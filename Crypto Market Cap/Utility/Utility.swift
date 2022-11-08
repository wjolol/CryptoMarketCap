//
//  Utility.swift
//  Crypto Market Cap
//
//  Created by Giorgio Sertori on 04/11/22.
//

import Foundation

class Utility {
    static func formatToPrice(price: Double) -> String {
        return String(format: "%.2f €", price)
    }
    
    static func formatDate(date: Double, dateFormat: String = "dd/MM/yyyy") -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat
        return dateFormatter.string(from: Date(timeIntervalSince1970: date/1000))
    }
}
