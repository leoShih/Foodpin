//
//  RestaurantTableViewController.swift
//  Foodpin
//
//  Created by Leo on 2017/4/29.
//  Copyright © 2017年 Leo. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController{

    var restaurantNames = ["Cafe Deadend", "Homei", "Teakha", "Cafe Loisl", "Petite Oyster", "For Kee Restaurant", "Po's Atelier", "Bourke Street Bakery", "Haigh's Chocolate", "Palomino Espresso", "Upstate", "Traif", "Graham Avenue Meats", "Waffle & Wolf", "Five Leaves", "Cafe Lore", "Confessional", "Barrafina", "Donostia", "Royal Oak", "CASK Pub and Kitchen"]

    var restaurantImages = ["cafedeadend.jpg", "homei.jpg", "teakha.jpg", "cafeloisl.jpg", "petiteoyster.jpg", "forkeerestaurant.jpg", "posatelier.jpg", "bourkestreetbakery.jpg", "haighschocolate.jpg", "palominoespresso.jpg", "upstate.jpg", "traif.jpg", "grahamavenuemeats.jpg", "wafflewolf.jpg", "fiveleaves.jpg", "cafelore.jpg", "confessional.jpg", "barrafina.jpg", "donostia.jpg", "royaloak.jpg", "caskpubkitchen.jpg"]
   
    var restaurantLocations = ["Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Hong Kong", "Sydney", "Sydney", "Sydney", "New York", "New York", "New York", "New York", "New York", "New York", "New York", "London", "London", "London", "London"]

    
    var restaurantTypes = ["Coffee & Tea Shop", "Cafe", "Tea House", "Austrian / Causual Drink", "French", "Bakery", "Bakery", "Chocolate", "Cafe", "American / Seafood", "American", "American", "Breakfast & Brunch", "Coffee & Tea", "Coffee & Tea", "Latin American", "Spanish", "Spanish", "Spanish", "British", "Thai"]
    
   
    /*
     UITableViewDataSource = 資料與表格試圖連結用
     UITableViewDataSource協定必須實作的方法：
     tableView(_:cellForRowAt indexPath:)
     tableView(_:numberOfRowsInSection:)
    */
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cellIdentifier = "Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as! RestaurantTableViewCell
        
        cell.nameLabel.text = restaurantNames[indexPath.row]
        cell.thumbImageLabel.image = UIImage(named: restaurantImages[indexPath.row])
        cell.locationLabel.text = restaurantLocations[indexPath.row]
        cell.typeLabel.text = restaurantTypes[indexPath.row]
        
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        //建立一個類似動作清單的選單
        let optionMenu = UIAlertController(title:nil, message:"What do you want to do?",preferredStyle: .actionSheet)
        
        //加入取消動作至選單中
        let cancelAction = UIAlertAction(title:"Cancel", style: .cancel, handler: nil)
        optionMenu.addAction(cancelAction)
        
        //加入call動作 
        //call完後 並呈現失敗的狀態
        let callActionHandler = {(action:UIAlertAction!) -> Void in
         
            let alertMessage = UIAlertController(title:"Service Unavailable", message: "Sorry, the call featrue is not availabel yet. Please retry later.", preferredStyle: .alert )
            alertMessage.addAction(UIAlertAction(title:"OK", style: .default, handler: nil))
            self.present(alertMessage, animated: true, completion: nil)
            
        }
       
        //加入call動作至選單中
        let callAction = UIAlertAction(title:"Call"+"123-000-\(indexPath.row)",style: .default, handler: callActionHandler)
        optionMenu.addAction(callAction)
        
        
        
        //呈現選單
        present(optionMenu, animated: true, completion: nil)
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    override var prefersStatusBarHidden: Bool {
        
        return true
        //用來指示狀態列的關閉狀態
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return restaurantNames.count
    }

}
