import UIKit

class DetailViewController: UIViewController {

    var usdaItem:USDAItem?
    
    @IBOutlet weak var textView: UITextView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func eatItBarButtonItemPressed(sender: UIBarButtonItem) {
    }
}
