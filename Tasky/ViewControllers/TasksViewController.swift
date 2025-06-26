//
//  TasksViewController.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import UIKit

protocol TasksViewControllerDelegate: AnyObject {
    func didAddTask(newTask: Task)
}

class TasksViewController: UIViewController {
    
    private var taskRepository: TaskRepository
    
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
    
    @objc
    private func didTapCompleteTaskButton(sender: UIButton) {
        guard let cell = sender.superview as? UITableViewCell else { return }
        guard let indexPath = tasksTableView.indexPath(for: cell) else { return }
        taskRepository.completeTask(at: indexPath.row)
        tasksTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    init(taskRepository: TaskRepository = TaskRepository()) {
        self.taskRepository = taskRepository
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
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
    
    private func createTaskCheckmarkButton(task: Task) -> UIButton {
        let completeButton = UIButton()
        let symbolName = task.isCompleted ? "checkmark.circle.fill" : "checkmark.circle"
        let configuration = UIImage.SymbolConfiguration(pointSize: 24)
        let image = UIImage(systemName: symbolName, withConfiguration: configuration)
        completeButton.setImage(image, for: .normal)
        completeButton.frame = .init(x: 0, y: 0, width: 24, height: 24)
        completeButton.addTarget(self, action: #selector(didTapCompleteTaskButton), for: .touchUpInside)
        return completeButton
    }
}

// MARK: - Tableview DataSource and Delegate
extension TasksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskRepository.tasks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "default", for: indexPath)
        var content = cell.defaultContentConfiguration()
        content.text = taskRepository.tasks[indexPath.row].title
        content.secondaryText = taskRepository.tasks[indexPath.row].description ?? ""
        cell.contentConfiguration = content
        cell.accessoryView = createTaskCheckmarkButton(task: taskRepository.tasks[indexPath.row])
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
            taskRepository.removeTask(at: indexPath.row)
            self.tasksTableView.reloadData()
        }
    }
}

// MARK: - Delegate TasksTableViewHeaderDelegate
extension TasksViewController: TasksTableViewHeaderDelegate {
    func didTapAddTaskButton() {
        let addTaskViewController = AddTaskViewController()
        addTaskViewController.delegate = self
        self.navigationController?.present(addTaskViewController, animated: true)
    }
}

// MARK: - Delegate TasksViewControllerDelegate
extension TasksViewController: TasksViewControllerDelegate {
    func didAddTask(newTask: Task) {
        self.taskRepository.addTask(newTask: newTask)
        self.tasksTableView.reloadData()
    }
}
