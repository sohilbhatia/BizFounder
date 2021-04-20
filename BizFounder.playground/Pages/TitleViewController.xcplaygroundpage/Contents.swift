import Cocoa
import UIKit
import PlaygroundSupport
import SceneKit
import SpriteKit

public var loanVal = 0.0
public var createRate = 0.0

public var mImpact = 0.2
public var sImpact = 0.1
public var bImpact = 0.1

public var espressoImpact = 0.05
public var steamerImpact = 0.03
public var cupsImpact = 0.01

private var maxCount : Int?
private var currentCount : Int?
private var updateTimer : Timer?
private var timerHour : Timer?
private var timerDay : Timer?

private var maxHour : Int?
private var currentHour : Int?

private var maxDay : Int?
private var currentDay : Int?

var removeCell = false
var cellLifetime = 30.0

var roundedBalance = Double()
var pausedBefore = false

var customerVariance = 1

class EmitterView: UIView {
  let emitterLayer = CAEmitterLayer()
 
  override init(frame: CGRect) {
    super.init(frame: frame)
    var cells:[CAEmitterCell] = [CAEmitterCell]()
    for index in 0..<2 {
        let cell = CAEmitterCell()

        cell.birthRate = Float(createRate)
        
        cell.lifetime = Float(500)
        
 
        cell.velocity = 30
        cell.velocityRange = 50
        cell.emissionLongitude = CGFloat.pi
        cell.spinRange = 5
        cell.spin = CGFloat(Double.pi * 2)
        cell.scale = 0.5
        cell.scaleRange = 0
        cell.color = UIColor(white: 0, alpha: 1.0).cgColor
        cell.alphaSpeed = Float(-0.025)
        cell.contents = UIImage(named: "user.png")?.cgImage
        cell.name = "cell\(index)"
        cells.append(cell)
        
        if (removeCell == true) {
            cell.birthRate = 0
            emitterLayer.isHidden = true
            cell.lifetime = 0
        }
        
    }
    emitterLayer.emitterCells = cells
    
    layer.addSublayer(emitterLayer)
    
    backgroundColor = .white
    
  }

  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }

    override public func layoutSubviews() {
    super.layoutSubviews()

    emitterLayer.emitterPosition = CGPoint(x: 1500, y: 370)
    emitterLayer.emitterShape = CAEmitterLayerEmitterShape.circle
        /*
    let animation = CABasicAnimation(keyPath: "position.x")
    animation.fromValue = 1500
    animation.toValue = -40
    animation.duration = 10
 */
    //emitterLayer.add(animation, forKey: "Reposition")
    let degrees = 30.0
    let radians = CGFloat(degrees * Double.pi / 180)
    emitterLayer.transform = CATransform3DMakeRotation(radians, 0.0, 0.0, 1.0)
    //emitterLayer.setAffineTransform(CGAffineTransform(rotationAngle: -.pi))
    emitterLayer.emitterSize = CGSize(width: 200, height: 500)
    emitterLayer.renderMode = CAEmitterLayerRenderMode.additive
        
        if (emitterLayer.isHidden == true) {
            print("HELLO")
        }
        
  }
}


func hideEmitter() {
    EmitterView().isHidden = true
}



let frameOfMainView = CGSize(width: 900, height: 700)
let title = UIImage(named: "TITLE.png")!
let titleView = UIImageView(image: title)
titleView.image = title
titleView.frame.size.width = 745
titleView.frame.size.height = 140
titleView.frame.origin.x = 35
titleView.frame.origin.y = 65

let loan = UITextView()
loan.text = "$ " + String(loanVal)
loan.backgroundColor = UIColor(red: 245/255, green: 245/255, blue: 245/255, alpha: 1)
loan.font = UIFont(name: "Arial", size: 25.0)
loan.frame.size.width = 300
loan.frame.size.height = 60
loan.frame.origin.x = 320
loan.frame.origin.y = 300
loan.isHidden = false

var cashBalance = Double()
var netWorth = Int()

netWorth = 25000
cashBalance = 25000.0

//let cfURL = Bundle.main.url(forResource: "Comfortaa-Bold", withExtension: "tff")! as CFURL
//CTFontManagerRegisterFontsForURL(cfURL, CTFontManagerScope.process, nil)

let mainFont = UIFont(name: "Arial", size:  30.0)
let altFont = UIFont(name: "Arial", size: 25.0)

let business = UIImage(named: "businessSpace.png")!
let businessView = UIImageView(image: business)
businessView.image = business
businessView.frame.size.width = 700
businessView.frame.size.height = 700
businessView.frame.origin.x = 35
businessView.frame.origin.y = 140
businessView.isHidden = true

let item = UIButton(type: UIButton.ButtonType.custom) as UIButton
let itemView = UIImage(named: "items.png") as UIImage?
item.frame = CGRect(x: -80, y: 15, width: 400, height: 60)
item.setImage(itemView, for: [])
item.contentMode = .center
item.imageView?.contentMode = .scaleAspectFit
item.isHidden = true



let cashView = UITextView()
cashView.text = "Total Cash: "
cashView.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
cashView.font = mainFont
cashView.frame.size.width = 200
cashView.frame.size.height = 60
cashView.frame.origin.x = 420
cashView.frame.origin.y = 850
cashView.isHidden = true

let worthAmnt = UITextView()
worthAmnt.text = "$" + String(netWorth)
worthAmnt.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
worthAmnt.font = mainFont
worthAmnt.frame.size.width = 150
worthAmnt.frame.size.height = 60
worthAmnt.frame.origin.x = 200
worthAmnt.frame.origin.y = 850
worthAmnt.isHidden = true

let cashAmnt = UITextView()
cashAmnt.text = "$" + String(cashBalance + Double(loanValue))
cashAmnt.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
cashAmnt.font = mainFont
cashAmnt.frame.size.width = 120
cashAmnt.frame.size.height = 40
cashAmnt.frame.origin.x = 580
cashAmnt.frame.origin.y = 850
cashAmnt.isHidden = true

let netWrth = UITextView()
netWrth.text = "Net Worth: "
netWrth.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
netWrth.font = mainFont
netWrth.frame.size.width = 200
netWrth.frame.size.height = 60
netWrth.frame.origin.x = 40
netWrth.frame.origin.y = 850
netWrth.isHidden = true

let stopWatch = UITextView()
stopWatch.text = "Number of Customers: "
stopWatch.backgroundColor = UIColor(red: 252/255, green: 252/255, blue: 252/255, alpha: 1)
stopWatch.font = UIFont.boldSystemFont(ofSize: 20.0)
stopWatch.font = mainFont
stopWatch.frame.size.width = 400
stopWatch.frame.size.height = 60
stopWatch.frame.origin.x = 40
stopWatch.frame.origin.y = 915
stopWatch.isHidden = true


let emp = UIButton(type: UIButton.ButtonType.custom) as UIButton
let empView = UIImage(named: "employees.png") as UIImage?
emp.frame = CGRect(x: 300, y: 15, width: 400, height: 60)
emp.setImage(empView, for: [])
emp.contentMode = .center
emp.imageView?.contentMode = .scaleAspectFit
emp.isHidden = true


let mark = UIImage(named: "marketing.png")!
let markView = UIImageView(image: mark)
markView.frame.size.width = 400
markView.frame.size.height = 60
markView.frame.origin.x = 490
markView.frame.origin.y = 15
markView.isHidden = true

let day = UIButton(type: UIButton.ButtonType.custom) as UIButton
let dayView = UIImage(named: "day.png") as UIImage?
day.frame = CGRect(x: 580, y: 15, width: 80, height: 80)
day.setImage(dayView, for: [])
day.contentMode = .center
day.imageView?.contentMode = .scaleAspectFit
day.isHidden = true


let dayText = UITextView()
dayText.text = "0"
dayText.backgroundColor = UIColor(red: 26/255, green: 159/255, blue: 237/255, alpha: 1)
dayText.font = UIFont.boldSystemFont(ofSize: 35.0)
dayText.font = altFont
dayText.textColor = UIColor.white
dayText.frame.size.width = 45
dayText.frame.size.height = 31
dayText.frame.origin.x = 610
dayText.frame.origin.y = 45
dayText.isHidden = true


let hour = UIButton(type: UIButton.ButtonType.custom) as UIButton
let hourView = UIImage(named: "hour.png") as UIImage?
hour.frame = CGRect(x: 670, y: 15, width: 80, height: 80)
hour.setImage(hourView, for: [])
hour.contentMode = .center
hour.imageView?.contentMode = .scaleAspectFit
hour.isHidden = true

let hourText = UITextView()
hourText.text = "0"
hourText.backgroundColor = UIColor(red: 26/255, green: 159/255, blue: 237/255, alpha: 1)
hourText.font = UIFont.boldSystemFont(ofSize: 28.0)
hourText.font = altFont
hourText.textColor = UIColor.white
hourText.frame.size.width = 45
hourText.frame.size.height = 31
hourText.frame.origin.x = 700
hourText.frame.origin.y = 45
hourText.isHidden = true


let start = UIButton(type: UIButton.ButtonType.custom) as UIButton
let startView = UIImage(named: "startButton.png") as UIImage?
start.frame = CGRect(x: 450, y: 910, width: 60, height: 60)
start.setImage(startView, for: [])
start.contentMode = .center
start.imageView?.contentMode = .scaleAspectFit
start.isHidden = true

let myPause = UIButton(type: UIButton.ButtonType.custom) as UIButton
let myPauseView = UIImage(named: "pause.png") as UIImage?
myPause.frame = CGRect(x: 550, y: 910, width: 60, height: 60)
myPause.setImage(myPauseView, for: [])
myPause.contentMode = .center
myPause.imageView?.contentMode = .scaleAspectFit
myPause.isHidden = true



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

let test = UIButton(type: UIButton.ButtonType.custom) as UIButton
let testView = UIImage(named: "mockButton.png") as UIImage?
test.frame = CGRect(x: -25, y: 222, width: 400, height: 60)
test.setImage(testView, for: [])
test.contentMode = .center
test.imageView?.contentMode = .scaleAspectFit
test.isHidden = true

let close2 = UIButton(type: UIButton.ButtonType.custom) as UIButton
let close2View = UIImage(named: "mockButton.png") as UIImage?
close2.frame = CGRect(x: -25, y: 222, width: 400, height: 60)
close2.setImage(testView, for: [])
close2.contentMode = .center
close2.imageView?.contentMode = .scaleAspectFit
close2.isHidden = true

let close3 = UIButton(type: UIButton.ButtonType.custom) as UIButton
let close3View = UIImage(named: "mockButton.png") as UIImage?
close3.frame = CGRect(x: -25, y: 222, width: 400, height: 60)
close3.setImage(testView, for: [])
close3.contentMode = .center
close3.imageView?.contentMode = .scaleAspectFit
close3.isHidden = true

let funds = UIButton(type: UIButton.ButtonType.custom) as UIButton
let fundsView = UIImage(named: "funds.png") as UIImage?
funds.frame = CGRect(x: 110, y: 15, width: 400, height: 60)
funds.setImage(fundsView, for: [])
funds.contentMode = .center
funds.imageView?.contentMode = .scaleAspectFit
funds.isHidden = true

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
        view.addSubview(item)
        view.addSubview(funds)
        view.addSubview(emp)
        //view.addSubview(markView)
        view.addSubview(cashView)
        view.addSubview(netWrth)
        view.addSubview(worthAmnt)
        view.addSubview(cashAmnt)
        view.addSubview(test)
        view.addSubview(close2)
        view.addSubview(close3)
        view.addSubview(start)
        view.addSubview(stopWatch)
        view.addSubview(myPause)
        view.addSubview(day)
        view.addSubview(hour)
        view.addSubview(dayText)
        view.addSubview(hourText)
       // view.addSubview(EmitterView())
        
        
      
        
        i.addTarget(self, action: #selector(iceAction), for: .touchDown)
        c.addTarget(self, action: #selector(coffeeAction), for: .touchDown)
        funds.addTarget(self, action: #selector(itemsAction), for: .touchDown)
        test.addTarget(self, action: #selector(add), for: .touchDown)
        item.addTarget(self, action: #selector(storeAction), for: .touchDown)
        close2.addTarget(self, action: #selector(closeAction), for: .touchDown)
        emp.addTarget(self, action: #selector(empAction), for: .touchDown)
        close3.addTarget(self, action: #selector(close3Action), for: .touchDown)
        start.addTarget(self, action: #selector(updateLabel), for: .touchDown)
        myPause.addTarget(self, action: #selector(pause), for: .touchDown)
        day.addTarget(self, action: #selector(dayTimer), for: .touchDown)
        hour.addTarget(self, action: #selector(hourTimer), for: .touchDown)
        
        i.alpha = 0
        i.isHidden = false
        
        //let everyMinuteTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self,
        //selector: #selector(updateLabel), userInfo: nil, repeats: true)
        /*
        override func didMoveToView(view: SKScene) {
            let main = SKSpriteNode(imageNamed: "user")
            main.xScale = 0.15
            main.yScale = 0.15
            main.zPosition = 1
            let circle = UIBezierPath(rect: CGRect(x:600, y: 600, width:600, height:600))
            let circularMove = SKAction.follow(circle.cgPath, asOffset: false, orientToPath: true, duration: 5)
            main.run(SKAction.repeat(circularMove, count: 2))
            view.addChild(main)
        }
       */
        
        
        
        
        if (closed == true) {
            print("Hello")
            cashBalance += Double(loanValue)
        }
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
    @objc func itemsAction(sender: UIButton) {
        getItemsView().alpha = 0
        view.addSubview(getItemsView())
        UIView.animate(withDuration: 3, delay: 2/10, options: .curveEaseOut, animations: {
           getItemsView().alpha = 1
        })
        getItemsView().isHidden = false
        test.isHidden = false
        funds.isEnabled = false
        
    }
    
    @objc func pause(sender: UIButton) {
        createRate = 0.0
        cellLifetime = 0.0
        updateTimer?.invalidate()
        timerHour?.invalidate()
        timerDay?.invalidate()
        pausedBefore = true
        EmitterView().removeFromSuperview()
        view.sendSubviewToBack(EmitterView())
        EmitterView().isHidden = true
    }
    @objc func hourTimer() {
        hourText.text = String(currentHour!)
        currentHour! += 1
        startDeductions()
        print(maxHour)
        if currentHour! > maxHour! {
            
            maxDay!+=1
            
            DispatchQueue.main.async { [self] in
                timerDay = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(dayTimer), userInfo: nil, repeats: true)
                if (currentDay == nil) {
                    currentDay = 0
                }
                currentHour = 0
                
            }
 
        }
    }
    @objc func dayTimer() {
        if currentDay! < maxDay! {
            currentDay!+=1
        }
        dayText.text = String(currentDay!)
        
    }
    
    @objc func updateLabel() {
        customerFormula()
        view.addSubview(EmitterView())
        if (EmitterView().isHidden == true) {
            print("HELLO")
        }
        DispatchQueue.main.async { [self] in
            maxCount = 100
            if (pausedBefore == false) {
                currentCount = 0
            }
            
            
            updateTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(startWatch), userInfo: nil, repeats: true)
        }
        DispatchQueue.main.async { [self] in
            maxHour = 24
            if (pausedBefore == false) {
                currentHour = 0
            }
            maxDay = 0
            timerHour = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(hourTimer), userInfo: nil, repeats: true)
        }
        /*
        var i = 0
        while (i<=60) {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                i+=1
                stopWatch.text = String(i)
            }
            if (i==60) {
                i=0
            }
        }
         */
    }

    @objc func empAction(sender: UIButton) {
        getEmployeeView().alpha = 0
        view.addSubview(getEmployeeView())
        UIView.animate(withDuration: 3, delay: 2/10, options: .curveEaseOut, animations: {
           getEmployeeView().alpha = 1
        })
        getEmployeeView().isHidden = false
        close3.isHidden = false
        emp.isEnabled = false
        
    }
    
    @objc func startWatch(sender: UIButton) {
        stopWatch.text = "Number of Customers: " + String(currentCount!)
        currentCount! += Int(calcImpact()*2)
        let myPrice = calcPrice()
        cashBalance = cashBalance + Double((4*currentCount!) + Int(myPrice))
        cashAmnt.text = "$" + String(cashBalance)
        if currentCount! > maxCount! {
            updateTimer?.invalidate()
            updateTimer = nil
            maxCount = nil
            currentCount = nil
        }
    }
    
    @objc func close3Action(sender: UIButton) {
        close3.fadeOut()
        let mDot = "managerDot.png"
        let image = UIImage(named: mDot)
        var i = 0
        var space = 0
        while(i<Int(manQuant)) {
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 620, y: 200 + space, width: 60, height: 56)
            view.addSubview(imageView)
            imageView.startRotating()
            
            
            space += 180
            i+=1
        }
        let bDot = "baristaDot.png"
        let bImage = UIImage(named: bDot)
        var b = 0
        var spaceB = 0
        print(servQuant)
        while(b<Int(baristQuant)) {
            let bView = UIImageView(image: bImage!)
            bView.frame = CGRect(x: 120 + spaceB, y: 520, width: 51, height: 52)
            view.addSubview(bView)
            bView.startRotating()
            
            
            spaceB += 180
            b+=1
        }
        let sDot = "serverDot.png"
        let sImage = UIImage(named: sDot)
        var s = 0
        var spaceS = 0
        print(servQuant)
        while(s<Int(servQuant)) {
            let sView = UIImageView(image: sImage!)
            sView.frame = CGRect(x: 480 - spaceS, y: 700, width: 60, height: 52)
            view.addSubview(sView)
            sView.startRotating()
            
            
            spaceS += 180
            s+=1
        }
    }
    
    @objc func closeAction(sender: UIButton) {
        let itemExpenses = (eQuantity * Float(espressoPrice)) + (cQuantity * Float(cupPrice)) + (sQuantity * Float(steamerPrice))
        cashBalance = cashBalance - Double(itemExpenses)
        cashAmnt.text = "$" + String(cashBalance)
        close2.isHidden = true
        let cups = "cupRack.png"
        let image = UIImage(named: cups)
        var i = 0
        var space = 0
        while(i<Int(cQuantity)) {
            let imageView = UIImageView(image: image!)
            imageView.frame = CGRect(x: 120 + space, y: 200, width: 120, height: 135)
            view.addSubview(imageView)
            space += 180
            i+=1
        }
        let esp = "espMachine.png"
        let espImage = UIImage(named: esp)
        var a = 0
        var aSpace = 0
        while(a<Int(eQuantity)) {
            let espView = UIImageView(image: espImage!)
            espView.frame = CGRect(x: 120 + aSpace, y: 390, width: 96, height: 108)
            view.addSubview(espView)
            aSpace += 180
            a+=1
        }
        let stea = "steamer.png"
        let steaImage = UIImage(named: stea)
        var s = 0
        var sSpace = 0
        while(s<Int(sQuantity)) {
            let steaView = UIImageView(image: steaImage!)
            steaView.frame = CGRect(x: 120 + sSpace, y: 580, width: 96, height: 108)
            view.addSubview(steaView)
            sSpace += 180
            s+=1
        }
    }
        
    
    @objc func storeAction(sender: UIButton) {
        getStoreView().alpha = 0
        view.addSubview(getStoreView())
        UIView.animate(withDuration: 3, delay: 2/10, options: .curveEaseOut, animations: {
            getStoreView().alpha = 1
        })
        getStoreView().isHidden = false
        close2.isHidden = false
        item.isEnabled = false
    }
    
    @objc func add(sender: UIButton) {
        print(getItemsView().isHidden)
        cashBalance = cashBalance + Double(loanValue)
        cashAmnt.text = "$" + String(cashBalance)
        netWorth = netWorth - Int(loanValue)
        netWrth.text = "$" + String(netWorth)
        DispatchQueue.main.async() {
            getItemsView().removeFromSuperview()
            getItemsView().isHidden = true
            self.view.sendSubviewToBack(getItemsView())
        }
        test.fadeOut()
        test.isHidden = true
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
                
                item.alpha = 0
                item.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    item.alpha = 1
                })
                
                emp.alpha = 0
                emp.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    emp.alpha = 1
                })
                
                markView.alpha = 0
                markView.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    markView.alpha = 1
                })
                
                
                funds.alpha = 0
                funds.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    funds.alpha = 1
                })
                
                start.alpha = 0
                start.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    start.alpha = 1
                })
                
                myPause.alpha = 0
                myPause.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    myPause.alpha = 1
                })
                
                hour.alpha = 0
                hour.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    hour.alpha = 1
                })
                hourText.alpha = 0
                hourText.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    hourText.alpha = 1
                })
                day.alpha = 0
                day.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    day.alpha = 1
                })
                dayText.alpha = 0
                dayText.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    dayText.alpha = 1
                })
                
                stopWatch.alpha = 0
                stopWatch.isHidden = false
                UIView.animate(withDuration: 3, delay: 5/10, options: .curveEaseOut, animations: {
                    stopWatch.alpha = 1
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

func customerFormula() {
    
    if (manQuant == 0) {
        createRate = 0.0
    }
    if (servQuant == 0) {
        createRate = 0.0
    }
    if (baristQuant == 0) {
        createRate = 0.0
    }
    if (eQuantity == 0.0) {
        createRate = 0.0
    }
    if (sQuantity == 0.0) {
        createRate = 0.0
    }
    if (cQuantity == 0) {
        createRate = 0.0
    }
    else {
        createRate = Double(calcImpact())
    }
}



func calcPrice() -> Float {
    
    let employeeImpact = (manQuant * Float(mImpact)) + (servQuant * Float(sImpact)) + (baristQuant * Float(bImpact))
    let machineImpact = (eQuantity * Float(espressoImpact)) + (sQuantity * Float(sImpact)) + (cQuantity * Float(cupsImpact))
    let totalImpact = (employeeImpact + machineImpact) * 1.2
    return totalImpact
}

func calcImpact() -> Float {
    let employeeImpact = (manQuant * Float(mImpact)) + (servQuant * Float(sImpact)) + (baristQuant * Float(bImpact))
    let machineImpact = (eQuantity * Float(espressoImpact)) + (sQuantity * Float(sImpact)) + (cQuantity * Float(cupsImpact))
    let totalImpact = employeeImpact + machineImpact
    return totalImpact
}

func startDeductions() {
    let hourExpenses = (manQuant * Float(managerPrice)) + (servQuant * Float(serverPrice)) + (baristQuant * Float(bImpact))
    cashBalance = cashBalance - Double(hourExpenses)
    cashAmnt.text = "$" + String(Int(cashBalance))
    
}


public extension UIView {
    func startRotating(duration: Double = 1) {
        let kAnimationKey = "rotation"
         
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Float(Double.pi * 2)
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }
    func stopRotating() {
        let kAnimationKey = "rotation"
         
        if self.layer.animation(forKey: kAnimationKey) != nil {
            self.layer.removeAnimation(forKey: kAnimationKey)
        }
    }
}

extension Date {
    func adding(minutes: Int) -> Date {
        return Calendar.current.date(byAdding: .minute, value: minutes, to: self)!
    }
}


let master = TitleViewController()
master.preferredContentSize = frameOfMainView
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = master
