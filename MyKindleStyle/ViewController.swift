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
    
    tableView.register(BookCell.self, forCellReuseIdentifier: "cellId")
    tableView.tableFooterView = UIView()
    
    navigationItem.title = "Kindle"
    
    setupBooks()
    fetchBooks()
  }
  
  func fetchBooks() {
    print("Fetching books...")
    if let url = URL(string: "https://letsbuildthatapp-videos.s3-us-west-2.amazonaws.com/kindle.json") {
      URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
        
        if let err = error {
          print("Failed to fetch external json books", err)
          return
        }

        guard let data = data else { return }
        
        do {
          let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers)
          
          guard let bookDictionaries = json as? [[String: Any]] else { return }
          
          self.books = []
          for bookDictionary in bookDictionaries {
            if let title = bookDictionary["title"] as? String,
              let author = bookDictionary["author"] as? String {
            
              let book = Book(title: title, author: author, image: #imageLiteral(resourceName: "steve_jobs"), pages: [])
              
              self.books?.append(book)
            }

          }
          
          DispatchQueue.main.async {
            self.tableView.reloadData()
          }
          
        } catch let jsonError {
          print("Failed to parse JSON properly: ", jsonError)
        }
        
    
      }).resume()
      
    }
  }
  
  override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    
    let selectedBook = self.books?[indexPath.row]
    //    print(book?.title)
    //    return
    
    let layout = UICollectionViewFlowLayout()
    let bookPagerController = BookPagerController(collectionViewLayout: layout)
    
    bookPagerController.book = selectedBook
    
    let navController = UINavigationController(rootViewController: bookPagerController)
    present(navController, animated: true, completion: nil)
    
  }
  
  override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 86
  }
  
  override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! BookCell
    
    let book = books?[indexPath.row]
    cell.book = book
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
    
    let book = Book(title: "Steve Jobs", author: "Walter Isaacson", image: #imageLiteral(resourceName: "steve_jobs"), pages: pages)
    
    let book2 = Book(title: "Bill Gates: A Biography", author: "Michael Becraft", image: #imageLiteral(resourceName: "bill_gates"),
                     pages: [Page(number: 1, text: "Text for page 1"),
                             Page(number: 2, text: "Text for page 2"),
                             Page(number: 3, text: "Text for page 3"),
                             Page(number: 4, text: "Text for page 4")])
    
    self.books = [book, book2]
  }
  
}
