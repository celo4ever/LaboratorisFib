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
    var laboratoris = [Laboratori]()
    private var viewController: ViewController
    
    func getLaboratoris () {
        
        LaboratoriManagement.performRequest(completion: { (laboratoris) in
            //afegir laboratori al singleton
        }, onError: {})
        
    }
    
    init(viewController: ViewController) {
        self.viewController = viewController
        getLaboratoris()
    }
}
