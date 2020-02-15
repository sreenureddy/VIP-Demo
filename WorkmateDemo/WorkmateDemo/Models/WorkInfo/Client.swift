import Foundation
struct Client: Codable {
	let id: Int?
	let country: Country?
	let name: String?
	let status: String?
	let logo: String?
	let tier: String?
	let website: String?
	let description: String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case country = "country"
		case name = "name"
		case status = "status"
		case logo = "logo"
		case tier = "tier"
		case website = "website"
		case description = "description"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		logo = try values.decodeIfPresent(String.self, forKey: .logo)
		tier = try values.decodeIfPresent(String.self, forKey: .tier)
		website = try values.decodeIfPresent(String.self, forKey: .website)
		description = try values.decodeIfPresent(String.self, forKey: .description)
	}

}
