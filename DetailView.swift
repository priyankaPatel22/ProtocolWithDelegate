//
//  DetailView.swift
//  SampleDemo
//
//  Created by ispl Mac Mini on 8/11/17.
//  Copyright © 2017 infinium. All rights reserved.
//

import UIKit

protocol DetailViewDelegate:class
{
    func backDelegate(controler :DetailView) -> Void
}

class DetailView: UIViewController {

    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtCity: UITextField!
    
    var fierDelegate:DetailViewDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(DetailView.tap(_:)))
        view.addGestureRecognizer(tapGesture)
    }

    func tap(_ gesture: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    //MARK : Button Tap Action
    
    @IBAction func btnSaveTap(_ sender: UIButton) {
        if(!(txtName.text?.isEmpty)! && !(txtCity.text?.isEmpty)!)
        {
            self.navigationController?.popViewController(animated: true)
            fierDelegate.backDelegate(controler: self)
            
        }
    }
}
