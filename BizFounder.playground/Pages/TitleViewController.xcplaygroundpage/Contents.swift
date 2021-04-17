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


var cashBalance = Int()
var netWorth = Int()

netWorth = 25000
cashBalance = 25000

//let cfURL = Bundle.main.url(forResource: "Comfortaa-Bold", withExtension: "tff")! as CFURL
//CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let mainFont = UIFont(name: "Arial", size:  30.0)

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


let cashView = UITextView()
cashView.text = "Total Cash: "
cashView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
cashView.font = mainFont
cashView.frame.size.width = 200
cashView.frame.size.height = 60
cashView.frame.origin.x = 420
cashView.frame.origin.y = 900
cashView.isHidden = true

let worthAmnt = UITextView()
worthAmnt.text = "$" + String(netWorth)
worthAmnt.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
worthAmnt.font = mainFont
worthAmnt.frame.size.width = 150
worthAmnt.frame.size.height = 60
worthAmnt.frame.origin.x = 200
worthAmnt.frame.origin.y = 900
worthAmnt.isHidden = true

let cashAmnt = UITextView()
cashAmnt.text = "$" + String(cashBalance)
cashAmnt.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
cashAmnt.font = mainFont
cashAmnt.frame.size.width = 150
cashAmnt.frame.size.height = 60
cashAmnt.frame.origin.x = 580
cashAmnt.frame.origin.y = 900
cashAmnt.isHidden = true

let netWrth = UITextView()
netWrth.text = "Net Worth: "
netWrth.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
netWrth.font = mainFont
netWrth.frame.size.width = 200
netWrth.frame.size.height = 60
netWrth.frame.origin.x = 40
netWrth.frame.origin.y = 900
netWrth.isHidden = true

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
        view.addSubview(cashView)
        view.addSubview(netWrth)
        view.addSubview(worthAmnt)
        view.addSubview(cashAmnt)
        
        
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
                
                fundsView.alpha = 0
                fundsView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    fundsView.alpha = 1
                })
                cashView.alpha = 0
                cashView.isHidden = false
                cashView.fadeIn()
                
                cashAmnt.alpha = 0
                cashAmnt.isHidden = false
                cashAmnt.fadeIn()
                
                netWrth.isHidden = false
                netWrth.alpha = 0
                netWrth.fadeI()
                
                worthAmnt.isHidden = false
                worthAmnt.alpha = 0
                worthAmnt.fadeI()
                
                
                
            }
        })
    }

    @objc func iceAction(sender: UIButton) {
        sender.isHidden = false
    }
    

    
}
public extension UIView {
    
 func fadeIn(duration: TimeInterval = 3.0) {
     UIView.animate(withDuration: duration, animations: {
        self.alpha = 1.0
     })
 }

func fadeOut(duration: TimeInterval = 1.0) {
    UIView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
    })
  }

}

public extension UITextView {
    
 func fadeI(duration: TimeInterval = 3.0) {
     UITextView.animate(withDuration: duration, animations: {
        self.alpha = 1.0
     })
 }

func fadeO(duration: TimeInterval = 1.0) {
    UITextView.animate(withDuration: duration, animations: {
        self.alpha = 0.0
    })
  }

}


let master = TitleViewController()
master.preferredContentSize = frameOfMainView
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = master
