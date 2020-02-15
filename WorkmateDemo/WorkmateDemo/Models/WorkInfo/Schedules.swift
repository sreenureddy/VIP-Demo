import Foundation
struct Schedules: Codable {
	let id: Int?
	let staff_request: Int?
	let recurrences: String?
	let start_date: String?
	let start_time: String?
	let end_time: String?
	let duration: String?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case staff_request = "staff_request"
		case recurrences = "recurrences"
		case start_date = "start_date"
		case start_time = "start_time"
		case end_time = "end_time"
		case duration = "duration"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		staff_request = try values.decodeIfPresent(Int.self, forKey: .staff_request)
		recurrences = try values.decodeIfPresent(String.self, forKey: .recurrences)
		start_date = try values.decodeIfPresent(String.self, forKey: .start_date)
		start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
		end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
		duration = try values.decodeIfPresent(String.self, forKey: .duration)
	}

}
