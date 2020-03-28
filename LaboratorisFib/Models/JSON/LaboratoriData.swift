//
//  LaboratoriData.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 28/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import Foundation

struct LaboratoriData : Decodable {
    
    var results : [Laboratori]
    
}

struct Laboratori : Decodable {
    
    var id : String
    var descripcio : String
    var places : Int?
    
}
