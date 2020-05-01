//
//  Laboratori.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 28/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//
import SwiftyJSON

struct Laboratori {
    
    var id : String?
    var descripcio : String?
    var places : String?
    var tamany : CGFloat = 0
    init(json: JSON){
        self.id = json["id"].stringValue
        self.descripcio = json["descripcio"].stringValue
        self.places = json["places"].stringValue
        self.tamany = CGFloat(172)
    }
    
    init(id: String){
        self.id = id
    }
}
