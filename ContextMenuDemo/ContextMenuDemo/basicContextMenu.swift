//
//  basicContextMenu.swift
//  ContextMenuDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct basicContextMenu: View {
    var body: some View {
        Text("Turtle Rock")
            .padding()
            .border(Color.blue)
            .contextMenu {
                Button {
                    print("즐겨찾기에 추가됨")
                } label: {
                    Label("즐겨찾기에 추가", systemImage: "heart")
                }
                Button {
                    print("지도에서 보기")
                } label: {
                    Label("지도에서 보기", systemImage: "mappin")
                }
            }
        
        Text("옵션")
            .padding()
            .border(Color.red)
            .contextMenu {
                Section {
                    Button("복사", action: { print("복사됨") })
                    Button("붙여넣기", action: { print("붙여넣기") })
                }
                Section {
                    Button("삭제", action: { print("삭제됨") })
                }
            }
    }
}

#Preview {
    basicContextMenu()
}
