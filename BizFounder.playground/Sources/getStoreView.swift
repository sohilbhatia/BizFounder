import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public var cupPrice = 1200
public var espressoPrice = 6500
public var steamerPrice = 4300


public class getStoreView: UIView {
    
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
        eView.frame.origin.y = 220
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
        
        let cField = UITextField()
        cField.borderStyle = .roundedRect
        cField.text = ""
        cField.frame.size.width = 100
        cField.frame.size.height = 60
        cField.frame.origin.x = 345
        cField.frame.origin.y = 120
        
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 500))
        self.addSubview(title)
        self.addSubview(cupView)
        self.addSubview(eView)
        self.addSubview(sView)
        self.addSubview(cPrice)
        self.addSubview(ePrice)
        self.addSubview(sPrice)
        self.addSubview(cField)
        
        self.layer.borderWidth = 4
        
        self.layer.borderColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        
        self.layer.shadowColor = UIColor(red:26/255, green:159/255, blue:237/255, alpha: 1).cgColor
        self.layer.shadowOpacity = 0.5
        self.layer.shadowOffset = .zero
        self.layer.shadowRadius = 6
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
