//
//  Reviews.swift
//  ZivameAssign
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import Foundation
struct Reviews : Codable {
	let description : String?
	let rating : Int?
	let likes : Int?
	let timeLine : String?
	let reviewId : Int?
	let customerName : String?

	enum CodingKeys: String, CodingKey {

		case description = "description"
		case rating = "rating"
		case likes = "likes"
		case timeLine = "timeLine"
		case reviewId = "reviewId"
		case customerName = "customerName"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		rating = try values.decodeIfPresent(Int.self, forKey: .rating)
		likes = try values.decodeIfPresent(Int.self, forKey: .likes)
		timeLine = try values.decodeIfPresent(String.self, forKey: .timeLine)
		reviewId = try values.decodeIfPresent(Int.self, forKey: .reviewId)
		customerName = try values.decodeIfPresent(String.self, forKey: .customerName)
	}

}
