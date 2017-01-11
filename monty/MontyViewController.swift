//
//  MontyViewController.swift
//  monty
//
//  Created by Pierre-Marie Galite on 08/12/16.
//  Copyright © 2016 Pierre-Marie Galite. All rights reserved.
//

import UIKit

class MontyViewController: UIViewController {
    
    @IBOutlet weak var btnLeft: UIButton!
    @IBOutlet weak var btnCenter: UIButton!
    @IBOutlet weak var btnRight: UIButton!
    @IBOutlet weak var labelAsk: UILabel!
    @IBOutlet weak var btnYes: UIButton!
    @IBOutlet weak var btnNo: UIButton!
    
    let doorLeft = 0
    let doorCenter = 1
    let doorRight = 2
    
    let prizesList = ["car", "goat A", "goat B"]
    var shuffledList:[String] = []
    var shuffleListSelected:[String] = []
    var doors = [Int:String]()
    var selected:Int = -1
    var canSelect = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDoors()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    func loadDoors() {
        canSelect = true
        btnLeft.setBackgroundImage(#imageLiteral(resourceName: "door"), for: .normal)
        btnCenter.setBackgroundImage(#imageLiteral(resourceName: "door"), for: .normal)
        btnRight.setBackgroundImage(#imageLiteral(resourceName: "door"), for: .normal)
        selected = -1
        btnYes.isHidden = true
        btnNo.isHidden = true
        labelAsk.text = ""
        shuffledList = prizesList.shuffled()
        shuffleListSelected = shuffledList
        for i in 0..<shuffledList.count{
            let key = i
            doors.updateValue(shuffledList[key], forKey: key)
        }
        print(shuffledList)
        print(shuffleListSelected)
    }
    
    func askToSwipe(){
        labelAsk.text = "Do you want to switch doors?"
        btnYes.isHidden = false
        btnNo.isHidden = false
    }
    
    /* 
     Show remaining goat
     */
    func showGoat(){
        print("Before showGoat "+shuffledList.description)
        print("Before showGoat "+shuffleListSelected.description)
        // check how many are left, select random index for it
        for i in 0..<shuffledList.count{
            let prize = shuffledList[i]
            if(prize.contains("goat")
                && i != selected){
                revealDoor(no: i)
                break
            }
        }
        askToSwipe()
        print("After showGoat "+shuffledList.description)
        print("After showGoat "+shuffleListSelected.description)
    }
  
    func revealDoor(no door: Int){
        switch door {
        case doorLeft:
            let isLeftCar = shuffledList[doorLeft].contains("car")
            btnLeft.setBackgroundImage(isLeftCar ? #imageLiteral(resourceName: "car.png") : #imageLiteral(resourceName: "goat.png"), for: .normal)
        case doorCenter:
            let isCenterCar = shuffledList[doorCenter].contains("car")
            btnCenter.setBackgroundImage(isCenterCar ? #imageLiteral(resourceName: "car.png") : #imageLiteral(resourceName: "goat.png"), for: .normal)
        case doorRight:
            let isRightCar = shuffledList[doorRight].contains("car")
            btnRight.setBackgroundImage(isRightCar ? #imageLiteral(resourceName: "car.png") : #imageLiteral(resourceName: "goat.png"), for: .normal)
        default:
            print("wrong choice")
        }
    }
    
    @IBAction func clickedOnLeft(_ sender: Any) {
        if(canSelect){
            selected = doorLeft
            shuffleListSelected.remove(at: selected)
            showGoat()
            canSelect = false
        }
    }
    
    @IBAction func clickedOnCenter(_ sender: Any) {
        if(canSelect){
            selected = doorCenter
            shuffleListSelected.remove(at: selected)
            showGoat()
            canSelect = false
        }
    }
    
    @IBAction func clickedOnRight(_ sender: Any) {
        if(canSelect){
            selected = doorRight
            shuffleListSelected.remove(at: selected)
            showGoat()
            canSelect = false
        }
    
    }
    
    @IBAction func onYesClicked(_ sender: Any) {
        // show my result
        revealDoor(no: doorLeft)
        revealDoor(no: doorRight)
        revealDoor(no: doorCenter)
        let isSelectedCar = shuffledList[doorLeft].contains("car")
        if(isSelectedCar){
            labelAsk.text = "You Win!"
        }else{
            labelAsk.text = "You Lose!"
        }
    }
    
    @IBAction func onNoClicked(_ sender: Any) {
        // show my result
        revealDoor(no: doorLeft)
        revealDoor(no: doorRight)
        revealDoor(no: doorCenter)
        let isSelectedCar = shuffledList[doorLeft].contains("car")
        if(isSelectedCar){
            labelAsk.text = "You Win!"
        }else{
            labelAsk.text = "You Lose!"
        }
    }
    
    
    @IBAction func onResetClicked(_ sender: Any) {
        loadDoors()
    }
    
}
