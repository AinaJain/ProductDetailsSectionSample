//
//  Details.swift
//  ProductDetailsSectionSample
//
//  Created by Aina Jain on 18/03/19.
//  Copyright © 2019 Aina Jain. All rights reserved.
//

import Foundation
struct Details : Codable {
	let basicDetailsTab : BasicDetailsTab?
	let fabricAndCareTab : FabricAndCareTab?
	let reviewsTab : ReviewsTab?

	enum CodingKeys: String, CodingKey {

		case basicDetailsTab = "basicDetailsTab"
		case fabricAndCareTab = "fabricAndCareTab"
		case reviewsTab = "reviewsTab"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		basicDetailsTab = try values.decodeIfPresent(BasicDetailsTab.self, forKey: .basicDetailsTab)
		fabricAndCareTab = try values.decodeIfPresent(FabricAndCareTab.self, forKey: .fabricAndCareTab)
		reviewsTab = try values.decodeIfPresent(ReviewsTab.self, forKey: .reviewsTab)
	}

}
