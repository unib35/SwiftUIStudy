import SwiftUI
struct Progressdemo: View {
    @State private var progress: Double = 0.0
    
    var body: some View {
        VStack {
            ProgressView(value: progress, total: 100)
                .progressViewStyle(LinearProgressViewStyle())
                .padding()//진행률 뷰에 패딩 추가
            
            Button(action: {
                // 버튼 활성화로 액션 > 예시로 10%씩 증가
                if progress < 100 {
                    progress += 10
                    if progress == 100 {//원복
                        progress = 0
                        
                    }
                }
            }) { //버튼 라벨 스타일
                Text("    진 행 측 도    ")
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}






import SwiftUI
struct Progressdemo: View {
    @State private var progress: Double = 0.0

    var body: some View {
        VStack {
            ZStack {
                Circle()
                    .stroke(lineWidth: 20.0)
                    .opacity(0.3) //반투명
                    .foregroundColor(Color.blue)

                Circle()
                    .trim(from: 0.0, to: min(progress / 100, 1.0))
                    .stroke(style: StrokeStyle(lineWidth: 20.0, lineCap: .round, lineJoin: .round))
                    .foregroundColor(Color.blue)
                    .rotationEffect(Angle(degrees: 270.0))
                    .animation(.linear)

                Text(String(format: "%.0f %%", min(progress, 100.0)))
                    .font(.largeTitle)
                    .bold()
            }
            .padding(40)

            Button(action: {
                if progress >= 100 {
                    progress = 0
                } else {
                    progress += 10
                }
            }) {
                Text("   진 행 척 도  ")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
        }
    }
}


#Preview {
    Progressdemo()
}
