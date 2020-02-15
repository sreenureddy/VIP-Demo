import Foundation
struct Manager: Codable {
	let id: Int?
	let name: String?
	let email: String?
	let phone: String?
	let role: String?
	let locations: [String]?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case email = "email"
		case phone = "phone"
		case role = "role"
		case locations = "locations"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		email = try values.decodeIfPresent(String.self, forKey: .email)
		phone = try values.decodeIfPresent(String.self, forKey: .phone)
		role = try values.decodeIfPresent(String.self, forKey: .role)
		locations = try values.decodeIfPresent([String].self, forKey: .locations)
	}

}
