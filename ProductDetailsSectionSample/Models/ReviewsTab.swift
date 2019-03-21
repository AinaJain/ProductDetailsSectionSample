//
//  ReviewsTab.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import Foundation
struct ReviewsTab : Codable {
	let values : [Values]?
	let count : Int?

	enum CodingKeys: String, CodingKey {

		case values = "values"
		case count = "count"
	}

	init(from decoder: Decoder) throws {
		let parsedValues = try decoder.container(keyedBy: CodingKeys.self)
		values = try parsedValues.decodeIfPresent([Values].self, forKey: .values)
		count = try parsedValues.decodeIfPresent(Int.self, forKey: .count)
	}

}
