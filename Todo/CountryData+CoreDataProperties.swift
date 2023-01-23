//
//  CountryData+CoreDataProperties.swift
//  Todo
//
//  Created by shoeb on 23/01/23.
//
//

import Foundation
import CoreData


extension CountryData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<CountryData> {
        return NSFetchRequest<CountryData>(entityName: "CountryData")
    }

    @NSManaged public var countryname: String?

}

extension CountryData : Identifiable {

}
