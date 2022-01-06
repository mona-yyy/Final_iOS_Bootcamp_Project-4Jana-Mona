//
//  UIViewExtensions.swift
//  Created by mona M on 18/12/2021.


import Foundation
import UIKit

extension UIView {
      @IBInspectable var isRounded: Bool {
          set {
            self.layer.cornerRadius = self.frame.height / 2
          }
          get {
              return self.layer.cornerRadius == self.frame.height / 2
          }
      }
    
    @IBInspectable var borderColor: UIColor {
        set {
            self.layer.borderColor = newValue.cgColor
        }
        get {
            return UIColor.init(cgColor: self.layer.borderColor ?? UIColor.white.cgColor)
        }
    }
    
    @IBInspectable var flipHorizontally: Bool {
        set {
            if newValue {
                self.transform = CGAffineTransform(scaleX: -1, y: 1)
            }
        }
        get {
            return true
        }
    }
    
//    
//    
//    @IBInspectable var shadowRadius: CGFloat {
//        set {
//            self.layer.shadowRadius = newValue
//        }
//        get {
//            return self.layer.shadowRadius
//        }
//    }
//    
//    @IBInspectable var shadowColor: UIColor {
//        set {
//            self.layer.shadowColor = newValue.cgColor
//        }
//        get {
//            return UIColor.init(cgColor: self.layer.shadowColor ?? UIColor.white.cgColor)
//        }
//    }
//    
//    @IBInspectable var shadowOffset: CGSize {
//        set {
//            self.layer.shadowOffset = newValue
//        }
//        get {
//            return self.layer.shadowOffset
//        }
//    }
//    
//    @IBInspectable var shadowOpacity: Float {
//        set {
//            self.layer.shadowOpacity = newValue
//        }
//        get {
//            return self.layer.shadowOpacity
//        }
//    }
    
    var parentViewController: UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}

extension UITabBar {
    @IBInspectable var isShowOriginalColor: Bool {
        set {
            for (index, item) in (self.items ?? []).enumerated() {
                let img =  item.selectedImage?.withRenderingMode(.alwaysOriginal)
                self.items?[index].selectedImage = newValue == true ? img : item.selectedImage
                
                let img2 =  item.image?.withRenderingMode(.alwaysOriginal)
                self.items?[index].image = newValue == true ? img2 : item.image
                
            }
        } get {
            return false
        }
    }
    
    @IBInspectable var nonSelectionActionColor: UIColor {
        set {
            self.unselectedItemTintColor = newValue
        } get {
            return self.unselectedItemTintColor ?? .gray
        }
    }
    
}
