

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var measurementLbl: UILabel!
    //@IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var onFeetLbl: UILabel!
    @IBOutlet weak var setAUnitLbl: UILabel!
    
    @IBOutlet weak var leftLabel: UILabel!
    
    @IBOutlet weak var leftLenTxtField: UITextField!
    @IBOutlet weak var leftToeHtTxtField: UITextField!
    @IBOutlet weak var leftWidthTxtField: UITextField!
    
    
    @IBOutlet weak var lftLenTxtFLbl: UILabel!
    @IBOutlet weak var lftWidthTxtFLbl: UILabel!
    @IBOutlet weak var lftToeHtTxtFLbl: UILabel!
    
    @IBOutlet weak var rightLabel: UILabel!
    
    @IBOutlet weak var rightLenTxtField: UITextField!
    @IBOutlet weak var rightWidthTxtField: UITextField!
    @IBOutlet weak var rightToeHtTxtField: UITextField!
    
    @IBOutlet weak var rightLenTxtFLbl: UILabel!
    @IBOutlet weak var rightWidthTxtFLbl: UILabel!
    @IBOutlet weak var rightToeHtTxtFLbl: UILabel!
    
    @IBOutlet weak var leftTxtFTitlesStack: UIStackView!
    @IBOutlet weak var rightTxtFTitlesStack: UIStackView!
    
    @IBOutlet weak var leftTxtFCMLbl: UIStackView!
    @IBOutlet weak var rightTxtFCMLbl: UIStackView!
    //MARK :- Unit Labels
    
    @IBOutlet weak var leftCM1Lbl: UILabel!
    @IBOutlet weak var leftCM2Lbl: UILabel!
    @IBOutlet weak var leftCM3Lbl: UILabel!
    
    @IBOutlet weak var rtCM1Lbl: UILabel!
    @IBOutlet weak var rtCM2Lbl: UILabel!
    @IBOutlet weak var rtCM3Lbl: UILabel!
    
    @IBOutlet weak var MMradioButtn: UIButton!
    @IBOutlet weak var CMradioButtn: UIButton!
    
    
    let backgroundColor : UIColor = UIColor(red: 42/255.0, green: 45/255.0, blue: 51/255.0, alpha: 2.5)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setColour()
        setCornerRadius(radius: 10)
        setBorderColour()
    }

    
    @IBAction func MMradioButtn(_ sender: UIButton) {
        MMradioButtn.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)
        CMradioButtn.setImage(UIImage(systemName: "circle"), for: .normal)
        
        CMradioButtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        MMradioButtn.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        setUnitSelection(true)
        leftCM1Lbl.text = "mm"
        leftCM2Lbl.text = "mm"
        leftCM3Lbl.text = "mm"
        
        rtCM1Lbl.text = "mm"
        rtCM2Lbl.text = "mm"
        rtCM3Lbl.text = "mm"
    }
    @IBAction func CMradioButtn(_ sender: UIButton) {
        CMradioButtn.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .selected)
        MMradioButtn.setImage(UIImage(systemName: "circle"), for: .normal)
        MMradioButtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        CMradioButtn.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        setUnitSelection(false)
        leftCM1Lbl.text = "cm"
        leftCM2Lbl.text = "cm"
        leftCM3Lbl.text = "cm"
        
        rtCM1Lbl.text = "cm"
        rtCM2Lbl.text = "cm"
        rtCM3Lbl.text = "cm"
    }
    
    @IBAction func switchButtnAction(_ sender: UISwitch) {
        if switchButton.isOn{
            rightLabel.isHidden = true
            rightLenTxtField.isHidden = true
            rightWidthTxtField.isHidden = true
            rightToeHtTxtField.isHidden = true
            rtCM1Lbl.isHidden = true
            rtCM2Lbl.isHidden = true
            rtCM3Lbl.isHidden = true
            rightTxtFTitlesStack.isHidden = true

        }
        else{
            rightLabel.isHidden = false
            rightLenTxtField.isHidden = false
            rightWidthTxtField.isHidden = false
            rightToeHtTxtField.isHidden = false
            rtCM1Lbl.isHidden = false
            rtCM2Lbl.isHidden = false
            rtCM3Lbl.isHidden = false
            rightTxtFTitlesStack.isHidden = false
        }
    }
    func setUnitSelection(_ isMMselected:Bool){
        if isMMselected{
            MMradioButtn.isSelected = true
            CMradioButtn.isSelected = false
        }
        else{
            MMradioButtn.isSelected = false
            CMradioButtn.isSelected = true
        }
    }
    func setColour(){
        view.backgroundColor = backgroundColor
        switchButton.backgroundColor = backgroundColor
        leftLenTxtField.backgroundColor = backgroundColor
        leftWidthTxtField.backgroundColor = backgroundColor
        leftToeHtTxtField.backgroundColor = backgroundColor
        
        
        rightLenTxtField.backgroundColor = backgroundColor
        rightWidthTxtField.backgroundColor = backgroundColor
        rightToeHtTxtField.backgroundColor = backgroundColor
    }
    
    func setCornerRadius(radius: Int){
        leftLenTxtField.layer.cornerRadius = CGFloat(radius)
        leftWidthTxtField.layer.cornerRadius = CGFloat(radius)
        leftToeHtTxtField.layer.cornerRadius = CGFloat(radius)

        rightLenTxtField.layer.cornerRadius = CGFloat(radius)
        rightWidthTxtField.layer.cornerRadius = CGFloat(radius)
        rightToeHtTxtField.layer.cornerRadius = CGFloat(radius)
    }
    
    func setBorderColour(){
        let bordercolor = UIColor.white.cgColor
        leftLenTxtField.layer.borderColor = bordercolor
        leftLenTxtField.layer.borderWidth = 1
        leftWidthTxtField.layer.borderColor = bordercolor
        leftWidthTxtField.layer.borderWidth = 1
        leftToeHtTxtField.layer.borderColor = bordercolor
        leftToeHtTxtField.layer.borderWidth = 1
        
        rightLenTxtField.layer.borderColor = bordercolor
        rightLenTxtField.layer.borderWidth = 1
        rightWidthTxtField.layer.borderColor = bordercolor
        rightWidthTxtField.layer.borderWidth = 1
        rightToeHtTxtField.layer.borderColor = bordercolor
        rightToeHtTxtField.layer.borderWidth = 1

    }
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        // Allow to remove character (Backspace)
            if string == "" {
                return true
            }

           // Block multiple dot
            if (textField.text?.contains("."))! && string == "." {
                return false
            }

            // Check decimal places
            if (textField.text?.contains("."))! {
                let limitDecimalPlace = 2
                let decimalPlace = textField.text?.components(separatedBy: ".").last
                if (decimalPlace?.count)! < limitDecimalPlace {
                    return true
                }
                else {
                    return false
                }
            }
        let invalidCharacters = CharacterSet(charactersIn: "0123456789.").inverted
                 return string.rangeOfCharacter(from: invalidCharacters) == nil
            //return true
    }
    
}

