//
//  CalculateViewController.swift
//  LoveCalculator
//
//  Created by Haseena Gul on 29/03/2019.
//  Copyright © 2019 lecture. All rights reserved.
//

import UIKit
import AVFoundation

class CalculateViewController: UIViewController , AVAudioPlayerDelegate {
    
    var audioPlayer: AVAudioPlayer!
    
    // IB - outlet.
    

    @IBOutlet weak var yourNameTextField: UITextField!
    
    @IBOutlet weak var partnerNameTextField: UITextField!
    
    
    
    @IBOutlet weak var percentageLabel: UILabel!
    
    @IBOutlet weak var summaryLabel: UILabel!
    
    
    @IBAction func calculateButton(_ sender: Any) {
        
        calculate()
    }
    
    //store file in array.
    let fileSound = ["happy","medium","uh"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
// calculate .
    func calculate(){
        
        let lovepercent = arc4random_uniform(101)
        if yourNameTextField.text != "" && partnerNameTextField.text != ""{
            
            percentageLabel.text = "\(lovepercent)%"
            
            
        }
        
        if lovepercent > 85 {
            sound(fileToPlay: fileSound[0])
            
            summaryLabel.text = "A successful relationship is possible, but you both have to work on it. Do not sit back and think that it will all work out fine, because it might not be working out the way you wanted it to. Spend as much time with each other as possible."
        }
        else if lovepercent > 40 && lovepercent <= 80{
            sound(fileToPlay: fileSound[1])
            summaryLabel.text = "you go together like coke and mentos"
        }
        else {
            sound(fileToPlay: fileSound[2])
             summaryLabel.text = "very good chance of being successful, but this doesn't mean that you don't have to work on the relationship. Remember that every relationship needs spending time together, talking with each other etc."
    }
    

}
    
    // play a sound with percentage.
    func sound(fileToPlay : String){
         let sourceFile = Bundle.main.url(forResource: fileToPlay, withExtension: "wav")!
        
        do {
            try audioPlayer = AVAudioPlayer(contentsOf: sourceFile)
        }
        catch {
            print (error)
            
        }
        audioPlayer.play()
        }
    
    //Exit the keyboard once the user has touch the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
    }
}
