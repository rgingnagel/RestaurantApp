//
//  MenuItemDetailViewController.swift
//  RestaurantApp
//
//  Created by Rens Gingnagel on 30/11/2017.
//  Copyright © 2017 Rens Gingnagel. All rights reserved.
//

import UIKit

class MenuItemDetailViewController: UIViewController {

    var delegate: AddToOrderDelegate?
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var addToOrderButton: UIButton!
    
    var menuItem: MenuItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        setupDelegate()

        // Do any additional setup after loading the view.
    }
    
    func setupDelegate() {
        if let navController =
            tabBarController?.viewControllers?.last as?
            UINavigationController,
            let orderTableViewController =
            navController.viewControllers.first as?
            OrderTableViewController {
            delegate = orderTableViewController
        }
    }
    
    func updateUI() {
        titleLabel.text = menuItem.name
        priceLabel.text = String(format: "$%.2f", menuItem.price)
        descriptionLabel.text = menuItem.description
        addToOrderButton.layer.cornerRadius = 5.0
        MenuController.shared.fetchImage(url: menuItem.imageURL)
        { (image) in
            guard let image = image else { return }
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
    

    
    @IBAction func addToOrderButtonTapped(_ sender: UIButton){
        UIView.animate(withDuration: 0.3) {
            self.addToOrderButton.transform =
                CGAffineTransform(scaleX: 3.0, y: 3.0)
            self.addToOrderButton.transform =
                CGAffineTransform(scaleX: 1.0, y: 1.0)
        }
        delegate?.added(menuItem: menuItem)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
