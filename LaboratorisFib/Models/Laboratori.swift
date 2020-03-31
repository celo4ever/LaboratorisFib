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
    
    init(json: JSON){
        print(json["results"]["id"].stringValue)
        self.id = json["id"].stringValue
        self.descripcio = json["descripcio"].stringValue
        self.places = json["places"].stringValue
    }
}
