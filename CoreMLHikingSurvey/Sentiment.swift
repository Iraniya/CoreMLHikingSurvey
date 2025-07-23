//
//  Sentiment.swift
//  CoreMLHikingSurvey
//
//  Created by Iraniya Naynesh on 22/07/25.
//

import Foundation
import SwiftUI

enum Sentiment {
  case positive
  case negative
  case moderate
  
  init(_ score: Double) {
    if score > 0.2 {
      self = .positive
    } else if score < -0.2 {
      self = .negative
    } else {
      self = .moderate
    }
  }
  
  var icon: String {
    switch self {
    case .positive:
      return "chevron.up.2"
    case .negative:
      return "chevron.down.2"
    case .moderate:
      return "minus"
    }
  }
  
  var sentimentColor: Color {
    switch self {
    case .positive:
      return Color(red: 0.99, green: 0.49, blue: 0.00)
    case .negative:
      return Color(red: 0.08, green: 0.22, blue: 0.41)
    case .moderate:
      return Color(red: 0.00, green: 0.44, blue: 0.49)
    }
  }
}
