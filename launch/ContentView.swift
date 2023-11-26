//
//  ContentView.swift
//  launch
//
//  Created by Blaze on 10/11/2023.
//

import SwiftUI

struct SignUpView: View {
    
    @EnvironmentObject var launchScreenManager: LaunchScreenManager
    
    var body: some View {
        
        VStack {
            logo
            Spacer()
            Text("Join X today")
                .font(.system(size: 26))
                .fontWeight(.bold)
                .padding(.bottom, 20)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
            
            CustomButton(
                title: "Sign up with Google", icon: "google-logo") {
                    print("Google sign in")
                }
            
            CustomButton(
                title: "Sign up with Apple", icon: "apple-logo") {
                    print("Google sign in")
                }
            
            
            orDivider
            
            CustomButton(
                title: "Create account", icon: "") {
                    print("Google sign in")
                }
            
            termsOfServie
            
            Spacer()

               
        }
        .frame(maxWidth: .infinity)
        .padding(.horizontal, 40)
        .background(Color.black)
        
        .onAppear(){
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                launchScreenManager.dismiss()
            }
        }
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView().environmentObject(LaunchScreenManager())
    }
}


private extension SignUpView {
    
    var logo: some View {
        Image("logo")
            .resizable()
            .frame(width: 30, height: 30, alignment: .center)
            .padding(.top, 10)
    }
    
    
    var orDivider: some View {
        HStack(alignment: .center){
            VStack { Divider().background(Color.gray) }.padding(.horizontal, 7)
            Text("or")
                .foregroundColor(Color.white)
                .fontWeight(.semibold)
                .font(.system(size: 20))
            VStack { Divider().background(Color.gray) }.padding(.horizontal, 7)

        }
        .padding(.bottom, 5)
    }
    
    var termsOfServie: some View {
        VStack(alignment: .leading) {
            Text("By signing up, you agree to the [Terms of Service](https://www.apple.com) and [Privacy Policy](https://www.apple.com), including [Cookie Use.](https://www.apple.com)")
                .foregroundColor(Color.gray)
                .font(.callout)
                .padding(.bottom, 25)
            
            
            Text("Have an account already? [Log in](https://www.apple.com)")
                .foregroundColor(Color.gray)
                .font(.callout)
        }
            
        
    }
    
       
//    Have an account already? Log in
}


struct CustomButton: View {
    var title: String
    var icon: String
    var tap: (() -> Void) // Callback closure
    
    
    var body: some View {
        Button(action: tap) {
            HStack {
                if icon != ""
                    {
                        Image(icon).resizable().frame(width: 22, height: 22)
                        .padding(.trailing, 0)
                    }
                Text(title).foregroundColor(Color.black)
                    .fontWeight((title != "Sign up with Google") ? .semibold : .regular)
            }
            .padding(.vertical, 12)
//            .padding(.horizontal, 50)
            .frame(maxWidth: .infinity)
            .background(Color.white)
            .clipShape(RoundedRectangle(cornerRadius: 50))
            .padding(.bottom, 10)
        }
    }
}


