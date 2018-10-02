//
//  MXContentViewController.swift
//  ParallaxDemo
//
//  Created by Lukasz Szarkowicz on 02.10.2018.
//  Copyright © 2018 Łukasz Szarkowicz. All rights reserved.
//

import UIKit

class MXContentViewController: UIViewController {

    let cellIdentifier = "MyCell"

    @IBOutlet weak var tableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellIdentifier)
        tableView.delegate = self
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }



}

extension MXContentViewController: UITableViewDelegate, UITableViewDataSource {

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
