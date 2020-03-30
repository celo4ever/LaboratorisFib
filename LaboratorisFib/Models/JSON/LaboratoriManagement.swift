//
//  LaboratoriManagement.swift
//  LaboratorisFib
//
//  Created by Marcel Costa i Amezquita on 28/03/2020.
//  Copyright © 2020 Marcel Costa i Amezquita. All rights reserved.
//

import Foundation
import SwiftyJSON

struct LaboratoriManagement{
    
    let urlLaboratoris = "https://api.fib.upc.edu/v2/laboratoris/?format=json&client_id=aWUwHpSXybOdHNPcix7QF0hl3ANqcMyKyLiwE1XW"
   
    func performRequest(){
        // 1. Create url
        if let url = URL(string: urlLaboratoris) {
            
            // 2. Create session
            let session = URLSession(configuration: .default)
            
            // 3. Give the session a task
               // Handler: quan finalitza executa el que posem a la funció
               // session.dataTask retorna una tasca que esta en suspend
            let task = session.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
                
                if error != nil{
                    return
                }
                
                if let safeData = data {
                    self.parseJSON(laboratorisData: safeData) // hauria d'afegir a algun singleton o base de dades
                }
            }
            
            task.resume()
        }
    }
    
    func parseJSON(laboratorisData: Data){
        
        let json = JSON(laboratorisData)
        var laboratoris = [Laboratori]()
        let entries = json["results"].arrayValue
        
        for i in 0 ..< entries.count {
            let labJSON = entries[i]
            
            let lab = Laboratori(json: labJSON)
            laboratoris.append(lab)
            print(lab.id!)
            
        }
    }
}
