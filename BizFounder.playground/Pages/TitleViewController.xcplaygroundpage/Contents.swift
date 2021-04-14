import Cocoa
import UIKit
import PlaygroundSupport
import SceneKit

let frameOfMainView = CGSize(width: 900, height: 700)
let title = UIImage(named: "TITLE.png")!
let titleView = UIImageView(image: title)
titleView.image = title
titleView.frame.size.width = 745
titleView.frame.size.height = 140
titleView.frame.origin.x = 35
titleView.frame.origin.y = 65

let business = UIImage(named: "businessSpace.png")!
let businessView = UIImageView(image: business)
businessView.image = business
businessView.frame.size.width = 700
businessView.frame.size.height = 700
businessView.frame.origin.x = 35
businessView.frame.origin.y = 140
businessView.isHidden = true

let item = UIImage(named: "items.png")!
let itemView = UIImageView(image: item)
itemView.image = item
itemView.frame.size.width = 400
itemView.frame.size.height = 60
itemView.frame.origin.x = -80
itemView.frame.origin.y = 15
itemView.isHidden = true

let funds = UIImage(named: "funds.png")!
let fundsView = UIImageView(image: funds)
fundsView.image = funds
fundsView.frame.size.width = 400
fundsView.frame.size.height = 60
fundsView.frame.origin.x = 110
fundsView.frame.origin.y = 15
fundsView.isHidden = true

let emp = UIImage(named: "employees.png")!
let empView = UIImageView(image: emp)
empView.frame.size.width = 400
empView.frame.size.height = 60
empView.frame.origin.x = 300
empView.frame.origin.y = 15
empView.isHidden = true

let mark = UIImage(named: "marketing.png")!
let markView = UIImageView(image: mark)
markView.frame.size.width = 400
markView.frame.size.height = 60
markView.frame.origin.x = 490
markView.frame.origin.y = 15
markView.isHidden = true

let type = UIImage(named: "type.png")!
let typeView = UIImageView(image: type)
typeView.image = type
typeView.frame.size.width = 850
typeView.frame.size.height = 75
typeView.frame.origin.x = -15
typeView.frame.origin.y = 145

typeView.isHidden = true

let textField = UITextField()
textField.borderStyle = .roundedRect
textField.text = ""
typeView.frame.origin.x = -15
typeView.frame.origin.y = 400

let sceneView = SCNView()
sceneView.frame.origin.x = 0
sceneView.frame.origin.y = 0
sceneView.isHidden = false

let c = UIButton(type: UIButton.ButtonType.custom) as UIButton
let cTab = UIImage(named: "cTab.png") as UIImage?
c.frame = CGRect(x: -240, y: 450, width: 900, height: 300)
c.setImage(cTab, for: [])
c.contentMode = .center
c.imageView?.contentMode = .scaleAspectFit
c.isHidden = false

let i = UIButton(type: UIButton.ButtonType.custom) as UIButton
let iTab = UIImage(named: "iTab.png") as UIImage?
i.frame = CGRect(x: 110, y: 450, width: 900, height: 300)
i.setImage(iTab, for: [])
i.contentMode = .center
i.imageView?.contentMode = .scaleAspectFit
i.isHidden = true

class TitleViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
        view.addSubview(titleView)
        view.addSubview(i)
        view.addSubview(c)
        view.addSubview(typeView)
        view.addSubview(sceneView)
        view.addSubview(businessView)
        view.addSubview(itemView)
        view.addSubview(fundsView)
        view.addSubview(empView)
        view.addSubview(markView)
        
        i.addTarget(self, action: #selector(iceAction), for: .touchDown)
        c.addTarget(self, action: #selector(coffeeAction), for: .touchDown)
        
        i.alpha = 0
        i.isHidden = false
        UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
           i.alpha = 1
        })
        
        titleView.alpha = 0
        UIView.animate(withDuration: 2, delay: 2/10, options: .curveEaseOut, animations: {
           titleView.alpha = 1
        })
        
        c.alpha = 0
        UIView.animate(withDuration: 3, delay: 2/10, options: .curveEaseOut, animations: {
           c.alpha = 1
        })
        
        
    }
    @objc func coffeeAction(sender: UIButton) {
        sender.isHighlighted = false
        UIView.animate(withDuration: 1, delay: 1, options: .curveEaseOut, animations: {
           sender.alpha = 0
        }, completion: { success in
            if success {
                i.alpha = 1
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                   i.alpha = 0
                }, completion: nil)
                
                titleView.alpha = 1
                titleView.isHidden = false
                UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
                   titleView.alpha = 0
                }, completion: nil)
                self.view.window?.makeKeyAndVisible()
                
                businessView.alpha = 0
                businessView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                   businessView.alpha = 1
                })
                
                itemView.alpha = 0
                itemView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    itemView.alpha = 1
                })
                
                empView.alpha = 0
                empView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    empView.alpha = 1
                })
                
                markView.alpha = 0
                markView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    markView.alpha = 1
                })
                
                fundsView.alpha = 0
                fundsView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    fundsView.alpha = 1
                })
                
                
                
            }
        })
    }

    @objc func iceAction(sender: UIButton) {
        sender.isHidden = false
    }
    
}



let master = TitleViewController()
master.preferredContentSize = frameOfMainView
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = master
