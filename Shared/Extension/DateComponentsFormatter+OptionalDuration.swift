import Foundation

extension DateComponentsFormatter {
    func string(from ti: TimeInterval?, fallback: String?) -> String? {
        guard let ti = ti else { return fallback }
        return string(from: ti)
    }
}
