//
//  ViewModel.swift
//  Todo-app
//
//  Created by Arpit Mallick on 9/10/24.
//

import Foundation
import CoreData

class ViewModel {
    static func getTaskData(moc: NSManagedObjectContext) -> [String]? {
        let tableData = Mdata.fetchRequest()
        do {
            let allData = try moc.fetch(tableData)
            let taskStrings = allData.compactMap {$0.data}
            return taskStrings
        } catch {
            return nil
        }
    }
}
