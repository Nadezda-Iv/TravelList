//
//  CoreDataManagerViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.07.2022.
//

import Foundation

class CoreDataManagerViewModel {
    
    let dbUtil = CoreDataManager()
    var empList : [RouteEntity] = []

    func addEmp(dates: Date, nameRoute: String) {
        
        dbUtil.addEmployee(dates: dates, nameRoute: nameRoute)
    }
    
    func getEmp(){
        
        empList = dbUtil.getAllEmployees()
    }
    
    func deleteEmp(empToDelete: RouteEntity){
        
        dbUtil.deleteEmp(emp: empToDelete)
    }
    
    func sortEmpByName(){
        empList = dbUtil.getEmpSortByName()
    }
}
