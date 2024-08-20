//
//  CurrencyModel.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

struct CurrencyModel : Hashable, Identifiable, Equatable {
    let title: String
    let code: String
    
    var id: UUID = UUID()
}
