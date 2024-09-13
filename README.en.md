# AUnit 🌍⚖️📏

**AUnit** is a Swift package designed for easy unit conversions and operations. Whether you're working with length, speed, temperature, or pressure, AUnit makes the process simple and efficient! 🚀

## 🌍 Multilingual README

Choose your preferred language for the documentation:

- [🇬🇧 English](./README.en.md)
- [🇩🇪 Deutsch](./README.de.md)
- [🇪🇸 Español](./README.es.md)
- [🇫🇷 Français](./README.fr.md)
- [🇮🇹 Italiano](./README.it.md)
- [🇯🇵 日本語](./README.ja.md)
- [🇰🇷 한국어](./README.ko.md)
- [🇵🇹 Português](./README.pt.md)
- [🇷🇺 Русский](./README.ru.md)
- [🇹🇭 ไทย](./README.th.md)
- [🇨🇳 简体中文](./README.zh-Hans.md)
- [🇭🇰 繁體中文](./README.zh-Hant.md)

## 🌟 Features

- **Multiple Unit Types**: Length, speed, temperature, pressure, and many more! 🌡️📏
- **Conversions**: Effortlessly convert between different units. 🔄
- **Arithmetic Operations**: Add, subtract, multiply, and divide units like a pro! ➕➖✖️➗
- **Localized Unit Names**: Customizable symbols, short names, and descriptions for different languages. 🗣️🌐

## 📦 Installation

To add **AUnit** to your project, include it in your `Package.swift` file:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "YourProjectName",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "YourProjectTarget",
            dependencies: ["AUnit"]),
    ]
)
```

Then run `swift build` to get started! 🛠️

## 🎓 Usage

### 1. **Importing the Package**

```swift
import AUnit
```

### 2. **Unit Conversion Example**

Convert units seamlessly:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // Output: 0.1 km
}
```

### 3. **Adding Measurements**

Add measurements with compatible units:

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // Output: 240 seconds
}
```

### 4. **Multiplying and Dividing**

Multiply or divide measurements:

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // Output: 50 meters
}
```

### 5. **Checking Equality**

Check if two measurements are equal:

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("Weights are equal")
}
```

### 6. **Complex Arithmetic**

AUnit supports more complex arithmetic operations such as combining or scaling different measurements.

#### Example: Calculating Area from Length

If you want to calculate an area by multiplying two length measurements:

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // Output: 50 square meters
}
```

#### Example: Power Calculation

If you want to calculate power by multiplying electric current and potential:

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // Output: 1100 watts
}
```

### 7. **Temperature Conversion and Arithmetic**

You can also handle temperature conversions, adding or subtracting differences between temperatures:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // Output: 35°C
}
```

## 📜 License

**AUnit** is available under the MIT License. See the `LICENSE` file for details. 📄

---

Happy coding with **AUnit**! 💻✨
