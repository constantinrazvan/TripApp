//
//  ContentView.swift
//  TripApp-SwiftUI
//
//  Created by Constantin Razvan on 02.09.2021.
//

import SwiftUI
import CoreData
import AuthenticationServices

struct ContentView: View {
    
    @State private var isFinished: Bool = Bool()
        
        var body: some View {
            if isFinished {
                HomeVC()
            }
            else {
                OnboardingView(pages: pages, isFinished: { value in isFinished = value })
                    .statusBar(hidden: true)
            }
        }
    }

struct OnboardingView: View {
    
    let pages: [OnboardingPage]
    var isFinished: (Bool) -> Void
    
    @State private var currentPage: Int = 0
    @State private var toggleView: Bool = Bool()
    @State private var animation: Animation? = Animation.default
    
    var body: some View {
        GeometryReader { proxy in
            Image(pages[currentPage].backgroundImage)
                .resizable()
                .overlay(Color.black.opacity(0.4))
                .ignoresSafeArea()
                .scaledToFill()
            
            VStack {
                Spacer()
                
                if toggleView {
                    middleVStack(index: currentPage).transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: Edge.trailing), removal: AnyTransition.move(edge: Edge.leading)))
                }
                else {
                    middleVStack(index: currentPage).transition(AnyTransition.asymmetric(insertion: AnyTransition.move(edge: Edge.trailing), removal: AnyTransition.move(edge: Edge.leading)))
                }
                
                Spacer()
                
                Button(action: {
                    if (pages.count > (currentPage + 1)) { currentPage += 1; animation = .default; toggleView.toggle() }
                    else { isFinished(true) }
                }, label: {
                    Text(pages[currentPage].stringOfButton)
                        .font(Font.body.bold())
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(pages[currentPage].colorOfButton.cornerRadius(10.0))
                        .padding()
                })
                
        HStack {
            ForEach(pages.indices, id:\.self) { index in
                Circle()
                    .fill(Color.white.opacity(index == currentPage ? 1.0 : 0.5))
                    .frame(width: 12, height: 12, alignment: .center)
                    .onTapGesture { animation = nil ; currentPage = index }
            }
        }
    }
            .foregroundColor(.white)
            .shadow(radius: 5.0)
            .animation(animation, value: currentPage)
        }
    }
    
func middleVStack(index: Int) -> some View {
  VStack(spacing: 20.0) {
     Image(systemName: pages[index].image)
        .font(Font.system(size: 100.0)
        .bold())
    Text(pages[index].title)
        .font(Font.system(size: 50, weight: .bold, design: .rounded))
    
    Text(pages[index].info)
        .font(Font.system(.title3, design: .rounded).bold())
        .padding()
        .multilineTextAlignment(.center)
    }
  }
}

struct LaunchView: View {
 var body: some View {
        ZStack{
            Image("bg1")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: UIScreen.main.bounds.width)
                .overlay(Color.black.opacity(0.3))
                .ignoresSafeArea()
            VStack(spacing: 20){
                Text("Welcome")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                Spacer()
                
                     VStack(alignment: .leading, spacing: 10, content: {
                         Text("TripGO")
                             .font(.system(size: 45))
                             .fontWeight(.heavy)
                             .foregroundColor(.white)
                         Text("Register now to benefit to our all features from TripGO App!")
                             .fontWeight(.semibold)
                             .foregroundColor(.white)
                    })
                     .frame(width: 350)
                     
                Spacer()
                     
                     SignInWithAppleButton(.signIn,
                                  onRequest: { request in
                                      request.requestedScopes = [.fullName, .email]
                     },
                     onCompletion: { result in
                         switch result {
                            case .success(let authResults):
                             guard let credentials = authResults.credential as? ASAuthorizationAppleIDCredential, let identityToken = credentials.identityToken, let identityTokenString = String(data: identityToken, encoding: .utf8) else { return }
                             let body = ["appleIdentityToken": identityTokenString]
                             guard (try? JSONEncoder().encode(body)) != nil else { return }

                               print("Authorization successful.")
                            case .failure(let error):
                               print("Authorization failed: " + error.localizedDescription)
                     }
                     })
                     .signInWithAppleButtonStyle(.black)
                     .frame(width: 350, height: 55)
                     .background(Color.green)
                     .clipShape(Capsule())
                     .shadow(color: Color.black.opacity(0.3), radius: 10.0, x: 0.0, y: 0.0)
                     .padding(.horizontal, 40)
                     
                    NavigationLink(destination: WithEmail()) {
                         Text("Login with Email")
                             .font(.system(size: 20.0))
                             .fontWeight(.semibold)
                             .foregroundColor(.white)
                             .frame(width: 350, height: 55)
                            .background(Color.blue)
                             .clipShape(Capsule())
                             .shadow(color: Color.black.opacity(0.3), radius: 10.0, x: 0.0, y: 0.0)
                     }
                     
                     NavigationLink(destination: RegisterVC()) {
                         Text("Register now")
                             .font(.system(size: 20.0))
                             .fontWeight(.semibold)
                             .frame(width: 350, height: 55)
                             .foregroundColor(.white)
                            .background(Color.blue)
                             .clipShape(Capsule())
                             .shadow(color: Color.black.opacity(0.3), radius: 10.0, x: 0.0, y: 0.0)
                         }
                     }
                 }
             .navigationBarHidden(true)
             }
         }


struct WithEmail: View {
    var body: some View {
        Text("Login")
    }
}

struct RegisterVC : View {
    var body: some View {
        Text("Login")
    }
}


struct OnboardingPage: Identifiable {
    let id: UUID = UUID()
    var backgroundImage: String
    var image: String
    var title: String
    var info: String
    var stringOfButton: String
    var colorOfButton: Color
}

let info: String = " Now, your dream trip can become true with us!"

let info2: String = "XXXXX"

let info3: String = "...."

var pages: [OnboardingPage] = [OnboardingPage(backgroundImage: "bg1", image: "megaphone", title: "GoTrip", info: info, stringOfButton: "Next", colorOfButton: .green),
                               OnboardingPage(backgroundImage: "bg2", image: "gauge", title: "Title 2", info: info2, stringOfButton: "Next", colorOfButton: .orange),
                               OnboardingPage(backgroundImage: "bg3", image: "gyroscope", title: "Title 3", info: info3, stringOfButton: "Get Started", colorOfButton: .blue)]

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
