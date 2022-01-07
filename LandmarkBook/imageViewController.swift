//
//  ImageViewController.swift
//  LandmarkBook
//
//  Created by Mert Can on 6.01.2022.
//

import UIKit

class imageViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var imageLabel: UILabel!
    
    var selectedLandmarkName = ""
    var selectedLandmarkImage = UIImage()
    var selectedWebSite = ""
    

    @IBAction func btnweb(_ sender: UIButton) {
        UIApplication.shared.open(URL(string:selectedWebSite)! as URL, options: [:], completionHandler: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        imageLabel.text = selectedLandmarkName
        imageView.image = selectedLandmarkImage
    }
}
