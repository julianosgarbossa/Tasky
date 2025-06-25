//
//  TasksViewController.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

class TasksViewController: UIViewController {
    
    private var tasks: [String] = ["Fazer café", "Estudar swift", "Fazer trabalho da faculdade"]
    
    private lazy var tasksTableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.backgroundColor = .white
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "default")
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
    }
    
    private func setVisualElements() {
        view.addSubview(tasksTableView)
        
        self.setConstraints()
    }
    
    private func setConstraints() {
        NSLayoutConstraint.activate([
            tasksTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tasksTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tasksTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tasksTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
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
        content.text = tasks[indexPath.row]
        cell.contentConfiguration = content
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
}
