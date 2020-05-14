//
//  MyButton.swift
//  Apple or not
//
//  Created by Mathias Bouillon on 14/05/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit

class MyButton: UIButton {

    func setup(string: String) {
        setLayer()
        setTitle(string, for: UIControl.State.normal)
        setTitleColor(UIColor.darkGray, for: .normal)
        
    }
}
