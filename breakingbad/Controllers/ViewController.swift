import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            
            print("viewDidLoad() [Character].count == ", response.count)
        })
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: "9", completion: { response in
            
            print("viewDidLoad() Character nickname \(response[0].nickname)")
        })
    }
}
