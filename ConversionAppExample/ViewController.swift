//
//  ViewController.swift
//  ConversionAppExample
//
//  Created by John Pill on 26/11/2021.
//

import UIKit

class ViewController: UIViewController {
   
    @IBOutlet var label1: UILabel!
    @IBOutlet var label2: UILabel!
    @IBOutlet var pointsLabel: UILabel!
    @IBOutlet var encouragementLabel: UILabel!
    @IBOutlet var imageView: UIImageView!
    
    var numberOfThings = 0
    var numberOfWalkCycle = 0
     
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
 
    
    

    func updateUI() {
       // CALLS THE POINTS CALCULATOR FUNCTION TO ASSIGN POINTS TO A VARIABLE WE CAN USE
        let points = calculatePoints(things: numberOfThings, walkOrCycle: numberOfWalkCycle)
        
        label1.text = "You have recycled \(numberOfThings) things!"
        label2.text = "You have walked / cycled instead of using a car \(numberOfWalkCycle) times!"
        pointsLabel.text = "You have \(points) points"
    
            // ENCOURAGEMENT LABEL & BADGE LOGIC
        
        switch points {
        case 0:
            encouragementLabel.text = ""
            imageView.image = nil
            
        case 1..<49:
            encouragementLabel.text = "Well done on making a start!"
            imageView.image = UIImage(named: "badge1")
            
        case 30..<99:
            encouragementLabel.text = "Excellent! Keep going..."
            imageView.image = UIImage(named: "badge2")
            
        case 100..<199:
            encouragementLabel.text = "Great Job!"
            imageView.image = UIImage(named: "badge3")
            
        case 200..<299:
            encouragementLabel.text = "Awesome Job!"
            imageView.image = UIImage(named: "badge4")
            
        case 300..<399:
            encouragementLabel.text = "Phenomenal Job!"
            imageView.image = UIImage(named: "badge5")
            
        case 400..<1000000:
            encouragementLabel.text = "Saving the Planet... Completed!"
            imageView.image = UIImage(named: "badge6")
            
        default:
            encouragementLabel.text = ""
            imageView.image = nil
            
        }
        
        // REMOVED IF STATEMENT FROM UPDATEUI FUNC
        /*
        if numberOfThings == 1 || numberOfWalkCycle == 1 {
            encouragementLabel.text = "Well done on making a start!"
            imageView.image = UIImage(named: "badge1")
        }     else if points >= 400 {
            encouragementLabel.text = "Saving the Planet... completed!"
            imageView.image = UIImage(named: "badge6")
            
        }  else if points >= 300 {
            encouragementLabel.text = "phenomenal Job!"
            imageView.image = UIImage(named: "badge5")
        
        } else if points >= 200 {
            encouragementLabel.text = "Awesome Job!"
            imageView.image = UIImage(named: "badge4")
        } else if points >= 100 {
            encouragementLabel.text = "Great Job!"
            imageView.image = UIImage(named: "badge3")
        } else if numberOfThings >= 10 || numberOfWalkCycle >= 10 {
            encouragementLabel.text = "Excellent! Keep going..."
            imageView.image = UIImage(named: "badge2")
            }
         */
        
        
    }
    
        
        
         
   
    // FUNCTION TO CACLULATE POINTS TAKEING BOTH VARS AS INPUT AND RETURS AN INT FOR USE ELSEWHERE
    
    func calculatePoints(things: Int, walkOrCycle: Int) -> Int {
        if things == 1 && walkOrCycle == 0 || things == 0 && walkOrCycle == 1 {
            return 1
        } else if things == 0 {
            return walkOrCycle * 1
        } else if walkOrCycle == 0 {
            return things * 1
        }
        
        return things * walkOrCycle
        }
    
    /*FUNCTIONS ALL LINKED TO BUTTONS EACH DOES A SIMPLE CALCULATION AND THEN CALLS THE UPDATEUI FUNCTION TO UPDATE THE SCREEN. APPLE LIKE THIS APPROACH! YOU CAN SEE WHY AS ALL 60 BUTTONS ONLY NEED A CALL TO 1 FUNCTION RATHER THAN HAVING LOTS OF CODE COPIED IN EACH BUTTON PRESS */
    
    @IBAction func plusButtonPressed(_ sender: Any) {
   numberOfThings += 1
        updateUI()
    }
    
    @IBAction func minusButtonPressed(_ sender: Any) {
   numberOfThings -= 1
    updateUI()
    }
    
    @IBAction func plusButtonPressed2(_ sender: Any) {
        numberOfWalkCycle += 1
             updateUI()
    }
    
    @IBAction func minusButtonPressed2(_ sender: Any) {
        numberOfWalkCycle -= 1
        updateUI()
    }
    
    @IBAction func deleteThingsButton(_ sender: Any) {
        numberOfThings = 0
        updateUI()
    }
    
    @IBAction func deleteWalksButton(_ sender: Any) {
        numberOfWalkCycle = 0
        updateUI()
    }
    
}

    

