//
//  TriviaViewModel.swift
//  Assignment3
//
//  Created by Brett Williams on 3/25/23.
//

import Foundation

class TriviaViewModel : ObservableObject{
    @Published private(set) var triviaData = [TriviaModel]()
    @Published var hasError = false
    @Published var error : TriviaModelError?
    private let url = "https://opentdb.com/api.php?amount=5&type=boolean"
    
    @MainActor
    func fetchData() async{
        if let url = URL(string: url){
            do{
                let(data, _) = try await URLSession.shared.data(from: url)
                guard let results = try JSONDecoder().decode(TriviaResults?.self, from: data) else{
                    self.hasError.toggle()
                    self.error = TriviaModelError.decodeError
                    return
                }
                self.triviaData = results.results
            }catch{
                self.hasError.toggle()
                self.error = TriviaModelError.customErorr(error: error)
            }
        }
    }
}

extension TriviaViewModel{
    enum TriviaModelError:LocalizedError{
        case decodeError
        case customErorr(error: Error)
        
        var errorDescription: String?{
            switch self{
            case .decodeError:
                return "Decoding Error"
            case .customErorr(let error):
                return error.localizedDescription
            }
        }
    }
}
