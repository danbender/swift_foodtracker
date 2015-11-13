import UIKit

class DetailViewController: UIViewController {

    var usdaItem:USDAItem?
    
    @IBOutlet weak var textView: UITextView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "usdaItemDidComplete", name: kUSDAItemCompleted, object: nil)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    deinit {
        NSNotificationCenter.defaultCenter().removeObserver(self)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func usdaItemDidComplete(notification: NSNotification) {
        print("usdaItemDidComplete in DetailViewController")
        usdaItem = notification.object as? USDAItem
    }

    
    @IBAction func eatItBarButtonItemPressed(sender: UIBarButtonItem) {
    }
    
    
    func createAttributedString(usdaItem: USDAItem!) -> NSAttributedString {
        var itemAttributedString = NSMutableAttributedString()
        
        var centeredParapgraphSTyle = NSMutableParagraphStyle()
        centeredParapgraphSTyle.alignment = NSTextAlignment.Center
        centeredParapgraphSTyle.lineSpacing = 10.0
        
        var titleAttributesDictionary = [
            NSForegroundColorAttributeName: UIColor.blackColor(),
            NSFontAttributeName: UIFont.boldSystemFontOfSize(22.0),
            NSParagraphStyleAttributeName: centeredParapgraphSTyle
        ]
        
        let titleString = NSAttributedString(string: "\(usdaItem.name)\n", attributes: titleAttributesDictionary)
        
        itemAttributedString.appendAttributedString(titleString)
        
        return itemAttributedString
    }
}
