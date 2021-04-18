import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground



public var loanValue = Double()
public var closed = false
public class getItemsView: UIView {
    
    
    @objc func close(sender: UIButton) {
        self.isHidden = true
        print(loanValue)
        closed = true
        
    }
    var loan = UITextField()
    @objc func getLoan() {
        loanValue = Double(loan.text!)!
        self.isHidden = true
    }
    
    override public init(frame: CGRect) {
        
        
        //loan.text = "$ " + String(loanValue)
        loan.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        loan.font = UIFont(name: "Arial", size: 25.0)
        loan.frame.size.width = 300
        loan.frame.size.height = 60
        loan.frame.origin.x = 120
        loan.frame.origin.y = 115
        loan.textAlignment = .center
        loan.isHidden = false
        
        loan.layer.shadowColor = UIColor.gray.cgColor
        loan.layer.shadowOpacity = 0.5
        loan.layer.shadowOffset = .zero
        loan.layer.shadowRadius = 6
        
        
        
        
        func plusAction() {
            loanValue += 100
            loan.text = String(loanValue)
        }
        
        let title = UITextView()
        title.text = "Obtain Financing"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 160
        title.frame.origin.y = 5
        title.isHidden = false
        
        let closeButton = UIButton(type: UIButton.ButtonType.custom) as UIButton
        let closeView = UIImage(named: "mockButton.png") as UIImage?
        closeButton.frame = CGRect(x: -15, y: -15, width: 90, height: 90)
        closeButton.setImage(closeView, for: [])
        closeButton.contentMode = .center
        closeButton.imageView?.contentMode = .scaleAspectFit
        
        let minus = UIButton(type: UIButton.ButtonType.custom) as UIButton
        let minusView = UIImage(named: "-But.png") as UIImage?
        minus.frame = CGRect(x: 130, y: 200, width: 105, height: 105)
        minus.setImage(minusView, for: [])
        minus.contentMode = .center
        minus.imageView?.contentMode = .scaleAspectFit
        
        let plus = UIButton(type: UIButton.ButtonType.custom) as UIButton
        let plusView = UIImage(named: "getLoan.png") as UIImage?
        plus.frame = CGRect(x: 160, y: 175, width: 200, height: 120)
        plus.setImage(plusView, for: [])
        plus.contentMode = .center
        plus.imageView?.contentMode = .scaleAspectFit
        
        
        let stepper = UIStepper()
        stepper.frame.origin.x = 220
        stepper.frame.origin.y = 230
        stepper.minimumValue = 100
        stepper.stepValue = 100
        stepper.maximumValue = 15000
        
        
        
        /*
        let loanAmnt = UITextView()
        
        
        
        loanAmnt.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)

        loanAmnt.font = UIFont(name: "Arial", size: 35.0)
        loanAmnt.frame.size.width = 300
        loanAmnt.frame.size.height = 60
        loanAmnt.frame.origin.x = 195
        loanAmnt.frame.origin.y = 110
        */
        
        
        
        
        /*
        let title = UITextView()
        title.text = "Obtain Financing"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 160
        title.frame.origin.y = 5
        title.isHidden = false
        */
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 300))
        
        closeButton.addTarget(self, action: #selector(close), for: .touchDown)
        plus.addTarget(self, action: #selector(getLoan), for: .touchDown)
        //stepper.addTarget(self, action: #selector(stepperInc(sender: )), for: .valueChanged)
        
        self.layer.borderWidth = 4
        
        self.layer.borderColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        self.layer.shadowColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
        
        
        self.bringSubviewToFront(closeButton)
        self.addSubview(title)
        //self.addSubview(closeButton)
        //self.addSubview(minus)
        self.addSubview(plus)
        self.addSubview(loan)
        //self.addSubview(loanAmnt)
        
        
        
        
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
