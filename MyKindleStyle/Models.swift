//
//  Models.swift
//  MyKindleStyle
//
//  Created by Michael De La Cruz on 3/15/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class Book {
  let title: String
  let author: String
  let image: UIImage
  let pages: [Page]
  
  init(title: String, author: String, image: UIImage, pages: [Page]) {
    self.title = title
    self.author = author
    self.pages = pages
    self.image = image
  }
}

class Page {
  let number: Int
  let text: String
  
  init(number: Int, text: String) {
    self.number = number
    self.text = text
  }
}
