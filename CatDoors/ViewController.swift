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

    @IBOutlet weak var gpsCoordinates: UILabel!
    
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
    
    @IBAction func getGPS(_ sender: Any) {
        AF.request("http://abdulrahmanuh.com:3000/get-gps", method: .get)
            .responseData { response in
                debugPrint(response)
                
                if let data = response.data {
                    let json = String(data: data, encoding: String.Encoding.utf8)
                    //print("Failure Response: \(json)")
                    
                    self.gpsCoordinates.text = json;
                    
                }
        }
    }
}

