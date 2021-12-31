
import UIKit

class MeasurementsViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var switchButtn: UISwitch!
    
    @IBOutlet weak var bothFeetLbl: UILabel!
    
    @IBOutlet weak var MMradioButtn: UIButton!
    @IBOutlet weak var CMradioButtn: UIButton!
    
    @IBOutlet weak var leftTxtF1: TextFieldSet!
    @IBOutlet weak var leftTxtF2: TextFieldSet!
    @IBOutlet weak var leftTxtF3: TextFieldSet!
    
    @IBOutlet weak var rightTxtF1: TextFieldSet!
    @IBOutlet weak var rightTxtF2: TextFieldSet!
    @IBOutlet weak var rightTxtF3: TextFieldSet!
    
    
    var arrayOfLftView = [TextFieldSet]()
    var arrayOfRightView = [TextFieldSet]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 42/255.0, green: 45/255.0, blue: 51/255.0, alpha: 2.5)
        leftViewDimensions()
        rightViewDimensions()
        
        arrayOfLftView.append(leftTxtF1)
        arrayOfLftView.append(leftTxtF2)
        arrayOfLftView.append(leftTxtF3)

        arrayOfRightView.append(rightTxtF1)
        arrayOfRightView.append(rightTxtF2)
        arrayOfRightView.append(rightTxtF3)
    }
    
//MARK:- View for left foot
    func leftViewDimensions(){
        leftTxtF1.headLbl.text = "Left"
        leftTxtF2.headLbl.isHidden = true
        leftTxtF3.headLbl.isHidden = true
        
        leftTxtF1.dimensionsOfTxtF = "Length"
        leftTxtF2.dimensionsOfTxtF = "Width"
        leftTxtF3.dimensionsOfTxtF = "Toe Height"
    }
//MARK:- View for Right foot
    func rightViewDimensions(){
        rightTxtF1.headLbl.text = "Right"
        rightTxtF2.headLbl.isHidden = true
        rightTxtF3.headLbl.isHidden = true
        
        rightTxtF1.dimensionsOfTxtF = "length"
        rightTxtF2.dimensionsOfTxtF = "Width"
        rightTxtF3.dimensionsOfTxtF = "Toe Height"
    }
    
//MARK:- Toggle switch action(on-off)
    @IBAction func switchButtnAction(_ sender: UISwitch) {
        if switchButtn.isOn{
            for i in arrayOfRightView{
                i.isHidden = true
            }
            leftTxtF1.headLbl.isHidden = true
        }
        else{
            for i in arrayOfLftView{
                i.isHidden = false
            }
            leftTxtF1.headLbl.isHidden = false

            for i in arrayOfRightView{
                i.isHidden = false
            }
        }

    }
//MARK:- Action after unit selection - mm
    @IBAction func mmButtonClicked(_ sender: UIButton) {
           MMradioButtn.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
           CMradioButtn.setImage(UIImage(systemName: "circle"), for: .normal)

           CMradioButtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
           MMradioButtn.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        for unit in arrayOfLftView{
            unit.unitLbl.text = "mm"
        }
        for unit in arrayOfRightView{
            unit.unitLbl.text = "mm"
        }
        setUnitSelection(true)
    }
    //MARK:- Action after unit selection - cm
    @IBAction func cmButtnClicked(_ sender: UIButton) {
        CMradioButtn.setImage(UIImage(systemName: "largecircle.fill.circle"), for: .normal)
        MMradioButtn.setImage(UIImage(systemName: "circle"), for: .normal)
        MMradioButtn.tintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        CMradioButtn.tintColor = #colorLiteral(red: 0.3411764801, green: 0.6235294342, blue: 0.1686274558, alpha: 1)
        
        for unit in arrayOfLftView{
            unit.unitLbl.text = "cm"
        }
        for unit in arrayOfRightView{
            unit.unitLbl.text = "cm"
        }
        setUnitSelection(false)
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

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
