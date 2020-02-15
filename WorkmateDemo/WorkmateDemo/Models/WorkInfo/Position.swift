
import Foundation
struct Position: Codable {
	let id: Int?
	let name: String?
	let active: Bool?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case active = "active"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		active = try values.decodeIfPresent(Bool.self, forKey: .active)
	}

}
