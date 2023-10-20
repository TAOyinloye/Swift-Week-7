func anagrams(word1: String, word2: String) -> Bool {
    
    //check same length to save time
    if word1.count != word2.count {
        return false
    }
    
    let orderedCharsFrom1 = Array(word1).sorted(by: <)
    let orderedCharsFrom2 = Array(word2).sorted(by: <)
    
    return orderedCharsFrom1 == orderedCharsFrom2
}