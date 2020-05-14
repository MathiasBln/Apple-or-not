//
//  MaVue.swift
//  Apple or not
//
//  Created by Mathias Bouillon on 14/05/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit

class MaVue: UIView {
    
    var masque = UIView()

    //Créer une vue façon programmatique
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    
    //Utiliser via un Xib ou Storyboard
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }

    func ajoutMasque() {
        masque = UIView(frame: bounds)
        masque.backgroundColor = .green
        masque.layer.cornerRadius = 25
        masque.alpha = 0.25
        addSubview(masque)
    }
    
    func setup() {
        setLayer()
        //L'user peut intéragir avec la vue
        isUserInteractionEnabled = true
        ajoutMasque()
    }
    
    
}
