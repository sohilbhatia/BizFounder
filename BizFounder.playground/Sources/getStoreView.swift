import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public var cupPrice = 1200
public var espressoPrice = 6500
public var steamerPrice = 4300
public var eQuantity = Int()
public var cQuantity = Int()
public var sQuantity = Int()

public class getStoreView: UIView {
    let cField = UITextField()
    let eField = UITextField()
    let sField = UITextField()
    
    @objc func buyItems(sender: UIButton) {
        eQuantity = Int(eField.text!)!
        cQuantity = Int(cField.text!)!
        sQuantity = Int(sField.text!)!
        self.isHidden = true
    }
    
    override public init(frame: CGRect) {
        
        let title = UITextView()
        title.text = "Get Items / Equipment"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 120
        title.frame.origin.y = 5
        title.isHidden = false
        
        let rack = UITextView()
        rack.text = "Cups Storage"
        rack.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        rack.font = UIFont(name: "Arial", size: 15.0)
        rack.textColor = UIColor.lightGray
        rack.frame.size.width = 125
        rack.frame.size.height = 60
        rack.frame.origin.x = 190
        rack.frame.origin.y = 160
        rack.isHidden = false
        
        let eLabel = UITextView()
        eLabel.text = "Espresso Machine"
        eLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        eLabel.font = UIFont(name: "Arial", size: 15.0)
        eLabel.textColor = UIColor.lightGray
        eLabel.frame.size.width = 150
        eLabel.frame.size.height = 60
        eLabel.frame.origin.x = 180
        eLabel.frame.origin.y = 280
        eLabel.isHidden = false
        
        let mLabel = UITextView()
        mLabel.text = "Steamer/Boiler"
        mLabel.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        mLabel.font = UIFont(name: "Arial", size: 15.0)
        mLabel.textColor = UIColor.lightGray
        mLabel.frame.size.width = 150
        mLabel.frame.size.height = 60
        mLabel.frame.origin.x = 180
        mLabel.frame.origin.y = 400
        mLabel.isHidden = false
        
        
        let cups = UIImage(named: "cupRack.png")!
        let cupView = UIImageView(image: cups)
        cupView.image = cups
        cupView.frame.size.width = 100
        cupView.frame.size.height = 100
        cupView.frame.origin.x = 35
        cupView.frame.origin.y = 100
        cupView.isHidden = false
        
        let cPrice = UITextView()
        cPrice.text = "$" + String(cupPrice)
        cPrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        cPrice.font = UIFont(name: "Arial", size: 30.0)
        cPrice.frame.size.width = 300
        cPrice.frame.size.height = 60
        cPrice.frame.origin.x = 190
        cPrice.frame.origin.y = 120
        cPrice.isHidden = false
        
        let espresso = UIImage(named: "espMachine.png")!
        let eView = UIImageView(image: espresso)
        eView.image = espresso
        eView.frame.size.width = 100
        eView.frame.size.height = 100
        eView.frame.origin.x = 35
        eView.frame.origin.y = 150
        eView.isHidden = false
        
        let ePrice = UITextView()
        ePrice.text = "$" + String(espressoPrice)
        ePrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        ePrice.font = UIFont(name: "Arial", size: 30.0)
        ePrice.frame.size.width = 300
        ePrice.frame.size.height = 60
        ePrice.frame.origin.x = 190
        ePrice.frame.origin.y = 240
        ePrice.isHidden = false
        
        let steamer = UIImage(named: "steamer.png")!
        let sView = UIImageView(image: espresso)
        sView.image = steamer
        sView.frame.size.width = 100
        sView.frame.size.height = 100
        sView.frame.origin.x = 35
        sView.frame.origin.y = 340
        sView.isHidden = false
        
        let sPrice = UITextView()
        sPrice.text = "$" + String(steamerPrice)
        sPrice.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        sPrice.font = UIFont(name: "Arial", size: 30.0)
        sPrice.frame.size.width = 300
        sPrice.frame.size.height = 60
        sPrice.frame.origin.x = 190
        sPrice.frame.origin.y = 360
        sPrice.isHidden = false
        
        
        cField.borderStyle = .roundedRect
        cField.text = ""
        cField.frame.size.width = 100
        cField.frame.size.height = 60
        cField.frame.origin.x = 345
        cField.frame.origin.y = 120
        
        
        eField.borderStyle = .roundedRect
        eField.text = ""
        eField.frame.size.width = 100
        eField.frame.size.height = 60
        eField.frame.origin.x = 345
        eField.frame.origin.y = 240
        
        
        
        sField.borderStyle = .roundedRect
        sField.text = ""
        sField.frame.size.width = 100
        sField.frame.size.height = 60
        sField.frame.origin.x = 345
        sField.frame.origin.y = 360
        
        
        let buy = UIButton(type: UIButton.ButtonType.custom) as UIButton
        let buyView = UIImage(named: "buyItems.png") as UIImage?
        buy.frame = CGRect(x: 300, y: 425, width: 144, height: 86.4)
        buy.setImage(buyView, for: [])
        buy.contentMode = .center
        buy.imageView?.contentMode = .scaleAspectFit
        
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 500))
        self.addSubview(title)
        self.addSubview(cupView)
        self.addSubview(eView)
        self.addSubview(sView)
        self.addSubview(cPrice)
        self.addSubview(ePrice)
        self.addSubview(sPrice)
        self.addSubview(cField)
        self.addSubview(eField)
        self.addSubview(sField)
        self.addSubview(buy)
        self.addSubview(rack)
        self.addSubview(eLabel)
        self.addSubview(mLabel)
        
        self.layer.borderWidth = 4
        
        self.layer.borderColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        buy.addTarget(self, action: #selector(buyItems(sender:)), for: .touchDown)
        
        self.layer.shadowColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
        /*
        func calcExpenses() -> Int {
            let eInt: Int? = Int(eField.text!)
            let sInt: Int? = Int(sField.text!)
            let cInt: Int? = Int(cField.text!)
            let itemExpenses = ((eInt * ePrice) + (sInt * sPrice) + (cInt * cPrice))
            return itemExpenses
        }
 */
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
