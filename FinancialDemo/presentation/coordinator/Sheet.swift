//
//  Sheet.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

enum Sheet : String, Identifiable {
    case currency
    
    var id: String { self.rawValue }
}
