//
//  MovieAppApp.swift
//  MovieApp
//
//  Created by Mohammad Azam on 4/22/21.
//

import SwiftUI
import Amplify
import AWSDataStorePlugin

@main
struct MovieAppApp: App {
    
    init() {
        let dataStorePlugin = AWSDataStorePlugin(modelRegistration: AmplifyModels())
        
        do {
            try Amplify.add(plugin: dataStorePlugin)
            try Amplify.configure()
            print("AWSAmplify has been initialized")
        } catch {
            print("Unable to initialize AWSAmplify \(error)")
        }
    }
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
