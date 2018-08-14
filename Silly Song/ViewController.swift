//
//  ViewController.swift
//  Silly Song
//
//  Created by Nicholas Kim on 8/13/18.
//  Copyright © 2018 Jamong Studios. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var nameField: UITextField!
  @IBOutlet weak var lyricsView: UITextView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    nameField.delegate = self
  }

  @IBAction func reset(_ sender: Any) {
    nameField.text = ""
    lyricsView.text = ""
  }
  
  @IBAction func displayLyrics(_ sender: Any) {
    let fullName = nameField.text!
    lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: fullName)
  }
  
  func shortNameFromName(name: String) -> String {
    var name = name.lowercased()
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    let firstVowelOccurrence = name.rangeOfCharacter(from: vowelSet)!.lowerBound.encodedOffset
    return String(name.suffix(name.characters.count - firstVowelOccurrence))
  }
  
  func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    return lyricsTemplate
      .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
      .replacingOccurrences(of: "<SHORT_NAME>", with: shortNameFromName(name: fullName))
  }
  
  let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")
  
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
  func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    textField.resignFirstResponder()
    return false
  }
}
