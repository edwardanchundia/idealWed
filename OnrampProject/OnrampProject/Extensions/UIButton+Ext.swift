//
//  UIButton+Ext.swift
//  OnrampProject
//
//  Created by Edward Anchundia on 3/4/20.
//

import UIKit

extension UIButton {
    func hasImage(named imageName: String, for state: UIControl.State) -> Bool {
        guard let buttonImage = image(for: state),
            let namedImage = UIImage(systemName: imageName) else {
            return false
        }
        return buttonImage.pngData() == namedImage.pngData()
    }
    
    func animateButtonTo(systemName: String) {
        UIView.transition(with: self, duration: 1.0, options: .curveEaseIn, animations: {
            self.setImage(UIImage(systemName: systemName), for: .normal)
        }, completion: nil)
    }
}
