import Foundation

struct StaffRequestResponse: Codable {
	let id: Int?
	let created_date: String?
	let modified_date: String?
	let status: String?
	let title: String?
	let cover_image: String?
	let description: String?
	let wage_amount: String?
	let wage_type: String?
	let staff_required: Int?
	let timezone: String?
	let gender: String?
	let min_age: Int?
	let max_age: Int?
	let require_experience: Bool?
	let require_english: Bool?
	let interview_time: String?
	let interview_info: String?
	let start_time: String?
	let end_time: String?
	let fixed_location: Bool?
	let schedules: [Schedules]?
	let client: Client?
	let location: Location?
	let position: Position?
	let manager: Manager?

	enum CodingKeys: String, CodingKey {

		case id = "id"
		case created_date = "created_date"
		case modified_date = "modified_date"
		case status = "status"
		case title = "title"
		case cover_image = "cover_image"
		case description = "description"
		case wage_amount = "wage_amount"
		case wage_type = "wage_type"
		case staff_required = "staff_required"
		case timezone = "timezone"
		case gender = "gender"
		case min_age = "min_age"
		case max_age = "max_age"
		case require_experience = "require_experience"
		case require_english = "require_english"
		case interview_time = "interview_time"
		case interview_info = "interview_info"
		case start_time = "start_time"
		case end_time = "end_time"
		case fixed_location = "fixed_location"
		case schedules = "schedules"
		case client = "client"
		case location = "location"
		case position = "position"
		case manager = "manager"
	}

	init(from decoder: Decoder) throws {
		let values = try decoder.container(keyedBy: CodingKeys.self)
		id = try values.decodeIfPresent(Int.self, forKey: .id)
		created_date = try values.decodeIfPresent(String.self, forKey: .created_date)
		modified_date = try values.decodeIfPresent(String.self, forKey: .modified_date)
		status = try values.decodeIfPresent(String.self, forKey: .status)
		title = try values.decodeIfPresent(String.self, forKey: .title)
		cover_image = try values.decodeIfPresent(String.self, forKey: .cover_image)
		description = try values.decodeIfPresent(String.self, forKey: .description)
		wage_amount = try values.decodeIfPresent(String.self, forKey: .wage_amount)
		wage_type = try values.decodeIfPresent(String.self, forKey: .wage_type)
		staff_required = try values.decodeIfPresent(Int.self, forKey: .staff_required)
		timezone = try values.decodeIfPresent(String.self, forKey: .timezone)
		gender = try values.decodeIfPresent(String.self, forKey: .gender)
		min_age = try values.decodeIfPresent(Int.self, forKey: .min_age)
		max_age = try values.decodeIfPresent(Int.self, forKey: .max_age)
		require_experience = try values.decodeIfPresent(Bool.self, forKey: .require_experience)
		require_english = try values.decodeIfPresent(Bool.self, forKey: .require_english)
		interview_time = try values.decodeIfPresent(String.self, forKey: .interview_time)
		interview_info = try values.decodeIfPresent(String.self, forKey: .interview_info)
		start_time = try values.decodeIfPresent(String.self, forKey: .start_time)
		end_time = try values.decodeIfPresent(String.self, forKey: .end_time)
		fixed_location = try values.decodeIfPresent(Bool.self, forKey: .fixed_location)
		schedules = try values.decodeIfPresent([Schedules].self, forKey: .schedules)
		client = try values.decodeIfPresent(Client.self, forKey: .client)
		location = try values.decodeIfPresent(Location.self, forKey: .location)
		position = try values.decodeIfPresent(Position.self, forKey: .position)
		manager = try values.decodeIfPresent(Manager.self, forKey: .manager)
	}

}
