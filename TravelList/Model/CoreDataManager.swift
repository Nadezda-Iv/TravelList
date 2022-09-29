//
//  CoreDataManager.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 19.07.2022.
//

import UIKit
import CoreData


public class CoreDataManager{
     
     let mContext = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
     
     func addRoute(dates: Date, nameRoute: String){
         
         
         let newRoute = RouteEntity(context: mContext)
         
         newRoute.dates = dates
         newRoute.nameRoute = nameRoute
         
         do {
             try mContext.save() // insertion happeing
             
             print("Emp added..")
         }catch {
             print("Unable to add employee: \(error.localizedDescription)")
             mContext.delete(newRoute)
         }
     }
     
    
     func getAllRoute() -> [RouteEntity] {
         
         let fReq : NSFetchRequest<RouteEntity> = RouteEntity.fetchRequest()
         
         do {
             let routeList = try mContext.fetch(fReq)
             return routeList
             
         }catch {
             print("Could not query: \(error.localizedDescription)")
         }
         return []
     }
     
     func deleteRoute(route: RouteEntity){
         
         mContext.delete(route)
         do {
             try mContext.save()
             print("Deleted \(route.nameRoute ?? "" )")
         }catch {
             print("Could not delete \(route.nameRoute ?? "")")
         }
     }
     
     func getRouteSortByName() -> [RouteEntity] {
         let fReq : NSFetchRequest<RouteEntity> = RouteEntity.fetchRequest()
         
         let nameSortDes = NSSortDescriptor(key: "nameRoute", ascending: true)
         
         fReq.sortDescriptors = [nameSortDes]
         do {
             let routes = try mContext.fetch(fReq)
             return routes
         }catch {
             print("getEmpSortByName: Could not fetch ")
         }
         
         return []
     }
  
 }

