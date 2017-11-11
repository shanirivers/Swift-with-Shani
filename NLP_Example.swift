//: Playground - noun: a place where people can play
//https://developer.apple.com/documentation/foundation/nslinguistictagger/tokenizing_natural_language_text
// https://www.hackingwithswift.com/example-code/strings/how-to-parse-a-sentence-using-nslinguistictagger
//https://www.willowtreeapps.com/ideas/apples-natural-language-processing-nlp-api

import UIKit
import Foundation

let text = """
Every record has been destroyed or falsified, every book
rewritten, every picture has been repainted, every statue and street
building has been renamed, every date has been altered. And the process
is continuing day by day and minute by minute. History has stopped.
Nothing exists except an endless present in which the Party is always
right.
"""


let derText = """
Hoffnung ist nicht die Überzeugung dass etwas gut
ausgeht, sondern die Gewissheit, dass etwas Sinn hat - egal wie es
ausgeht.
"""

let namedText = """
Shani R. would like to meet Steve Wozniak, who
co-founded Apple Inc. which is located in Cupertino, California
"""

// - IDENTIFYING LANGUAGE -
print("\n- IDENTIFYING LANGUAGE - ")

// 1. Create a tagger instance
let langTagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.language], options: 0)

// 2. Bring in text
langTagger.string = derText

// 3. Return a single tag
print("\(langTagger.tag(at: 0, scheme: NSLinguisticTagScheme.language, tokenRange: nil, sentenceRange: nil)!)")

// - IDENTIFYING TOKENS -
print("\n- IDENTIFYING TOKENS - ")
/*// 1. Create some options
 let tokenOptions = NSLinguisticTagger.Options.omitWhitespace.rawValue |
 NSLinguisticTagger.Options.joinNames.rawValue | NSLinguisticTagger.Options.omitPunctuation.rawValue
 /* short hand */
 //let tokenOptions: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]
 
 
 // 2. Create an instance
 let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"),
 options: Int(tokenOptions))
 
 // 3. Bring in the text
 tagger.string = text
 
 // 4. Set the range
 let range = NSRange(location: 0, length: text.utf16.count)
 
 // 5. Enumerate over text to get the tags and tokens
 tagger.enumerateTags(in: range, scheme: NSLinguisticTagScheme.nameTypeOrLexicalClass,
 options: NSLinguisticTagger.Options(rawValue: tokenOptions)) { tag, tokenRange, sentenceRange, stop in
 let token = (text as NSString).substring(with: tokenRange)
 let tag = tag!._rawValue
 print("\(String(describing: tag)): \(token)")
 }
 
 short hand version of above: */
let tokenOptions: NSLinguisticTagger.Options = [.omitWhitespace, .omitPunctuation, .joinNames]


// 2. Create an instance
let tagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"),
                                options: Int(tokenOptions.rawValue))

// 3. Bring in the text
tagger.string = text

// 4. Set the range
let range = NSRange(location: 0, length: text.utf16.count)

// 5. Enumerate over text to get the tags and tokens
tagger.enumerateTags(in: range, scheme: .nameTypeOrLexicalClass, options: tokenOptions)
{ tag, tokenRange, sentenceRange, stop in
    let token = (text as NSString).substring(with: tokenRange)
    let tag = tag!._rawValue
    print("\(String(describing: tag)): \(token)")
}


// - LEMMATIZATION - //
print("\n- LEMMATIZATION - ")

// 1. Options
let lemmaOptions = NSLinguisticTagger.Options.omitPunctuation.rawValue |
    NSLinguisticTagger.Options.omitWhitespace.rawValue

// 2. Create instance
let lemmaTagger = NSLinguisticTagger(tagSchemes: [NSLinguisticTagScheme.lemma,
                                                  NSLinguisticTagScheme.nameTypeOrLexicalClass], options: 0)

// 3. Bring in text
lemmaTagger.string = derText

// 4. Set range
let lemmaRange = NSRange(location: 0, length: derText.utf16.count)

// 5. Enumerate over text and output only words that are different from the lemma
lemmaTagger.enumerateTags(in: lemmaRange, scheme: NSLinguisticTagScheme.lemma,
                          options: NSLinguisticTagger.Options(rawValue: lemmaOptions), using: {tag, tokenRange, sentenceRange, stop in
                            
                            let token = (derText as NSString).substring(with: tokenRange)
                            let testTag = String(tag!._rawValue)
                            if testTag != token
                            {
                                print("\(String(describing: testTag)): \(token)")
                            }
                            
})


// - NAMED ENTITY RECOGNITION -
print("\n- NAMED ENTITY RECOGNITION - ")

// 1. Define options
let namedOptions = NSLinguisticTagger.Options.omitPunctuation.rawValue |
    NSLinguisticTagger.Options.omitWhitespace.rawValue | NSLinguisticTagger.Options.joinNames.rawValue

// 2. Create an instance ( with availableTagSchemes specified for a particular language,
//if you know which lang it is, can make computting faster.
let namedTagger = NSLinguisticTagger(tagSchemes: NSLinguisticTagger.availableTagSchemes(forLanguage: "en"),
                                     options: Int(namedOptions))

// 3. Bring in text
namedTagger.string = namedText

// 4. Set range
let namedRange = NSRange(location: 0, length: namedText.utf16.count)

// 5. Enumerate over text and output only the entities
namedTagger.enumerateTags(in: namedRange, scheme: .nameType,
                          options: NSLinguisticTagger.Options(rawValue: namedOptions), using: { tag, tokenRange, _, stop in
                            let name = (namedText as NSString).substring(with: tokenRange)
                            let tag = String(describing: tag!._rawValue)
                            if tag != "OtherWord"
                            {
                                print("\(String(describing: tag)): \(name)")
                            }
})


// -- Combining multiple tag schemes ???





