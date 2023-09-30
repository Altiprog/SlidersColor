//
//  ViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 29.09.23.
//

import UIKit

class ViewController: UIViewController {


    @IBOutlet weak var viewColors: UIView!
    
    @IBOutlet weak var valueRedLable: UILabel!
    @IBOutlet weak var valueGreenLable: UILabel!
    @IBOutlet weak var valueBlueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    var redColor = 0.1
    var greenColor = 0.3
    var blueColor = 0.5

    override func viewDidLoad() {
        super.viewDidLoad()
       
        viewColors.layer.cornerRadius = 20
        
        redSlider.value = Float(redColor)
        greenSlider.value = Float(greenColor)
        blueSlider.value = Float(blueColor)
        
        valueRedLable.text =  String(redColor)
        valueGreenLable.text = String(greenColor)
        valueBlueLable.text = String(blueColor)

        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value), green:  CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
    }
    
    override func viewWillLayoutSubviews() {
  
        viewColors.backgroundColor = UIColor(red: redColor, green:  greenColor, blue: blueColor, alpha: 1)
    }
    
    @IBAction func actRedSlider() {
       valueRedLable.text = String(format: "%.2f", redSlider.value)
        redColor = CGFloat(redSlider.value)
    }

    @IBAction func actGreenSlider() {
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        greenColor = CGFloat(greenSlider.value)
    }
    
    @IBAction func actBlueSlider() {
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
        blueColor = CGFloat(blueSlider.value)
    }
    
}

