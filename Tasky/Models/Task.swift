//
//  Task.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import Foundation

struct Task {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}

var tasks: [Task] = [Task(title: "Fazer café"),
                     Task(title: "Estudar swift", description: "MVC"),
                     Task(title: "Fazer trabalho da faculdade", description: "Modelos Éticos"),]
