//
//  ChangeCityViewController.swift
//  WeatherApp
//
//  Created by Tomasz Paluszkiewicz on 13/10/2020.
//

import UIKit
import AVKit
import AVFoundation

class ChangeCityViewController: UIViewController {
    
    var delegate : ChangeCityDelegate?
    
    var player:AVAudioPlayer = AVAudioPlayer()
    
    override func viewDidLoad() {
        // code
        
        do {
            let audioPath = Bundle.main.path(forResource: "CityChangeVoice", ofType: "mp3")
            try player = AVAudioPlayer(contentsOf: NSURL(fileURLWithPath: audioPath!) as URL)
        }
        catch
        {
            print("error -> \(error.localizedDescription)")
        }
        
        player.play()
    }
    
    
    @IBOutlet weak var changeCityTextField: UITextField!

    
    
    @IBAction func getWeatherPressed(_ sender: AnyObject) {
        
        let cityName = changeCityTextField.text!
        delegate?.userEnteredANewCityName(city: cityName)
        
        self.dismiss(animated: true, completion: nil)
            
        
        
    }
    
    
    @IBAction func backButtonPressed(_ sender: AnyObject) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
