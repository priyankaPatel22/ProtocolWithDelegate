//
//  DropDownView.swift
//  SampleDemo
//
//  Created by ispl Mac Mini on 8/11/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit
import DropDown

class DropDownView: UIViewController {

    @IBOutlet var txtName: UITextField!
    
   
    
    let dropDown = DropDown()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dropDown.anchorView = txtName
        dropDown.dataSource = ["aaaaa", "bbbbbb", "ccccc","dddddd","eeeeeeee","ffffff","gggggggg","hhhhhhhhhhh","iiiiiiiiii","jjjjjjjj","kkkkkkk","llllllll","mmmmmmmmm","nnnn","oo","ppp","qqqq","rrrr","sssss","tttttt","uuuuuu","vvvvvv","wwwwww","xxxxxxxx","yyyyyyy","zzzzzzzz"]
        dropDown.bottomOffset = CGPoint(x: 0, y:txtName.bounds.height)
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.txtName.text=item
        }
        
        // Do any additional setup after loading the view.
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func btnSelectTap(_ sender: UIButton) {
        
        dropDown.show()
    }
}
