//
//  LaunchManager.swift
//  launch
//
//  Created by Blaze on 25/11/2023.
//

import Foundation

enum LaunchPhase {
    case first
    case second
    case finished
}

final class LaunchScreenManager: ObservableObject {
    @Published private(set) var state: LaunchPhase = .first
    
    func dismiss() {
        
        // Load up second animation phase
        self.state = .second
        
        // Remove launch screen from view
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.state = .finished
        }
    }
}
