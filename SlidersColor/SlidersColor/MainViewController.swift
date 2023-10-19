//
//  MainViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 18.10.23.
//

import UIKit

class MainViewController: UIViewController {
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let secondVC = segue.destination as? SlidersViewController else { return }
        secondVC.delegate = self
        secondVC.receivedColor = view.backgroundColor
    }
}

extension MainViewController: SecondViewControllerDelegate {
    func viewColorChanged(_ color: UIColor) {
        view.backgroundColor = color
    }
}
