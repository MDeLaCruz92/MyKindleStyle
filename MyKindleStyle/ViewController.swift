//
//  ViewController.swift
//  MyKindleStyle
//
//  Created by Michael De La Cruz on 3/15/17.
//  Copyright © 2017 Michael De La Cruz. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
  
  var books: [Book]?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cellId")
    tableView.tableFooterView = UIView()
    
    navigationItem.title = "Kindle"
   
    setupBooks()
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 80
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath)
    
    let book = books?[indexPath.row]
    
    cell.textLabel?.text = book?.title
    return cell
  }
  
  override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    if let count = books?.count {
      return count
    }
    return 0
  }
  
  func setupBooks() {
    let page1 = Page(number: 1, text: "Text for the first page")
    let page2 = Page(number: 2, text: "This is the second text page")
    
    let pages = [page1, page2]
    
    let book = Book(title: "Steve Jobs", author: "Walter Isaacson", pages: pages)
    
    let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft",
                     pages: [Page(number: 1, text: "Text for page 1"),
                             Page(number: 2, text: "Text for page 2"),
                             Page(number: 3, text: "Text for page 3"),
                             Page(number: 4, text: "Text for page 4")])
    
    self.books = [book, book2]
  }
  
}
