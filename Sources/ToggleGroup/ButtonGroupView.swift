//
//  ButtonGroupView.swift
//  
//
//  Created by Roger Vogel on 1/9/23.
//

import UIKit
import Extensions


public enum RadioType: Int { case open, locked, unlocked }

public class ButtonGroupView: UIView {
    
    // MARK: - PROPERTIES
    public var radioType: RadioType = .open

    // MARK: - COMPUTED PROPERTIES
    public var toggleGroup: [ToggleButton]?
    
    public var toggledButtons: [ToggleButton] {
        
        var selectedButtons = [ToggleButton]()
        
        for button in toggleGroup! {
            
            if button.isOn { selectedButtons.append(button) }
        }
        
        return selectedButtons
        
    }
    
    public var toggledRadioButton: ToggleButton? {
        
        guard toggleGroup != nil else { return nil }
        
        for button in toggleGroup! { if button.isOn { return button } }
        return nil
    }
        
    public var toggledButtonTag: Int? {
        
        for button in toggleGroup! {  if button.isOn { return button.tag } }
        return nil
    }
    
    // MARK: - METHODS
    public func initToggleButtons(isCheckBox: Bool, withTint: UIColor) {
        
        guard toggleGroup != nil else { return }
     
        for button in toggleGroup! {
        
            button.initToggle(isCheckBox: true, boxTint: withTint)
        }
    }
    
    public func initToggleButtons(selectedImage: UIImage? = nil, unselectedImage: UIImage? = nil, toggleColors: ToggleColors? = nil) {
        
        guard toggleGroup != nil else { return }
     
        for button in toggleGroup! {
        
            button.initToggle(selectedImage: selectedImage, unselectedImage: unselectedImage, toggleColors: toggleColors)
        }
    }
    
    public func setGroup(toggleGroup:[ToggleButton]? = nil, radioType: RadioType? = RadioType.open) {
        
        self.toggleGroup = toggleGroup
        self.radioType = radioType!
    
        if toggleGroup != nil { for toggleButton in toggleGroup! { toggleButton.groupView = self } }
    }
    
    public func setSelection(_ button: ToggleButton, state: Bool? = true) {
        
        button.setState(state!)
        isSelected(button)
    }
    
    public func isSelected(_ button: ToggleButton) {
        
        guard toggleGroup != nil else { return }
        
        if radioType != .open {
            
            for aButton in toggleGroup! {
                if aButton != button { aButton.setState(false) } }
        }
    }
    
    public func enableGroup(_ state: Bool) {
        
        if toggleGroup != nil {
            
            for button in toggleGroup! {
                
                button.isEnabled = state
                button.alpha = state ? 1.0 : 0.50
            }
        }
    }
    
    public func roundButtons() {
        
        guard toggleGroup != nil else { return }
        for button in toggleGroup! { button.roundAllCorners(value: 5) }
    }
    
    public func toggle(button: ToggleButton) {
        
        // Save the toggle state and then toggle the button
        let priorStateIsOn = button.isOn
      
        // Act based on group type - locked
        if radioType == .locked {
            
            // Toggle this button on and toggle the others off
            button.toggle()
            isSelected(button)
            
        // Unlocked
        } else if radioType == .unlocked {
            
            // If this button was on, just toggle it off
            if priorStateIsOn {
                
                button.toggle()
                
            // otherwise toggle this button on and toggle the others off
            }  else {
                
                button.toggle()
                isSelected(button)
                
            }
    
        // Open
        } else {
            
            // Just toggle the button
            button.toggle()
        }
    }
    
    public func clear() {
      
        if toggleGroup != nil {
            
            for button in toggleGroup! { button.setState(false) }
        }
    }
}
