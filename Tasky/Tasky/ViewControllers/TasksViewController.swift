//
//  TasksViewController.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

class TasksViewController: UIViewController {
    
    private lazy var taskIllustrationImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(named: AssetsConstants.tasksIllustration)
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.layer.cornerRadius = 24
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
        let header = TasksTableViewHeader(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 64))
        header.delegate = self
        tableView.tableHeaderView = header
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.addGradientBackground()
        self.setVisualElements()
        self.setNavigationBar()
    }
    
    private func setNavigationBar() {
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.isHidden = true
    }
    
    private func setVisualElements() {
        view.addSubview(taskIllustrationImageView)
        view.addSubview(tasksTableView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            taskIllustrationImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            taskIllustrationImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            tasksTableView.topAnchor.constraint(equalTo: taskIllustrationImageView.bottomAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }
    
    private func createTaskCheckmarkButton() -> UIButton {
        let completeButton = UIButton()
        let symbolName = "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        completeButton.setImage(image, for: .normal)
        completeButton.frame = .init(x: 0, y: 0, width: 24, height: 24)
        return completeButton
    }
}

// MARK: - Tableview DataSource and Delegate
extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = tasks[indexPath.row].title
        content.secondaryText = tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckmarkButton()
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}

extension TasksViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        return tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            print("toque no botão de remover")
        }
    }
}

extension TasksViewController: TasksTableViewHeaderDelegate {
    func didTapAddTaskButton() {
        self.navigationController?.present(AddTaskViewController(), animated: true)
    }
}
