
import UIKit

class TextFieldSet: UIView, UITextFieldDelegate {

    @IBOutlet var containerView: UIView!
    @IBOutlet weak var headLbl: UILabel!
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var textFTopLbl: UILabel!
    @IBOutlet weak var unitLbl: UILabel!
    
    let vc = MeasurementsViewController()
    
    var unitSuffix : String = ""{
        didSet{
            unitLbl.text = unitSuffix
        }
    }
    
    var dimensionsOfTxtF : String = "" {
        didSet{
            textFTopLbl.text = dimensionsOfTxtF
        }
    }
    
    var setBackgroundColour : UIColor = UIColor.white{
        didSet {
            textField.backgroundColor = setBackgroundColour
        }
    }
    
    var dimensionTxtColor : UIColor = UIColor.white{
        didSet{
            textFTopLbl.textColor = dimensionTxtColor
        }
    }
    
    var txtFieldBorderColor : UIColor = UIColor.white{
        didSet{
            textField.layer.borderColor = txtFieldBorderColor.cgColor
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit(){
         Bundle.main.loadNibNamed("TextFieldSet", owner: self, options: nil)
        containerView.backgroundColor =  UIColor(red: 42/255.0, green: 45/255.0, blue: 51/255.0, alpha: 2.5)
        textField.backgroundColor = containerView.backgroundColor
        textField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textField.layer.borderWidth = 0.5
        textField.delegate = self
        addSubview(containerView)
    }
    
//MARK:- Textfield delegate properties
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
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textField.layer.borderWidth = 3
        textField.layer.borderColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        textFTopLbl.textColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        textField.resignFirstResponder()
        textField.layer.borderWidth = 0.5
        textField.layer.borderColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        textFTopLbl.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
}
