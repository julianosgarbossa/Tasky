//
//  TaskRepository.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 26/06/25.
//

import Foundation

class TaskRepository {
    
    var tasks: [Task] = []
    private let persintence: PersistenceProtocol
    private let tasksKey = "tasky-app-tasks"
    
    init(persistence: PersistenceProtocol = UserDefaultsPersistence()) {
        self.persintence = persistence
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
            persintence.saveData(data: tasksData, key: tasksKey)
        } catch {
            print("ocorreu um erro ao salvar as tarefas: \(error)")
        }
    }
    
    private func loadTasks() {
        guard let tasksData = persintence.loadData(key: tasksKey) else { return }
        do {
            tasks = try JSONDecoder().decode([Task].self, from: tasksData)
        } catch {
            print("ocorreu um erro ao carregar as tarefas: \(error)")
        }
    }
}
