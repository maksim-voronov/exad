import UIKit
import Foundation

extension UILabel {
    // This initializer allows setting text with a given value and format style
    convenience init<T: FormatStyle>(value: T.FormatInput, formatStyle: T) where T.FormatOutput == String {
        self.init(frame: .zero)
        self.text = formatStyle.format(value)
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

// Example usage:

// Let's say we want to create a label with a formatted date
let dateFormatter = Date.FormatStyle(date: .numeric, time: .omitted)
let dateLabel = UILabel(value: Date(), formatStyle: dateFormatter)

// Or, create a label with a formatted number
let numberFormatter = Number.FormatStyle.number
let numberLabel = UILabel(value: 12345.6789, formatStyle: numberFormatter)

// Adding labels to a view (for demonstration purposes)
let stackView = UIStackView(arrangedSubviews: [dateLabel, numberLabel])
stackView.axis = .vertical
stackView.spacing = 10

// Assuming this code is in a UIViewController, add it to the main view
let viewController = UIViewController()
viewController.view.addSubview(stackView)
stackView.translatesAutoresizingMaskIntoConstraints = false
NSLayoutConstraint.activate([
    stackView.centerXAnchor.constraint(equalTo: viewController.view.centerXAnchor),
    stackView.centerYAnchor.constraint(equalTo: viewController.view.centerYAnchor)
])

// If you need to display the view controller (this would be done in an app context)
let window = UIWindow(frame: UIScreen.main.bounds)
window.rootViewController = viewController
window.makeKeyAndVisible()
