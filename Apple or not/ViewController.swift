//
//  ViewController.swift
//  Apple or not
//
//  Created by Mathias Bouillon on 14/05/2020.
//  Copyright © 2020 Mathias Bouillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var container: UIView!
    
    //référencer une vue
    var carte: MaVue?
    var rect = CGRect()
    var boutonOui = MyButton()
    var boutonNon = MyButton()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //background dégradé
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.black.cgColor, UIColor.darkGray.cgColor]
        gradient.startPoint = CGPoint(x: 0, y: 0)
        gradient.endPoint = CGPoint(x: 1, y: 1)
        gradient.frame = view.bounds
        view.layer.addSublayer(gradient)
        //ramener le container au premier plan
        view.bringSubviewToFront(container)
        
        
        //Créer un rectangle - CGRect
        rect = CGRect(
            x: container.frame.midX - 100,
            y: container.frame.midY - 100,
            width: 200,
            height: 200)
        carte = MaVue(frame: rect)
        //Pour ajouter le CGRect dans le container
        container.addSubview(carte ?? UIView())
        
        
        //Création des boutons
        let tiers = container.frame.width / 3
        let quart = container.frame.width / 4
        let hauteur: CGFloat = 50
        let yPosition = container.frame.height - hauteur
        let taille = CGSize(width: tiers, height: hauteur)
        
        boutonNon.frame.size = taille
        boutonNon.center = CGPoint(x: quart, y: yPosition)
        boutonNon.setup(string: "NON")
        boutonNon.addTarget(self, action: #selector(non), for: .touchUpInside)
        container.addSubview(boutonNon)
        
        boutonOui.frame.size = taille
        boutonOui.center = CGPoint(x: quart * 3, y: yPosition)
        boutonOui.setup(string: "OUI")
        boutonOui.addTarget(self, action: #selector(oui), for: .touchUpInside)
        container.addSubview(boutonOui)
        
        
    }
    
    
    //Commence à toucher la vue
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
    }
    
    //Bouge le doigt sur l'écran
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == carte?.masque{
            //permet de bouger le cadre sur l'axe X
            let xPosition = touch.location(in: container).x
            let distance = container.frame.midX - xPosition
            let angle = -distance / 360
            carte?.center.x = xPosition
            carte?.transform = CGAffineTransform(rotationAngle: angle)
        }
    }
    
    //Arrête de toucher l'écran
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        if let touch = touches.first, touch.view == carte?.masque{
            //Reviens à sa position d'origine et reprend sa forme
            carte?.transform = CGAffineTransform.identity
            carte?.frame = rect
        }
    }

    
    @objc func non() {
        print("Non")
    }
    
    @objc func oui() {
        print("Oui")
    }

}

