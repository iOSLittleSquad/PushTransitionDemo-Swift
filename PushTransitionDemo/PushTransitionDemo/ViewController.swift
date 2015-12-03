//
//  ViewController.swift
//  PushTransitionDemo
//
//  Created by CG on 15/12/3.
//  Copyright © 2015年 iOSLittleSquad. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: properties
    
    @IBOutlet weak var kTableView: UITableView!
    
    internal var naviTransistion: PushTransition!
    
    // MARK: view controller
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        naviTransistion = PushTransition()
        self.navigationController?.delegate = naviTransistion
        kTableView.backgroundColor = UIColor.clearColor()
        kTableView.backgroundView = nil
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: tableView datasource

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: UITableViewCell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        cell.textLabel?.text = "row - \(indexPath.row)"
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    // MARK: tableView delegate
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0.1
    }
    
    func tableView(tableView: UITableView, willSelectRowAtIndexPath indexPath: NSIndexPath) -> NSIndexPath? {
        let cell = tableView.cellForRowAtIndexPath(indexPath)!
        var convertRect: CGRect = cell.convertRect(cell.bounds, toView: AppDelegate.currentWindow())
        if CGRectGetMaxY(convertRect) > ScreenHeight {
            convertRect.size.height = ScreenHeight - convertRect.origin.y - 1
        }
        naviTransistion.convertCellRect = convertRect
        return indexPath
    }
}

