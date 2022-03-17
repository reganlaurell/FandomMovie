//
//  ParseUtil.swift
//  FandomMovie
//
//  Created by Regan Laurell on 3/16/22.
//

import Foundation

enum JsonParseUtility<T: Codable> {
    static func decodeJson(url: URL) -> T? {
        do {
            let data = try Data(contentsOf: url)
            return JsonParseUtility<T>.parse(json: data)
        } catch {
            print("Data error: \(error)")
            return nil
        }
    }
    
    static private func parse(json: Data) -> T? {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        
        do {
            let jsonValue = try decoder.decode(T.self, from: json)
            return jsonValue
        } catch {
            print("Decoder error: \(error)")
            return nil
        }
    }
}
