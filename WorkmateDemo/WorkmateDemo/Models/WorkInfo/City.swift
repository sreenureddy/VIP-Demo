import Foundation
struct City: Codable {
	let id: Int?
	let name: String?
	let timezone: String?
	let country: Country?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case timezone = "timezone"
		case country = "country"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
	}

}
