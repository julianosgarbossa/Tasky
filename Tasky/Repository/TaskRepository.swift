//
//  TaskRepository.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 26/06/25.
//

import Foundation

class TaskRepository {
    
    init() {}
    
    var tasks: [Task] = []
    
    func addTask(newTask: Task) {
        tasks.append(newTask)
    }
    
    func removeTask(at index: Int) {
        guard index >= 0 && index < tasks.count else { return }
        tasks.remove(at: index)
    }
    
    func completeTask(at index: Int) {
        guard index >= 0 && index < tasks.count else { return }
        tasks[index].isCompleted.toggle()
    }
}
