//
//  SecondViewController.swift
//  XcodeBasic
//
//  Created by 阿部拓磨 on 2020/09/18.
//  Copyright © 2020 abetkma.com. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var resultArray:[Double] = []
    var sum:Double = 0
    
    @IBOutlet var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resultArray = UserDefaults.standard.object(forKey: "item") as! [Double]
        print(resultArray)
        sum = resultArray.reduce(0) { (num1:Double, num2:Double) -> Double in
            return num1 + num2
        }
        
        resultLabel.text = String(format: "%.0f", sum)
        
    }
    
    @IBAction func shareButton(_ sender: Any) {
        
        // 共有する項目
               let shareText = "\(String(format: "%.0f", sum))"
               let shareWebsite = NSURL(string: "http://hachimantai.spartacamp.jp/")!
        
        
               let activityItems = [shareText, shareWebsite] as [Any]
        
               let activityVC = UIActivityViewController(activityItems: activityItems, applicationActivities: nil)
        
        
                // 使用しないアクティビティタイプ
                let excludedActivityTypes = [
//                UIActivity.ActivityType.postToFacebook,
//                UIActivity.ActivityType.postToTwitter,
//                UIActivity.ActivityType.message,
                UIActivity.ActivityType.saveToCameraRoll,
                UIActivity.ActivityType.print
                ]
        
                activityVC.excludedActivityTypes = excludedActivityTypes
        
               // UIActivityViewControllerを表示
               self.present(activityVC, animated: true, completion: nil)
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
