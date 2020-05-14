//
//  ExtensionView.swift
//  Apple or not
//
//  Created by Mathias Bouillon on 14/05/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit

extension UIView {
    
    func setLayer() {
        backgroundColor = .white
        layer.cornerRadius = 25
        //shadow
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.75
        layer.shadowRadius = 4
        layer.shadowOffset = CGSize(width: 5, height: 5)
    }
}
