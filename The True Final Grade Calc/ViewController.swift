//
//  ViewController.swift
//  Grade Calculator
//
//  Created by  on 10/16/20.
//  Copyright © 2020 man. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentGradeText: UITextField!
    @IBOutlet weak var finalExamWeightText: UITextField!
    @IBOutlet weak var desiredFinalGrade: UITextField!
    @IBOutlet weak var resultsLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    
    @IBAction func calculateButtonTapped(_ sender: UIButton) {
        
        if currentGradeText.text == "" {
            currentGradeText.text = "0"
        }
        if finalExamWeightText.text == "" {
            finalExamWeightText.text = "0"
        }
        if desiredFinalGrade.text == "" {
            desiredFinalGrade.text = "0"
        }

        let currentGrade = Double(currentGradeText.text!)!
        let desiredGrade = Double(desiredFinalGrade.text!)!
        let finalExamWeight = Double(finalExamWeightText.text!)!
        let neededFinalExamGrade = (100 * desiredGrade - (100 - finalExamWeight) * currentGrade) / finalExamWeight
        print(neededFinalExamGrade)
        resultsLabel.text = "You need to get a \(neededFinalExamGrade)% on the final to get your desired final grade."
        
        if neededFinalExamGrade > 100 {
            view.backgroundColor = UIColor.red
        resultsLabel.text = "You need to get a \(neededFinalExamGrade)% on the final, so if possible, you will have to ask your teacher for extra credit to achieve your desired grade."
        }
        else if neededFinalExamGrade < 100 {
            view.backgroundColor = UIColor.green
        }
        else {
            resultsLabel.text = "You have entered an invalid number."
        }
    }
    
    @IBAction func onSegmentedTapped(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            desiredFinalGrade.text = "90.0"
        case 1:
            desiredFinalGrade.text = "80.0"
        case 2:
            desiredFinalGrade.text = "70.0"
        case 3:
            desiredFinalGrade.text = "60.0"
        default:
            print("How did you get here?")
        }
        
    }
    

}

