//
//  MainViewController.swift
//  Add one
//
//  Created by Yamin Hameed on 01/05/17.
//  Copyright © 2017 Yaseen Majeed. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var numbersLabel:UILabel?
    @IBOutlet weak var scoreLabel:UILabel?
    @IBOutlet weak var inputField:UITextField?
    var score:Int = 0
    
    
    override func viewDidLoad()
    {
        
        super.viewDidLoad()
        setRandomnumberLabel()
        updateScoreLabel()
        inputField?.addTarget(self, action: #selector(textFieldDidChanged(textField:)), for:UIControlEvents.editingChanged)

    }
    
    
    func updateScoreLabel()
    {
        
        scoreLabel?.text = "\(score)"
        
    }
    
    
    
    
    func setRandomnumberLabel()
    {
     numbersLabel?.text = generateRandomString()
    }
    
    func textFieldDidChanged(textField:UITextField)
    {
        if inputField?.text?.characters.count ?? 0 < 4  // double question mark means a nil coalesing 
        {
            return
        }
        
        if let numbers_text = numbersLabel?.text,
            let input_text  = inputField?.text,
            let numbers = Int(numbers_text),
            let input = Int(input_text)
        {
            print("Comparing: \(input_text) minus \(numbers_text) == \(input - numbers)")
            
            if (input - numbers == 1111)
            {
                print("Correct")
                score += 1
                inputField?.text = ""
            }
            else
            {
                print("Incorrect")
                score -= 1
                inputField?.text = ""
            }
        }
        
        setRandomnumberLabel()
        updateScoreLabel()
    
    }

    
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
   // my function to generate a random number string
    
    
    func generateRandomString() -> String {
        var result: String = ""
        for _ in 1...4{
            var digit:Int = Int(arc4random_uniform(8) + 1)
            result += "\(digit)"
        }
        return result
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
