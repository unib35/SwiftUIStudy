//
//  ContentView.swift
//  OXQuizApp
//
//  Created by 이종민 on 1/10/25.
//

import SwiftUI

struct ContentView: View {
    let setRandomNumMax: Int = 10
    let setRandomNumMin: Int = 1
    let opList: [Character] = ["+", "-", "*", "/"]
    
    @State var number1: Int
    @State var number2: Int
    @State var resultNumber: Int = 9
    @State var countCorrect: Int = 0
    @State var countWrong: Int = 0
    @State var op: Character
    
    
    var body: some View {
        // UI 구성 및 로직 작성 부분
        Spacer()
        Text("다음 수식은 맞을까요?")
            .font(.largeTitle)
        Spacer()
        Text("\(number1) \(op) \(number2) = \(resultNumber)")
            .font(.largeTitle)
        Spacer()
        
        HStack(alignment: .center, spacing: 5) {
            Spacer()
            Button(action: {
                selectCorrect()
                print(#fileID, #function, #line, "- 맞음 버튼 클릭")
            }) {
                HStack(spacing: 0){
                    Image(systemName: "checkmark.circle.fill")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.green)
                    Text("맞음")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.green)
                }
                
            }
            
            Spacer()
            Button(action: {
                selectWrong()
                print(#fileID, #function, #line, "- 틀림 버튼 클릭")
            }) {
                HStack(spacing: 0) {
                    Image(systemName: "x.circle")
                        .font(.largeTitle)
                        .padding()
                        .foregroundStyle(.red)
                    Text("틀림")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundStyle(.red)
                }
            }
            Spacer()
        }
        
        Spacer()
        
        HStack {
            Spacer()
            Text("\(countCorrect)개 맞춤")
                .font(.largeTitle)
            Spacer()
            Text("\(countWrong)개 틀림")
                .font(.largeTitle)
            Spacer()
        }
        
        Spacer()
        
        Button(action: {
            reloadGame()
            print(#fileID, #function, #line, "- 카운트 초기화 버튼 클릭")
        }) {
            Text("카운트 초기화")
                .font(.largeTitle)
                .foregroundStyle(.blue)
            
        }
        Spacer()
    }
    
    init() {
        number1 = Int.random(in: setRandomNumMin...setRandomNumMax)
        number2 = Int.random(in: setRandomNumMin...setRandomNumMax)
        resultNumber = Int.random(in: setRandomNumMin...setRandomNumMax)
        op = opList.randomElement()!
    }
    
    func reloadGame() {
    // 게임 재시작 로직
        self.countWrong = 0
        self.countCorrect = 0
        
    }
    func selectCorrect() {
    // 정답 선택 시 로직
        if (calculateResult(number1, number2, op) == resultNumber) {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        resetNumbers()
    }
    func selectWrong() {
    // 오답 선택 시 로직
        if (calculateResult(number1, number2, op) != resultNumber) {
            countCorrect += 1
        } else {
            countWrong += 1
        }
        resetNumbers()
    }
    func resetNumbers() {
        //숫자 다시 뽑는 로직
        number1 = Int.random(in: setRandomNumMin...setRandomNumMax)
        number2 = Int.random(in: setRandomNumMin...setRandomNumMax)
        resultNumber = Int.random(in: 1...100)
        op = opList.randomElement()!
        
        
        
    }
    
    func calculateResult(_ num1 : Int, _ num2: Int, _ op: Character) -> Int {
        switch op {
        case "+":
            return num1 + num2
        case "-":
            return num1 - num2
        case "*":
            return num1 * num2
        case "/":
            return num1 / num2
        default:
            return 0
        }
    }
}

#Preview {
    ContentView()
}
