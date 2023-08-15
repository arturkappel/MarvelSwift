//
//  MarvelResponse.swift
//  MarvelAppi
//
//  Created by Artur Kappel on 07/06/23.
//

import Foundation
enum FilterType: String, CaseIterable, Identifiable{
    case ascending = "Ascending"
    case descending = "Descending"

    var id: FilterType { self }
}
//class MarvelChar: Identifiable, ObservableObject {
//    var name: String
//    var id: UUID = UUID()
//    @Published var fav: Bool {
//        didSet {
//            if fav {
//                print("fav is true")
//                Marvel.shared.FavoritesMock.append(self)
//            } else {
//                print("fav is false")
//                if let index = Marvel.shared.FavoritesMock.firstIndex(where: { $0.id == self.id }) {
//                    Marvel.shared.FavoritesMock.remove(at: index)
//                }
//            }
//
//        }
//    }
//
//
//
//    init(name: String, fav: Bool) {
//        self.name = name
//        self.fav = fav
//    }
//}

//class Marvel: ObservableObject {
//    static var shared: Marvel = {
//        let instance = Marvel()
//        return instance
//    }()
//
//    @Published var MarvelMock: [MarvelCharacter] = [
//        MarvelCharacter(id: 0, name: "aaa", description: "aaaa", ),
//    ]
//
//    @Published var FavoritesMock: [MarvelChar] = [MarvelChar]()
//
//
//
//}



struct MarvelCharactersResponse: Decodable, Hashable {
    
    var code: Int
    var data: MarvelCharactersData
}

struct MarvelCharactersData: Decodable, Hashable {
    
    var offset: Int
    var limit: Int
    var total: Int
    var count: Int
    var results: [MarvelCharacter]
}

class MarvelCharacter: ObservableObject, Decodable, Hashable, Identifiable {
    var id: Int
    var name: String
    var description: String?
    var thumbnail: MarvelCharacterThumbnail? = nil
    @Published var isFavorite: Bool = false
    
    var sharableText: String {
        "\(name): \(description ?? "not found")"
    }
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case description
        case thumbnail
    }
    
    static func == (lhs: MarvelCharacter, rhs: MarvelCharacter) -> Bool {
        return lhs.id == rhs.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        name = try container.decode(String.self, forKey: .name)
        description = try container.decodeIfPresent(String.self, forKey: .description)
        thumbnail = try container.decodeIfPresent(MarvelCharacterThumbnail.self, forKey: .thumbnail)
    }
    
    init(id: Int, name: String, description: String?, thumbnail: MarvelCharacterThumbnail?, isFavorite: Bool = false) {
        self.id = id
        self.name = name
        self.description = description
        self.thumbnail = thumbnail
        self.isFavorite = isFavorite
    }
}

struct MarvelCharacterThumbnail: Decodable, Hashable {
    
    var path: String
    var `extension`: String
    
    var url: URL? {
        URL(string: "\(path).\(`extension`)")
    }
}

