//
//  ScrollStackContainerRow.swift
//  ScrollStackKit
//
//  Created by Marco Del Giudice on 10/09/21.
//

import Foundation
import UIKit

public class ScrollStackContainerRow: UIView {
    var controller: UIViewController
    
    init(parentController: UIViewController, childViewController: UIViewController, scrollStack: ScrollStackView) {
        self.controller = childViewController
        super.init(frame: .zero)
        self.backgroundColor = scrollStack.backgroundColor
        self.translatesAutoresizingMaskIntoConstraints = false
        parentController.addChild(controller)
        controller.view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(controller.view)
        NSLayoutConstraint.activate(
            childViewController.view.constraintsForAnchoringTo(boundsOf: self)
        )
        childViewController.didMove(toParent: parentController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        self.subviews.forEach {
            $0.frame = self.bounds
        }
    }
}
