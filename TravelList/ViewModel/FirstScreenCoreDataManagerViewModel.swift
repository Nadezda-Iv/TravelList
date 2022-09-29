//
//  CoreDataManagerViewModel.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.07.2022.
//

import Foundation

class CoreDataManagerViewModel {
    
    let dbUtil = CoreDataManager()
    var routeList : [RouteEntity] = []

    func addRoute(dates: Date, nameRoute: String) {
        
        dbUtil.addRoute(dates: dates, nameRoute: nameRoute)
    }
    
    func getRoute(){
        
        routeList = dbUtil.getAllRoute()
    }
    
    func deleteRoute(routeToDelete: RouteEntity){
        
        dbUtil.deleteRoute(route: routeToDelete)
    }
    
    func sortEmpByName(){
        routeList = dbUtil.getRouteSortByName()
    }
}
