//
//  BabySplashVC.swift
//  Baby Sound
//
//  Created by MacBookAir_36 on 06/09/23.
//

import UIKit
import BubbleShowCase

class BabySplashVC: UIViewController, BubbleShowCaseDelegate {
    
    @IBOutlet weak var imgNotchImage: UIImageView!
    @IBOutlet weak var imgBackView: UIView!
    @IBOutlet weak var titleTxtView: UIView!
    @IBOutlet weak var tipslblView: UIView!
    @IBOutlet weak var countView: UIView!
    @IBOutlet weak var backSubView: UIView!
    
    @IBOutlet weak var lblOption: UILabel!
    @IBOutlet weak var lblTips: UILabel!
    @IBOutlet weak var bottomTxtView: UIView!
    private var isDemoStarted = false
    
    private var showcases: [BubbleShowCase] = []
    private var currentShowcaseIndex = 0
    private var showcasesShown = false
    
    var ArrCount = ["1","2","3","4"]
    var currentIndex = 0
    var countCurrentIndex = 0
    var animationDuration: TimeInterval = 1.0
    
    var ArrTitle = ["How to make children   Cooperate and listen?"]
    var ArrTips = ["Are Your Expectations Clear?Do You Use Positive Reinforcement?","Do You Model Good Behavior?Are You Using Age-Appropriate Language?Are You Giving Them Choices?","Are You Being Patient and Calm? Are You Offering Rewards and Consequences Consistently?","Are You Creating a Positive Environment? How to make children   Cooperate and listen?"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
        lblTips.text = ArrTips.first
        lblOption.text = ArrCount.first
        
        self.titleTxtView.layer.cornerRadius = 20
        self.tipslblView.layer.cornerRadius = self.tipslblView.frame.height/2
        self.countView.layer.cornerRadius = self.countView.frame.height/2
        self.bottomTxtView.layer.cornerRadius = 20
        
        backSubView.layer.cornerRadius = 30
        backSubView.layer.borderWidth = 1
        backSubView.layer.borderColor = UIColor.white.cgColor
        backSubView.layer.shadowColor = UIColor.white.cgColor
        backSubView.layer.shadowOpacity = 0.9 // Adjust opacity as needed
        backSubView.layer.shadowOffset = CGSize(width: 0, height: 0) // Offset on all sides
        backSubView.layer.shadowRadius = 3
        
        self.backSubView.bringSubviewToFront(self.countView)
        

        if UIDevice.current.userInterfaceIdiom == .pad {
            TopNotchIPad(viewName: bottomTxtView)
        } else {
            TopNotchIphone(viewName: bottomTxtView)
        }

        if UIDevice.current.userInterfaceIdiom == .pad {
            TopNotchIPad(viewName: titleTxtView)
        } else {
            TopNotchIphone(viewName: titleTxtView)
        }
        
        if UIDevice.current.userInterfaceIdiom == .pad {
            bottomNotchIPad(viewName: tipslblView)
        } else {
            bottomNotchIphone(viewName: tipslblView)
        }
        
      //  let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
     //   view.addGestureRecognizer(tapGestureRecognizer)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
//        if !isDemoStarted {
//            let showCaseOnView = BubbleShowCase(target: tipslblView, arrowDirection: .down, label: "startDemoButton")
//            showCaseOnView.titleText = "Tap here to close it"
//            showCaseOnView.descriptionText = "You will start the demo"
//            showCaseOnView.arrowDirection = .down
//            showCaseOnView.shadowColor = UIColor.red
//            showCaseOnView.isCrossDismissable = false
//            showCaseOnView.backgroundColor =  UIColor.red
//            showCaseOnView.delegate = self
//            showCaseOnView.show()
//            isDemoStarted = true
//        }
        
//        if !isDemoStarted {
//            let showCaseOnView = BubbleShowCase(target: titleTxtView, arrowDirection: .down, label: "Startbtn")
//            showCaseOnView.titleText = "Tap here to close it"
//            showCaseOnView.descriptionText = "You will start the demo"
//            showCaseOnView.arrowDirection = .up
////            showCaseOnView.shadowColor = addBtn1.titleColor(for: .normal)
//            showCaseOnView.isCrossDismissable = false
//            showCaseOnView.delegate = self
//
//            showCaseOnView.show()
//
//            isDemoStarted = true
//        }
        
//        SetHint()
           // SetAnimation()
        
        
//        titleTxtView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//        UIView.animate(withDuration: 1.5) { [self] in
//            titleTxtView.transform = .identity // Reset to the original state
//        }
        
        titleTxtView.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)

        // Create a repeating animation block
        UIView.animate(withDuration: 0.8, delay: 0.0, options: [.repeat, .autoreverse], animations: { [self] in
            titleTxtView.transform = .identity // Reset to the original state
        }, completion: nil)

    }
    
//    @objc func handleTap() {
////        UIView.transition(with: lblTips, duration: 0.5, options: .transitionCrossDissolve, animations: {
//
////        }, completion: nil)
//
//
//        guard currentIndex < ArrTips.count - 1 else {
//            return
//        }
//
//        // Create a CATransition animation
//        let transition = CATransition()
//        transition.type = CATransitionType.push
//        transition.subtype = CATransitionSubtype.fromRight
//        transition.duration = animationDuration
//
//        // Apply the animation to the label's layer
//        bottomTxtView.layer.add(transition, forKey: kCATransition)
//      //  imgNotchImage.layer.add(transition, forKey: kCATransition)
//
//        // Update the label's text with the next item in the array
//       // currentIndex += 1
//        //lblTips.text = ArrTips[currentIndex]
//      //  self.lblOption.text = self.getNextTextCount()
//        self.lblTips.text = self.getNextText()
//        self.lblOption.text = self.getNextTextCount()
//    }
    
    func getNextText() -> String {
        currentIndex += 1
        if currentIndex >= ArrTips.count {
            currentIndex = 0
        }
        return ArrTips[currentIndex]
    }
    
    func getNextTextCount() -> String {
        countCurrentIndex += 1
        if countCurrentIndex >= ArrCount.count {
            countCurrentIndex = 0
        }
        return ArrCount[currentIndex]
    }
    
    func TopNotchIphone(viewName:UIView){
        let triangleView = TriangleView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        viewName.addSubview(triangleView)

        triangleView.centerXAnchor.constraint(equalTo: viewName.centerXAnchor).isActive = true

        triangleView.topAnchor.constraint(equalTo: viewName.topAnchor, constant: -20).isActive = true

        triangleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        triangleView.heightAnchor.constraint(equalToConstant: 20).isActive = true
    }
    
    func TopNotchIPad(viewName:UIView){
        let triangleView = TriangleView(frame: CGRect(x: 0, y: 0, width: 45, height: 32))
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        viewName.addSubview(triangleView)

        triangleView.centerXAnchor.constraint(equalTo: viewName.centerXAnchor).isActive = true

        triangleView.topAnchor.constraint(equalTo: viewName.topAnchor, constant: -32).isActive = true

        triangleView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        triangleView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    
    func bottomNotchIphone(viewName:UIView){
//        let triangleView = TriangleView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
//        triangleView.translatesAutoresizingMaskIntoConstraints = false
//        viewName.addSubview(triangleView)
//
//        triangleView.centerXAnchor.constraint(equalTo: viewName.centerXAnchor).isActive = true
//
//        triangleView.topAnchor.constraint(equalTo: viewName.bottomAnchor, constant: +20).isActive = true
//
//        triangleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
//        triangleView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        
        let triangleView = RotateTriangleView(frame: CGRect(x: 0, y: 0, width: 30, height: 20))
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        viewName.addSubview(triangleView)

        triangleView.centerXAnchor.constraint(equalTo: viewName.centerXAnchor).isActive = true

        // Position the triangleView at the bottom with a constant of -20
        triangleView.bottomAnchor.constraint(equalTo: viewName.bottomAnchor, constant: +20).isActive = true

        triangleView.widthAnchor.constraint(equalToConstant: 30).isActive = true
        triangleView.heightAnchor.constraint(equalToConstant: 20).isActive = true

    }
    
    func bottomNotchIPad(viewName:UIView){
        let triangleView = RotateTriangleView(frame: CGRect(x: 0, y: 0, width: 45, height: 32))
        triangleView.translatesAutoresizingMaskIntoConstraints = false
        viewName.addSubview(triangleView)

        triangleView.centerXAnchor.constraint(equalTo: viewName.centerXAnchor).isActive = true

        triangleView.topAnchor.constraint(equalTo: viewName.bottomAnchor, constant: +32).isActive = true

        triangleView.widthAnchor.constraint(equalToConstant: 45).isActive = true
        triangleView.heightAnchor.constraint(equalToConstant: 32).isActive = true
    }
    

    
//    func SetHint(){
//        let showCaseOnRootView = BubbleShowCase(target: self.view, arrowDirection: .upAndDown, label: "rootView")
//        showCaseOnRootView.titleText = "Lots of directions"
//        showCaseOnRootView.delegate = self
////        showCaseOnRootView.image = UIImage(named: "show-case-swipe")
//        showCaseOnRootView.descriptionText = "-Double directions are placed in the center of the screen \n-You can add images too \n-Show a cross to dismiss it or choose to force the user to react to the target"
////        showCaseOnNavBar.concat(bubbleShowCase: showCaseOnRootView)
//
//        let showCaseOnButton1 = BubbleShowCase(target: titleTxtView, arrowDirection: .up, label: "button1")
//        showCaseOnButton1.titleText = "Tap here to close it"
//        showCaseOnButton1.descriptionText = "You will start the demo"
//        showCaseOnButton1.arrowDirection = .up
//        showCaseOnButton1.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
//        showCaseOnRootView.concat(bubbleShowCase: showCaseOnButton1)
//        // Configure the showcase for button1
//
//        let showCaseOnButton2 = BubbleShowCase(target: tipslblView, arrowDirection: .up, label: "button2")
//        showCaseOnButton2.titleText = "Tap here to close it"
//        showCaseOnButton2.descriptionText = "You will start the demo"
//        showCaseOnButton2.arrowDirection = .up
//        showCaseOnButton1.concat(bubbleShowCase: showCaseOnButton2)
//
//        // Configure the showcase for button2
//
//        let showCaseOnButton3 = BubbleShowCase(target: countView, arrowDirection: .up, label: "button3")
//        showCaseOnButton3.titleText = "Tap here to close it"
//        showCaseOnButton3.descriptionText = "You will start the demo"
//        showCaseOnButton2.concat(bubbleShowCase: showCaseOnButton3)
//        showCaseOnButton3.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
//        showCaseOnButton3.arrowDirection = .up
//        // Configure the showcase for button3
//
//        let showCaseOnButton4 = BubbleShowCase(target: bottomTxtView, arrowDirection: .up, label: "button4")
//        showCaseOnButton4.titleText = "Tap here to close it"
//        showCaseOnButton4.descriptionText = "You will start the demo"
//        showCaseOnButton3.concat(bubbleShowCase: showCaseOnButton4)
//        showCaseOnButton4.arrowDirection = .down
//        // Configure the showcase for button4
//
//        // Show the showcases
//        showCaseOnButton1.show()
//
//
//    }
    
    
    func SetAnimation(){
//        let showCaseOnRootView = BubbleShowCase(target: self.view, arrowDirection: .upAndDown, label: "rootView")
//        showCaseOnRootView.titleText = "Lots of directions"
//        showCaseOnRootView.delegate = self
//
//        showCaseOnRootView.descriptionText = "-Double directions are placed in the center of the screen \n-You can add images too \n-Show a cross to dismiss it or choose to force the user to react to the target"
        
        let showCaseOnButton1 = BubbleShowCase(target: titleTxtView, arrowDirection: .up, label: "button1")
//        showCaseOnButton1.titleText = "Tap here to close it"
//        showCaseOnButton1.descriptionText = "You will start the demo"
//        showCaseOnButton1.arrowDirection = .up
//        showCaseOnButton1.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
//        showCaseOnRootView.concat(bubbleShowCase: showCaseOnButton1)
        
        showCaseOnButton1.show()
        
//        self.titleTxtView.animateBubble = { bubbleView in
//                    // You can apply any animation you want to the bubble view
//                    // For example, you can use CGAffineTransform for scaling or rotation
//            titleTxtView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//                    UIView.animate(withDuration: 0.5) {
//                        titleTxtView.transform = .identity // Reset to the original state
//                    }
//                }
//
      
    }
    
}



class TriangleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
       backgroundColor = UIColor.clear
        
        
    }
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        // Create a bezier path for the triangle
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width/2, y: 0))
        path.addLine(to: CGPoint(x: 0, y: rect.height))
        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
        path.close()
        UIColor(hex: "D8D8D8").setFill()
       // UIColor.white
        path.fill()
    }
}

class RotateTriangleView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor.clear
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        backgroundColor = UIColor.clear
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        // Create a bezier path for the triangle
        let path = UIBezierPath()
        path.move(to: CGPoint(x: rect.width/2, y: rect.height))
        path.addLine(to: CGPoint(x: 0, y: 0))
        path.addLine(to: CGPoint(x: rect.width, y: 0))
        path.close()
        
//        UIColor(hex: "D8D8D8").setFill()
        UIColor.white.setFill()
        path.fill()
    }
}


extension UIColor {
    convenience init(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")

        var rgb: UInt64 = 0

        Scanner(string: hexSanitized).scanHexInt64(&rgb)

        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0

        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}

