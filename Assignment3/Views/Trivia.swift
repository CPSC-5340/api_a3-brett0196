//
//  Trivia.swift
//  Assignment3
//
//  Created by Brett Williams on 3/25/23.
//

import SwiftUI

struct Trivia: View {
    
    @ObservedObject var triviavm = TriviaViewModel()
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(triviavm.triviaData){trivia in
                    NavigationLink{
                       TriviaDetail(trivia: trivia)
                    }label:{
                        Text(trivia.category)
                    }
                    
                }
            }
            .task{
                await triviavm.fetchData()
            }
            .listStyle(.grouped)
            .navigationTitle("Trivia")
            .alert(isPresented: $triviavm.hasError, error: triviavm.error){
                Text("")
            }
        }
    }
}

struct Trivia_Previews: PreviewProvider {
    static var previews: some View {
        Trivia()
    }
}
