//
//  MXMainViewController.swift
//  ParallaxDemo
//
//  Created by Lukasz Szarkowicz on 02.10.2018.
//  Copyright © 2018 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MXMainViewController: MXScrollViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        setup()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func setup() {
        self.scrollView.parallaxHeader.height = 300.0
        self.scrollView.parallaxHeader.minimumHeight = 150.0
        self.scrollView.parallaxHeader.mode = .fill
        self.scrollView.delegate = self
    }

}

extension MXMainViewController: MXScrollViewDelegate {
    func scrollView(_ scrollView: MXScrollView, shouldScrollWithSubView subView: UIScrollView) -> Bool {

        return true
    }
}
