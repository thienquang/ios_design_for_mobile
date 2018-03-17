//
//  DetailPresenter.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation

protocol DetailPresenter {
  var spy: SpyDTO! { get }
  var imageName: String { get }
  var name: String { get }
  var age: String { get }
  var gender: String { get }
}

class DetailPresenterImpl: DetailPresenter {
  var spy: SpyDTO!
  var imageName: String { return spy.imageName}
  var name: String { return spy.name}
  var age: String { return String(spy.age) }
  var gender: String { return spy.gender.rawValue}
  
  init(with spy: SpyDTO) {
    self.spy = spy
  }
}
