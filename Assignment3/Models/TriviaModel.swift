//
//  TriviaModel.swift
//  Assignment3
//
//  Created by Brett Williams on 3/25/23.
//

import Foundation

struct TriviaResults : Codable{
    let response_code : Int
    let results : [TriviaModel]
}


struct TriviaModel:Codable, Identifiable{
    var id : UUID{
        return UUID()
    }
    let category: String
    let question : String
    let correct_answer : String
}

