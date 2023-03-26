//
//  TriviaAnswer.swift
//  Assignment3
//
//  Created by Brett Williams on 3/25/23.
//

import SwiftUI

struct TriviaAnswer: View {
    var answer: String
    var body: some View {
        ScrollView(.vertical){
            Text("Scroll for Answer!")
            Text(answer)
        }
        .font(.system(size: 26))
        .frame(width:300, height: 30)
    }
}

struct TriviaAnswer_Previews: PreviewProvider {
    static var previews: some View {
        TriviaAnswer(answer: "True")
    }
}
