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
    @IBOutlet weak var viewToFly: UIView!
    
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
    
    @IBAction func animateAlpha(_ sender: Any) {
        redUIView.alpha = 1.0
        UIView.animate(withDuration: 4.5,
                       animations: {
                        self.redUIView.alpha = 0.0
                        },
                       completion: { _ in
                        self.redUIView.alpha = 1.0
                        })
    }
    
    @IBAction func animateTransform(_ sender: Any) {
        let redViewX = redUIView.frame.origin.x
        let redViewY = redUIView.frame.origin.y
        UIView.animate(withDuration: 1.0,
                       animations: {
                        self.redUIView.transform = CGAffineTransform(translationX: (redViewX + 50.0), y: (redViewY + 50.0) )
                       },
                       completion: {_ in
                       })
        
    }
    
    @IBAction func animatKeyFrames(_ sender: UIButton) {
        UIView.animateKeyframes(withDuration: 1.5,
        delay: 0.0,
        animations: {
            
            // move to right and up
            UIView.addKeyframe(withRelativeStartTime: 0.0,
                               relativeDuration: 0.25,
                               animations: {
                                self.viewToFly.center.x += 90
                                self.viewToFly.center.y -= 100
            })
            
            UIView.addKeyframe(withRelativeStartTime: 0.25,
                               relativeDuration: 1.25,
                               animations: {
                                self.viewToFly.center.x += 400
                                self.viewToFly.center.y -= 400
                                self.viewToFly.alpha = 0.0
            })
            
        }, completion: {_ in
            self.viewToFly.removeFromSuperview()
            sender.isEnabled = false
        })
        

    }


    @IBAction func animateViewController(_ sender: Any) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "AnimatedViewController") as! AnimatedViewController
        self.present(vc, animated: true)
    }
    
    

    @objc private func refreshWeatherData(_ sender: Any) {
//        if (!tableView.refreshControl!.isRefreshing) {
//            tableView.refreshControl?.endRefreshing()
//        }
    }
}

