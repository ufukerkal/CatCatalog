//
//  Favorites.swift
//  CatCatalog
//
//  Created by Hakkı Yiğit Yener on 22.04.2022.
//

import Foundation

class Favorites: ObservableObject {
    
    let defaults = UserDefaults.standard
    private let savekey="Favorites"
    @Published private(set) var catFavorite: [CatBreed]
    
    init() {
        if let data = UserDefaults.standard.data(forKey: savekey) {
                    if let decoded = try? JSONDecoder().decode([CatBreed].self, from: data) {
                        catFavorite = decoded
                        return
                    }
                }
        catFavorite = []
        }
    
    
   private func save() {
            if let encoded = try? JSONEncoder().encode(catFavorite) {
                UserDefaults.standard.set(encoded, forKey: savekey)
            }
    }

    func add(_ prospect: CatBreed) {
        catFavorite.append(prospect)
        save()
        }
    
    func contains(_ prospect: CatBreed) -> Bool {
        if  self.catFavorite.contains(where: { $0.id == prospect.id }) {
            return true
        }
        else {
           return false
        }
     }
    
    func remove(_ prospect: CatBreed) {
        objectWillChange.send()
        catFavorite.removeAll(where: { $0.id == prospect.id })
        save()
       }
    
    func getData(){
        if let data = UserDefaults.standard.data(forKey: savekey) {
            if let decoded = try? JSONDecoder().decode([CatBreed].self, from: data) {
                catFavorite = decoded
                return
            }
        }
        catFavorite = []
    }
}

	
