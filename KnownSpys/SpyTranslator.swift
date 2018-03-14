//
//  SpyTranslator.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation
import CoreData

class SpyTranslator {
  func translate(from spy: Spy?) -> SpyDTO? {
    guard let spy = spy else { return nil }
    
    let gender = Gender(rawValue: spy.gender)!
    
    return SpyDTO(age: Int(spy.age),
                  name: spy.name,
                  gender: gender,
                  password: spy.password,
                  imageName: spy.imageName,
                  isIncognito: spy.isIncognito)
  }
  
  func translate(from dto: SpyDTO?, with context: NSManagedObjectContext) -> Spy? {
    guard let dto = dto else { return nil }
    
    let spy = Spy(context: context)
    spy.age = Int64(dto.age)
    spy.name =   dto.name
    spy.gender =   dto.gender.rawValue
    spy.password =   dto.password
    spy.imageName =   dto.imageName
    spy.isIncognito =   dto.isIncognito
    
    return spy
  }
}

