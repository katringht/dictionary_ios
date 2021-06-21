//
//  Animations.swift
//  dict
//
//  Created by Ekaterina Tarasova on 21.06.2021.
//

import UIKit

let blurEffect: UIVisualEffectView = {
    let blurEff = UIBlurEffect(style: .dark)
    let view = UIVisualEffectView(effect: blurEff)
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()

func setupBlurEffect(view: UIView) {
    view.addSubview(blurEffect)
    blurEffect.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
    blurEffect.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    blurEffect.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
    blurEffect.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    blurEffect.alpha = 0
}

func animationsOut(alert: UIView) {
    UIView.animate(withDuration: 0.3) {
        blurEffect.alpha = 0
        alert.alpha = 0
    } completion: { (_) in
        alert.removeFromSuperview()
    }

}

func animations(alert: UIView) {
    alert.transform = CGAffineTransform.init(scaleX: 1.3, y: 1.3)
    alert.alpha = 0
    
    UIView.animate(withDuration: 0.3) {
        blurEffect.alpha = 1
        alert.alpha = 1
        alert.transform = CGAffineTransform.identity
    }
}
