//
//  AddTaskViewController.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

class AddTaskViewController: UIViewController {
    
    private lazy var addNewTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TextConstants.addTaskTitleLabel
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var titleTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TextConstants.addTaskTitleTaskLabel
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        return label
    }()
    
    private lazy var titleTaskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextConstants.addTaskTitleTaskPlaceholder
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var descriptionTaskLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TextConstants.addTaskDescriptionTaskLabel
        label.font = .systemFont(ofSize: 16, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        return label
    }()
    
    private lazy var descriptionTaskTextField: UITextField = {
        let textField = UITextField()
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.placeholder = TextConstants.addTaskDescriptionTaskPlaceholder
        textField.borderStyle = .roundedRect
        return textField
    }()
    
    private lazy var saveTaskButton: UIButton = {
        let button = UIButton(type: .system)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle(TextConstants.addTaskSaveTaskButtonLabel, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 18, weight: .bold)
        button.addTarget(self, action: #selector(didTapSaveTaskButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapSaveTaskButton(sender: UIButton) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        self.setVisualElements()
    }
    
    private func setVisualElements() {
        view.addSubview(addNewTaskLabel)
        view.addSubview(titleTaskLabel)
        view.addSubview(titleTaskTextField)
        view.addSubview(descriptionTaskLabel)
        view.addSubview(descriptionTaskTextField)
        view.addSubview(saveTaskButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            addNewTaskLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 32),
            addNewTaskLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            titleTaskLabel.topAnchor.constraint(equalTo: addNewTaskLabel.bottomAnchor, constant: 24),
            titleTaskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTaskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            titleTaskTextField.topAnchor.constraint(equalTo: titleTaskLabel.bottomAnchor, constant: 8),
            titleTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            titleTaskTextField.heightAnchor.constraint(equalToConstant: 48),
            
            descriptionTaskLabel.topAnchor.constraint(equalTo: titleTaskTextField.bottomAnchor, constant: 20),
            descriptionTaskLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTaskLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            
            descriptionTaskTextField.topAnchor.constraint(equalTo: descriptionTaskLabel.bottomAnchor, constant: 8),
            descriptionTaskTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTaskTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTaskTextField.heightAnchor.constraint(equalToConstant: 48),
            
            saveTaskButton.topAnchor.constraint(equalTo: descriptionTaskTextField.bottomAnchor, constant: 20),
            saveTaskButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
        ])
    }
}
