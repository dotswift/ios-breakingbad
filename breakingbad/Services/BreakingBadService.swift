import Foundation

class BreakingBadService {
    
    static func getCharacters(parameters: String, completion: @escaping ([Character]) -> Void) {
        
        let url: String = "\(BreakingBadApiConstants.baseUrl)\(parameters)"
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
    
    static func getCharacterById(parameters: String, completion: @escaping ([Character]) -> Void) {
        
        let url: String = "\(BreakingBadApiConstants.baseUrl)\(parameters)"
        print("[Started] getCharacterById() url == ", url)
        URLSession.shared.dataTask(with: URL(string: url)!, completionHandler: {data, response, error in
            
            guard let data = data, error == nil else {
                return
            }
            
            do {
                let response: [Character] = try JSONDecoder().decode([Character].self, from: data)
                completion(response)
                print("[Success] getCharacterById() Character.name == ", response[0].name)
            } catch {
                print("[Error] getCharacterById() ==", error.localizedDescription)
            }
            
        }).resume()
    }
}
