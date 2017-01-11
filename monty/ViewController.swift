//
//  ViewController.swift
//  monty
//
//  Created by Pierre-Marie Galite on 06/12/16.
//  Copyright © 2016 Pierre-Marie Galite. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testButton: UIButton!
    @IBOutlet weak var testLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func didClickOnButton(_ sender: Any) {
        self.performSegue(withIdentifier: "viewSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "buttonSegue":
            print("toto")
        case "viewSegue":
            print("tata")
            if let viewController = segue.destination as? testViewController {
                viewController.toto = true
            }
        default:
            break
        }

    }


}

