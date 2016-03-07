//
//  ViewController.swift
//  IBRepCalculator
//
//  Created by Justin Krysinski on 11/23/15.
//  Copyright © 2015 Justin Krysinski. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //VARIABLES

    var dayMultiply: Double = 0.0
    var shadeMultiply: Double = 0.0
    var emblemMultiply: Double = 0.0
    var classMultiply: Double = 0.0
    var altMultiply: Double = 0.0

    var dailyBounty: Double = 125.0
    var weeklyBounty: Double = 525.0

    var dailyText: Double = 0.0
    var daily2Text: Double = 0.0
    var daily3Text: Double = 0.0

    var weeklyText: Double = 0.0
    var weekly2Text: Double = 0.0
    var weekly3Text: Double = 0.0

    //OUTLETS

    @IBOutlet weak var dayOfWeek: UISegmentedControl!
    @IBOutlet weak var shadeSwitch: UISwitch!
    @IBOutlet weak var emblemSwitch: UISwitch!
    @IBOutlet weak var classSwitch: UISwitch!
    @IBOutlet weak var altPick: UISegmentedControl!
    @IBOutlet weak var weeklyTextField: UITextField!
    @IBOutlet weak var weekly2TextField: UITextField!
    @IBOutlet weak var weekly3TextField: UITextField!
    @IBOutlet weak var dailyTextField: UITextField!
    @IBOutlet weak var daily2TextField: UITextField!
    @IBOutlet weak var daily3TextField: UITextField!


    //This function gets called when the user presses the calculate button and checks each switch's state

    func checkVariables() {

        //Day picker segmented control

        switch dayOfWeek {

        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 0:
            dayMultiply = 2.0
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 1:
            dayMultiply = 2.5
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 2:
            dayMultiply = 1.0
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 3:
            dayMultiply = 1.15
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 4:
            dayMultiply = 1.25
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 5:
            dayMultiply = 1.4
        case dayOfWeek where dayOfWeek.selectedSegmentIndex == 6:
            dayMultiply = 1.6
        default:
            dayMultiply = 1.0
        }

        //Shader, emblem, and class item switches

        if shadeSwitch.on == true {
            shadeMultiply = 1.1
        }
        else {
            shadeMultiply = 1.0
        }
        if emblemSwitch.on == true {
            emblemMultiply = 1.1
        }
        else {
            emblemMultiply = 1.0
        }
        if classSwitch.on == true {
            classMultiply = 1.1
        }
        else {
            classMultiply = 1.0
        }

        //Alt character segmented control

        if altPick.selectedSegmentIndex == 1 {
            altMultiply = 2.0
        }
        else {
            altMultiply = 1.0
        }
    }


    //The actual calculation of the rep

    func dailyBountyRep() ->Double {
        var calc = 0.0
        calc = shadeMultiply * emblemMultiply * classMultiply * altMultiply * dayMultiply * dailyBounty
        return calc
    }

    func weeklyBountyRep() ->Double {
        var calc2 = 0.0
        calc2 = shadeMultiply * emblemMultiply * classMultiply * altMultiply * dayMultiply * weeklyBounty
        return calc2
    }



    //MARK ACTIONS

    //Button to calculate rep
    
    @IBAction func calculateButton(sender: UIButton) {

        checkVariables()

        dailyText = dailyBountyRep()
        dailyTextField.text = String(format: "%.0f", dailyText)

        daily2Text = dailyBountyRep() * 2
        daily2TextField.text = String( format: "%.0f", daily2Text)

        daily3Text = dailyBountyRep() * 3
        daily3TextField.text = String(format: "%.0f", daily3Text)

        weeklyText = weeklyBountyRep()
        weeklyTextField.text = String(format: "%.0f", weeklyText)

        weekly2Text = weeklyBountyRep() * 2
        weekly2TextField.text = String(format: "%.0f", weekly2Text)

        weekly3Text = weeklyBountyRep() * 3
        weekly3TextField.text = String(format: "%.0f", weekly3Text)

    }


}

