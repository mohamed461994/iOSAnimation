//
//  ViewController.swift
//  TestRefresherProtocol
//
//  Created by Muhamed Shaban on 10/23/18.
//  Copyright © 2018 Muhamed Shaban. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var redUIView: UIView!
    
    @IBOutlet weak var blackViewHightConstraint: NSLayoutConstraint!
    @IBOutlet weak var redHightConstrain: NSLayoutConstraint!

    @IBOutlet weak var hightConstrain: NSLayoutConstraint!
    @IBOutlet weak var hightConstrain1: NSLayoutConstraint!
    @IBOutlet weak var hightConstrain2: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    var antimated = false
    @IBAction func Animate(_ sender: Any) {
        antimated.toggle()
        redHightConstrain.constant = antimated ? 100 : 250
        redUIView.constraints.forEach { constraint in
            if constraint.identifier == "RedViewWidth" {
                constraint.constant = antimated ? 100 : 250
            }
        }
        blackViewHightConstraint.constant = antimated ? 200 : 100
        hightConstrain.constant = antimated ? 500: 50
        hightConstrain1.constant = antimated ? 500: 50
        hightConstrain2.constant = antimated ? 500: 50
        
        UIView.animate(withDuration: 0.8,
            delay: 0.0,
            options: .curveEaseOut,
            animations: {
                self.antimated ? self.rotateRedView(degree: .pi/4): self.rotateRedView(degree: 0)
                self.view.layoutIfNeeded()
            },
            completion: nil)
    }
    
    func rotateRedView(degree: CGFloat) {
        self.redUIView.transform = CGAffineTransform(rotationAngle: degree)
    }
    
    func SetRefresher() {
//        tableView.refreshControl = UIRefreshControl()
//        tableView.refreshControl?.addTarget(self, action: #selector(refreshWeatherData(_:)), for: .valueChanged)
//        tableView.refreshControl?.tintColor = .red
//        tableView.refreshControl?.attributedTitle = NSAttributedString(string: "Fetching Weather Data ...", attributes: nil)

    }
    
    @IBAction func ExpandWithDampinAndVelocity(_ sender: Any) {
        antimated.toggle()
        redHightConstrain.constant = antimated ? 100 : 250
        redUIView.constraints.forEach { constraint in
            if constraint.identifier == "RedViewWidth" {
                constraint.constant = antimated ? 100 : 250
            }
        }
        blackViewHightConstraint.constant = antimated ? 200 : 100
        hightConstrain.constant = antimated ? 500: 50
        hightConstrain1.constant = antimated ? 500: 50
        hightConstrain2.constant = antimated ? 500: 50
        
        UIView.animate(withDuration: 1.8,
                       delay: 0.0,
                       usingSpringWithDamping: 0.9,
                       initialSpringVelocity: 8.4,
                       options: .curveEaseOut,
                       animations: {
                        self.antimated ? self.rotateRedView(degree: .pi/4): self.rotateRedView(degree: 0)
                        self.view.layoutIfNeeded()
        },
                       completion: nil)
    }

    
    @IBAction func HideWithFlib(_ sender: Any) {
        antimated.toggle()
        
        UIView.transition(with: redUIView,
                          duration: 1.0,
                          options: self.antimated ? ([.transitionFlipFromBottom]): [.transitionFlipFromTop],
                          animations: {
                            
                          },
                          completion: nil)
    }

    @objc private func refreshWeatherData(_ sender: Any) {
//        if (!tableView.refreshControl!.isRefreshing) {
//            tableView.refreshControl?.endRefreshing()
//        }
    }
}

