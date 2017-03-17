//
//  BookCell.swift
//  MyKindleStyle
//
//  Created by Michael De La Cruz on 3/16/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
  
  var book: Book? {
    didSet {
      coverImageView.image = book?.image
      titleLabel.text = book?.title
      titleLabel.text = book?.author
    }
  }
  
  private let coverImageView: UIImageView = {
    let imageView = UIImageView()
    imageView.backgroundColor = .red
    imageView.translatesAutoresizingMaskIntoConstraints = false
    imageView.image = #imageLiteral(resourceName: "profile_image")
    return imageView
  }()
  
  private let titleLabel: UILabel = {
    let label = UILabel()
    label.text = "This is the text for the title of our book inside of our cell"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  private let authorLabel: UILabel = {
    let label = UILabel()
    label.text = "This some author for the book that we have in this row"
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
    
    addSubview(coverImageView)
    coverImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8).isActive = true
    coverImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 8).isActive = true
    coverImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8).isActive = true
    coverImageView.widthAnchor.constraint(equalToConstant: 50).isActive = true
    
    addSubview(titleLabel)
    titleLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    titleLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
    titleLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: -10).isActive = true
    
    addSubview(authorLabel)
    authorLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 4).isActive = true
    authorLabel.leftAnchor.constraint(equalTo: coverImageView.rightAnchor, constant: 8).isActive = true
    authorLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -8).isActive = true
    authorLabel.heightAnchor.constraint(equalToConstant: 20).isActive = true
   
  }
  
  required init(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

}
