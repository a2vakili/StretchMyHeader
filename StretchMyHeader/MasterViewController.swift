//
//  MasterViewController.swift
//  StretchMyHeader
//
//  Created by Arsalan Vakili on 2015-09-08.
//  Copyright (c) 2015 Arsalan Vakili. All rights reserved.
//

import UIKit

let kTableHeaderHeight:CGFloat = 130.0



class MasterViewController: UITableViewController {
    

    var headlines = [Headline]()
    var newsItems = [NewsItems]()

    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var tableHeaderView: UIView!
    
    @IBOutlet weak var imageHeaderView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        
        self.setUpModel()
        
        setUPHeaderView()
    
        
       
        var dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .LongStyle
        var timeString = " \(dateFormatter.stringFromDate(NSDate()))"
        self.dateLabel.text = timeString
        
        
    }
    
    
    func setUpModel(){
        
        let newsItem1 = NewsItems(category:  "Climate change protests, divestments meet fossil fuels realities")
        let newsItem2 = NewsItems(category: "Scotland's 'Yes' leader says independence vote is 'once in a lifetime")
        let newsItem3 = NewsItems(category: "Airstrikes boost Islamic State, FBI director warns more hostages possible")
        let newsItem4 = NewsItems(category: "Nigeria says 70 dead in building collapse; questions S. Africa victim claim")
        let newsItem5 = NewsItems(category: "Despite UN ruling, Japan seeks backing for whale hunting")
        let newsItem6 = NewsItems(category: "Officials: FBI is tracking 100 Americans who fought alongside IS in Syria")
        let newsItem7 = NewsItems(category: "South Africa in $40 billion deal for Russian nuclear reactors")
        let newsItem8 = NewsItems(category: "One million babies' created by EU student exchanges")
        
        newsItems.insert(newsItem1, atIndex: 0)
        newsItems.insert(newsItem2, atIndex: 1)
        newsItems.insert(newsItem3, atIndex: 2)
        newsItems.insert(newsItem4, atIndex: 3)
        newsItems.insert(newsItem5, atIndex: 4)
        newsItems.insert(newsItem6, atIndex: 5)
        newsItems.insert(newsItem7, atIndex: 6)
        newsItems.insert(newsItem8, atIndex: 7)
        
        let headline1 = Headline(headline: "World", color: UIColor.greenColor())
        let headline2 = Headline(headline: "Europe", color: UIColor.blueColor())
        let headline3 = Headline(headline: "Middle East", color: UIColor.purpleColor())
        let headline4 = Headline(headline: "Africa", color: UIColor.redColor())
        let headline5 = Headline(headline: "Asia Pacific", color: UIColor.yellowColor())
        let headline6 = Headline(headline: "Americas", color: UIColor.brownColor())
        let headline7 = Headline(headline: "World", color: UIColor.greenColor())
        let headline8 = Headline(headline: "Europe", color: UIColor.blueColor())
        
        headlines.insert(headline1, atIndex: 0)
        headlines.insert(headline2, atIndex: 1)
        headlines.insert(headline3, atIndex: 2)
        headlines.insert(headline4, atIndex: 3)
        headlines.insert(headline5, atIndex: 4)
        headlines.insert(headline6, atIndex: 5)
        headlines.insert(headline7, atIndex: 6)
        headlines.insert(headline8, atIndex: 7)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prefersStatusBarHidden() -> Bool {
        return true;
    }

    func updateHeaderView(){
        
        var contentOffSet = self.tableView.contentOffset
        
        if (contentOffSet.y < 0) {
             self.tableHeaderView.frame = CGRectMake(0, contentOffSet.y , self.tableView.frame.size.width, -contentOffSet.y)
        }
    }


    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return headlines.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! HeaderTableViewCell

        let object = headlines[indexPath.row] as Headline
        let object2 = newsItems[indexPath.row] as NewsItems
        
        cell.headlineTextLabel.text = object.headline
        cell.headlineTextLabel.textColor = object.color
        cell.categoryTextLabel.text = object2.category
        
        return cell
    }
    
    override func scrollViewDidScroll(scrollView: UIScrollView) {
        updateHeaderView()
    }
    
    
    func setUPHeaderView(){
        
        tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.rowHeight = 100 // FIXME:
        
        // setting up the tableview header
        self.tableView.tableHeaderView = nil

        self.tableHeaderView.frame = CGRectMake(0, -kTableHeaderHeight, self.tableView.frame.size.width, kTableHeaderHeight);
        
        self.tableView.addSubview(self.tableHeaderView)
        
        self.tableView.contentOffset = CGPointMake(0.0, -kTableHeaderHeight)
        self.tableView.contentInset = UIEdgeInsetsMake(kTableHeaderHeight, 0.0, 0.0, 0.0)

    }
    

    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }



}

