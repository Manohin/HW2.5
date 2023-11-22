//
//  Movie.swift
//  HW2.5
//
//  Created by Alexey Manokhin on 22.11.2023.
//

import Foundation

struct Movie {
    let name: String
    let releaseDate: String
    let poster: String
    
    static func getUsers() -> [Movie] {
        [
            Movie(name: "Зеленая миля", releaseDate: "1999", poster: "GreenMile"),
            Movie(name: "Побег из Шоушенка", releaseDate: "1994", poster: "Shawshank"),
            Movie(name: "Intouchables", releaseDate: "2011", poster: "Intouchables"),
            Movie(name: "Список Шиндлера", releaseDate: "1993", poster: "Schindler"),
            Movie(name: "Интерстеллар", releaseDate: "2014", poster: "Interstellar"),
            Movie(name: "Бойцовский клуб", releaseDate: "1999", poster: "FightClub"),
            Movie(name: "Шрэк", releaseDate: "2001", poster: "Shrek"),
            Movie(name: "Форрест Гамп", releaseDate: "1994", poster: "Gump"),
            Movie(name: "Король Лев", releaseDate: "1994", poster: "LionKing"),
            Movie(name: "Достучаться до небес", releaseDate: "1996", poster: "KnockinHeavenDoor")
        ]
    }
}
