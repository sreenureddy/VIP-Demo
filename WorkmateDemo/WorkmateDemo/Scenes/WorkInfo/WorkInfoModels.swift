import UIKit

enum Staff {
    enum Requestinformation {
        struct Request {
            var authorizationKey: String?
            var latitude: String?
            var longitude: String?
            enum CodingKeys: String, CodingKey {
                case authorizationKey = "Authorization"
                case latitude
                case longitude
                case clockType
            }
            
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(authorizationKey, forKey: .authorizationKey)
                try container.encodeIfPresent(latitude, forKey: .latitude)
                try container.encodeIfPresent(longitude, forKey: .longitude)
            }
        }
        struct ClockTypeRequest {
            var clockType: ClockInfo?
        }
        struct Response {
            let staffRequest: StaffRequestResponse
        }
        struct CheckInResponse {
            let chcekIn: CheckIn
        }
        struct CheckOutResponse {
            let checkOut: CheckOut
        }
        struct ViewModel {
            var information: StaffRequest
            struct StaffRequest {
                var positionName: String
                var clientName: String
                var managerName: String
                var managerPhone: String
                var wageAmount: String
                var wageType: String
                var location: String
            }
        }
        struct checkInViewModel {
            var checkIn: String
        }
        
        struct clockTypeViewModel {
            var clockType: ClockInfo
        }
        
        struct checkOutViewModel {
            var checkOut: String
        }
    }
}
