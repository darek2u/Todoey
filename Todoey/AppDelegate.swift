//
//  AppDelegate.swift
//  Todoey
//
//  Created by Dariusz Urbanczyk on 10/03/2019.
//  Copyright © 2019 Dariusz Urbanczyk. All rights reserved.
//

import UIKit
import RealmSwift

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
       
        //print(Realm.Configuration.defaultConfiguration.fileURL)
        
     
      
        
        
        do {
            _ = try Realm()
           
            
        } catch {
            print ("Error inintialising new realm, \(error)")
        }
        return true
    }


 
    
    // MARK: - Core Data stack
}


