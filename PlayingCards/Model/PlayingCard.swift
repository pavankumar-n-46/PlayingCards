//
//  PlayingCards.swift
//  PlayingCards
//
//  Created by Pavan Kumar N on 31/10/19.
//  Copyright © 2019 https://github.com/pavankumar-n-46. All rights reserved.
//

import Foundation

struct PlayingCard {
    
    var suit : Suit
    var rank : Rank
    
    enum Suit : String {
        case spades = "♠️"
        case hearts = "❤️"
        case clubs = "♣️"
        case diamonds = "♦️"
        
        static var all : [Suit] {
            return [Suit.spades,.clubs,.diamonds,.hearts]
        }
    }
    
    enum Rank  {
        case ace
        case face(String)
        case numeric(Int)
        
        var order : Int {
            switch self {
            case .ace : return 1
            case .numeric(let pips) : return pips
            case .face(let kind)  where kind == "J" : return 11
            case .face(let kind)  where kind == "Q" : return 12
            case .face(let kind)  where kind == "K" : return 13
            default : return 0
            }
        }
        
        static var all: [Rank] {
            var allRank = [Rank.ace]
            for pips in 2...10 {
                allRank.append(.numeric(pips))
            }
            allRank += [Rank.face("J"),.face("Q"),.face("K")]
            return allRank
        }
    }
}
