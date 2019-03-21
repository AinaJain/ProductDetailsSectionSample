//
//  ReviewViewController.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class ReviewViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    var reviewDetails : ReviewsTab?
    @IBOutlet weak var reviewTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        reviewTableView.rowHeight = UITableView.automaticDimension
        reviewTableView.estimatedRowHeight = 120
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return reviewDetails?.values?[section].reviews?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ReviewCell", for: indexPath) as! ReviewTableViewCell
        cell.revierNameLabel.text = reviewDetails?.values?[indexPath.section].reviews?[indexPath.row].customerName
        cell.reviewTimeLabel.text = reviewDetails?.values?[indexPath.section].reviews?[indexPath.row].timeLine
        cell.reviewLabel.text = reviewDetails?.values?[indexPath.section].reviews?[indexPath.row].description
        cell.numberOfLikesLabel.text = "\(reviewDetails?.values?[indexPath.section].reviews?[indexPath.row].likes ?? 0)"
        cell.starView.rating = Double(reviewDetails?.values?[indexPath.section].reviews?[indexPath.row].rating ?? 0)

        return cell
    }

}
