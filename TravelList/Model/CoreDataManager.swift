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
     
     func addEmployee(dates: Date, nameRoute: String){
         
         
         let emp = RouteEntity(context: mContext)
         
         emp.dates = dates
         emp.nameRoute = nameRoute
         
         do {
             try mContext.save() // insertion happeing
             
             print("Emp added..")
         }catch {
             print("Unable to add employee: \(error.localizedDescription)")
             mContext.delete(emp)
         }
     }
     
    
     func getAllEmployees() -> [RouteEntity] {
         
         let fReq : NSFetchRequest<RouteEntity> = RouteEntity.fetchRequest()
         
         do {
             let empList = try mContext.fetch(fReq)
             return empList
             
         }catch {
             print("Could not query: \(error.localizedDescription)")
         }
         return []
     }
     
     func deleteEmp(emp: RouteEntity){
         
         mContext.delete(emp)
         do {
             try mContext.save()
             print("Deleted \(emp.nameRoute ?? "" )")
         }catch {
             print("Could not delete \(emp.nameRoute ?? "")")
         }
     }
     
     func getEmpSortByName() -> [RouteEntity] {
         let fReq : NSFetchRequest<RouteEntity> = RouteEntity.fetchRequest()
         
         let nameSortDes = NSSortDescriptor(key: "nameRoute", ascending: true)
         
         fReq.sortDescriptors = [nameSortDes]
         do {
             let emps = try mContext.fetch(fReq)
             return emps
         }catch {
             print("getEmpSortByName: Could not fetch ")
         }
         
         return []
     }
  
 }

