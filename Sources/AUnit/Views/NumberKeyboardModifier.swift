import SwiftUI

@available(iOS 15.0, macOS 12.0, *)
@available(tvOS, unavailable)
@available(watchOS, unavailable)
@available(visionOS, unavailable)
struct NumberKeyboardModifier: ViewModifier {
    @Binding var value: Double?
    var digits: Int

    @State private var rotationAngle: Double = 0 // State variable to track rotation
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
#if os(iOS)
        .autocorrectionDisabled()
        .focused($isFocused)
        .keyboardType(.decimalPad)
        .textContentType(.oneTimeCode)
        .toolbar {
            ToolbarItemGroup(placement: .keyboard) {
                if isFocused {
                    if let currentValue = value, !currentValue.isZero {
                        Button {
                            value = -currentValue
                        } label: {
                            Text(-currentValue, format: .number.precision(.significantDigits(0 ... digits)))
                                .foregroundStyle(currentValue > 0 ? .red : .blue)
                        }
                    }
                    Spacer()
                    Button {
                        value = 0
                        withAnimation {
                            rotationAngle -= 360
                            value = nil
                        }
                    } label: {
                        Image(systemName: "arrow.counterclockwise")
                            .rotationEffect(.degrees(rotationAngle)) // Apply rotation effect
                    }
                }
            }
        }
#endif
    }
}
