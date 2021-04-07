import Cocoa
import UIKit
import PlaygroundSupport

let frameOfMainView = CGSize(width: 900, height: 700)
let title = UIImage(named: "TITLE.png")!
let titleView = UIImageView(image: title)
titleView.image = title
titleView.frame.size.width = 745
titleView.frame.size.height = 140
titleView.frame.origin.x = 35
titleView.frame.origin.y = 65

let c = UIImage(named: "cTab.png")!
let cTab = UIImageView(image: c)
cTab.frame.size.width = 900
cTab.frame.size.height = 300
cTab.image = c
cTab.frame.origin.x = -240
cTab.frame.origin.y = 450

let i = UIImage(named: "iTab.png")!
let iTab = UIImageView(image: i)
iTab.frame.size.width = 900
iTab.frame.size.height = 300
iTab.image = i
iTab.frame.origin.x = 110
iTab.frame.origin.y = 450

class TitleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        view.addSubview(titleView)
        view.addSubview(cTab)
        view.addSubview(iTab)
        titleView.alpha = 0
        UIView.animate(withDuration: 2, delay: 2/10, options: .curveEaseOut, animations: {
           titleView.alpha = 1
        })
        
        
    }
    
}

let master = TitleViewController()
master.preferredContentSize = frameOfMainView
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = master
