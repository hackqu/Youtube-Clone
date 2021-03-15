//
//  ViewController.swift
//  Youtube Clone
//
//  Created by tsaqifammar on 15/03/21.
//

import UIKit

class ViewController: UIViewController {
    
    var model = Model()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        model.getVideos()
    }


}

