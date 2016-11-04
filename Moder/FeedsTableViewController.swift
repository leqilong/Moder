//
//  FeedsTableViewController.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import UIKit

class FeedsTableViewController: UITableViewController {
    
    let imageData: [UIImage] = [
        UIImage(named: "daria.jpg")!,
        UIImage(named: "daria.jpg")!,
        UIImage(named: "daria.jpg")!,
        UIImage(named: "quinn.jpg")!,
        UIImage(named: "jane.jpg")!,
        UIImage(named: "jane.jpg")!,
        UIImage(named: "jane.jpg")!,
        UIImage(named: "quinn.jpg")!,
        UIImage(named: "daria.jpg")!,
        UIImage(named: "daria.jpg")!
    ]
    
    let textData: [String] = [
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you",
        "started following you"
    ]
    
    let chartData: [UIImage] = [
        UIImage(named: "cats-1.png")!,
        UIImage(named: "cats_2.png")!,
        UIImage(named: "Sales-card.png")!,
        UIImage(named: "churn card.png")!,
        UIImage(named: "product card.png")!,
        UIImage(named: "cats-1.png")!,
        UIImage(named: "cats_2.png")!,
        UIImage(named: "Sales-card.png")!,
        UIImage(named: "churn card.png")!,
        UIImage(named: "product card.png")!

    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("FeedsCell", forIndexPath: indexPath) as! FeedsTableViewCell
        cell.profileImageView.image = imageData[indexPath.row].rounded
        cell.notificationLabel.text = textData[indexPath.row]
        cell.chartImageView.image = chartData[indexPath.row]
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    func configureUI(){
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.22, green:0.69, blue:0.40, alpha:1.0)
        
        
        let moderLogoImageName = "Logo-moder-navbar.png"
        let logo = UIImageView(frame: CGRectMake(CGFloat(view.frame.maxX/2 - 40.0), 0, 80, 20))
        logo.contentMode = .ScaleAspectFit
        logo.image = UIImage(named: moderLogoImageName)
        self.navigationItem.titleView = logo
        
    }


}
