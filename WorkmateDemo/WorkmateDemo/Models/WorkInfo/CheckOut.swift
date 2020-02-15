import Foundation
struct CheckOut: Codable {
	let timesheet: Timesheet?
	let require_feedback: Bool?

	enum CodingKeys: String, CodingKey {

		case timesheet = "timesheet"
		case require_feedback = "require_feedback"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		timesheet = try values.decodeIfPresent(Timesheet.self, forKey: .timesheet)
		require_feedback = try values.decodeIfPresent(Bool.self, forKey: .require_feedback)
	}

}
