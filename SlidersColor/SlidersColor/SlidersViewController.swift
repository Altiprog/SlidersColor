//
//  ViewController.swift
//  SlidersColor
//
//  Created by Александр Тиунович on 29.09.23.
//

import UIKit
// MARK: - SecondViewControllerDelegate
protocol SecondViewControllerDelegate: AnyObject {
    func viewColorChanged(_ color: UIColor)
}
// MARK: - SlidersViewController
final class SlidersViewController: UIViewController {
    
    @IBOutlet weak var viewColors: UIView!
    
    @IBOutlet weak var valueRedLable: UILabel!
    @IBOutlet weak var valueGreenLable: UILabel!
    @IBOutlet weak var valueBlueLable: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redText: UITextField!
    @IBOutlet weak var greenText: UITextField!
    @IBOutlet weak var blueText: UITextField!
    
    var receivedColor: UIColor?
    
    weak var delegate: SecondViewControllerDelegate!
    
    // MARK: -
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewColors.layer.cornerRadius = 20
        
        setupValueLable()
        getColors()
        
        redText.delegate = self
        greenText.delegate = self
        blueText.delegate = self
    }
    // MARK: -
    @IBAction func actRedSlider() {
        valueRedLable.text = String(format: "%.2f", redSlider.value)
        redText.text = String(format: "%.2f", redSlider.value)
    }
    
    @IBAction func actGreenSlider() {
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        greenText.text = String(format: "%.2f", greenSlider.value)
    }
    
    @IBAction func actBlueSlider() {
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
        blueText.text = String(format: "%.2f", blueSlider.value)
    }
    
    @IBAction func buttonPressed() {
        
        delegate?.viewColorChanged(UIColor(red: CGFloat(redSlider.value),
                                           green: CGFloat(greenSlider.value),
                                           blue: CGFloat(blueSlider.value),
                                           alpha: 1))
        
        dismiss(animated: true)
    }
    // MARK: -
    override func viewWillLayoutSubviews() {
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    private func setupValueLable() {
        valueRedLable.text = String(format: "%.2f", redSlider.value)
        valueGreenLable.text = String(format: "%.2f", greenSlider.value)
        valueBlueLable.text = String(format: "%.2f", blueSlider.value)
    }
    
    private func updateUI(for slider: UISlider, label: UILabel, textField: UITextField, with value: Float) {
        slider.value = value
        label.text = String(format: "%.2f", value)
        textField.text = String(format: "%.2f", value)
    }
    
    private func getColors() {
        let ciColor = CIColor(color: receivedColor!)
        updateUI(for: redSlider, label: valueRedLable, textField: redText, with: Float(ciColor.red))
        updateUI(for: greenSlider, label: valueGreenLable, textField: greenText, with: Float(ciColor.green))
        updateUI(for: blueSlider, label: valueBlueLable, textField: blueText, with: Float(ciColor.blue))
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        redText.endEditing(true)
        greenText.endEditing(true)
        blueText.endEditing(true)
    }
}
// MARK: -
extension SlidersViewController: UITextFieldDelegate {
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        guard let text = textField.text, let value = Float(text) else {
            showAlert()
            return
        }
        if value < 0 || value > 1 {
            showAlert()
            return
        }
        if textField == redText {
            redSlider.value = value
            valueRedLable.text = String(format: "%.2f", value)
        } else if textField == greenText {
            greenSlider.value = value
            valueGreenLable.text = String(format: "%.2f", value)
        } else if textField == blueText {
            blueSlider.value = value
            valueBlueLable.text = String(format: "%.2f", value)
        }
        viewColors.backgroundColor = UIColor(red: CGFloat(redSlider.value),
                                             green: CGFloat(greenSlider.value),
                                             blue: CGFloat(blueSlider.value),
                                             alpha: 1)
    }
    
    private func showAlert() {
        let alert = UIAlertController(title: "🚨Attention🚨", message: "Specify a value between 0 and 1", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        self.present(alert, animated: true)
    }
}
// MARK: -


