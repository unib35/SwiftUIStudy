//
//  ContentView.swift
//  ListNavDemo
//
//  Created by 이종민 on 1/14/25.
//

import SwiftUI

struct ContentView: View {
    // CarStore 인스턴스를 상태로 관리
    @State var carStore = CarStore(cars: carData)
    // 네비게이션 스택의 경로를 관리하는 상태 변수
    @State var stackPath = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $stackPath) {
            List {
                ForEach(carStore.cars) { car in
                    NavigationLink(value: car) {
                        ListCell(car: car)
                    }
                }
                .onDelete(perform: deleteCar)
                .onMove(perform: moveCar)
            }
            .navigationTitle(Text("Ev Cars"))
            .toolbar{
                ToolbarItem(placement: .topBarLeading, content: {
                    NavigationLink(value: "Add Car") {
                        Text("Add")
                            .foregroundStyle(.blue)
                    }
                })
                ToolbarItem(placement: .topBarTrailing, content: {
                    EditButton()
                })
            }
            .navigationDestination(for: String.self) { menuString in
                if menuString == "Add Car" {
                    AddNewCar(carStore: carStore, path: $stackPath)
                }
                
            }
            .navigationDestination(for: Car.self) { car in
                CarDetail(selectedCar: car)
            }
        }
        
    
    }
    func deleteCar(offsets: IndexSet) {
        carStore.cars.remove(atOffsets: offsets)
    }
    
    func moveCar(from source: IndexSet, to destination: Int) {
        carStore.cars.move(fromOffsets: source, toOffset: destination)
    }
}

#Preview {
    ContentView()
}


struct ListCell: View {
    var car: Car
    
    var body: some View {
        HStack {
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 60)
                .cornerRadius(16)
            Text(car.name)
        }
    }
}
