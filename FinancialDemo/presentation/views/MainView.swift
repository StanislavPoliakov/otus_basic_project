//
//  MainView.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import SwiftUI

struct MainView: View {
    @EnvironmentObject private var coordinator: Coordinator
    
    var body: some View {
        Button("Выбрать валюту") {
            coordinator.present(.currency)
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
        
    }
}

#Preview {
    MainView()
}
