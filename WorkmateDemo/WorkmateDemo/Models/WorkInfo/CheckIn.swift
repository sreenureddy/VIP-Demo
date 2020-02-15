import Foundation

struct CheckIn: Codable {
    let id: Int?
    let clock_in_time: String?
    let clock_out_time: String?
    let clock_in_latitude: String?
    let clock_in_longitude: String?
    let clock_out_latitude: String?
    let clock_out_longitude: String?
    let schedule : String?
    
    enum CodingKeys: String, CodingKey {
        
        case id = "id"
        case clock_in_time = "clock_in_time"
        case clock_out_time = "clock_out_time"
        case clock_in_latitude = "clock_in_latitude"
        case clock_in_longitude = "clock_in_longitude"
        case clock_out_latitude = "clock_out_latitude"
        case clock_out_longitude = "clock_out_longitude"
        case schedule = "schedule"
    }
    
    init(from decoder: Decoder) throws {
        let values = try decoder.container(keyedBy: CodingKeys.self)
        id = try values.decodeIfPresent(Int.self, forKey: .id)
        clock_in_time = try values.decodeIfPresent(String.self, forKey: .clock_in_time)
        clock_out_time = try values.decodeIfPresent(String.self, forKey: .clock_out_time)
        clock_in_latitude = try values.decodeIfPresent(String.self, forKey: .clock_in_latitude)
        clock_in_longitude = try values.decodeIfPresent(String.self, forKey: .clock_in_longitude)
        clock_out_latitude = try values.decodeIfPresent(String.self, forKey: .clock_out_latitude)
        clock_out_longitude = try values.decodeIfPresent(String.self, forKey: .clock_out_longitude)
        schedule = try values.decodeIfPresent(String.self, forKey: .schedule)
    }
    
}
