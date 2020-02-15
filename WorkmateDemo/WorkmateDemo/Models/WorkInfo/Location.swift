import Foundation
struct Location: Codable {
	let created_date: String?
	let modified_date: String?
	let id: Int?
	let name: String?
	let address: Address?

	enum CodingKeys: String, CodingKey {

		case created_date = "created_date"
		case modified_date = "modified_date"
		case id = "id"
		case name = "name"
		case address = "address"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
		modified_date = try values.decodeIfPresent(String.self, forKey: .modified_date)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		address = try values.decodeIfPresent(Address.self, forKey: .address)
	}

}
