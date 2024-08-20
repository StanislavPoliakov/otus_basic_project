//
//  CurrencySheetView.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import SwiftUI

struct CurrencySheetView: View {
    @EnvironmentObject private var coordinator: Coordinator
    @ObservedObject private var viewModel: CurrencyViewModel
    @State var currencySelected: Int = 0
    
    init(viewModel: CurrencyViewModel) {
        self.viewModel = viewModel
        self.viewModel.load()
    }
    
    var body: some View {
        switch viewModel.state {
            case .loading:
                ProgressView()
                    .presentationDetents([.fraction(0.25)])
            case .success(let currencies):
                VStack {
                    Picker("Выберите валюту", selection: $currencySelected) {
                        ForEach(0..<currencies.count) { index in
                            Text(currencies[index].title).tag(index)
                        }
                    }
                    .onChange(of: currencySelected, initial: true, { _, selectedIndex  in
                        viewModel.selectCurrency(currencies[selectedIndex])
                    })
                    .pickerStyle(.inline)
                    
                    
                    Button("Выбрать") {
                        viewModel.onCurrencySubmitted()
                        coordinator.dismiss()
                    }
                    .buttonStyle(.borderless)
                    .controlSize(.large)
                }
                .presentationDetents([.fraction(0.25)])
            case .failure(let error):
                Text(error.localizedDescription)
                    .presentationDetents([.fraction(0.25)])
        }
    }
}

#Preview {
    CurrencySheetView(viewModel: dependencies!.currencyViewModel)
}
