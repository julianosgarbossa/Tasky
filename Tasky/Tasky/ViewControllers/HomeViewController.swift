//
//  HomeViewController.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

class HomeViewController: UIViewController {

    private lazy var logoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: AssetsConstants.logoIllustration)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var mainIllustrationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: AssetsConstants.homeIllustration)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var getReadyLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TextConstants.homeDescriptionLabel
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = .systemFont(ofSize: 22, weight: .bold)
        return label
    }()
    
    private lazy var getStartedButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(TextConstants.homeTitleButtonLabel, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.backgroundColor = UIColor(named: AssetsConstants.darkPurple)
        button.layer.cornerRadius = 12
        button.addTarget(self, action: #selector(didTapGetStartedButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapGetStartedButton(sender: UIButton) {
        navigationController?.pushViewController(TasksViewController(), animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGradientBackground()
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        view.addSubview(logoImageView)
        view.addSubview(mainIllustrationImageView)
        view.addSubview(getReadyLabel)
        view.addSubview(getStartedButton)
        
        self.setConstrains()
    }
    
    private func setConstrains() {
        NSLayoutConstraint.activate([
            logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            mainIllustrationImageView.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 8),
            mainIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            getReadyLabel.topAnchor.constraint(equalTo: mainIllustrationImageView.bottomAnchor, constant: 32),
            getReadyLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 26),
            getReadyLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -26),
            
            getStartedButton.topAnchor.constraint(equalTo: getReadyLabel.bottomAnchor, constant: 32),
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.widthAnchor.constraint(equalToConstant: 162),
            getStartedButton.heightAnchor.constraint(equalToConstant: 48),
        ])
    }
}
