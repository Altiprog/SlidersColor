//
//  MainViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 18.10.23.
//

import UIKit

class MainViewController: UIViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            guard let secondVC = segue.destination as? ViewController else {return}
            secondVC.delegate = self
            secondVC.receivedColor = view.backgroundColor
//            secondVC.viewColors.backgroundColor = view.backgroundColor
//        let ciColor = CIColor(color: view.backgroundColor!)
        
//        secondVC.blueSlider.value = Float(ciColor.blue)
//        secondVC.redSlider.value = Float(ciColor.red)
//        secondVC.greenSlider.value = Float(ciColor.green)
    }
    
    
}



extension MainViewController: SecondViewControllerDelegate {
    func viewColorChanged(_ color: UIColor) {
        view.backgroundColor = color
    }

    
}
