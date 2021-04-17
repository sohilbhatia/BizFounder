import Foundation
import UIKit
import PlaygroundSupport
import XCPlayground

public class getItemsView: UIView {
    override public init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 500, height: 500))
        self.backgroundColor = UIColor.red
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
