//
//  ViewController.swift
//  AVSpeechTest
//
//  Created by Daisuke T on 2019/08/05.
//  Copyright © 2019 DaisukeT. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var labelText: UILabel!
  @IBOutlet weak var buttonEN: UIButton!
  @IBOutlet weak var buttonJA: UIButton!
  @IBOutlet weak var buttonPlay: UIButton!
  @IBOutlet weak var buttonStop: UIButton!
  
  let textMap: [String: String] = ["ja-JP": "我輩は猫である。名前はまだ無い。どこで生れたかとんと見当がつかぬ。何でも薄暗いじめじめした所でニャーニャー泣いていた事だけは記憶している。吾輩はここで始めて人間というものを見た。",
                                   "en-US": "I am a cat. There is no name yet. I have no idea where I was born. I remember only that I was crying in a dim and damp place. For the first time here I saw a human being."]
  
  override func viewDidLoad() {
    super.viewDidLoad()
    
    buttonEN.addTarget(self,
                       action: #selector(buttonActionEN(sender:)),
                       for: .touchUpInside)
    
    buttonJA.addTarget(self,
                       action: #selector(buttonActionJA(sender:)),
                       for: .touchUpInside)
    
    buttonPlay.addTarget(self,
                         action: #selector(buttonActionPlay(sender:)),
                         for: .touchUpInside)
    
    buttonStop.addTarget(self,
                         action: #selector(buttonActionStop(sender:)),
                         for: .touchUpInside)
    
    
    setLang("ja-JP")
    
  }
  
  @objc func buttonActionEN(sender: UIButton) {
    setLang("en-US")
  }
  
  @objc func buttonActionJA(sender: UIButton) {
    setLang("ja-JP")
  }
  
  @objc func buttonActionPlay(sender: UIButton) {
    AVSpeechManager.sharedInstance.play()
  }
  
  @objc func buttonActionStop(sender: UIButton) {
    AVSpeechManager.sharedInstance.stop()
  }
  
  func setLang(_ lang: String) {
    AVSpeechManager.sharedInstance.lang = lang
    AVSpeechManager.sharedInstance.text = textMap[AVSpeechManager.sharedInstance.lang]!
    
    labelText.text = textMap[AVSpeechManager.sharedInstance.lang]!
  }
  
}

