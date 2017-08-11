//
//  MasterView.swift
//  SampleDemo
//
//  Created by ispl Mac Mini on 8/11/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

class MasterView: UIViewController,UITableViewDelegate,UITableViewDataSource,DetailViewDelegate {

    @IBOutlet var tblView: UITableView!
    
    private var discFinalData:NSMutableDictionary!
    private let arrSection:[String]=["Section....1","Section....2","Section....3","Section....4","Section....5"]
    
    private var selectionIndex:Int=0
    
    //Mark:
    override func viewDidLoad() {
        super.viewDidLoad()

        discFinalData=[arrSection[0]:[],arrSection[1]:[],arrSection[2]:[],arrSection[3]:[],arrSection[4]:[]]
        print(arrSection.count)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //Mark: TableView
    func numberOfSections(in tableView: UITableView) -> Int {
        return arrSection.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let arr=discFinalData.object(forKey: arrSection[section]) as! NSArray
        //if(((discFinalData.object(forKey: arrSection[section]) as! NSArray).count == 0)
        return arr.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! MasterViewCell
        
        cell.lblName.text=((discFinalData.object(forKey: arrSection[indexPath.section]) as! NSArray).object(at: indexPath.row) as! NSArray).object(at: 0) as? String
        cell.lblCity.text=((discFinalData.object(forKey: arrSection[indexPath.section]) as! NSArray).object(at: indexPath.row) as! NSArray).object(at: 1) as? String
        
        return cell
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView:UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "headerView")!
        
        let lblTitle=headerView.viewWithTag(1) as! UILabel
        lblTitle.text=arrSection[section]
        
        let btnAdd=headerView.viewWithTag(2) as! UIButton
        btnAdd.tag=section
        btnAdd.addTarget(self, action: #selector(MasterView.btnAddTap(_:)), for: .touchUpInside)
        
        return headerView
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 44
    }
        
    //MARK : Button Tap
    @IBAction func btnAddTap(_ sender: UIButton) {
        selectionIndex=sender.tag
        
        let detailView=self.storyboard?.instantiateViewController(withIdentifier: "DetailView") as! DetailView
        detailView.fierDelegate=self
        self.navigationController?.pushViewController(detailView, animated: true)
    }
    
    func backDelegate(controler :DetailView)
    {
        let arrLast:NSMutableArray = NSMutableArray(array: discFinalData.object(forKey: arrSection[selectionIndex]) as! NSArray)
        arrLast.add([controler.txtName.text,controler.txtCity.text])
        discFinalData.setValue(arrLast, forKey: arrSection[selectionIndex])
        
        print(discFinalData)
        
        tblView.reloadData()
    }
    
}
