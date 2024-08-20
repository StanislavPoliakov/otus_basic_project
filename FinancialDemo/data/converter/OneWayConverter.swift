//
//  OneWayConverter.swift
//  FinancialDemo
//
//  Created by Поляков Станислав Денисович on 20.08.2024.
//

import Foundation

protocol OneWayConverter {
    associatedtype Response
    associatedtype Model
    
    func convert(_ response: Response) throws -> Model
    func convertAll(_ response: [Response]) throws -> [Model]
}

extension OneWayConverter {
    func convertAll(_ responseList: [Response]) throws -> [Model] {
        return responseList.compactMap { response in
            try? convert(response)
        }
    }
}
