//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Mert Can on 6.01.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var landmarkNames = [String]()
    var landmarkWeb = [String]()
    var landmarkImages = [UIImage]()
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()
    var chosenWebsite = ""
    let reuseIdentifier = "textCell"
    
 

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        landmarkNames.append("Colloseum")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Golden Gate Bridge")
        landmarkNames.append("Great Pyramid of Giza")
        landmarkNames.append("Petronas Towers")
        landmarkNames.append("London Eye")
        landmarkNames.append("Louvre Museum")
        landmarkNames.append("Great Sphinx of Giza")
        landmarkNames.append("Sydney Opera House")
        landmarkNames.append("Taj Mahal")
        landmarkNames.append("Trevi Fountain")
        
        landmarkImages.append(UIImage(named: "colosseum")!)
        landmarkImages.append(UIImage(named: "eiffeltower")!)
        landmarkImages.append(UIImage(named: "goldengatebridge")!)
        landmarkImages.append(UIImage(named: "greatpyramid")!)
        landmarkImages.append(UIImage(named: "klcctower")!)
        landmarkImages.append(UIImage(named: "londoneye")!)
        landmarkImages.append(UIImage(named: "louvre")!)
        landmarkImages.append(UIImage(named: "sphynx")!)
        landmarkImages.append(UIImage(named: "sydneyoperahouse")!)
        landmarkImages.append(UIImage(named: "tajmahal")!)
        landmarkImages.append(UIImage(named: "trevifountain")!)
        
        landmarkWeb.append("https://en.wikipedia.org/wiki/Colosseum")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Eiffel_Tower")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Golden_Gate_Bridge")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Great_Pyramid_of_Giza")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Petronas_Towers")
        landmarkWeb.append("https://en.wikipedia.org/wiki/London_Eye")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Louvre")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Great_Sphinx_of_Giza")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Sydney_Opera_House")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Taj_Mahal")
        landmarkWeb.append("https://en.wikipedia.org/wiki/Trevi_Fountain")
        
        
        
        navigationItem.title = "Landmark Book"
        
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.landmarkNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath as IndexPath) as! MyCollectionViewCell
        cell.mylabel.text = self.landmarkNames[indexPath.row] 
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toLandmarkBook"{
            let destinationVC = segue.destination as! imageViewController
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
            destinationVC.selectedWebSite = chosenWebsite
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        chosenWebsite = landmarkWeb[indexPath.row]
        
        self.performSegue(withIdentifier: "toLandmarkBook", sender: self)
    }
    
}
