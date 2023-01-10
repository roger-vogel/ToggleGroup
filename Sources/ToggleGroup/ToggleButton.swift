//
//  ToggleButton.swift
//  
//
//  Created by Roger Vogel on 1/9/23.
//

import UIKit
import Extensions


public struct ToggleColors {
    
    public var selectedForeground: UIColor?
    public var selectedBackground: UIColor?
    public var unselectedForeground: UIColor?
    public var unselectedBackground: UIColor?
}

public class ToggleButton: UIButton {

    // MARK: - PROPERTIES
    public var isOn = false
    public var isCheckBox = false
    public var boxTint: UIColor = .green
    public var groupView: ButtonGroupView?
    public var theSelectedImage: UIImage?
    public var theUnselectedImage: UIImage?
    public var theToggleColors: ToggleColors?
   
    // MARK: - COMPUTED PROPERTIES
    public var isInRadioGroup: RadioType {
        
        get { return groupView!.radioType }
        set { groupView!.radioType = newValue }
    }
        
    // MARK: - METHODS
    public func initToggle(isCheckBox: Bool? = false, boxTint: UIColor? = .green) {
        
        self.isCheckBox = isCheckBox!
        self.boxTint = boxTint!
        
        isOn = true
        toggle()
    }
    
    public func initToggle(selectedImage: UIImage? = nil, unselectedImage: UIImage? = nil, toggleColors: ToggleColors? = nil) {
        
        theSelectedImage = selectedImage
        theUnselectedImage = unselectedImage
        theToggleColors = toggleColors
        
        isOn = true
        toggle()
    }
    
    public func setState(_ state: Bool) {
        
        isOn = !state
        toggle()
    }
        
    public func toggle() {
        
        isOn = !isOn
        
        if isCheckBox {
            
            let theSelectedImage = UIImage(systemName: "checkmark.circle.fill", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!
            theSelectedImage.withTintColor(boxTint)
            
            let theUnselectedImage = UIImage(systemName: "circle", withConfiguration: UIImage.SymbolConfiguration(scale: .large))!
            theUnselectedImage.withTintColor(boxTint)
            
            if isOn { setImage(theSelectedImage, for: .normal) }
            else { setImage(theUnselectedImage, for: .normal) }
         
            return
        }
    
        if theSelectedImage != nil && theUnselectedImage != nil {
            
            if isOn { self.setImage(theSelectedImage!, for: .normal) }
            else { self.setImage(theUnselectedImage!, for: .normal) }
        
            return
        }
        
        if theToggleColors != nil {
            
            if isOn {
                
                self.setTitleColor(theToggleColors!.selectedForeground, for: .normal)
                self.backgroundColor = theToggleColors!.selectedBackground
                
            } else {
                
                self.setTitleColor(theToggleColors!.unselectedForeground, for: .normal)
                self.backgroundColor = theToggleColors!.unselectedBackground
            }
        }
    }
}
