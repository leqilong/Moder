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
        UIImage(named: "product card.png")!,
        UIImage(named: "churn.png")!,
        UIImage(named: "Group.png")!,
    ]
    
    var noMoreImageView: UIImage = UIImage(named: "circle.png")!
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let starActionImageView = UIImageView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for image in data{
            currentChartView = ChartView(
                frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height/5*4).integral,
                image: image,
                center: CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            )
            chartsView.append(currentChartView)
        }
        
        
        for chart in chartsView{
            self.view.addSubview(chart)
        }
        
        configureUI()
        
        //add pan gesture recognizer
        let pan = UIPanGestureRecognizer(target: self, action: #selector(ChartsViewController.handlePan(_:)))
        self.view.addGestureRecognizer(pan)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func determineStarred(_ dir: Bool!){
        self.currentChartView.swipe(dir)
        
        if (dir != nil && dir == true){
            appDelegate.starredCharts.append(currentChartView)
            starActionImageView.transform = CGAffineTransform(scaleX: 1, y: 0)
            let animation = CABasicAnimation(keyPath: "transform.scale")
            animation.fromValue = 1.0
            animation.toValue = 0.8
            animation.duration = 0.6
            animation.fillMode = kCAFillModeBoth
            starActionImageView.layer.add(animation, forKey: "anim")
        }
        
        self.chartsView.remove(at: self.chartsView.count - 1 )
        if self.chartsView.count - 1 < 0{
            var noMoreView = ChartView(
                frame: CGRect(x: 0, y: 0, width: self.view.frame.width-50, height: self.view.frame.height/2),
                image: noMoreImageView,
                center: CGPoint(x: self.view.bounds.width/2, y: self.view.bounds.height/2)
            )
            
            chartsView.append(noMoreView)
            self.view.addSubview(noMoreView)
            done = true
            return
        }
        
        currentChartView = chartsView.last!
    }
    
    
    func handlePan(_ gesture: UIPanGestureRecognizer){
        if gesture.state == UIGestureRecognizerState.ended{
            let location = gesture.location(in: self.view)
            if currentChartView.center.x / self.view.bounds.maxX > 0.8{
                determineStarred(true)
            }else if currentChartView.center.x / self.view.bounds.maxX < 0.2{
                determineStarred(false)
            }else{
                currentChartView.returnToCenter()
            }
        }
        
        
        let translation = gesture.translation(in: currentChartView)
        currentChartView.center = CGPoint(x: currentChartView.center.x + translation.x, y: currentChartView.center.y + translation.y)
        gesture.setTranslation(CGPoint.zero, in: self.view)
    }
    
    func configureUI(){
        starActionImageView.frame = CGRect(x: CGFloat(self.view.frame.width/2 - 24), y: CGFloat(self.view.frame.height/2 - 24), width: 48, height: 48)
        starActionImageView.image = UIImage(named: "Star-selected.png")
        view.addSubview(starActionImageView)
        starActionImageView.transform = CGAffineTransform(scaleX: 0, y: 0)
        self.navigationController!.navigationBar.barTintColor = UIColor(red:0.22, green:0.69, blue:0.40, alpha:1.0)
        
        
        let moderLogoImageName = "Logo-moder-navbar.png"
        let logo = UIImageView(frame: CGRect(x: CGFloat(view.frame.maxX/2 - 40.0), y: 0, width: 80, height: 20))
        logo.contentMode = .scaleAspectFit
        logo.image = UIImage(named: moderLogoImageName)
        self.navigationItem.titleView = logo

    }

}
