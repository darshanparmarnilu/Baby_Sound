//
//  FloatingOnTableViewController.swift
//  Baby Sound
//
//  Created by MacBookAir_36 on 21/08/23.
//

import UIKit
import ImageIO
import SwiftyGif

class FloatingOnTableViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var ImgFloating: UIImageView!
    @IBOutlet weak var TableBackView: UIView!
    @IBOutlet weak var btnFloating: UIButton!
    @IBOutlet weak var FloatingBackView: UIView!
    
    @IBOutlet weak var imgTopLeft: UIImageView!
    
    @IBOutlet weak var imgBottomLeft: UIImageView!
    @IBOutlet weak var imgTopRight: UIImageView!
    
    @IBOutlet weak var imgBottomRight: UIImageView!
    var panGesture = UIPanGestureRecognizer()
    var isShow = false
    var isdrag = false
    var hoverLeading:CGFloat = 24//24
    var hoverTreling:CGFloat = 24//24
    var hoverTop:CGFloat = 16//45
    var hoverBottom:CGFloat = 16//45
    var hoverHeight:CGFloat = 80
    var hoverWidth:CGFloat = 80
    var yPoints:CGFloat = 8//60
    var minYX:CGFloat = 8//110
    var ViewFrame:CGRect!
    
    var isselect = true
    
    //    var ArrImage = [UIImage(imageLiteralResourceName: "Image0"),
    //                    UIImage(imageLiteralResourceName: "Image1"),
    //                    UIImage(imageLiteralResourceName: "Image2"),
    //                    UIImage(imageLiteralResourceName: "Image3"),
    //                    UIImage(imageLiteralResourceName: "Image4"),
    //                    UIImage(imageLiteralResourceName: "Image5"),
    //                    UIImage(imageLiteralResourceName: "Image6"),
    //                    UIImage(imageLiteralResourceName: "Image7"),
    //                    UIImage(imageLiteralResourceName: "Image8"),
    //                    UIImage(imageLiteralResourceName: "Image9"),
    //                    UIImage(imageLiteralResourceName: "Image10"),
    //                    UIImage(imageLiteralResourceName: "Image11"),
    //                    UIImage(imageLiteralResourceName: "Image12"),
    //                    UIImage(imageLiteralResourceName: "Image13")]
    
    
    var ArrImage = [UIImage(imageLiteralResourceName: "Group 11"),
                    UIImage(imageLiteralResourceName: "Group 12"),
                    UIImage(imageLiteralResourceName: "Group 13")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        FloatingBackView.layer.masksToBounds = true
        FloatingBackView.layer.cornerRadius = 20
        FloatingBackView.layer.borderWidth = 3
        FloatingBackView.layer.borderColor = UIColor.white.cgColor
        
        panGesture = UIPanGestureRecognizer(target: self, action: #selector(draggedView(_:)))
        FloatingBackView.isUserInteractionEnabled = true
        FloatingBackView.addGestureRecognizer(panGesture)
        FloatingBackView.alpha = 1
        TableBackView.alpha = 0
        
        
        
        self.tableView.layer.masksToBounds = true
        self.tableView.layer.cornerRadius = 25
        self.TableBackView.layer.cornerRadius = 25
        //self.ImgFloating.loadGif(name:"Gif")
        
        imgTopLeft.alpha = 0
        imgTopRight.alpha = 0
        imgBottomLeft.alpha = 0
        imgBottomRight.alpha = 0
        
    }
    override func viewWillAppear(_ animated: Bool) {
        do{
            let gif = try UIImage(gifName: "130718-baby.gif")
            self.ImgFloating.setGifImage(gif, loopCount: -1)
        }catch{
            print(error)
        }
        self.TableBackView.alpha = 0.0
        self.FloatingBackView.alpha = 1.0
        
        if let xValue = UserDefaults.standard.value(forKey: "keypadbtnFramX") as? CGFloat {
            if let yValue = UserDefaults.standard.value(forKey: "keypadbtnFramY") as? CGFloat {
                DispatchQueue.main.async {
                    let framBtn = CGRect(x: xValue, y: yValue, width: self.hoverWidth, height: self.hoverHeight)
                    
                    self.FloatingBackView.frame = framBtn
                    self.view.layoutIfNeeded()
                }
                
            }
        }
        
    }
    
    @IBAction func next(_ sender: UIButton) {
        
    }
    
    @IBAction func FloatingAction(_ sender: UIButton) {
        if isselect == true{
            isselect = false
            showViewiPhone()
        }else{
            isselect = true
            dismissView()
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesEnded(touches, with: event)
        UIView.animate(withDuration: 0.5, animations: {
            self.TableBackView.alpha = 0.0
            self.FloatingBackView.alpha = 1.0
            self.isselect = true
        })
        
        
        
    }
    
//    @objc func draggedView(_ sender: UIPanGestureRecognizer) {
//        self.view.bringSubviewToFront(FloatingBackView)
//
//        switch sender.state {
//        case .began:
//            print("Began.")
//            isdrag = true
//            print("Began")
//        case .changed:
//            print("change")
//                        let translation = sender.translation(in: self.view)
//                        let newX = FloatingBackView.center.x + translation.x
//                        let newY = FloatingBackView.center.y + translation.y
//
//                        let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
//                        let minX = FloatingBackView.frame.width / 2 + (safeAreaInsets?.left ?? 0)
//                        let maxX = self.view.frame.width - FloatingBackView.frame.width / 2 - (safeAreaInsets?.right ?? 0)
//
//                        let clampedX = min(maxX, max(minX, newX))
//
//                        let minY = FloatingBackView.frame.height / 2 + (safeAreaInsets?.top ?? 0)
//                        let maxY = self.view.frame.height - FloatingBackView.frame.height / 2 - (safeAreaInsets?.bottom ?? 0)
//
//                        let clampedY = min(maxY, max(minY, newY))
//
//                        FloatingBackView.center = CGPoint(x: clampedX, y: clampedY)
//
//                        sender.setTranslation(CGPoint.zero, in: self.view)
//            print("Changed.")
//        case .ended:
//            print("Ended.")
//            isdrag = false
//            let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
//            let minX = FloatingBackView.frame.width / 2 + (safeAreaInsets?.left ?? 0)
//            let maxX = self.view.frame.width - FloatingBackView.frame.width / 2 - (safeAreaInsets?.right ?? 0)
//
//            let clampedX: CGFloat
//            if FloatingBackView.center.x < self.view.frame.width / 2 {
//                clampedX = minX + 12
//            } else {
//                clampedX = maxX - 12
//            }
//
//            let minY = FloatingBackView.frame.height / 2 + (safeAreaInsets?.top ?? 0)
//            let maxY = self.view.frame.height - FloatingBackView.frame.height / 2 - (safeAreaInsets?.bottom ?? 0)
//
//            let clampedY = min(maxY, max(minY, FloatingBackView.center.y))
//
//            FloatingBackView.center = CGPoint(x: clampedX, y: clampedY)
//            UserDefaults.standard.setValue(FloatingBackView.frame.minX, forKey: "keypadbtnFramX")
//            UserDefaults.standard.setValue(FloatingBackView.frame.minY, forKey: "keypadbtnFramY")
//            sender.setTranslation(CGPoint.zero, in: self.view)
//        case .cancelled:
//            print("Cancelled.")
//        default:
//            print("Default.")
//        }
//    }

    
    @objc func draggedView(_ sender: UIPanGestureRecognizer) {
        self.view.bringSubviewToFront(FloatingBackView)
        switch sender.state {
        case .began:
            print("Began.")
        case .changed:
            self.TableBackView.alpha = 0
            self.btnFloating.isSelected = false
            let translation = sender.translation(in: self.FloatingBackView)
            FloatingBackView.center = CGPoint(x: FloatingBackView.center.x + translation.x, y: FloatingBackView.center.y + translation.y)
            sender.setTranslation(CGPoint.zero, in: self.view)
            print("Changed.")
        case .ended:
            print("Ended.")
            isdrag = true
            let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
            let minX = FloatingBackView.frame.width / 2 + (safeAreaInsets?.left ?? 0)
            let maxX = self.view.frame.width - FloatingBackView.frame.width / 2 - (safeAreaInsets?.right ?? 0)
            
            let clampedX: CGFloat
            if FloatingBackView.center.x < self.view.frame.width / 2 {
                clampedX = minX + 12
            } else {
                clampedX = maxX - 12
            }
            
            let minY = FloatingBackView.frame.height / 2 + (safeAreaInsets?.top ?? 0)
            let maxY = self.view.frame.height - FloatingBackView.frame.height / 2 - (safeAreaInsets?.bottom ?? 0)
            
            let clampedY = min(maxY, max(minY, FloatingBackView.center.y))
            FloatingBackView.center = CGPoint(x: clampedX, y: clampedY)
            DispatchQueue.main.async {
                self.ViewFrame = self.FloatingBackView.frame
            }
            UserDefaults.standard.setValue(FloatingBackView.frame.minX, forKey: "keypadbtnFramX")
            UserDefaults.standard.setValue(FloatingBackView.frame.minY, forKey: "keypadbtnFramY")
            sender.setTranslation(CGPoint.zero, in: self.view)
            
        case .cancelled:
            print("Cancelled.")
        default:
            print("Default.")
        }
    }
    
    func showViewiPhone(){
        let buttonCenterY = FloatingBackView.center.y
        let buttonCenterX = FloatingBackView.center.x
        
        var customViewCenterX: CGFloat
        var customViewCenterY: CGFloat
        
        let xOffset: CGFloat = -20
        let yOffset: CGFloat = 20
        let spacing: CGFloat = 5
        
        let safeAreaTopInset = (UIApplication.shared.windows.first?.safeAreaInsets.top ?? 0) + 3
        
        var roundedCorners: UIRectCorner = []
        let cornerRadii = CGSize(width: 25, height: 25)
        
        if buttonCenterY < TableBackView.frame.height + yOffset + safeAreaTopInset {
            customViewCenterY = buttonCenterY + yOffset + TableBackView.frame.height / 2 + 20 //
            roundedCorners = [.topRight, .topLeft, .bottomLeft, .bottomRight]
            
            if buttonCenterX < view!.frame.width / 2 {
                roundedCorners.remove(.topLeft)
                imgTopLeft.alpha = 1
                imgTopRight.alpha = 0
                imgBottomLeft.alpha = 0
                imgBottomRight.alpha = 0
            }
            
            if buttonCenterX > view!.frame.width / 2 {
                roundedCorners.remove(.topRight)
                imgTopLeft.alpha = 0
                imgTopRight.alpha = 1
                imgBottomLeft.alpha = 0
                imgBottomRight.alpha = 0
            }
        } else if view!.frame.height - buttonCenterY < TableBackView.frame.height + yOffset {
            customViewCenterY = buttonCenterY - yOffset - TableBackView.frame.height / 2
            roundedCorners = [.topRight, .topLeft, .bottomRight, .bottomLeft]
            
            if buttonCenterX < view!.frame.width / 2 {
                roundedCorners.remove(.bottomLeft)
                imgTopLeft.alpha = 0
                imgTopRight.alpha = 0
                imgBottomLeft.alpha = 1
                imgBottomRight.alpha = 0
            }
            
            if buttonCenterX > view!.frame.width / 2 {
                roundedCorners.remove(.bottomRight)
                imgTopLeft.alpha = 0
                imgTopRight.alpha = 0
                imgBottomLeft.alpha = 0
                imgBottomRight.alpha = 1
            }
        } else {
            customViewCenterY = buttonCenterY - yOffset - TableBackView.frame.height / 2
            roundedCorners = [.topRight, .topLeft, .bottomLeft, .bottomRight]
            
            if buttonCenterX < view!.frame.width / 2 {
                roundedCorners.remove(.bottomLeft)
                imgTopLeft.alpha = 0
                imgTopRight.alpha = 0
                imgBottomLeft.alpha = 1
                imgBottomRight.alpha = 0
            }
            
            if buttonCenterX > view!.frame.width / 2 {
                roundedCorners.remove(.bottomRight)
                imgTopLeft.alpha = 0
                imgTopRight.alpha = 0
                imgBottomLeft.alpha = 0
                imgBottomRight.alpha = 1
            }
        }
        
        let minY = TableBackView.frame.height / 2
        let maxY = view!.frame.height - TableBackView.frame.height / 2
        customViewCenterY = min(maxY, max(minY, customViewCenterY)) - 10 //
        
        if buttonCenterX < TableBackView.frame.width + xOffset {
            customViewCenterX = buttonCenterX + xOffset + TableBackView.frame.width / 2 + spacing // Add spacing
        } else if view!.frame.width - buttonCenterX < TableBackView.frame.width + xOffset {
            customViewCenterX = buttonCenterX - xOffset - TableBackView.frame.width / 2 - spacing // Add spacing
        } else {
            customViewCenterX = buttonCenterX + FloatingBackView.frame.width / 2 + TableBackView.frame.width / 2
        }
        
        TableBackView.center = CGPoint(x: customViewCenterX, y: customViewCenterY)
        let path = UIBezierPath(roundedRect: TableBackView.bounds, byRoundingCorners: roundedCorners, cornerRadii: cornerRadii)
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
       // subView.layer.mask = maskLayer
        UIView.animate(withDuration: 0.5, animations: { [self] in
            self.TableBackView.alpha = 1.0
            self.FloatingBackView.alpha = 1.0
            //            self.showTimer.invalidate()
        })
    }
    func dismissView(){
        UIView.animate(withDuration: 0.5, animations: {
            self.TableBackView.alpha = 0.0
            self.FloatingBackView.alpha = 1.0
            
        })
    }
}

extension FloatingOnTableViewController: UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ArrImage.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "ShowImageTableViewCell") as! ShowImageTableViewCell
        cell.selectionStyle = .none
        cell.imgImage.image = ArrImage[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.TableBackView.alpha = 0
        isselect = true
        let navigate = self.storyboard?.instantiateViewController(withIdentifier: "BabySplashVC") as! BabySplashVC
        
        self.navigationController?.pushViewController(navigate, animated: true)
        //self.navigationController?.present(navigate, animated: true)
    }
}
