//
//  ResultViewController.swift
//  PersonalityQuiz
//
//  Created by leila leila on 21.09.2021.
//

import UIKit

class ResultViewController: UIViewController {
    
    @IBOutlet weak var animalTypeLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    var answers: [Answer]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.hidesBackButton = true
        updateResult()
    }
    
    private func updateResult() {
        
        var frequencyOfAnimal: [Animal: Int] = [:]
        let animals = answers.map { $0.animal }
        
        for animal in animals {
            if let animalTypeCount = frequencyOfAnimal[animal] {
                frequencyOfAnimal.updateValue(animalTypeCount + 1, forKey: animal)
            } else {
                frequencyOfAnimal[animal] = 1
            }
            
            /*
             
             for animal in animals {
             frequencyOfAnimal[animal] = (frequencyOfAnimal[animal] ?? 0) + 1
             }
             
             */
            
            let sortedFrequencyOfAnimals = frequencyOfAnimal.sorted { $0.value >  $1.value }
            guard let mostFrequencyAnimal = sortedFrequencyOfAnimals.first?.key else { return }
            
            updateUI(with: mostFrequencyAnimal)
        }
    }
    
    private func updateUI(with animal: Animal) {
        animalTypeLabel.text = "Вы - \(animal.rawValue)"
        descriptionLabel.text = animal.definition
    }
}

