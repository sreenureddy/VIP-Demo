import Foundation
struct Address: Codable {
	let id: Int?
	let country: Country?
	let street_1: String?
	let street_2: String?
	let zip: String?
	let province: String?
	let latitude: Double?
	let longitude: Double?
	let point: String?
	let area: Area?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case country = "country"
		case street_1 = "street_1"
		case street_2 = "street_2"
		case zip = "zip"
		case province = "province"
		case latitude = "latitude"
		case longitude = "longitude"
		case point = "point"
		case area = "area"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		country = try values.decodeIfPresent(Country.self, forKey: .country)
		street_1 = try values.decodeIfPresent(String.self, forKey: .street_1)
		street_2 = try values.decodeIfPresent(String.self, forKey: .street_2)
		zip = try values.decodeIfPresent(String.self, forKey: .zip)
		province = try values.decodeIfPresent(String.self, forKey: .province)
		latitude = try values.decodeIfPresent(Double.self, forKey: .latitude)
		longitude = try values.decodeIfPresent(Double.self, forKey: .longitude)
		point = try values.decodeIfPresent(String.self, forKey: .point)
		area = try values.decodeIfPresent(Area.self, forKey: .area)
	}

}
