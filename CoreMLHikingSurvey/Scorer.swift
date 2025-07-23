//
//  Scorer.swift
//  CoreMLHikingSurvey
//
//  Created by Iraniya Naynesh on 22/07/25.
//

import Foundation
import NaturalLanguage

class Scorer {
  let tagger = NLTagger(tagSchemes: [.sentimentScore])
  
  func score(_ text: String) -> Double {
    var sentimentScore = 0.0
    tagger.string = text
    tagger.enumerateTags(
      in: text.startIndex..<text.endIndex,
      unit: .paragraph,
      scheme: .sentimentScore,
      options:[]) {  sentimentTag, _ in
        if let sentimentString = sentimentTag?.rawValue,
           let score = Double(sentimentString) {
          sentimentScore = score
        }
        return false
      }
    
    return sentimentScore
  }
}
