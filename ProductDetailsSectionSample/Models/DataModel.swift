//
//  DataModel.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import Foundation
struct DataModel : Codable {
	let details : Details?

	enum CodingKeys: String, CodingKey {

		case details = "details"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		details = try values.decodeIfPresent(Details.self, forKey: .details)
	}

}
