//
//  DeleteViewContextMenu.swift
//  ContextMenuDemo
//
//  Created by 이종민 on 1/15/25.
//

import SwiftUI

struct DeleteViewContextMenu: View {
    @State private var items = ["아이템 1", "아이템 2", "아이템 3", "아이템 4"]
        
        var body: some View {
            VStack {
                // 리스트 표시
                List {
                    ForEach(items, id: \.self) { item in
                        Text(item)
                            .padding()
                            .contextMenu {
                                Button(role: .destructive) {
                                    deleteItem(item: item)
                                } label: {
                                    Label("삭제", systemImage: "trash")
                                }
                            }
                    }
                }
                .listStyle(InsetGroupedListStyle())
            }
            .padding()
        }
        
        // 아이템 삭제 함수
        private func deleteItem(item: String) {
            if let index = items.firstIndex(of: item) {
                items.remove(at: index)
            }
        }
}

#Preview {
    DeleteViewContextMenu()
}
