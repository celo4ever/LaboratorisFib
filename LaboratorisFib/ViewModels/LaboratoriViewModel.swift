//
//  LaboratoriViewModel.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 30/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import Foundation
import ARKit

enum SelectedType {
    case top
    case fav
}

class LaboratoriViewModel{
    
    var selectedType: SelectedType = .top {
        didSet {
    controller.labsCollection.reloadData()
        }
    }
    
    var labs : [Laboratori] {
        get{
            if self.selectedType == .top {
                return DataSingleton.sharedInstance.labs
            }else { return DataSingleton.sharedInstance.favs }
        }
    }
    
    private var controller : LaboratorisController
    
    func getLaboratoris () {
        LaboratoriManagement.performRequest{ labs in
            DataSingleton.sharedInstance.labs.append(contentsOf: labs)
            self.controller.labsCollection?.reloadData()
        }
    
    }
    
    init(controller: LaboratorisController) {
        self.controller = controller
        getLaboratoris()
    }
}
