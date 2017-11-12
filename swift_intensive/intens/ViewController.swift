//
//  ViewController.swift
//  intens
//
//  Created by Ильдар on 11.11.17.
//  Copyright © 2017 Ильдар. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var new: Int = -1
    var numberSet: Set<Int> = []
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        while numberSet.count < 25 {
            numberSet.insert(Int(arc4random_uniform(25)))
        }
        print(numberSet)
        for value in buttons {
            value.setTitle(String(describing: numberSet.first!), for: UIControlState.normal)
            numberSet.removeFirst()
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func pressButton(_ sender: UIButton) {
        
        let pressedButtonTextNumber: Int = Int((sender.titleLabel?.text)!)!
        if  pressedButtonTextNumber == new + 1  {
            sender.setTitle("", for: UIControlState.normal)
            new = new + 1
            print(new)
        }
        
        if new == 24 {
            let alert = UIAlertController(title: "Ура", message: "Вы победили", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        /* Вариант сделанный на интенсиве
        var pressedButton: UIButton = sender
        for value in buttons {
            if value.tag == sender.tag {
                pressedButton = value
                break
            }
        }
        
        let pressedButtonTextNumber: Int = Int((pressedButton.titleLabel?.text)!)!
        if  pressedButtonTextNumber == new + 1  {
            pressedButton.setTitle("", for: UIControlState.normal)
            new = new + 1
            print(new)
        }
        
        if new == 24 {
            let alert = UIAlertController(title: "Ура", message: "Вы победили", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "ok", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
 */
    }
}

