//
//  TestViewController.swift
//  Baby Sound
//
//  Created by MacBookAir_36 on 11/09/23.
//

//import UIKit
//
//class TestViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//
//    }
//
//
//}


//class TestViewController: UIViewController {
//    var myView: UIView!
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create a UIView
//        myView = UIView(frame: CGRect(x: 50, y: 100, width: 100, height: 100))
//        myView.backgroundColor = UIColor.blue
//        view.addSubview(myView)
//
//        // Add gesture recognizers for each animation direction
//        addGestureRecognizers()
//    }
//
//    func addGestureRecognizers() {
//        // Right to Left Animation
//        let rightToLeftGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(animateRightToLeft))
//        rightToLeftGestureRecognizer.direction = .left
//        myView.addGestureRecognizer(rightToLeftGestureRecognizer)
//
//        // Left to Right Animation
//        let leftToRightGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(animateLeftToRight))
//        leftToRightGestureRecognizer.direction = .right
//        myView.addGestureRecognizer(leftToRightGestureRecognizer)
//
//        // Top to Bottom Animation
//        let topToBottomGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(animateTopToBottom))
//        topToBottomGestureRecognizer.direction = .down
//        myView.addGestureRecognizer(topToBottomGestureRecognizer)
//
//        // Bottom to Top Animation
//        let bottomToTopGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(animateBottomToTop))
//        bottomToTopGestureRecognizer.direction = .up
//        myView.addGestureRecognizer(bottomToTopGestureRecognizer)
//    }
//
//    @objc func animateRightToLeft() {
//        UIView.animate(withDuration: 1.0) {
//            self.myView.frame.origin.x -= self.myView.frame.size.width
//        }
//    }
//
//    @objc func animateLeftToRight() {
//        UIView.animate(withDuration: 1.0) {
//            self.myView.frame.origin.x += self.myView.frame.size.width
//        }
//    }
//
//    @objc func animateTopToBottom() {
//        UIView.animate(withDuration: 1.0) {
//            self.myView.frame.origin.y += self.myView.frame.size.height
//        }
//    }
//
//    @objc func animateBottomToTop() {
//        UIView.animate(withDuration: 1.0) {
//            self.myView.frame.origin.y -= self.myView.frame.size.height
//        }
//    }
//}
//


//import UIKit
//
//class TestViewController: UIViewController {
//    var myView: UIView!
//    var isViewDisplayed = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create a UIView
//        myView = UIView(frame: CGRect(x: view.frame.width, y: view.frame.height / 2 - 50, width: 100, height: 100))
//        myView.backgroundColor = UIColor.blue
//        view.addSubview(myView)
//
//        // Create a UIButton to trigger the animation
//        let animateButton = UIButton(type: .system)
//        animateButton.setTitle("Animate", for: .normal)
//        animateButton.frame = CGRect(x: 150, y: 250, width: 100, height: 30)
//        animateButton.addTarget(self, action: #selector(animateButtonTapped), for: .touchUpInside)
//        view.addSubview(animateButton)
//    }
//
//    @objc func animateButtonTapped() {
//        if isViewDisplayed {
//            UIView.animate(withDuration: 1.0) {
//                // Hide the UIView by moving it off-screen to the right
//                self.myView.frame.origin.x = self.view.frame.width
//            }
//        } else {
//            UIView.animate(withDuration: 1.0) {
//                // Display the UIView at the center of the screen
//                self.myView.center = self.view.center
//            }
//        }
//
//        isViewDisplayed.toggle()
//    }
//}
//


//
//import UIKit
//
//class TestViewController: UIViewController {
//
//    @IBOutlet weak var label: UILabel!
//    var textArray = ["Hello, World!", "This is a UILabel animation.", "Swift is awesome!"]
//    var currentIndex = 0
//    var animationDuration: TimeInterval = 2.0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set the initial text
//        label.text = textArray.first
//    }
//
//    override func viewDidAppear(_ animated: Bool) {
//        super.viewDidAppear(animated)
//
//        // Start the animation when the view appears
//        animateLabelText()
//    }
//
//    func animateLabelText() {
//        // Ensure we have more text to display
//        guard currentIndex < textArray.count - 1 else {
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
//        label.layer.add(transition, forKey: kCATransition)
//
//        // Update the label's text
//        currentIndex += 1
//        label.text = textArray[currentIndex]
//
//        // Schedule the next animation
//        DispatchQueue.main.asyncAfter(deadline: .now() + animationDuration) {
//            self.animateLabelText()
//        }
//    }
//}


//import UIKit
//
//class TestViewController: UIViewController {
//    @IBOutlet weak var label: UILabel!
//    var textArray = ["Hello, World!", "This is a UILabel animation.", "Swift is awesome!"]
//    var currentIndex = 0
//    var animationDuration: TimeInterval = 2.0
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Set the initial text
//        label.text = textArray.first
//
//        // Add a tap gesture recognizer to the view
//        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(handleTap))
//        view.addGestureRecognizer(tapGestureRecognizer)
//    }
//
//    @objc func handleTap() {
//        // Ensure we have more text to display
//        guard currentIndex < textArray.count - 1 else {
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
//        label.layer.add(transition, forKey: kCATransition)
//
//        // Update the label's text with the next item in the array
//        currentIndex += 1
//        label.text = textArray[currentIndex]
//    }
//}


import UIKit

//class TriangleView: UIView {
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        backgroundColor = UIColor.clear
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        super.init(coder: aDecoder)
//        backgroundColor = UIColor.clear
//    }
//
//    override func draw(_ rect: CGRect) {
//        super.draw(rect)
//
//        // Create a bezier path for the triangle
//        let path = UIBezierPath()
//        path.move(to: CGPoint(x: rect.width / 2, y: 0))
//        path.addLine(to: CGPoint(x: 0, y: rect.height))
//        path.addLine(to: CGPoint(x: rect.width, y: rect.height))
//        path.close()
//        UIColor(hex: "D9D9D9")
//        path.fill()
//    }
//}

//class TestViewController: UIViewController {
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Create a TriangleView and add it to the view controller's view
//        let triangleView = TriangleView(frame: CGRect(x: 100, y: 100, width: 30, height: 30))
//        self.view.addSubview(triangleView)
//    }
//}


//extension UIColor {
//    convenience init(hex: String) {
//        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
//        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
//
//        var rgb: UInt64 = 0
//
//        Scanner(string: hexSanitized).scanHexInt64(&rgb)
//
//        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
//        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
//        let blue = CGFloat(rgb & 0x0000FF) / 255.0
//
//        self.init(red: red, green: green, blue: blue, alpha: 1.0)
//    }
//}




import UIKit
import BubbleShowCase


//
//class TestViewController: UIViewController{
//
//    @IBOutlet weak var startDemoButton: UIButton! {
//        didSet {
//            startDemoButton.layer.masksToBounds = true
//            startDemoButton.layer.cornerRadius = 4.0
//            startDemoButton.layer.borderColor = startDemoButton.titleColor(for: .normal)?.cgColor
//            startDemoButton.layer.borderWidth = 2.0
//        }
//    }
//
//    private var isCellShowCaseShown = false
//    private var isDemoStarted = false
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        if !isDemoStarted {
//            let showCaseOnView = BubbleShowCase(target: startDemoButton, arrowDirection: .down, label: "startDemoButton")
//            showCaseOnView.titleText = "Tap here to close it"
//            showCaseOnView.descriptionText = "You will start the demo"
//            showCaseOnView.arrowDirection = .right
//            showCaseOnView.shadowColor = startDemoButton.titleColor(for: .normal)
//            showCaseOnView.isCrossDismissable = false
//            showCaseOnView.delegate = self
//
//            showCaseOnView.show()
//
//            isDemoStarted = true
//        }
//
//    }
//}
//
//extension TestViewController: BubbleShowCaseDelegate {
//
//    func bubbleShowCase(_ bubbleShowCase: BubbleShowCase, didTap target: UIView!, gestureRecognizer: UITapGestureRecognizer) {
//        guard let showCaseLabel = bubbleShowCase.label else { return }
//        guard showCaseLabel == "startDemoButton" else { return }
//
//        showSimpleAlert(title: "Hey!", message: "You can react to certain gestures. See ShowCaseDelegate for more information.") { [weak self] in
//            guard let `self` = self else { return }
//            self.startDemoDidTap(self.startDemoButton)
//        }
//
//        bubbleShowCase.dismiss()
//    }
//
//    @IBAction func startDemoDidTap(_ sender: UIButton) {
//
//        let showCaseOnTabBar = BubbleShowCase(tabBar: tabBarController!.tabBar, index: 8, label: "tabBar")
//        showCaseOnTabBar.titleText = "In a tabBar!"
//        showCaseOnTabBar.descriptionText = "It doesn't matter wether the item is hidden"
//        showCaseOnTabBar.color = UIColor(red: 196.0/255.0, green: 249.0/255.0, blue: 212.0/255.0, alpha: 1.0)
//        showCaseOnTabBar.textColor = UIColor.darkGray
//        showCaseOnTabBar.delegate = self
//
//        let showCaseOnNavBar = BubbleShowCase(target: navigationItem.rightBarButtonItem!, label: "barButtonItem")!
//        showCaseOnNavBar.titleText = "Watch out!"
//        showCaseOnNavBar.descriptionText = "Bar buttons must be custom so that the show case works"
//        showCaseOnTabBar.concat(bubbleShowCase: showCaseOnNavBar)
//        showCaseOnNavBar.color = UIColor(red: 255.0/255.0, green: 26.0/255.0, blue: 114.0/255.0, alpha: 1.0)
//        showCaseOnNavBar.shadowColor = UIColor.blue
//        showCaseOnNavBar.textColor = UIColor.white
//
//        let showCaseOnRootView = BubbleShowCase(target: view, arrowDirection: .upAndDown, label: "rootView")
//        showCaseOnRootView.titleText = "Lots of directions"
//        showCaseOnRootView.delegate = self
//        showCaseOnRootView.image = UIImage(named: "show-case-swipe")
//        showCaseOnRootView.descriptionText = "-Double directions are placed in the center of the screen \n-You can add images too \n-Show a cross to dismiss it or choose to force the user to react to the target"
//        showCaseOnNavBar.concat(bubbleShowCase: showCaseOnRootView)
//
////        DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(100)) { [weak self] in
////            guard let `self` = self else { return }
////            if let cell = self.tableView.cellForRow(at: IndexPath(row: 4, section: 0)) {
////                let showCaseOnCell = BubbleShowCase(cell: cell, target: nil, arrowDirection: .down, label: "cellIndex4")
////                showCaseOnCell.titleText = "Hey, what about me?"
////                showCaseOnCell.descriptionText = "ShowCase works also for both UITableView and UICollectionView"
////                showCaseOnCell.delegate = self
////                showCaseOnCell.shadowColor = UIColor.black
////                showCaseOnCell.color = UIColor(red: 235.0/255.0, green: 213.0/255.0, blue: 64.0/255.0, alpha: 1.0)
////                showCaseOnCell.textColor = UIColor.darkGray
////
////                showCaseOnCell.show(after: showCaseOnRootView)
////            }
////        }
//
//        showCaseOnTabBar.show()
//    }
//
//}
//
//extension UIViewController {
//
//    func showSimpleAlert(title: String, message: String, action: (() -> Void)? = nil) {
//        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//        let okAction = UIAlertAction(title: "Gotcha", style: .default) { _ in
//            action?()
//        }
//        alertController.addAction(okAction)
//        present(alertController, animated: true)
//    }
//
//}




//import BubbleShowCase
//
//class TestViewController : UIViewController {
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        
//        // Create the BubbleShowCase
//        let bubbleShowCase = BubbleShowCase(target: )
//        
//        // Configure the target view you want to showcase
//        let targetView = self.view // Replace with your target view
//        
//        // Create a bubble item with a title, description, and animation
//        let bubbleItem = BubbleShowCaseItem(title: "Welcome!",
//                                            description: "This is a showcase with animation.",
//                                            target: targetView)
//        
//        // Customize the appearance of the bubble
//        bubbleItem.titleColor = .white
//        bubbleItem.descriptionColor = .white
//        bubbleItem.titleFont = UIFont.boldSystemFont(ofSize: 16)
//        bubbleItem.descriptionFont = UIFont.systemFont(ofSize: 14)
//        
//        // Configure the animation for the bubble
//        bubbleItem.animateBubble = { bubbleView in
//            // You can apply any animation you want to the bubble view
//            // For example, you can use CGAffineTransform for scaling or rotation
//            bubbleView.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
//            UIView.animate(withDuration: 0.5) {
//                bubbleView.transform = .identity // Reset to the original state
//            }
//        }
//        
//        // Add the bubble item to the showcase
//        bubbleShowCase.addShowCaseItem(bubbleItem)
//        
//        // Show the showcase
//        bubbleShowCase.show()
//    }
//}
