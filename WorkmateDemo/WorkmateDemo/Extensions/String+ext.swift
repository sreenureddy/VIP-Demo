import Foundation

extension String {
    func formattedCurrencyBasedOnIDR(input: String) -> String? {
        let price = Double(input)! as NSNumber
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.string(from: price)
        formatter.locale = Locale(identifier: "id_ID")
        let formattedCurrency = formatter.string(from: price)
        let idrCurrency = formattedCurrency?.replacingOccurrences(of: ".", with: ",") ?? ""
        let amount = idrCurrency.replacingOccurrences(of: "Rp", with: "Rp ")
        return amount
    }
}
