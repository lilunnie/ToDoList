//
//  ToDo.swift
//  TableView
//
//  Created by Imane Fadel on 15/12/2021.
//

import Foundation

class ToDo {
    var name: String
    var description: String
    var status: String
    var date: Date
    
    init(name: String, description: String, date: Date) {
        self.name = name
        self.description = description
        self.status = "À faire"
        self.date = date
    }
}





