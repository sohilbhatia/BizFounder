import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public class getEmployeeView: UIView {
    override public init(frame: CGRect) {
        
        let title = UITextView()
        title.text = "Hire Employees"
        title.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
        title.font = UIFont(name: "Arial", size: 25.0)
        title.frame.size.width = 300
        title.frame.size.height = 60
        title.frame.origin.x = 120
        title.frame.origin.y = 5
        title.isHidden = false
        
        
        
        
        
        
        super.init(frame: CGRect(x: 150, y: 270, width: 500, height: 300))
        
        self.addSubview(title)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
