
import UIKit

class CharacterViewController: UIViewController {
    
    @IBOutlet weak var characterNameLabel: UILabel!
    @IBOutlet weak var characterNicknameLabel: UILabel!
    @IBOutlet weak var characterBirthdateLabel: UILabel!
    @IBOutlet weak var characterImage: UIImageView!
    
    var selectedCharacter: Character?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getSelectedCharacterData()
    }
    
    // Retrieve data for selected character after Segue from ViewController
    func getSelectedCharacterData(){
        self.characterNameLabel.text = selectedCharacter?.name
        self.characterNicknameLabel.text = selectedCharacter?.nickname
        self.characterBirthdateLabel.text = selectedCharacter?.birthday
        let url = URL(string: selectedCharacter!.img)
        self.characterImage.downloaded(from: url!)
    }
}

// Extension for downloading images for using img url
extension UIImageView {
    
    func downloaded(from url: URL, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        contentMode = mode
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                let image = UIImage(data: data)
            else { return }
            DispatchQueue.main.async() { [weak self] in
                self?.image = image
            }
        }.resume()
    }
    
    func downloaded(from link: String, contentMode mode: UIView.ContentMode = .scaleAspectFit) {
        guard let url = URL(string: link) else { return }
        downloaded(from: url, contentMode: mode)
    }
}
