//
//  BasicDetailsViewController.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class BasicDetailsViewController: UIViewController,UITableViewDataSource {
    
    @IBOutlet weak var basicTableView: UITableView!
    var basicDetails : BasicDetailsTab?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        basicTableView.rowHeight = UITableView.automaticDimension
        basicTableView.estimatedRowHeight = 120
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return basicDetails?.values?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = basicTableView.dequeueReusableCell(withIdentifier: "BasicCell", for: indexPath) as! BasicTableViewCell
        cell.valueText.text = basicDetails?.values?[indexPath.row].text
        return cell
    }
    
    
    

}
