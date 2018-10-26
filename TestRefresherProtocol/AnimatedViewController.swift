//
//  AnimatedViewController.swift
//  TestRefresherProtocol
//
//  Created by Muhamed Shaban on 10/24/18.
//  Copyright © 2018 Muhamed Shaban. All rights reserved.
//

import UIKit

class AnimatedViewController: UIViewController, UIViewControllerTransitioningDelegate {

    @IBOutlet var contentView: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
    contentView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(actionClose(_:))))
        
    }
    
    @objc func actionClose(_ tap: UITapGestureRecognizer) {
        presentingViewController?.dismiss(animated: true, completion: nil)
    }

}

