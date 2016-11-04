//
//  ChartsViewController.swift
//  Moder
//
//  Created by Leqi Long on 11/3/16.
//  Copyright © 2016 TeamAwesome. All rights reserved.
//

import UIKit

class ChartsViewController: UIViewController {
    
    var done: Bool!
    var direction: Bool!
    var chartsView: [ChartView] = []
    var currentChartView: ChartView!
    var data: [UIImage] = [
        UIImage(named: "cats-1.png")!,
        UIImage(named: "cats_2.png")!,
        UIImage(named: "Sales-card.png")!,
        UIImage(named: "churn card.png")!,
        UIImage(named: "product card.jpg")!
    ]
    
    var noMoreImageView: UIImage = UIImage(named: "product card.png")!
    let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        for image in data{
            currentChartView = ChartView(
                frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/5*4),
                image: image,
                center: CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            )
            chartsView.append(currentChartView)
        }
        
        for chart in chartsView{
            self.view.addSubview(chart)
        }
        
        //add pan gesture recognizer
        let pan = UIPanGestureRecognizer(target: self, action: Selector("handlePan:"))
        self.view.addGestureRecognizer(pan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func determineStarred(dir: Bool!){
        self.currentChartView.swipe(dir)
        
        if (dir != nil && dir == true){
            appDelegate.starredCharts.append(currentChartView)
        }
        
        self.chartsView.removeAtIndex(self.chartsView.count - 1 )
        if self.chartsView.count - 1 < 0{
            var noMoreView = ChartView(
                frame: CGRectMake(0, 0, self.view.frame.width, self.view.frame.height/3*2),
                image: noMoreImageView,
                center: CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/3)
            )
            
            chartsView.append(noMoreView)
            self.view.addSubview(noMoreView)
            done = true
            return
        }
        
        currentChartView = chartsView.last!
    }
    
    
    func handlePan(gesture: UIPanGestureRecognizer){
        if gesture.state == UIGestureRecognizerState.Ended{
            let location = gesture.locationInView(self.view)
            if currentChartView.center.x / self.view.bounds.maxX > 0.8{
                determineStarred(true)
            }else if currentChartView.center.x / self.view.bounds.maxX < 0.2{
                determineStarred(false)
            }else{
                currentChartView.returnToCenter()
            }
        }
        
        
        let translation = gesture.translationInView(currentChartView)
        currentChartView.center = CGPoint(x: currentChartView.center.x + translation.x, y: currentChartView.center.y + translation.y)
        gesture.setTranslation(CGPointZero, inView: self.view)
    }
    
    func configureUI(){
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.22, green:0.69, blue:0.40, alpha:1.0)
        
        
        let moderLogoImageName = "Logo-moder-navbar.png"
        let logo = UIImageView(frame: CGRectMake(CGFloat(view.frame.maxX/2 - 40.0), 0, 80, 20))
        logo.contentMode = .ScaleAspectFit
        logo.image = UIImage(named: moderLogoImageName)
        self.navigationItem.titleView = logo

    }

}
