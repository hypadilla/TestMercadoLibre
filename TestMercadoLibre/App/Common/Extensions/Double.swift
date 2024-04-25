//
//  Double.swift
//  TestMercadoLibre
//
//  Created by Harold Padilla on 25/04/24.
//

import Foundation

extension Double {
    func formattedAsCurrency(symbol: String = "$", locale: Locale = Locale.current) -> String? {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        numberFormatter.currencySymbol = symbol
        numberFormatter.locale = locale
        return numberFormatter.string(from: NSNumber(value: self))
    }
}
