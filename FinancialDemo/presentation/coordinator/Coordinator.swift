//
//  Coordinator.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import SwiftUI

class Coordinator : ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: Sheet? = nil
    private var dependencies = FinancialDemoLibraryApi.shared
    
    func forward(_ page: Page) {
        path.append(page)
    }
    
    func present(_ sheet: Sheet) {
        self.sheet = sheet
    }
    
    func back() {
        path.removeLast()
    }
    
    func dismiss() {
        self.sheet = nil
    }
    
    @ViewBuilder
    func build(page: Page) -> some View {
        switch page {
            case .splash:
                SplashView()
            case .chart:
                ChartView()
            case .main:
                MainView()
        }
    }
    
    @ViewBuilder
    func build(sheet: Sheet) -> some View {
        switch sheet {
            case .currency:
                CurrencySheetView(viewModel: dependencies.currencyViewModel)
        }
    }
}
