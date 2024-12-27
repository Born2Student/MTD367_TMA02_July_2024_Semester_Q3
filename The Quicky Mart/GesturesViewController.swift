//
//  GesturesViewController.swift
//  The Quicky Mart
//
//  Created by Shawn Yang on 13/9/24.
//

import UIKit

class GesturesViewController: UIViewController {

    @IBOutlet weak var indigoView: UIView!
    
    var offset: CGPoint?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        let myView = UIView(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        
        myView.backgroundColor = .red
        
        myView.center = view.center
        
        view.addSubview(myView)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gestureFired(_:)))
        
        gestureRecognizer.numberOfTapsRequired = 2
        
        gestureRecognizer.numberOfTouchesRequired = 1
        
        myView.addGestureRecognizer(gestureRecognizer)
        
        myView.isUserInteractionEnabled = true
        
        
        let gestureRecognizer_2 = UISwipeGestureRecognizer(target: self, action: #selector(gestureFired_2(_:)))
        
        gestureRecognizer_2.direction = .right
        
        gestureRecognizer_2.numberOfTouchesRequired = 1
        
        myView.addGestureRecognizer(gestureRecognizer_2)
        
        myView.isUserInteractionEnabled = true
        
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(panned))
        
        indigoView.addGestureRecognizer(panGesture)
        
        panGesture.delegate = self
    }
    
    @objc func panned(_ gesture: UIPanGestureRecognizer) {
        print("panned")
        
        let translation = gesture.translation(in: indigoView)
        
        indigoView.frame.origin.x += translation.x
        
        indigoView.frame.origin.y += translation.y
        
        gesture.setTranslation(.zero, in: indigoView)
    }
    
    
    @objc func gestureFired(_ gesture: UITapGestureRecognizer) 
    {
        if let fireView = gesture.view {
            fireView.backgroundColor = .blue
        }
        
    }
    
    @objc func gestureFired_2(_ gesture: UISwipeGestureRecognizer) {
        if let fireView = gesture.view {
            fireView.backgroundColor = .green
        }
    }
    
    
    @IBAction func longPressed(_ sender: UILongPressGestureRecognizer) 
    {
        if sender.state == .began {
            indigoView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
        }
        
        if sender.state == .ended {
            indigoView.transform = .identity
        }
        
    }
    

}

extension GesturesViewController: UIGestureRecognizerDelegate {
    func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool
    {
        return true
    }
    
}
