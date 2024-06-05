//
//  ViewController.swift
//  LandmarkBook
//
//  Created by Batuhan Ham on 2.06.2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet weak var tableView: UITableView!
    
    var landmarkNames = [String]()
    var landmarkImages = [UIImage]()
    
    var chosenLandmarkName = ""
    var chosenLandmarkImage = UIImage()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        
        
        landmarkNames.append("Colosseum")
        landmarkNames.append("Great Wall")
        landmarkNames.append("Kremlin")
        landmarkNames.append("Stonehenge")
        landmarkNames.append("Taj Mahal")
        landmarkNames.append("Anıtkabir")
        landmarkNames.append("Brandenburger Tor")
        landmarkNames.append("Burj Khalifa")
        landmarkNames.append("Eiffel Tower")
        landmarkNames.append("Niagara Falls")
        landmarkNames.append("Cristo Redentor")
        landmarkNames.append("Pyramids")
        landmarkNames.append("Statue of Liberty")
        landmarkNames.append("Sydney Opera House")
        landmarkNames.append("Ali and Nino")
        landmarkNames.append("Big Ben")
        landmarkNames.append("Machu Picchu")
        landmarkNames.append("Stari Most")
        
        
        landmarkImages.append(UIImage(named: "colosseum.jpeg")!)
        landmarkImages.append(UIImage(named: "greatwall.jpeg")!)
        landmarkImages.append(UIImage(named: "kremlin.jpeg")!)
        landmarkImages.append(UIImage(named: "stonehenge.jpeg")!)
        landmarkImages.append(UIImage(named: "tajmahal.jpeg")!)
        landmarkImages.append(UIImage(named: "anıtkabir.jpeg")!)
        landmarkImages.append(UIImage(named: "brandenburg.jpeg")!)
        landmarkImages.append(UIImage(named: "burjkhalifa.jpeg")!)
        landmarkImages.append(UIImage(named: "eiffel.jpeg")!)
        landmarkImages.append(UIImage(named: "niagara.jpeg")!)
        landmarkImages.append(UIImage(named: "isa.jpeg")!)
        landmarkImages.append(UIImage(named: "pyramids.jpeg")!)
        landmarkImages.append(UIImage(named: "statueofliberty.jpeg")!)
        landmarkImages.append(UIImage(named: "sydneyopera.jpeg")!)
        landmarkImages.append(UIImage(named: "aliandnino.jpeg")!)
        landmarkImages.append(UIImage(named: "bigben.jpeg")!)
        landmarkImages.append(UIImage(named: "machupicchu.jpeg")!)
        landmarkImages.append(UIImage(named: "mostarkoprusu.jpeg")!)
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return landmarkNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        //cel.textLabel?.text = "test"
        var content = cell.defaultContentConfiguration() // içerik ayarlayıcısı
        content.text = landmarkNames[indexPath.row]
        cell.contentConfiguration = content
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        chosenLandmarkName = landmarkNames[indexPath.row]
        chosenLandmarkImage = landmarkImages[indexPath.row]
        
        performSegue(withIdentifier: "toDetailsVC", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetailsVC" {
            let destinationVC = segue.destination as! DetailsVC
            destinationVC.selectedLandmarkName = chosenLandmarkName
            destinationVC.selectedLandmarkImage = chosenLandmarkImage
        }
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            self.landmarkNames.remove(at: indexPath.row)
            self.landmarkImages.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    

}

