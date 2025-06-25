//
//  TasksTableViewHeader.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

protocol TasksTableViewHeaderDelegate: AnyObject {
    func didTapAddTaskButton()
}

class TasksTableViewHeader: UIView {
    
    weak var delegate: TasksTableViewHeaderDelegate?

    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = TextConstants.headerTitleLabel
        label.font = .systemFont(ofSize: 20, weight: .bold)
        label.textColor = UIColor(named: AssetsConstants.darkPurple)
        label.textAlignment = .center
        return label
    }()
    
    private lazy var addTaskButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        let plusImage = UIImage(systemName: "plus")
        button.setImage(plusImage, for: .normal)
        button.addTarget(self, action: #selector(didTapAddTaskButton), for: .touchUpInside)
        return button
    }()
    
    @objc
    private func didTapAddTaskButton(sender: UIButton) {
        self.delegate?.didTapAddTaskButton()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setVisualElements()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setVisualElements() {
        addSubview(titleLabel)
        addSubview(addTaskButton)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            titleLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
            
            addTaskButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            addTaskButton.centerYAnchor.constraint(equalTo: centerYAnchor),
        ])
    }

}
