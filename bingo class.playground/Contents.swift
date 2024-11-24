//Unsure about this implementation, the BingoGame class is dependant on other classes, could use protocols but oh well
//Tried to emphasise the single responsibility principle... the code could be simplified

struct Ball{
    let value: Int
    init(value: Int) {
        self.value = value
    }
}

class RevolvingContainer{
    var numbers = Set(1...90)
    
    func spin() -> Ball {
        let selected = numbers.randomElement()!
        numbers.remove(selected)
        return Ball(value: selected)
        
        
    }
}

class Tray{
    private var trayContents = [Ball](repeating: Ball(value: 0), count: 90)
    
    func addNewBall(ball : Ball){
        trayContents[ball.value-1] = ball
    }
    
    func viewTray(){
        for i in 0..<9 {
            let startIndex = i * 10
            let endIndex = startIndex + 10
            let row = trayContents[startIndex..<endIndex]
            let rowValues = row.map { "\($0.value)" }
            print(rowValues.joined(separator: "\t"))
        }
    }
}

class BingoGame{
    func run(){
        let rc = RevolvingContainer()
        var t = Tray()
        
        print("Welcome to UK style Bingo!")
        print("--------------------------------------")
        
        for x in 1...90{
            print("Round: \(x)")
            print("State of Ball Tray:")
            t.addNewBall(ball: rc.spin())
            t.viewTray()
            print("--------------------------------------")
        }
    }
}


var game = BingoGame()
game.run()


