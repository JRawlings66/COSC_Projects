import UIKit

// ViewController class conforming to UITextFieldDelegate to handle text field interactions
class ViewController: UIViewController, UITextFieldDelegate {
    
    // Outlets connected to storyboard UI components
    @IBOutlet weak var outputLabel: UILabel!  // user input label
    @IBOutlet weak var inputTextField: UITextField!  // user input text field
    @IBOutlet weak var submitButton: UIButton!  // button to trigger action
    @IBOutlet weak var imageView: UIImageView!  // ImageView to display an image
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Setting the text field delegate to self to handle events
        self.inputTextField.delegate = self    
    }
    
    // Action function to display input text on the label when button is pressed
    @IBAction func getInput(_ sender: UIButton) {
        outputLabel.text = "Hello, " + (inputTextField.text ?? "")
    }
    
    // Dismiss keyboard when user taps outside the text field
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
    // Hide keyboard when return key is pressed
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        inputTextField.resignFirstResponder()
        return true
    }
}
