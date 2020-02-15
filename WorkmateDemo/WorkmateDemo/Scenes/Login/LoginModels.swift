import UIKit

enum User {
    enum Login {
        struct Request: Encodable {
            var userName: String?
            var password: String?
            
            enum CodingKeys: String, CodingKey {
                case userName = "username"
                case password = "password"
            }
            
            func encode(to encoder: Encoder) throws {
                var container = encoder.container(keyedBy: CodingKeys.self)
                try container.encodeIfPresent(userName, forKey: .userName)
                try container.encodeIfPresent(password, forKey: .password)
            }
        }
        
        struct Response {
            var authorizationKey: LoginResponse
            
        }
        
        struct ViewModel {
            var key: String
        }
    }
}
