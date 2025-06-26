//
//  Task.swift
//  Tasky
//
//  Created by Juliano Sgarbossa on 25/06/25.
//

import Foundation

struct Task: Codable {
    var title: String
    var description: String?
    var isCompleted: Bool = false
}
