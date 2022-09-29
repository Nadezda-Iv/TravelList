//
//  CoreDataCheckList.swift
//  TravelList
//
//  Created by NADEZDA IVANOVA on 27.09.2022.
//

import UIKit
import CoreData

public class CoreDataManagerForCheckList{
     
     let mContext = (UIApplication.shared.delegate as!  AppDelegate).persistentContainer.viewContext
     
    var routeEntity: RouteEntity!
    
     func addNewTask(task: String){
         
         
         let newTask = Tasks(context: mContext)
         newTask.route = routeEntity
         newTask.task = task
         
         let tasks = routeEntity.task?.mutableCopy() as? NSMutableOrderedSet
         tasks?.add(newTask)
         routeEntity.task = tasks
         
         let ad = routeEntity.task
         
         do {
             try mContext.save()
             
             print("Emp added..")
         }catch {
             print("Unable to add employee: \(error.localizedDescription)")
             mContext.delete(newTask)
         }
     }
     
    
     func getAllTasks() -> [Tasks] {
         
         let fReq : NSFetchRequest<Tasks> = Tasks.fetchRequest()
         
         do {
             let taskList = try mContext.fetch(fReq)
             return taskList
             
         }catch {
             print("Could not query: \(error.localizedDescription)")
         }
         return []
     }
     
     func deleteTasks(task: Tasks){
         
         mContext.delete(task)
         do {
             try mContext.save()
             print("Deleted \(task.task ?? "" )")
         }catch {
             print("Could not delete \(task.task ?? "")")
         }
     }
     
     func getEmpSortByName() -> [Tasks] {
         let fReq : NSFetchRequest<Tasks> = Tasks.fetchRequest()
         
         let nameSortDes = NSSortDescriptor(key: "nameRoute", ascending: true)
         
         fReq.sortDescriptors = [nameSortDes]
         do {
             let tasks = try mContext.fetch(fReq)
             return tasks
         }catch {
             print("getEmpSortByName: Could not fetch ")
         }
         
         return []
     }
  
 }
