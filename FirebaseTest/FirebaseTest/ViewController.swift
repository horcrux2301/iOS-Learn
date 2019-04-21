//
//  ViewController.swift
//  FirebaseTest
//
//  Created by Harsh Khajuria on 20/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit
import FirebaseDatabase

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    var news:NSArray = []
    
    @IBOutlet weak var table: UITableView!
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: UITableViewCell.CellStyle.default, reuseIdentifier: "cell")
        print("here")
        print(indexPath.row)
        print(news.count)
        if indexPath.row >= 1 && indexPath.row < news.count {
            print("here \(indexPath.row)")
            if let newsArticle:NSDictionary = news[indexPath.row] as? NSDictionary{
                print(newsArticle)
                if let article = newsArticle["article"] {
//                    cell.titleLabel?.text = article as? String
                    cell.textLabel?.text = article as? String
                    cell.detailTextLabel?.text = "abcdef"
                    let imageHere = UIImage(named: "IMG_2197.JPG")
                    cell.imageView?.image = imageHere
                }
            }
        }
        //cell.textLabel?.text = news[indexPath].name
        return cell
    }
    
    func doneFirebase(){
        for i in 1...news.count-1 {
            if let newsArticle:NSDictionary = news[i] as? NSDictionary{
                print(newsArticle)
                if let article=newsArticle["article"] {
                    print(article)
                }
            }
        }
        table.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let ref = Database.database().reference()
        ref.child("news").observeSingleEvent(of: .value, with: {
            snapshot in
            if let value = snapshot.value as? NSArray{
                self.news = value
            } else {
                print("error")
            }
            self.doneFirebase()
        })
        
        
        
    }


}

