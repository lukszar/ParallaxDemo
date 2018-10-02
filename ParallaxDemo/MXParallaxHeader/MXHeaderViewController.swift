//
//  MXHeaderViewController.swift
//  ParallaxDemo
//
//  Created by Lukasz Szarkowicz on 02.10.2018.
//  Copyright © 2018 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MXHeaderViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .red
        parallaxHeader?.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension MXHeaderViewController: MXParallaxHeaderDelegate {
    func parallaxHeaderDidScroll(_ parallaxHeader: MXParallaxHeader) {

        print("did scroll")
    }
}
