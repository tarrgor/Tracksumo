//
//  CategoryView.swift
//  Tracksumo
//
//  Created by Thorsten Klusemann on 21.12.16.
//  Copyright © 2016 Kreskow&Karrmarr DevHeroes. All rights reserved.
//

import UIKit
import SnapKit

typealias ActionHandler = () -> ()

class CategoryView: UIView {

  fileprivate var category: String!
  fileprivate var categoryLabel: UILabel!
  fileprivate var addButton: UIButton!
  
  var addHandler: ActionHandler?
  
  init(category: String) {
    super.init(frame: CGRect.zero)
    self.category = category
    setup()
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func setup() {
    self.backgroundColor = .lightGray
    
    categoryLabel = UILabel()
    categoryLabel.text = category
    categoryLabel.textColor = .black

    self.addSubview(categoryLabel)
    
    addButton = UIButton(type: .contactAdd)
    addButton.tintColor = .white
    addButton.addTarget(self, action: #selector(addButtonPressed), for: .touchUpInside)
    
    self.addSubview(addButton)
    
    categoryLabel.snp.makeConstraints { make in
      make.leading.equalTo(self.snp.leadingMargin)
      make.bottom.equalTo(self.snp.bottomMargin)
    }
    addButton.snp.makeConstraints { make in
      make.trailing.equalTo(self.snp.trailingMargin)
      make.bottom.equalTo(self.categoryLabel.snp.bottom)
    }
  }
  
  func addButtonPressed() {
    self.addHandler?()
  }
}
