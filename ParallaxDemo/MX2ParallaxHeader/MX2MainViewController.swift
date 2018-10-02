//
//  MX2MainViewController.swift
//  ParallaxDemo
//
//  Created by Lukasz Szarkowicz on 02.10.2018.
//  Copyright © 2018 Łukasz Szarkowicz. All rights reserved.
//

import UIKit
import MXParallaxHeader

class MX2MainViewController: MXScrollViewController {

    let cellIdentifier = "MyCell"

    var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .blue
        setup()
        tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self

        scrollView.addSubview(tableView)

        if #available(iOS 11.0, *) {
            scrollView.contentInsetAdjustmentBehavior = .always
            tableView.contentInsetAdjustmentBehavior = .always
        } else {
            automaticallyAdjustsScrollViewInsets = true
        }
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

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()

        var frame = view.frame
        frame.size.height -= scrollView.parallaxHeader.minimumHeight

        tableView.frame = frame
    }

}


extension MX2MainViewController: MXScrollViewDelegate {
    func scrollView(_ scrollView: MXScrollView, shouldScrollWithSubView subView: UIScrollView) -> Bool {

        return true
    }
}

extension MX2MainViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header of section"
    }

    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }


    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 50
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40.0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) else {
            return UITableViewCell()
        }

        cell.textLabel?.text = "\(indexPath.row). row in section \(indexPath.section)"
        cell.backgroundColor = UIColor.lightText

        return cell
    }
}

