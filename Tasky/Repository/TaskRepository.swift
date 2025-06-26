//
//  TaskRepository.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 26/06/25.
//

import Foundation

class TaskRepository {
    
    var tasks: [Task] = []
    private let userDefaults = UserDefaults.standard
    private let tasksKey = "tasky-app-tasks"
    
    init() {
        self.loadTasks()
    }
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
        self.saveTasks()
    }
    
    func removeTask(at index: Int) {
        guard index >= 0 && index < tasks.count else { return }
        tasks.remove(at: index)
        self.saveTasks()
    }
    
    func completeTask(at index: Int) {
        guard index >= 0 && index < tasks.count else { return }
        tasks[index].isCompleted.toggle()
        self.saveTasks()
    }
    
    private func saveTasks() {
        do {
            let tasksData = try JSONEncoder().encode(tasks)
            userDefaults.setValue(tasksData, forKey: tasksKey)
        } catch {
            print("ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    
    private func loadTasks() {
        guard let tasksData = userDefaults.data(forKey: tasksKey) else { return }
        do {
            tasks = try JSONDecoder().decode([Task].self, from: tasksData)
        } catch {
            print("ocorreu um erro ao carregar as tarefas: \(error)")
        }
    }
}
