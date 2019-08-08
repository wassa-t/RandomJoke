//
//  ViewController.swift
//  RandomJoke
//
//  Created by Wassa Tunsiri on 8/8/2562 BE.
//  Copyright © 2562 Wassa. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    var joke: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        label.text = joke
        
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        joke = APIManager().getRandomJoke()
        print(joke)
    }
    
}

