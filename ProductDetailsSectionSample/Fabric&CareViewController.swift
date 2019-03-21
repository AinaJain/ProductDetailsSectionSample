//
//  Fabric&CareViewController.swift
//  ZivameAssign
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class Fabric_CareViewController: UIViewController, UITableViewDataSource {

    var fabricDetails : FabricAndCareTab?
    @IBOutlet weak var fabricTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        fabricTableView.rowHeight = UITableView.automaticDimension
        // Do any additional setup after loading the view.
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return fabricDetails?.values?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let list = fabricDetails?.values?[section].list?.count
        return list ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FabricCell", for: indexPath) as! FabricTableViewCell
        let list = fabricDetails?.values?[indexPath.section].list
        cell.fabricLabel.text = list?[indexPath.row]
        return cell
    }

}
