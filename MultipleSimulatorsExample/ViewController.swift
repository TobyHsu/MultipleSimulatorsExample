//
//  ViewController.swift
//  MultipleSimulatorsExample
//
//  Created by tobyhsu on 2018/9/7.
//  Copyright © 2018 TobyHsu. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController {
    let locationManager = CLLocationManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager.requestAlwaysAuthorization()

        // Do any additional setup after loading the view, typically from a nib.
    }

}

