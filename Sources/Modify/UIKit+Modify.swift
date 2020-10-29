//
//  File.swift
//  
//
//  Created by Dsee.Lab on 2020/10/29.
//
#if !os(macOS)
import UIKit

/// 为啥不用Self? 参见=> https://stackoverflow.com/questions/61137449/fatal-error-could-not-demangle-keypath-type
/// 所以子类用时得最后做个强转
public extension UIView {
    
    func tagged(_ tag: Int) -> UIView {
        modified(tag, for: \.tag)
    }
    
    func frame(_ frame: CGRect) -> UIView {
        modified(frame, for: \.frame)
    }
    
    func bounds(_ bounds: CGRect) -> UIView {
        modified(bounds, for: \.bounds)
    }

    func centered(_ center: CGPoint) -> UIView {
        modified(center, for: \.center)
    }
    
    func transformed(_ transform: CGAffineTransform) -> UIView {
        modified(transform, for: \.transform)
    }
    
    @available(iOS 13.0, *)
    func transformed(_ transform3D: CATransform3D) -> UIView {
        modified(transform3D, for: \.transform3D)
    }
    
    func contentScaleFactor(_ factor: CGFloat) -> UIView {
        modified(factor, for: \.contentScaleFactor)
    }
    
    func multipleTouchEnabled(_ enabled: Bool) -> UIView {
        modified(enabled, for: \.isMultipleTouchEnabled)
    }
    
    func exclusiveToucu(_ exclusive: Bool) -> UIView {
        modified(exclusive, for: \.isExclusiveTouch)
    }
    
    func autoresizesSubviews(_ auto: Bool) -> UIView {
        modified(auto, for: \.autoresizesSubviews)
    }
    
    func autoresizingMask(_ mask: UIView.AutoresizingMask) -> UIView {
        modified(mask, for: \.autoresizingMask)
    }
    
    func clipsToBounds(_ clips: Bool) -> UIView {
        modified(clips, for: \.clipsToBounds)
    }
    
    func backgroundColor(_ color: UIColor) -> UIView {
        modified(color, for: \.backgroundColor)
    }
    
    func alpha(_ alpha: CGFloat) -> UIView {
        modified(alpha, for: \.alpha)
    }
    
    func opaque(_ isOpaque: Bool) -> UIView {
        modified(isOpaque, for: \.isOpaque)
    }
    
    func clearsContextBeforeDrawing(_ clears: Bool) -> UIView {
        modified(clears, for: \.clearsContextBeforeDrawing)
    }
    
    func hide(_ isHidden: Bool) -> UIView {
        modified(isHidden, for: \.isHidden)
    }
    
    func contentMode(_ mode: UIView.ContentMode) -> UIView {
        modified(mode, for: \.contentMode)
    }
    
    func masked(_ mask: UIView?) -> UIView {
        modified(mask, for: \.mask)
    }
    
    func tintColor(_ color: UIColor) -> UIView {
        modified(color, for: \.tintColor)
    }
    
    func tintAdjustmentMode(_ mode: UIView.TintAdjustmentMode) -> UIView {
        modified(mode, for: \.tintAdjustmentMode)
    }
    
    func restorationIdentifier(_ identifier: String?) -> UIView {
        modified(identifier, for: \.restorationIdentifier)
    }
    
    @available(iOS 13.0, *)
    func overrideUserInterfaceStyle(_ style: UIUserInterfaceStyle) -> UIView {
        modified(style, for: \.overrideUserInterfaceStyle)
    }
    
}
#endif
