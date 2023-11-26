//
//  ContentView.swift
//  launch
//
//  Created by Blaze on 10/11/2023.
//

import SwiftUI

struct LaunchView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    @State private var firstAnimationPhase: Bool = false // Scale Animation
    @State private var secondAnimationPhase: Bool = false // Second Animation Phase (Ease in then out)

    
    private let timer = Timer.publish(every: 0.65, on: .main, in: .common).autoconnect()
    
    
    var body: some View {
        ZStack {
            background
            logo
            
        }.onReceive(timer) { input in
            
            switch launchScreenManager.state {
            case .first:
                // SCALE EFFECT
                withAnimation(.spring()) {
                    firstAnimationPhase.toggle()
                }
            case .second:
                // EXPAND LOGO IN THEN OUT
                withAnimation(.easeInOut) {
                    secondAnimationPhase.toggle()
                }
                
            default: break
            }
           
        }
        .opacity(secondAnimationPhase ? 0 : 1)
        .edgesIgnoringSafeArea(.all)
    }
}

struct LaunchView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchView().environmentObject(LaunchScreenManager())
    }
}


private extension LaunchView {
    
    var logo: some View {
        Image("logo")
            .scaleEffect(firstAnimationPhase ? 0.6 : 1)
            .scaleEffect(secondAnimationPhase ? UIScreen.main.bounds.height / 4 : 1)
    }
    
    var background: some View {
        Color("launch-screen-bg")
    }
}
