//
//  ScrollStackView.swift
//  ScrollStackKit
//
//  Created by Marco Del Giudice on 10/09/21.
//

import Foundation
import UIKit


/// The types of visibility a row can have
public enum RowVisibility {
    case offscreen
    case entirely
    case partially
}

/// The location in wich to insert the row
public enum InsertLocation {
    case top
    case bottom
    case atIndex(Int)
    case after(UIView)
    case before(UIView)
    case afterController(UIViewController)
    case beforeController(UIViewController)
}

public class ScrollStackView: UIView {
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
        return stackView
    }()
    
    public var scrollViewDelegate: UIScrollViewDelegate? {
        didSet{
            scrollView.delegate = scrollViewDelegate
        }
    }
    
    /// The list of views inside the ScrollStack
    public var rows: [UIView] {
        return self.stackView.arrangedSubviews
    }
    
    /// The custom distance that the content view is inset from the safe area or scroll view edges.
    public var contentInset: UIEdgeInsets = .zero {
        didSet{
            self.scrollView.contentInset = contentInset
        }
    }
    
    init() {
        super.init(frame: .zero)
        setupViewHierarchy()
        setupLayoutContraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupViewHierarchy()
        setupLayoutContraints()
    }
    
    private func setupViewHierarchy() {
        scrollView.addSubview(stackView)
        self.addSubview(scrollView)
    }
    
    private func setupLayoutContraints() {
        NSLayoutConstraint.activate(
            stackView.constraintsForAnchoringTo(boundsOf: scrollView) +
            scrollView.constraintsForAnchoringTo(boundsOf: self)
        )
    }
    
    /// insert a view inside the stack
    /// - Parameters:
    ///   - view: the view to insert
    ///   - height: the height to set at the view if needed
    ///   - location: the location for the new row
    ///   - spacing: spacing applied after the row
    public func insertRow(_ view: UIView, withFixedHeight height: CGFloat? = nil, at location: InsertLocation = .bottom, spacing: CGFloat? = nil) {
        
        if let height = height {
            view.heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        
        if let index = getIndexForLocation(location) {
            stackView.insertArrangedSubview(view, at: index)
        } else {
            stackView.addArrangedSubview(view)
        }
        
        if let spacing = spacing {
            stackView.setCustomSpacing(spacing, after: view)
        }
    }
    
    /// insert a view inside the stack
    /// - Parameters:
    ///   - controller: the controller to insert
    ///   - height: the height to set at the view if needed
    ///   - location: the location for the new row
    ///   - spacing: spacing applied after the row
    public func insertRow(_ controller: UIViewController, withFixedHeight height: CGFloat? = nil, at location: InsertLocation = .bottom, spacing: CGFloat? = nil) {
        guard let view = createRowFromController(controller) else { return }
        self.insertRow(view,withFixedHeight: height, at: location, spacing: spacing)
    }
    
    private func createRowFromController(_ controller: UIViewController) -> ScrollStackContainerRow? {
        guard let parentController = self.viewController else { return nil }
        let view = ScrollStackContainerRow(parentController: parentController, childViewController: controller, scrollStack: self)
        return view
    }
    
    /// get the index related to the location
    /// - Parameter location: the location in wich to insert the row
    /// - Returns: return the index if it exists
    private func getIndexForLocation(_ location: InsertLocation) -> Int? {
        switch location {
        case .top:
            return 0
        case .bottom:
            return rows.count
        case .atIndex(let index):
            return index
        case .after(let view):
            guard let index = getIndex(of: view) else { return nil }
            return index + 1
        case .before(let view):
            guard let index = getIndex(of: view) else { return nil }
            return index
        case .afterController(let controller):
            guard let index = getIndex(of: controller) else { return nil }
            return index + 1
        case .beforeController(let controller):
            guard let index = getIndex(of: controller) else { return nil }
            return index
        }
    }
    
    public func getIndex(of view: UIView) -> Int? {
        return rows.firstIndex(of: view)
    }
    
    public func getIndex(of controller: UIViewController) -> Int? {
        let row =  rows.first { (row) -> Bool in
            guard let row = row as? ScrollStackContainerRow else { return false }
            return  row.controller == controller
        }
        guard let view = row else { return nil }
        return getIndex(of: view)
    }
    
    
    /// remove a row with the given view
    /// - Parameter view: the view to remove
    public func removeRow(_ view: UIView) {
        if self.rows.contains(view) {
            view.removeFromSuperview()
        }
    }
    
    public func removeAllRows(){
        stackView.subviews.forEach({ $0.removeFromSuperview() })
    }
    
    /// remove a row with the given controller
    /// - Parameter view: the controller to remove
    public func removeRow(_ controller: UIViewController) {
        let row =  rows.first { (row) -> Bool in
            guard let row = row as? ScrollStackContainerRow else { return false }
            return  row.controller == controller
        }
        guard let view = row else { return }
        removeRow(view)
    }
    
    /// remove a row at location
    /// - Parameter location: the location where the row is to be deleted
    public func removeRow(at location: InsertLocation) {
        guard let index = getIndexForLocation(location), let view = getView(by: index) else { return }
        removeRow(view)
    }
    
    /// get the visibility type of a given cell
    /// - Parameter view: the view whose type to receive
    /// - Returns: the visibility type
    public func getRowVisibility(_ view: UIView) -> RowVisibility? {
        guard self.rows.contains(view) else { return nil }
        //convert view frame to the scroll view coordinate system
        let rowFrame = convert(view.frame, to: self)
        if !bounds.intersects(rowFrame) {
            return .offscreen
        }
        if bounds.contains(rowFrame) {
            return .entirely
        } else {
            return .partially
        }
    }
    
    /// get the visibility type of a given cell
    /// - Parameter index: the index whose type to receive
    /// - Returns: the visibility type
    public func getRowVisibility(_ index: Int) -> RowVisibility? {
        guard let view = getView(by: index), self.rows.contains(view) else { return nil }
        return getRowVisibility(view)

    }
    
    /// get the view at the given index inside the rows
    /// - Parameter index: the index from which to get the view
    /// - Returns: return the view if it exists
    public func getView(by index: Int) -> UIView? {
        guard rows.indices.contains(index) else { return nil }
        return rows[index]
    }
    
    /// returns true if the given view is contained in the ScrollStackView
    /// - Parameter index: the index from which to get the view
    /// - Returns: return the view if it exists
    public func containsView(view: UIView) -> Bool {
        if self.rows.contains(view) {
            return true
        } else {
            return false
        }
    }
    
    /// scroll to the top of the scroll stack
    public func goToTop() {
        self.scrollView.setContentOffset(.zero, animated: true)
    }
    
}


