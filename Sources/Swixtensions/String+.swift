//
//  String+.swift
//  
//
//  Created by Branden Smith on 8/28/20.
//

import Foundation

public extension String {

    /// Returns a string with all the characters in the given set removed.
    /// - parameters:
    ///   - charactersInSet: the characters to remove
    /// - returns: the new string
    func removing(charactersInSet characters: CharacterSet) -> String {
        return self.components(separatedBy: characters).joined()
    }

    /// Returns an initials of the receiver, consisting of the capitalized first letter of up to the first
    /// `n` words. Words are determined by splitting on whitespace and the ASCII hyphen
    /// character `"-"`, and removing empty subsequences. Numbers are ignored.
    ///
    /// For less than `length` words, multiple letters are taken from the last word
    /// to fill the `length`.
    ///
    /// Example:
    /// ```
    /// "Apple over Android".abbreviated(length: 3)
    /// // results in "AOA"
    /// "iPhone".abbreviated()
    /// // results in "IP"
    /// ```
    ///
    /// - parameters:
    ///   - length: The number of words to abbreviate. Additional words will be ignored.
    /// - returns: The initials as a new string.
    func initials(length: Int = 2) -> String {
        let splitCharacters = CharacterSet(charactersIn: "-").union(.whitespaces)
        let nonAlphaCharacters = CharacterSet
            .alphanumerics
            .subtracting(CharacterSet(charactersIn: "0123456789"))
            .inverted

        let words = self
            .components(separatedBy: splitCharacters)
            .map { $0.removing(charactersInSet: nonAlphaCharacters)}
            .filter { !$0.isEmpty }
            .prefix(length)

        var abbreviation = words.map { $0.prefix(1).capitalized }.joined()

        // If the abbreviation is too short, append letters from the last word
        if abbreviation.count < length, let lastWord = words.last {
            let pad = lastWord.dropFirst().prefix(length - abbreviation.count).capitalized
            abbreviation.append(pad)
        }

        return abbreviation
    }
}
