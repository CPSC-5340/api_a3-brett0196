//
//  TriviaDetail.swift
//  Assignment3
//
//  Created by Brett Williams on 3/25/23.
//

import SwiftUI

struct TriviaDetail: View {
    var trivia : TriviaModel
    var body: some View {
        VStack{
            Spacer()
            Text(trivia.question)
                .font(.system(size: 18))
                .padding()
            Spacer()
            HStack{
                Group{
                    TriviaAnswer(answer: trivia.correct_answer)
                }
                .padding()
            }
            Spacer()
        }
    }
}

/*
struct TriviaDetail_Previews: PreviewProvider {
    static var previews: some View {
        TriviaDetail()
    }
}*/
