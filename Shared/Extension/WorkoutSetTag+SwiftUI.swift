import Foundation
import SwiftUI
import WorkoutDataKit

extension WorkoutSetTag {
    var color: Color {
        switch self {
//        case .warmUp:
//            return .yellow
        case .dropSet:
            return .purple
        case .failure:
            return .red
        }
    }
}
