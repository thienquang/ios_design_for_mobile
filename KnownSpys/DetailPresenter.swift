//
//  DetailPresenter.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation

class DetailPresenter {
  var spy: SpyDTO!
  var imageName: String { return spy.imageName}
  var name: String { return spy.name}
  var age: String { return String(spy.age) }
  var gender: String { return spy.gender.rawValue}
  
  init(with spy: SpyDTO) {
    self.spy = spy
  }
}
