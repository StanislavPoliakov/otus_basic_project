//
//  FinancialDemoApp.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import SwiftUI

var dependencies: FinancialDemoLibraryApi? = nil

@main
struct FinancialDemoApp: App {
    init() {
        dependencies = FinancialDemoLibraryApi.shared
    }
    
    var body: some Scene {
        WindowGroup {
            SplashView()
        }
    }
}
