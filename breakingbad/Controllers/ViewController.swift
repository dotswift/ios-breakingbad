import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, completion: { response in
            print("viewDidLoad() Character.count == ", response.count)
        })
        
        BreakingBadService.getCharacterById(parameters: "characters/8", completion: { response in
            print("viewDidLoad() Character.nickname == ", response[0].nickname)
        })
    }
}
