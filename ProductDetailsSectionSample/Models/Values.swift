//
//  Values.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import Foundation
struct Values : Codable {
	let reviews : [Reviews]?
	let rating : Int?
	let totalReviewCount : Int?
    let text : String?
    let list : [String]?

	enum CodingKeys: String, CodingKey {

		case reviews = "reviews"
		case rating = "rating"
		case totalReviewCount = "totalReviewCount"
        case text = "text"
        case list = "list"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		reviews = try values.decodeIfPresent([Reviews].self, forKey: .reviews)
		rating = try values.decodeIfPresent(Int.self, forKey: .rating)
		totalReviewCount = try values.decodeIfPresent(Int.self, forKey: .totalReviewCount)
        text = try values.decodeIfPresent(String.self, forKey: .text)
        list = try values.decodeIfPresent([String].self, forKey: .list)
	}

}
