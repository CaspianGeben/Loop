//
//  NightscoutTreatment.swift
//  Loop
//
//  Created by Pete Schwamb on 10/7/16.
//  Copyright © 2016 LoopKit Authors. All rights reserved.
//

import Foundation
import LoopKit
import NightscoutUploadKit
import HealthKit




extension MealBolusNightscoutTreatment {
    
    public convenience init(carbEntry: StoredCarbEntry) {
        let carbGrams = carbEntry.quantity.doubleValue(for: HKUnit.gram())
    
       var myFoodType = carbEntry.foodType;
        
        if (carbEntry.absorptionTime == 7200){
            myFoodType = "🍭, \(String(carbEntry.foodType!))";
        } else if (carbEntry.absorptionTime == 10800){
            myFoodType = "🌮, \(String(carbEntry.foodType!))";
        } else if (carbEntry.absorptionTime == 14400){
            myFoodType = "🍕, \(String(carbEntry.foodType!))";
            
       
        self.init(timestamp: carbEntry.startDate, enteredBy: "loop://\(UIDevice.current.name)", id: carbEntry.externalID, carbs: lround(carbGrams), absorptionTime: carbEntry.absorptionTime, foodType: myFoodType // + carbEntry.foodType
        )
        
    }
}
