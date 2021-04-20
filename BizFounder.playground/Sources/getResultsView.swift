import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public class getResultsView: UIView {
    override public init(frame: CGRect) {
        let title = UITextView()
        title.text = "Congratulations"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 140
        title.frame.origin.y = 20
        title.isHidden = false
        
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 300))
        
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
