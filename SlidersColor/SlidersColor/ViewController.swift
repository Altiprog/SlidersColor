//
//  ViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 29.09.23.
//

import UIKit
// MARK: -
final class ViewController: UIViewController {
    
    @IBOutlet weak var viewColors: UIView!
    
    @IBOutlet weak var valueRedLable: UILabel!
    @IBOutlet weak var valueGreenLable: UILabel!
    @IBOutlet weak var valueBlueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColors.layer.cornerRadius = 20
        
        setupSliderValue()
        
        setupValueLable()
        
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green:CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    // MARK: -
    override func viewWillLayoutSubviews() {
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    // MARK: -
    @IBAction func actRedSlider() {
        valueRedLable.text = String(format: "%.2f", redSlider.value)
        redSlider.value = redSlider.value
    }
    // MARK: -
    @IBAction func actGreenSlider() {
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        greenSlider.value = greenSlider.value
    }
    // MARK: -
    @IBAction func actBlueSlider() {
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
        blueSlider.value = blueSlider.value
    }
    // MARK: -
    private func setupValueLable() {
        valueRedLable.text =  String(redSlider.value)
        valueGreenLable.text = String(greenSlider.value)
        valueBlueLable.text = String(blueSlider.value)
    }
    // MARK: -
    private func setupSliderValue() {
        redSlider.value = 0.11
        greenSlider.value = 0.33
        blueSlider.value = 0.55
    }
}

