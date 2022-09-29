//
//  CheckListCoreDataViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 28.09.2022.
//

import Foundation

class CheckListCoreDataViewModel {
    
    let coreManager = CoreDataManagerForCheckList()
    
    var checkList : [Tasks] = []
    
    func addTask(newTask: String) {
        coreManager.addNewTask(task: newTask)
    }
    
    
    func getTask() {
        checkList = coreManager.getAllTasks()
    }
    
    
    func deleteTask(taskDel: Tasks) {
        coreManager.deleteTasks(task: taskDel)
    }

    
}
