import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public var managerPrice = 23
public var baristaPrice = 12
public var serverPrice = 8.5

public var manQuant = Int()
public var baristQuant = Int()
public var servQuant = Int()

public class getEmployeeView: UIView {
    
    let mField = UITextField()
    let bField = UITextField()
    let sField = UITextField()
    
    @objc func hirePersonnel (sender: UIButton){
        manQuant = Int(mField.text!)!
        servQuant = Int(sField.text!)!
        baristQuant = Int(bField.text!)!
        self.isHidden = true
    }
    
    override public init(frame: CGRect) {
        
        let title = UITextView()
        title.text = "Hire Employees"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 140
        title.frame.origin.y = 20
        title.isHidden = false
        
        let mLabel = UITextView()
        mLabel.text = "Manager"
        mLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        mLabel.font = UIFont(name: "Arial", size: 15.0)
        mLabel.textColor = UIColor.lightGray
        mLabel.frame.size.width = 125
        mLabel.frame.size.height = 60
        mLabel.frame.origin.x = 190
        mLabel.frame.origin.y = 160
        mLabel.isHidden = false
        
        let bLabel = UITextView()
        bLabel.text = "Barista"
        bLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        bLabel.font = UIFont(name: "Arial", size: 15.0)
        bLabel.textColor = UIColor.lightGray
        bLabel.frame.size.width = 150
        bLabel.frame.size.height = 60
        bLabel.frame.origin.x = 190
        bLabel.frame.origin.y = 280
        bLabel.isHidden = false
        
        let sLabel = UITextView()
        sLabel.text = "Server"
        sLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        sLabel.font = UIFont(name: "Arial", size: 15.0)
        sLabel.textColor = UIColor.lightGray
        sLabel.frame.size.width = 150
        sLabel.frame.size.height = 30
        sLabel.frame.origin.x = 190
        sLabel.frame.origin.y = 400
        sLabel.isHidden = false
        
        
        let manager = UIImage(named: "manager.png")!
        let mView = UIImageView(image: manager)
        mView.image = manager
        mView.frame.size.width = 100
        mView.frame.size.height = 100
        mView.frame.origin.x = 35
        mView.frame.origin.y = 100
        mView.isHidden = false
        
        let mPrice = UITextView()
        mPrice.text = "$" + String(managerPrice) + "/hour"
        mPrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        mPrice.font = UIFont(name: "Arial", size: 30.0)
        mPrice.frame.size.width = 300
        mPrice.frame.size.height = 50
        mPrice.frame.origin.x = 190
        mPrice.frame.origin.y = 120
        mPrice.isHidden = false
        
        let barista = UIImage(named: "barista.png")!
        let bView = UIImageView(image: barista)
        bView.image = barista
        bView.frame.size.width = 100
        bView.frame.size.height = 100
        bView.frame.origin.x = 35
        bView.frame.origin.y = 230
        bView.isHidden = false
        
        let bPrice = UITextView()
        bPrice.text = "$" + String(baristaPrice) + "/hour"
        bPrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        bPrice.font = UIFont(name: "Arial", size: 30.0)
        bPrice.frame.size.width = 300
        bPrice.frame.size.height = 50
        bPrice.frame.origin.x = 190
        bPrice.frame.origin.y = 240
        bPrice.isHidden = false
        
        let server = UIImage(named: "server.png")!
        let sView = UIImageView(image: server)
        sView.image = server
        sView.frame.size.width = 100
        sView.frame.size.height = 100
        sView.frame.origin.x = 35
        sView.frame.origin.y = 340
        sView.isHidden = false
        
        let sPrice = UITextView()
        sPrice.text = "$" + String(serverPrice) + "/hour"
        sPrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        sPrice.font = UIFont(name: "Arial", size: 30.0)
        sPrice.frame.size.width = 300
        sPrice.frame.size.height = 50
        sPrice.frame.origin.x = 190
        sPrice.frame.origin.y = 360
        sPrice.isHidden = false
        
        
        
        mField.borderStyle = .roundedRect
        mField.text = ""
        mField.frame.size.width = 100
        mField.frame.size.height = 60
        mField.frame.origin.x = 345
        mField.frame.origin.y = 120
        
        
        bField.borderStyle = .roundedRect
        bField.text = ""
        bField.frame.size.width = 100
        bField.frame.size.height = 60
        bField.frame.origin.x = 345
        bField.frame.origin.y = 240
        
        
        
        sField.borderStyle = .roundedRect
        sField.text = ""
        sField.frame.size.width = 100
        sField.frame.size.height = 60
        sField.frame.origin.x = 345
        sField.frame.origin.y = 360
        
        
        
        let hire = UIButton(type: UIButton.ButtonType.custom) as UIButton
        let hireView = UIImage(named: "personnel.png") as UIImage?
        hire.frame = CGRect(x: 300, y: 425, width: 144, height: 86.4)
        hire.setImage(hireView, for: [])
        hire.contentMode = .center
        hire.imageView?.contentMode = .scaleAspectFit
        
        
        
        
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 500))
        
        
        hire.addTarget(self, action: #selector(hirePersonnel(sender:)), for: .touchDown)
        
        self.layer.borderWidth = 4
        
        self.layer.borderColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        self.layer.shadowColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
        
        self.addSubview(title)
        self.addSubview(mLabel)
        self.addSubview(bLabel)
        self.addSubview(sLabel)
        self.addSubview(mView)
        self.addSubview(bView)
        self.addSubview(sView)
        self.addSubview(sPrice)
        self.addSubview(bPrice)
        self.addSubview(mPrice)
        self.addSubview(sField)
        self.addSubview(mField)
        self.addSubview(bField)
        self.addSubview(hire)
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
