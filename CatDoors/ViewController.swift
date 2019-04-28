//
//  ViewController.swift
//  CatDoors
//
//  Created by Mihai Solomon on 28/04/2019.
//  Copyright © 2019 Mihai Solomon. All rights reserved.
//

import UIKit

import Alamofire;

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lockDoor(_ sender: Any) {
        AF.request("http://abdulrahmanhu.com/door-lock", method: .get)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    @IBAction func openDoor(_ sender: Any) {
        AF.request("http://abdulrahmanhu.com/door-open", method: .get)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
}

