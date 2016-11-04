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
        UIImage(named: "Cats1.png")!,
        UIImage(named: "cats2.png")!,
        UIImage(named: "cats3.png")!,
        UIImage(named: "cats4.png")!,
        UIImage(named: "cats6.png")!,
        UIImage(named: "cats7.png")!,
        UIImage(named: "cats5.png")!,
        UIImage(named: "Cats1.png")!,
        UIImage(named: "cats3.png")!,
        UIImage(named: "cats7.png")!
    ]
    
    let nameData: [String] = [
        "Britney Spears ",
        "Beyonce ",
        "TLC ",
        "Shirley Wong ",
        "NSYNC ",
        "Prince ",
        "Bruno Mars ",
        "TLC ",
        "Shirley Wong ",
        "Briney Spears "
        
    ]
    
    let textData: [String] = [
        "commented on ",
        "added a report to ",
        "starred ",
        "added a report to ",
        "starred ",
        "shared a report with you ",
        "starred ",
        "starred ",
        "starred ",
        "starred "
    ]
    
    let objectData: [String] = [
        "Marketing",
        "Sales - revenue dashboard",
        "No Scrubs churn analysis",
        "Marketing",
        "Sales",
        "Sales - update KPI dashboard",
        "Marketing",
        "Marketing",
        "Marketing",
        "Sales"
    ]
    
    let chartData: [UIImage] = [
        UIImage(named: "cats-1.png")!,
        UIImage(named: "cats_2.png")!,
        UIImage(named: "product card.png")!,
        UIImage(named: "churn.png")!,
        UIImage(named: "Group.png")!,
        UIImage(named: "cats-1.png")!,
        UIImage(named: "cats_2.png")!,
        UIImage(named: "product card.png")!,
        UIImage(named: "churn.png")!,
        UIImage(named: "Group.png")!

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

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FeedsCell", for: indexPath) as! FeedsTableViewCell
        cell.profileImageView.image = imageData[indexPath.row].rounded
        
        let att = [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 12)]
        let nonAtt = [NSFontAttributeName: UIFont.systemFont(ofSize: 12)]
        
        let boldName = NSMutableAttributedString(string: nameData[indexPath.row], attributes: att)
        
        let boldObject = NSMutableAttributedString(string: objectData[indexPath.row], attributes: att)
        
        let activity = NSMutableAttributedString(string: textData[indexPath.row], attributes: nonAtt)
        
        var combination = NSMutableAttributedString()
        combination.append(boldName)
        combination.append(activity)
        combination.append(boldObject)
        cell.notificationLabel.attributedText = combination
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
        let logo = UIImageView(frame: CGRect(x: CGFloat(view.frame.maxX/2 - 40.0), y: 0, width: 80, height: 20))
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: moderLogoImageName)
        self.navigationItem.titleView = logo
        
    }


}
