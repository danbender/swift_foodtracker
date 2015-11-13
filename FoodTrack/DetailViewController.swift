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

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func usdaItemDidComplete(notification: NSNotification) {
        usdaItem = notification.object as? USDAItem
        
    }

    @IBAction func eatItBarButtonItemPressed(sender: UIBarButtonItem) {
    }
}
