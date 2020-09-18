//
//  FirstViewController.swift
//  XcodeBasic
//
//  Created by 阿部拓磨 on 2020/09/18.
//  Copyright © 2020 abetkma.com. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTableView.delegate = self
        itemTableView.dataSource = self
        
        costsArray.removeAll()
    }
    
    var cost:Double = 0
    var addTaxCost:Double = 0
    var costsArray:[Double] = []
    var addTaxCostString:String = ""
    
    @IBOutlet var showLabel: UILabel!
    
    @IBOutlet var costField: UITextField!
    
    @IBOutlet var taxController: UISegmentedControl!
    
    @IBOutlet var itemTableView: UITableView!
    
    @IBAction func taxChanger(_ sender: Any) {
        
        if taxController.selectedSegmentIndex == 0 {
            calc(tax: 1.1)
        } else {
            calc(tax: 1.08)
        }
        
    }
    
    func calc(tax:Double) {
        cost = Double(costField.text!)!
        addTaxCost = cost * Double(tax)
        print(addTaxCost)
        
        addTaxCostString = String(format: "%.0f", addTaxCost)
        showLabel.text = addTaxCostString
    }
    
    
    @IBAction func addButton(_ sender: Any) {
        
        costsArray.append(contentsOf: [addTaxCost])
        print(costsArray)
        UserDefaults.standard.set(costsArray, forKey: "item")
        
        costField.text = ""
        showLabel.text = ""
        
        self.itemTableView.reloadData()
        
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return costsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = itemTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        
        cell.textLabel?.text = "\(costsArray[indexPath.row])"
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {

                //resultArray内のindexPathのrow番目をremove（消去）する
                costsArray.remove(at: indexPath.row)

                //再びアプリ内に消去した配列を保存
                UserDefaults.standard.set(costsArray, forKey: "item")

                //tableViewを更新
                itemTableView.reloadData()
        }
    }
    
    
    
    
}
