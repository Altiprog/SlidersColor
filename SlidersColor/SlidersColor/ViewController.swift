//
//  ViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 29.09.23.
//

import UIKit
// MARK: -


protocol SecondViewControllerDelegate: AnyObject {
    
    func viewColorChanged(_ color: UIColor)
    
}



final class ViewController: UIViewController {
    
    @IBOutlet weak var viewColors: UIView!
    
    @IBOutlet weak var valueRedLable: UILabel!
    @IBOutlet weak var valueGreenLable: UILabel!
    @IBOutlet weak var valueBlueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    
    var receivedColor: UIColor?
    
    var delegate: SecondViewControllerDelegate?
    
    // MARK: -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColors.layer.cornerRadius = 20
        
        setupSliderValue()
        
        setupValueLable()
        
        
            getColor()
        
        
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
    }
    // MARK: -
    @IBAction func actGreenSlider() {
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
    }
    // MARK: -
    @IBAction func actBlueSlider() {
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
    }
    // MARK: -
    private func setupValueLable() {
        valueRedLable.text = String(format: "%.2f", redSlider.value)
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
    }
    // MARK: -
    private func setupSliderValue() {
        redSlider.value = 0.1
        greenSlider.value = 0.3
        blueSlider.value = 0.5
    }
    
    
    @IBAction func buttonPressed() {
        delegate?.viewColorChanged(UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1))
        dismiss(animated: true)
        
    }
    
    private func getColor() {
        
            let ciColor = CIColor(color: receivedColor!)
            
            blueSlider.value = Float(ciColor.blue)
            redSlider.value = Float(ciColor.red)
            greenSlider.value = Float(ciColor.green)
            
        
        
    }
    
    
}




