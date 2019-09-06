//
//  ViewController.swift
//  SillySong
//
//  Created by Brian Diesel on 9/6/19.
//  Copyright © 2019 DesignCondition. All rights reserved.
//

import UIKit

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}


class ViewController: UIViewController {

    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var lyricsOutput: UITextView!
    
    let bananaFanaTemplate = [
        "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
        "Banana Fana Fo F<SHORT_NAME>",
        "Me My Mo M<SHORT_NAME>",
        "<FULL_NAME>"].joined(separator: "\n")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameInput.delegate = self
    }
    
    func shortNameFromName(name: String) -> String {
        var short_name = name.lowercased()
        if !["a", "e", "i", "o", "u"].contains(short_name[short_name.startIndex]){
            short_name.remove(at: short_name.startIndex)
        }
        return String(short_name)
    }
    
    func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
        let shortName = shortNameFromName(name: fullName)
        let lyrics = lyricsTemplate
            .replacingOccurrences(of: "<FULL_NAME>", with: fullName)
            .replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
        return lyrics
    }

    @IBAction func reset(_ sender: Any) {
        nameInput.text = ""
        lyricsOutput.text = ""
    }
    
    @IBAction func displayLyrics(_ sender: Any) {
        lyricsOutput.text = lyricsForName(lyricsTemplate: bananaFanaTemplate, fullName: nameInput.text!)
    }
}

