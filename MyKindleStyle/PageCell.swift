//
//  PageCell.swift
//  MyKindleStyle
//
//  Created by Michael De La Cruz on 3/16/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
  
  let textLabel: UILabel = {
    let label = UILabel()
    label.text = "ANA REINHEART JUNKRAT MERCY ROADHOG SOLDIER76 REAPER TRACER SYMMERTA ZARYA ZENYETTA WINSTON DVA MCCREE LUCIO TROJBON WIDOW SOMBRA BASTION HANZO GENJI MEI"
    label.translatesAutoresizingMaskIntoConstraints = false
    label.numberOfLines = 0
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(textLabel)
//    textLabel.frame = CGRect(x: 0, y: 0, width: 100, height: 200)
    
    textLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
    textLabel.leftAnchor.constraint(equalTo: leftAnchor, constant: 10).isActive = true
    textLabel.rightAnchor.constraint(equalTo: rightAnchor, constant: -10).isActive = true
    textLabel.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
