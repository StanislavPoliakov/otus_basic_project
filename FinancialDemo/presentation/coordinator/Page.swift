//
//  Page.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

enum Page : String, Identifiable {
    case splash
    case chart
    case main
    
    var id: String { self.rawValue }
}
