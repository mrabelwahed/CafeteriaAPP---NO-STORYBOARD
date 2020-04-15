//
//  cafteria.swift
//  Cafetria-No-Storyboard
//
//  Created by MahmoudRamadan on 4/14/20.
//  Copyright © 2020 MahmoudRamadan. All rights reserved.
//

import Foundation

enum CafteriaRating{
    case terrible
    case bad
    case good
    case moderate
    case great
}



class Cafteria{
    var name: String
    var rating:CafteriaRating
    var isFavorite: Bool
    
    init(name:String , rating:CafteriaRating , isFavorite : Bool = false) {
        self.name = name
        self.rating = rating
        self.isFavorite =  isFavorite
    }
}
