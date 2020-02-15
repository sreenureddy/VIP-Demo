import Foundation
struct Area: Codable {
	let id: Int?
	let name: String?
	let city: City?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case city = "city"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		city = try values.decodeIfPresent(City.self, forKey: .city)
	}

}
