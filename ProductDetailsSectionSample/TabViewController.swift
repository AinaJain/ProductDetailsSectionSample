//
//  TabViewController.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import UIKit

class TabViewController: UIViewController {

    @IBOutlet weak var contentView : UIView!
    @IBOutlet var buttons : [UIButton]!
    @IBOutlet var separators : [UIView]!
    
    var basicDetailsViewController: BasicDetailsViewController!
    var fabric_CareViewController: Fabric_CareViewController!
    var reviewViewController: ReviewViewController!
    
    var viewControllers: [UIViewController]!
    var selectedIndex: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData { (dataModel) in
            initializeViewControllers(withDataModel : dataModel)
            didTapTabButton(buttons[selectedIndex])
        }
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func getData(onCompletion handler : ((DataModel?)->())) {
        if let path = Bundle.main.path(forResource: "Tests", ofType: "json") {
            do {
                let data = try Data(contentsOf: URL(fileURLWithPath: path), options: .mappedIfSafe)
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(DataModel.self, from: data)
                handler(responseModel)
            } catch {
                // handle error
                handler(nil)
                print("Data can't be parsed")
            }
        }
    }
    

    func initializeViewControllers(withDataModel data: DataModel?) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        //initialize BasicDetailsViewController
        basicDetailsViewController = storyboard.instantiateViewController(withIdentifier: "BasicDetailsViewController") as? BasicDetailsViewController
        basicDetailsViewController.basicDetails = data?.details?.basicDetailsTab
        
        //initialize Fabric_CareViewController
        fabric_CareViewController = storyboard.instantiateViewController(withIdentifier: "Fabric_CareViewController") as? Fabric_CareViewController
        fabric_CareViewController.fabricDetails = data?.details?.fabricAndCareTab
        //initialize ReviewViewController
        reviewViewController = (storyboard.instantiateViewController(withIdentifier: "ReviewViewController") as! ReviewViewController)
        reviewViewController.reviewDetails = data?.details?.reviewsTab

        viewControllers = [basicDetailsViewController, fabric_CareViewController, reviewViewController]
        
    }
    
    @IBAction func didTapTabButton(_ sender: Any) {
        let previousIndex = selectedIndex
        selectedIndex = (sender as? UIButton)?.tag ?? 0
        
        if previousIndex != selectedIndex {
            
            buttons[previousIndex].isSelected = false
            let previousVC = viewControllers[previousIndex]
            previousVC.willMove(toParent: nil)
            previousVC.view.removeFromSuperview()
            previousVC.removeFromParent()
        }
        
        (sender as? UIButton)?.isSelected = true
        manageSelection(forTag : ((sender as? UIButton)?.tag)!)
        let vc = viewControllers[selectedIndex]
        addChild(vc)
        vc.view.frame = contentView.bounds
        contentView.addSubview(vc.view)
        vc.didMove(toParent: self)
    }
    
    func manageSelection(forTag tag : Int) {
        self.view.viewWithTag(11)?.isHidden = true
        self.view.viewWithTag(22)?.isHidden = true
        self.view.viewWithTag(33)?.isHidden = true

        switch tag {
        case 0:
            self.view.viewWithTag(11)?.isHidden = false
        case 1:
            self.view.viewWithTag(22)?.isHidden = false
        case 2:
            self.view.viewWithTag(33)?.isHidden = false
        default:
            break
        }
    }
}
