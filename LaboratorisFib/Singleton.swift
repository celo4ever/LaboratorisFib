//
//  Singleton.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 28/04/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import Foundation

class DataSingleton{
    
    static let sharedInstance = DataSingleton()
    private init() {}
    var labs:[Laboratori] = [Laboratori]()
    
    func add(lab: Laboratori){
        self.labs.append(lab)
    }
}
