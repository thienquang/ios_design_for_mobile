//
//  SpyCellPresenter.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation


class SpyCellPresenter {
  var spy: Spy
  
  var age: Int { return Int(spy.age) }
  var name: String { return spy.name }
  var imageName: String { return spy.imageName }
  
  init(with spy: Spy) {
    self.spy = spy
  }
}
