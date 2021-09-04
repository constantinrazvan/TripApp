//
//  HomeVC.swift
//  TripApp-SwiftUI
//
//  Created by Constantin Razvan on 04.09.2021.
//

import SwiftUI

struct HomeVC: View {
    var body: some View {
        NavigationView {
            ScrollView(.vertical) {
                VStack(alignment: .leading) {
                    HStack{
                        Image(systemName: "line.horizontal.3")
                            .resizable()
                            .frame(width: 24, height: 24)
                        Spacer()
                        Image(systemName: "location.fill")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Text("Los Angeles,")
                            .font(.system(.headline, design: .rounded))
                        Text("California")
                            .fontWeight(.ultraLight)
                        Spacer()
                        Image(systemName: "person.crop.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 36, height: 36)
                            .clipShape(Circle())
                            .foregroundColor(.gray)
                    }
                    VStack(alignment: .leading, spacing: 8) {
                        HStack {
                            Text("Hi,")
                                .font(.largeTitle)
                                .fontWeight(.light)
                            Text("Martin!")
                                .font(.largeTitle)
                                .fontWeight(.heavy)
                        }
                        HStack{
                            HStack{
                                Image(systemName: "magnifyingglass")
                                    .foregroundColor(Color(UIColor.systemIndigo))
                                    .padding()
                                
                                Text("Search")
                                    .font(.footnote)
                                    .padding()
                                Spacer()
                                Divider()
                                    .frame(height: 24)
                                Image(systemName: "arrowtriangle.down.fill")
                                    .resizable()
                                    .frame(width: 8, height: 8)
                                    .padding()
                            }
                            .foregroundColor(Color.secondary.opacity(0.5))
                            .background(Color.gray.opacity(0.1))
                            .cornerRadius(80)
                            .shadow(radius: 1)
                            .padding()
                        }
            HStack(spacing: 40) {
                VStack{
                    Button(action: {}) {
                        Image(systemName: "airplane")
                            .foregroundColor(.white)
                            .padding(.all, 18)
                            .background(Color.blue.opacity(0.8))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                    Text("Flight")
                        .font(.footnote)
                        .bold()
                        .textCase(.uppercase)
                }
                
                VStack{
                    Button(action: {}) {
                        Image(systemName: "bed.double.fill")
                            .foregroundColor(.white)
                            .padding(.all, 18)
                            .background(Color.green.opacity(0.8))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                    Text("Hotel")
                        .font(.footnote)
                        .bold()
                        .textCase(.uppercase)
                }
               
                VStack{
                    Button(action: {}) {
                        Image(systemName: "location.fill")
                            .foregroundColor(.white)
                            .padding(.all, 18)
                            .background(Color.orange.opacity(0.8))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                    Text("Places")
                        .font(.footnote)
                        .bold()
                        .textCase(.uppercase)
                }
                
                VStack{
                    Button(action: {}) {
                        Image(systemName: "rectangle.grid.2x2.fill")
                            .foregroundColor(.white)
                            .padding(.all, 18)
                            .background(Color.red.opacity(0.8))
                            .cornerRadius(12)
                            .shadow(radius: 2)
                    }
                    Text("More")
                        .font(.footnote)
                        .bold()
                        .textCase(.uppercase)
                    }
                }
            } .padding()
            
            HStack{
                Text("Your")
                    .font(.largeTitle)
                Text("Trips")
                    .font(.largeTitle)
                    .fontWeight(.bold)
            }.padding(.vertical)
            
            HStack(alignment: .center, spacing: 30) {
                Text("Past")
                    .bold()
                Text("Futured")
                    .foregroundColor(.secondary)
                Text("All")
                    .foregroundColor(.secondary)
            }.padding(.vertical)
            
            ScrollView(.horizontal) {
                HStack(spacing: 20) {
                    Image("brazil")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 270)
                        .cornerRadius(12)
                        .overlay(Color.white.opacity(0.3))
                    Image("alemania")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 270)
                        .cornerRadius(12)
                        .overlay(Color.white.opacity(0.3))
                    Image("africa")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 270)
                        .cornerRadius(12)
                        .overlay(Color.white.opacity(0.3))
                    HStack {
                    Image("rd")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 200, height: 270)
                        .cornerRadius(12)
                        .overlay(Color.white.opacity(0.3))
                    }
                        }
                    }.padding(.trailing, -20)
                }.padding()
                .edgesIgnoringSafeArea(.bottom)
            }.navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}



struct Curves: Shape {
    var corner: UIRectCorner
    var radius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath (roundedRect: rect, byRoundingCorners: corner, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct HomeVC_Previews: PreviewProvider {
    static var previews: some View {
        HomeVC()
    }
}
