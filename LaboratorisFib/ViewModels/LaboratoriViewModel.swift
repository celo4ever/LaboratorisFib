//
//  LaboratoriViewModel.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 30/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import Foundation
import ARKit

class LaboratoriViewModel{
    
    var labs : [Laboratori] {
        get{
            return DataSingleton.sharedInstance.labs
        }
    }
    
    private var controller : LaboratorisController
    
    func getLaboratoris () {
        LaboratoriManagement.performRequest{ labs in
            DataSingleton.sharedInstance.labs.append(contentsOf: labs)
            self.controller.collectionView?.reloadData()
         //   print(self.laboratoris)
        }
    
    }
    
    init(controller: LaboratorisController) {
        self.controller = controller
        getLaboratoris()
    }
}


