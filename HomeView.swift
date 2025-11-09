//
//  HomeView.swift
//  Atleti
//
//  Created by Dario Ciuciulla on 22/10/25.
//
//Creazione della Schermata home

import Foundation
import SwiftUI

struct HomeView: View{
    var body: some View{
        ZStack{
            Image("back2")
                .resizable()
                .ignoresSafeArea()
                .allowsHitTesting(false)
            ScrollView{
                VStack(spacing: 40){
                    Text("Home")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Spacer()
                    //Primo test
                    NavigationLink{
                        //Placeholder
                        Text("Dettagli Test 1")
                    }label: {
                        Text("Test 1")
                            .font(.largeTitle)
                            .frame(maxWidth:.infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(40)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .allowsHitTesting(true)
                    //Secondo TEst
                    NavigationLink{
                        //PlaceHolder
                        Text("Dettagli Test 2")
                    }label:{
                        Text("Test 2")
                            .font(.largeTitle)
                            .frame(maxWidth:.infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(40)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .allowsHitTesting(true)
                    //Terzo Test
                    NavigationLink{
                        //PlaceHolder
                        Text("Dettagli Test 3")
                    }label:{
                        Text("Test 3")
                            .font(.largeTitle)
                            .frame(maxWidth:.infinity)
                            .background(.ultraThinMaterial)
                            .cornerRadius(40)
                            .foregroundColor(.black)
                    }
                    .padding(.horizontal)
                    .allowsHitTesting(true)
                }
                
            }
            
            
        }
        .toolbarBackground(.visible, for: .tabBar)
    }
    
}

#Preview {
    ContentView()
}
