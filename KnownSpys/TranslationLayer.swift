//
//  TranslationLayer.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation
import Outlaw
import CoreData

class TranslationLayer {
  
  fileprivate var spyTranslator = SpyTranslator()
  
  func createSpyDTOsFromJsonData(_ data: Data) -> [SpyDTO] {
    print("converting json to DTOs")
    let json:[String: Any] = try! JSON.value(from: data)
    let spies: [SpyDTO] = try! json.value(for: "spies")
    return spies
  }
  
  func toUnsavedCoreData(from dtos: [SpyDTO], with context: NSManagedObjectContext) -> [Spy] {
    print("convering DTOs to Core Data Objects")
    let spies = dtos.flatMap{ dto in spyTranslator.translate(from: dto, with: context) } // keeping it simple by keeping things single threaded
    
    return spies
  }
  
  func toSpyDTOs(from spies:[Spy]) -> [SpyDTO] {
    let dtos = spies.flatMap { spyTranslator.translate(from: $0) }
    
    return dtos
  }
}
