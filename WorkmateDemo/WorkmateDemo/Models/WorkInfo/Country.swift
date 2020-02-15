import Foundation
struct Country: Codable {
	let id: Int?
	let name: String?
	let code: String?
	let currency_code: String?
	let dial_code: String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case name = "name"
		case code = "code"
		case currency_code = "currency_code"
		case dial_code = "dial_code"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		name = try values.decodeIfPresent(String.self, forKey: .name)
		code = try values.decodeIfPresent(String.self, forKey: .code)
		currency_code = try values.decodeIfPresent(String.self, forKey: .currency_code)
		dial_code = try values.decodeIfPresent(String.self, forKey: .dial_code)
	}

}
