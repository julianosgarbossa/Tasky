//
//  UIViewController+.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

extension UIViewController {
    func addGradientBackground() {
        let gradientBackground = CAGradientLayer()
        gradientBackground.frame = view.bounds
        gradientBackground.colors = [UIColor.white.cgColor, UIColor(named: AssetsConstants.lilac)?.cgColor ?? UIColor.purple.cgColor]
        view.layer.insertSublayer(gradientBackground, at: 0)
    }
    
    func showAlert(title: String = "Erro", message: String, buttonTitle: String = "OK") {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonTitle, style: .default))
        self.present(alert, animated: true, completion: nil)
    }
}
