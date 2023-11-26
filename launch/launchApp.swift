//
//  launchApp.swift
//  launch
//
//  Created by Blaze on 10/11/2023.
//

import SwiftUI

@main
struct launchApp: App {
    
    @StateObject var launchScreenManager = LaunchScreenManager()
    
    var body: some Scene {
        WindowGroup {
            ZStack {
                SignUpView()
                
                // Remove from view after api call has finished
                if launchScreenManager.state != .finished {
                    LaunchView()
                }
              
            }.environmentObject(launchScreenManager)
        }
    }
}
