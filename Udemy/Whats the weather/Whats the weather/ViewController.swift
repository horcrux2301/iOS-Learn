//
//  ViewController.swift
//  Whats the weather
//
//  Created by Harsh Khajuria on 19/04/19.
//  Copyright © 2019 horcrux2301. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    
    @IBOutlet weak var cityTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    @IBAction func getWeather(_ sender: Any) {
        var message = ""
        if let url = URL(string: "https://www.weather-forecast.com/locations/" + cityTextField.text! + "/forecasts/latest"){
        
        let request = NSMutableURLRequest(url: url)
        print(url)
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("was here")
                print(error!)
            } else {
                if let unwrappedData = data{
                    let dataString = NSString(data: unwrappedData, encoding: String.Encoding.utf8.rawValue)
                    let stringSeperator = "<p class=\"b-forecast__table-description-content\">"
                    if let contentArray = dataString?.components(separatedBy: stringSeperator){
                        if contentArray.count > 1 {
                            let secondStringSeperator = "</span>"
                            let secondContentArray = contentArray[1].components(separatedBy: secondStringSeperator)
                            if secondContentArray.count > 1 {
                                let weatherString = NSString(string: secondContentArray[0])
                                var weather = weatherString.substring(from: 21)
                                weather = weather.replacingOccurrences(of: "&deg;", with: "°")
                                message = weather
                                print(message)
                            }
                        }
                        
                    }
                }
            }
            
            if message == "" {
                message = "There was an error fetching the data. Please try again."
            }
            
            DispatchQueue.main.sync(execute: {
                self.resultLabel.text = message
            })
            
        }
        
        task.resume()
        } else {
            resultLabel.text = "here was an error fetching the data. Please try again.1"
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

