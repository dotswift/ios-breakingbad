import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var nameTable: UITableView!
    var characterNameList: [String] = []
    var characters: [Character] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureNameTable()
        
        BreakingBadService.getCharacters(parameters: BreakingBadApiConstants.paramCharacters, characterId: nil, completion: { response in
            
            self.characters = response
            
            DispatchQueue.main.async {
                
                for i in 0...response.count-1 {
                    
                    self.characterNameList.append(self.characters[i].name)
                }
                self.nameTable.reloadData()
            }
        })
    }
    
    // Configure Table View containing names of all characters
    private func configureNameTable() {
        nameTable.delegate = self
        nameTable.dataSource = self
    }
    
    // Determines how many rows are in the Table View
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characterNameList.count
    }
    
    // Put characters name in each cell
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = nameTable.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = characterNameList[indexPath.row]
        return cell
    }
}
