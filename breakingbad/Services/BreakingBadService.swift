import Foundation

class BreakingBadService {
    
    static func getCharacters(parameters: String, characterId: String?, completion: @escaping ([Character]) -> Void) {
        
        let url: String = "\(BreakingBadApiConstants.baseUrl)\(parameters)\(characterId ?? "")"
        
        print("[Started] getCharacters() url == ", url)
        
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response: [Character] = try JSONDecoder().decode([Character].self, from: data)
                completion(response)
                
                print("[Success] getCharacters() [Character].count == ", response.count)
                
            } catch {
                
                print("[Error] getCharacters() ==", error.localizedDescription)
                
            }
            
        }).resume()
    }
    
}
