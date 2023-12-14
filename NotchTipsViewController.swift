//
//  NotchTipsViewController.swift
//  Baby Sound
//
//  Created by MacBookAir_36 on 12/09/23.
//

import UIKit
import BubbleShowCase
class NotchTipsViewController: UIViewController {

    
    @IBOutlet var StartBtn: UIButton!
    
    @IBOutlet var button1: UIButton!
    @IBOutlet var button2: UIButton!
    @IBOutlet var button3: UIButton!
    @IBOutlet var button4: UIButton!
//---
    var floatingButton: UIButton!
    var xValue:CGFloat = 100
    var yValue:CGFloat = 200
    var floatingBtnWidth:CGFloat = 50
    var floatingBtnHeight:CGFloat = 50
    var panGesture = UIPanGestureRecognizer()
    private var isDemoStarted = false
    
    var minYX:CGFloat = 110
    var isShow = false
   
    var isdrag = false
    //--------
    
    
    private var showcases: [BubbleShowCase] = []
    private var currentShowcaseIndex = 0
    private var showcasesShown = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        floatingButton = UIButton(frame: CGRect(x: 100 , y: 300, width: 50, height: 50))
        floatingButton.backgroundColor = UIColor.init(white: 90, alpha: 1)
        view.addSubview(floatingButton)
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
            
            if !isDemoStarted {
                let showCaseOnView = BubbleShowCase(target: floatingButton, arrowDirection: .down, label: "StartBtn")
                showCaseOnView.color = UIColor.red
                showCaseOnView.crossColor = UIColor.red
                showCaseOnView.backgroundColor = UIColor.white
                showCaseOnView.titleText = "Tap here to close it"
                showCaseOnView.descriptionText = "You will start the demo"
                showCaseOnView.arrowDirection = .up
    //            showCaseOnView.shadowColor = addBtn1.titleColor(for: .normal)
                showCaseOnView.isCrossDismissable = false
                showCaseOnView.delegate = self
               
                showCaseOnView.show()
               
                isDemoStarted = true
            }
        }
    

    @IBAction func startDemoDidTap(_ sender: UIButton) {
        
        let showCaseOnRootView = BubbleShowCase(target: self.view, arrowDirection: .upAndDown, label: "rootView")
        showCaseOnRootView.titleText = "Lots of directions"
        showCaseOnRootView.delegate = self
//        showCaseOnRootView.image = UIImage(named: "show-case-swipe")
        showCaseOnRootView.descriptionText = "-Double directions are placed in the center of the screen \n-You can add images too \n-Show a cross to dismiss it or choose to force the user to react to the target"
//        showCaseOnNavBar.concat(bubbleShowCase: showCaseOnRootView)
        
        let showCaseOnButton1 = BubbleShowCase(target: button1, arrowDirection: .up, label: "button1")
        showCaseOnButton1.titleText = "Tap here to close it"
        showCaseOnButton1.descriptionText = "You will start the demo"
        showCaseOnButton1.arrowDirection = .up
        showCaseOnButton1.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        showCaseOnRootView.concat(bubbleShowCase: showCaseOnButton1)
        // Configure the showcase for button1

        let showCaseOnButton2 = BubbleShowCase(target: button2, arrowDirection: .up, label: "button2")
        showCaseOnButton2.titleText = "Tap here to close it"
        showCaseOnButton2.descriptionText = "You will start the demo"
        showCaseOnButton2.arrowDirection = .up
        showCaseOnButton1.concat(bubbleShowCase: showCaseOnButton2)

        // Configure the showcase for button2

        let showCaseOnButton3 = BubbleShowCase(target: button3, arrowDirection: .up, label: "button3")
        showCaseOnButton3.titleText = "Tap here to close it"
        showCaseOnButton3.descriptionText = "You will start the demo"
        showCaseOnButton2.concat(bubbleShowCase: showCaseOnButton3)
        showCaseOnButton3.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
        showCaseOnButton3.arrowDirection = .up
        // Configure the showcase for button3

        let showCaseOnButton4 = BubbleShowCase(target: button4, arrowDirection: .up, label: "button4")
        showCaseOnButton4.titleText = "Tap here to close it"
        showCaseOnButton4.descriptionText = "You will start the demo"
        showCaseOnButton3.concat(bubbleShowCase: showCaseOnButton4)
        showCaseOnButton4.arrowDirection = .down
        // Configure the showcase for button4

        // Show the showcases
        showCaseOnButton1.show()

    }
    
    
}

extension NotchTipsViewController: BubbleShowCaseDelegate {

    func bubbleShowCase(_ bubbleShowCase: BubbleShowCase, didTap target: UIView!, gestureRecognizer: UITapGestureRecognizer) {
//        self.startDemoDidTap(self.floatingButton)
        bubbleShowCase.dismiss()
    }
    

}
