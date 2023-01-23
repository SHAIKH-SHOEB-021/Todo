//
//  DatabaseHandler.swift
//  Todo
//
//  Created by shoeb on 23/01/23.
//

import Foundation
import CoreData
import UIKit

class DatabaseHandler{
    func saveData(cName : String){
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        let countryObject = NSEntityDescription.insertNewObject(forEntityName: "CountryData", into: context) as! CountryData
        countryObject.countryname = cName
        do{
            try context.save()
            print("Data Save")
        }catch{
            print("Some Error")
        }
    }
    func fetchData() -> [CountryData]{
        var cData = [CountryData]()
        let appDelegate = (UIApplication.shared.delegate) as! AppDelegate
        let context = appDelegate.persistentContainer.viewContext
        do{
            cData = try context.fetch(CountryData.fetchRequest()) as! [CountryData]
        }catch{
            print("Error")
        }
        return cData
    }
}
