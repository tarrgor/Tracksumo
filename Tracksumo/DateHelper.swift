//
//  DateHelper.swift
//  Tracksumo
//
//  Created by Krystian Gontarek on 26/12/2016.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import Foundation

class DateHelper {
    
    static func timeStringToDate(string: String) -> Date? {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .none
        dateFormatter.timeStyle = .short
        dateFormatter.locale = Locale(identifier: "pl_PL")
        let date = dateFormatter.date(from: string)

        return date
        
    }
    
    
    
    
}
