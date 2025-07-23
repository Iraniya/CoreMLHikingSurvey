//
//  ContentView.swift
//  CoreMLHikingSurvey
//
//  Created by Iraniya Naynesh on 22/07/25.
//

import SwiftUI

struct ContentView: View {
  @FocusState private var textFieldIsFocused: Bool
  @State var responses: [Response] = []
  @State private var responseText = ""
  var scorer = Scorer()
  
  func saveResponse(text: String) {
    let score = scorer.score(text)
    let response = Response(text: text, score: score)
    responses.insert(response, at: 0)
  }
  
  var body: some View {
    VStack {
      Text("Opinions on Hiking")
        .frame(width: .infinity)
        .font(.title)
        .padding(.top, 24)
      
      ScrollView {
        ForEach(responses) { response in
          ResponseView(response: response)
        }
      }
      HStack {
        TextField("What do you think about hiking?", text: $responseText)
          .textFieldStyle(.roundedBorder)
          .lineLimit(5)
        Button("Done") {
          guard !responseText.isEmpty else { return }
          saveResponse(text: responseText)
          responseText = ""
          textFieldIsFocused = false
        }
        .padding(.horizontal, 4)
      }
      .padding(.bottom, 8)
    }
    .onAppear{
      for response in Response.sampleResponses {
        saveResponse(text: response)
      }
    }
    .padding()
    .background(Color(white: 0.94))
  }
}

#Preview {
  ContentView()
}

