//
//  ViewController.swift
//  CatDoors
//
//  Created by Mihai Solomon on 28/04/2019.
//  Copyright © 2019 Mihai Solomon. All rights reserved.
//

import UIKit

import Alamofire;
import MapKit;

class ViewController: UIViewController {

    @IBOutlet weak var gpsCoordinates: UILabel!
    @IBOutlet weak var cityLabel: UILabel!
    @IBOutlet weak var countryLabel: UILabel!
    @IBOutlet weak var countryCodeLabel: UILabel!
    @IBOutlet weak var streetLabel: UILabel!
    @IBOutlet weak var localtionNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func lockDoor(_ sender: Any) {
        AF.request("http://abdulrahmanhu.com:3000/door-lock", method: .get)
            .responseJSON { response in
                debugPrint(response)
        }
    }
    
    @IBAction func openDoor(_ sender: Any) {
        AF.request("http://abdulrahmanhu.com:3000/door-open", method: .get)
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
                    
                    let coordinatesArr = json?.components(separatedBy: ", ");
                    
                    let num = (coordinatesArr?[1] as! NSString).floatValue;
                    let num2 = (coordinatesArr?[0] as! NSString).floatValue;
                    
                    let geoCoder = CLGeocoder()
                    let location = CLLocation(latitude: CLLocationDegrees(num), longitude: CLLocationDegrees(num2))
                    
                    geoCoder.reverseGeocodeLocation(location, completionHandler: {
                            placemarks, error -> Void in
                            
                            // Place details
                            guard let placeMark = placemarks?.first else { return }
                            
                            // Location name
                            if let locationName = placeMark.location {
                                print(locationName)
                                self.localtionNameLabel.text = "Location: \(locationName)";
                            }
                            // Street address
                            if let street = placeMark.thoroughfare {
                                print(street)
                                self.streetLabel.text = "Street: \(street)";
                            }
                            // City
                            if let city = placeMark.subAdministrativeArea {
                                print(city)
                                self.cityLabel.text = "City: \(city)";
                            }
                            // Zip code
                            if let zip = placeMark.isoCountryCode {
                                print(zip)
                                self.countryLabel.text = "Country code: \(zip)";
                            }
                            // Country
                            if let country = placeMark.country {
                                print(country)
                                self.countryLabel.text = "Country: \(country)";
                            }
                    })
                    
                    self.gpsCoordinates.text = json;
                    
                }
        }
    }
    @IBAction func getPicture(_ sender: Any) {
        AF.request("http://abdulrahmanuh.com:3000/socket.io/?EIO=3&transport=polling&t=MfaVmWg&sid=ec323149a929487c81dca3ff219b6e07", method: .get)
            .responseJSON { response in
                debugPrint(response)
        }
        
    }
}

