//
//  AVSpeechManager.swift
//  AVSpeechTest
//
//  Created by Daisuke T on 2019/08/05.
//  Copyright © 2019 DaisukeT. All rights reserved.
//

import Foundation
import AVFoundation

class AVSpeechManager {
  public static let sharedInstance = AVSpeechManager()
  private init() {}
  
  private let synthesizer = AVSpeechSynthesizer()
  public var lang = "ja-JP"
  public var text = ""
  
  public func play() {
    // 発音を準備する
    let utterance = AVSpeechUtterance.init(string: self.text)
    let voice = AVSpeechSynthesisVoice.init(language: lang)
    utterance.voice = voice
    
    // 一旦停止する
    stop()
    
    // 再生する
    synthesizer.speak(utterance)
  }
  
  public func stop() {
    guard synthesizer.isSpeaking else {
      return
    }
    
    synthesizer.stopSpeaking(at: .immediate)  // 即時停止
    // synthesizer.stopSpeaking(at: .word) // 単語単位で停止
  }
  
}

