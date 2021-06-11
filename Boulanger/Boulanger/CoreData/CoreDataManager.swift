//
//  CoreDataManager.swift
//  Boulanger
//
//  Created by Adam Mabrouki on 10/04/2021.
//

import Foundation
import CoreData

final class CoreDataManager {
    
    // MARK: - Properties
    
    private let coreDataStack: CoreDataStack
    private let managedObjectContext: NSManagedObjectContext
    
    var players: [Players] {
        let request: NSFetchRequest<Players> = Players.fetchRequest()
        request.sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
        guard let tasks = try? managedObjectContext.fetch(request) else { return [] }
        return tasks
    }
    
    // MARK: - Initializer
    
    init(coreDataStack: CoreDataStack) {
        self.coreDataStack = coreDataStack
        self.managedObjectContext = coreDataStack.mainContext
    }
    
    // MARK: - Manage Task Entity
    /// Manage  Favorite Recipes List entities
    func createPlayer(name: String) {
        let player = Players(context: managedObjectContext)
        player.name = name
        coreDataStack.saveContext()
    }
    /// Delete all
    func deleteAllRecipe() {
        players.forEach { managedObjectContext.delete($0) }
        coreDataStack.saveContext()
    }
    
    
    func checkIfNameAlreadyExist(playerName: String) -> Bool {
        let request: NSFetchRequest<Players> = Players.fetchRequest()
        let predicate = NSPredicate(format: "name == %@", playerName)
        request.predicate = predicate
        guard let favoritesFoods = try? managedObjectContext.fetch(request) else { return false }
        if favoritesFoods.isEmpty {
            return false
        }
        return true
    }
    
    
//
//    func deleteFromFavorite(recipeName: String) {
//        let request: NSFetchRequest<Players> = FavoriteFood.fetchRequest()
//        let predicate = NSPredicate(format: "name == %@", recipeName)
//        request.predicate = predicate
//        guard let objects = try? managedObjectContext.fetch(request) else { return }
//        objects.forEach { managedObjectContext.delete($0)}
//        coreDataStack.saveContext()
//    }
}



