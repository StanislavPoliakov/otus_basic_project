//
//  SplashScreenView.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import SwiftUI

struct SplashView: View {
    @State private var isSplash = true
    
    var body: some View {
        if isSplash {
            ZStack {
                Image(.splash)
                
                VStack {
                    Text("Financial")
                        .font(.largeTitle)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                    Text("Application")
                        .font(.largeTitle)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                }
            }
            .onAppear {
                DispatchQueue.main.async {
                    sleep(3)
                    isSplash = false
                }
            }
        } else {
            CoordinatorView()
        }
    }
}

#Preview {
    SplashView()
}
