//
//  SpyListPresenter.swift
//  KnownSpys
//
//  Created by Thien Le quang on 3/14/18.
//  Copyright © 2018 JonBott.com. All rights reserved.
//

import Foundation

typealias BlockWithSource = (Source)->Void
typealias VoidBlock = ()->Void

class SpyListPresenter {
  var data = [SpyDTO]()
  
  fileprivate var modelLayer = ModelLayer()
}

//MARK: - Data Methods
extension SpyListPresenter {
  
  func loadData(finished: @escaping BlockWithSource) {
    modelLayer.loadData { [weak self] source, spies in
      
      self?.data = spies
      finished(source)
    }
  }
}


