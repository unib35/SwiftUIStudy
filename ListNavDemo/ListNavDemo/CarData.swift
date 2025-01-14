//
//  CarData.swift
//  ListNavDemo
//
//  Created by 이종민 on 1/14/25.
//

import Foundation

var carData: [Car] = loadJson("carData.json")

func loadJson<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else { fatalError("Couldn't find \(filename)")}
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError(error.localizedDescription)
    }
    
    do {
        let decoder = JSONDecoder()
        let result = try decoder.decode(T.self, from: data)
        return result
    } catch {
        fatalError("Unable to parse \(filename): \(error.localizedDescription)")
    }
}
