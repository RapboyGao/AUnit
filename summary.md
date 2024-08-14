给 AUnitBindNumberViews 写一下中英文注释

### File: Package.swift

```swift
// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AUnit",
    defaultLocalization: "en",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(name: "AUnit", targets: ["AUnit"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(name: "AUnit", resources: [.process("Resources")]),
        .testTarget(name: "AnitTests", dependencies: ["AUnit"]),
    ])
```

### File: Sources/AUnit/AQuantity.swift

```swift
public struct AQuantity<UnitType: AUnitProtocol>: AQuantityProtocol {
    public var unit: UnitType
    public var value: Double
    public init(value: Double, unit: UnitType) {
        self.value = value
        self.unit = unit
    }
}

public extension AQuantity where UnitType: AProportionalUnitProtocol {
    func add(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value + other.value, unit: unit) }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 + value2, unit: .baseUnit)
    }

    func subtract(_ other: AQuantity<UnitType>) -> AQuantity<UnitType> {
        guard unit != other.unit
        else { return AQuantity(value: value - other.value, unit: unit) }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return AQuantity(value: value1 - value2, unit: .baseUnit)
    }

    func divided(by other: AQuantity<UnitType>) -> Double {
        guard unit != other.unit
        else { return value / other.value }
        let value1 = unit.convert(value: value, to: .baseUnit)
        let value2 = other.unit.convert(value: other.value, to: .baseUnit)
        return value1 / value2
    }
}

// MARK: - 乘除法

public extension AQuantity where UnitType == AULength {
    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 * value2, unit: .squareMeters)
    }

    func multiply(by other: AQuantity<AUArea>) -> AQuantity<AUVolume> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AUVolume>(value: value1 * value2, unit: .cubicMeters)
    }

    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 / value2, unit: .metersPerSecond)
    }

    func divided(by other: AQuantity<AUSpeed>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .meters)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecond)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUArea {
    func divided(by other: AQuantity<AULength>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .squareMeters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func multiply(by other: AQuantity<AULength>) -> AQuantity<AUVolume> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUVolume>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .squareMeters)
        let value2 = other.unit.convert(value: other.value, to: .cubicMeters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }
}

public extension AQuantity where UnitType == AUVolume {
    func divided(by other: AQuantity<AULength>) -> AQuantity<AUArea> {
        let value1 = unit.convert(value: value, to: .cubicMeters)
        let value2 = other.unit.convert(value: other.value, to: .meters)
        return AQuantity<AUArea>(value: value1 / value2, unit: .squareMeters)
    }

    func divided(by other: AQuantity<AUArea>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .cubicMeters)
        let value2 = other.unit.convert(value: other.value, to: .squareMeters)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func multiply(by other: AQuantity<AUConcentration>) -> AQuantity<AUMass> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUTime {
    func multiply(by other: AQuantity<AUSpeed>) -> AQuantity<AULength> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUAcceleration>) -> AQuantity<AUSpeed> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUPower>) -> AQuantity<AUEnergy> {
        other.multiply(by: self)
    }

    func multiply(by other: AQuantity<AUAngularVelocity>) -> AQuantity<AUAngle> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUSpeed>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .seconds)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecond)
        return AQuantity<AULength>(value: value1 / value2, unit: .meters)
    }

    func divided(by other: AQuantity<AUAcceleration>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .seconds)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecondSquared)
        return AQuantity<AUSpeed>(value: value1 / value2, unit: .metersPerSecond)
    }
}

public extension AQuantity where UnitType == AUSpeed {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AULength> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AULength>(value: value1 * value2, unit: .meters)
    }

    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAcceleration> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAcceleration>(value: value1 / value2, unit: .metersPerSecondSquared)
    }

    func divided(by other: AQuantity<AUAcceleration>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .metersPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .metersPerSecondSquared)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUAcceleration {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUSpeed> {
        let value1 = unit.convert(value: value, to: .metersPerSecondSquared)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUSpeed>(value: value1 * value2, unit: .metersPerSecond)
    }
}

public extension AQuantity where UnitType == AUMass {
    func divided(by other: AQuantity<AUVolume>) -> AQuantity<AUConcentration> {
        let value1 = unit.convert(value: value, to: .grams)
        let value2 = other.unit.convert(value: other.value, to: .liters)
        return AQuantity<AUConcentration>(value: value1 / value2, unit: .gramsPerLiter)
    }

    func divided(by other: AQuantity<AUConcentration>) -> AQuantity<AUVolume> {
        let value1 = unit.convert(value: value, to: .grams)
        let value2 = other.unit.convert(value: other.value, to: .gramsPerLiter)
        return AQuantity<AUVolume>(value: value1 / value2, unit: .liters)
    }
}

public extension AQuantity where UnitType == AUConcentration {
    func multiply(by other: AQuantity<AUVolume>) -> AQuantity<AUMass> {
        let value1 = unit.convert(value: value, to: .gramsPerLiter)
        let value2 = other.unit.convert(value: other.value, to: .liters)
        return AQuantity<AUMass>(value: value1 * value2, unit: .grams)
    }
}

public extension AQuantity where UnitType == AUEnergy {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUPower>(value: value1 / value2, unit: .watts)
    }

    func divided(by other: AQuantity<AUPower>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .watts)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }

    func divided(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUElectricChargeCapacity> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUElectricChargeCapacity>(value: value1 / value2, unit: .coulombs)
    }

    func divided(by other: AQuantity<AUElectricChargeCapacity>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .joules)
        let value2 = other.unit.convert(value: other.value, to: .coulombs)
        return AQuantity<AUElectricPotential>(value: value1 / value2, unit: .volts)
    }
}

public extension AQuantity where UnitType == AUPower {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUEnergy> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUEnergy>(value: value1 * value2, unit: .joules)
    }

    func divided(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .amperes)
        return AQuantity<AUElectricPotential>(value: value1 / value2, unit: .volts)
    }

    func divided(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUElectricCurrent> {
        let value1 = unit.convert(value: value, to: .watts)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUElectricCurrent>(value: value1 / value2, unit: .amperes)
    }
}

public extension AQuantity where UnitType == AUElectricCurrent {
    func multiply(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUPower> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUPower>(value: value1 * value2, unit: .watts)
    }

    func multiply(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricPotential> {
        let value1 = unit.convert(value: value, to: .amperes)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricPotential>(value: value1 * value2, unit: .volts)
    }
}

public extension AQuantity where UnitType == AUElectricPotential {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUPower> {
        other.multiply(by: self)
    }

    func divided(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricResistance> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .amperes)
        return AQuantity<AUElectricResistance>(value: value1 / value2, unit: .ohms)
    }

    func divided(by other: AQuantity<AUElectricResistance>) -> AQuantity<AUElectricCurrent> {
        let value1 = unit.convert(value: value, to: .volts)
        let value2 = other.unit.convert(value: other.value, to: .ohms)
        return AQuantity<AUElectricCurrent>(value: value1 / value2, unit: .amperes)
    }

    func multiply(by other: AQuantity<AUElectricChargeCapacity>) -> AQuantity<AUEnergy> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUElectricResistance {
    func multiply(by other: AQuantity<AUElectricCurrent>) -> AQuantity<AUElectricPotential> {
        other.multiply(by: self)
    }
}

public extension AQuantity where UnitType == AUElectricChargeCapacity {
    func multiply(by other: AQuantity<AUElectricPotential>) -> AQuantity<AUEnergy> {
        let value1 = unit.convert(value: value, to: .ampereHours)
        let value2 = other.unit.convert(value: other.value, to: .volts)
        return AQuantity<AUEnergy>(value: value1 * value2, unit: .joules)
    }
}

public extension AQuantity where UnitType == AUAngle {
    func divided(by other: AQuantity<AUTime>) -> AQuantity<AUAngularVelocity> {
        let value1 = unit.convert(value: value, to: .degrees)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngularVelocity>(value: value1 / value2, unit: .degreesPerSecond)
    }

    func divided(by other: AQuantity<AUAngularVelocity>) -> AQuantity<AUTime> {
        let value1 = unit.convert(value: value, to: .degrees)
        let value2 = other.unit.convert(value: other.value, to: .degreesPerSecond)
        return AQuantity<AUTime>(value: value1 / value2, unit: .seconds)
    }
}

public extension AQuantity where UnitType == AUAngularVelocity {
    func multiply(by other: AQuantity<AUTime>) -> AQuantity<AUAngle> {
        let value1 = unit.convert(value: value, to: .degreesPerSecond)
        let value2 = other.unit.convert(value: other.value, to: .seconds)
        return AQuantity<AUAngle>(value: value1 * value2, unit: .degrees)
    }
}

// MARK: - 温度加减法

public extension AQuantity where UnitType == AUTemperature {
    func add(_ other: AQuantity<AUTemperatureDifference>) -> AQuantity<AUTemperature> {
        switch unit {
        case .kelvin, .celsius:
            let temperatureDelta = other.converted(to: .celsiusDelta)
            return AQuantity(value: value + temperatureDelta.value, unit: unit)
        case .fahrenheit, .rankine:
            let temperatureDelta = other.converted(to: .fahrenheitDelta)
            return AQuantity(value: value + temperatureDelta.value, unit: unit)
        }
    }

    func subtract(_ other: AQuantity<AUTemperatureDifference>) -> AQuantity<AUTemperature> {
        switch unit {
        case .kelvin, .celsius:
            let temperatureDelta = other.converted(to: .celsiusDelta)
            return AQuantity(value: value - temperatureDelta.value, unit: unit)
        case .fahrenheit, .rankine:
            let temperatureDelta = other.converted(to: .fahrenheitDelta)
            return AQuantity(value: value - temperatureDelta.value, unit: unit)
        }
    }
}

public extension AQuantity where UnitType == AUTemperatureDifference {
    func add(_ other: AQuantity<AUTemperature>) -> AQuantity<AUTemperature> {
        other.add(self)
    }
}
```

### File: Sources/AUnit/AUnitType.swift

```swift
import Foundation

/// Enum representing the types of units.
/// 表示单位类型的枚举。
public enum AUnitType: Codable, Sendable, Hashable, CaseIterable, Identifiable {
    case length, speed, pressure, temperature, temperatureDifference, mass, volume, acceleration, power, angle, angularVelocity, area, concentration, time, electricChargeCapacity, electricCurrent, electricPotential, electricResistance, energy, frequency, fuelEfficiency, data

    public var id: AUnitType { self }

    /// The symbol for the unit type.
    /// 单位类型的符号。
    /// 尽可能一个字/词
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit type.
    /// 单位类型的短名称。
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit type.
    /// 单位类型的全名称。
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit type.
    /// 单位类型的详细介绍。
    public var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// The SF Symbol name for the unit type.
    /// 单位类型的 SF Symbol 名称。
    public var systemImage: String {
        switch self {
        case .length: return "ruler"
        case .speed: return "speedometer"
        case .pressure: return "gauge"
        case .temperature: return "thermometer"
        case .temperatureDifference: return "thermometer.transmission"
        case .mass: return "scalemass"
        case .volume: return "cube.box"
        case .acceleration: return "arrow.up.and.down.circle"
        case .power: return "bolt.circle"
        case .angle: return "angle"
        case .angularVelocity: return "goforward"
        case .area: return "square.on.square"
        case .concentration: return "drop"
        case .time: return "clock"
        case .electricChargeCapacity: return "bolt.horizontal.circle"
        case .electricCurrent: return "bolt"
        case .electricPotential: return "waveform.path.ecg"
        case .electricResistance: return "wave.3.right"
        case .energy: return "flame"
        case .frequency: return "waveform"
        case .fuelEfficiency: return "fuelpump"
        case .data: return "server.rack"
        }
    }

    public var baseUnit: AUnit {
        switch self {
        case .length: return .meters
        case .speed: return .metersPerSecond
        case .pressure: return .newtonsPerMetersSquared
        case .temperature: return .kelvin
        case .temperatureDifference: return .celsiusDelta
        case .mass: return .grams
        case .volume: return .liters
        case .acceleration: return .metersPerSecondSquared
        case .power: return .watts
        case .angle: return .degrees
        case .angularVelocity: return .degreesPerSecond
        case .area: return .squareMeters
        case .concentration: return .gramsPerLiter
        case .time: return .seconds
        case .electricChargeCapacity: return .coulombs
        case .electricCurrent: return .amperes
        case .electricPotential: return .volts
        case .electricResistance: return .ohms
        case .energy: return .joules
        case .frequency: return .hertz
        case .fuelEfficiency: return .litersPer100Kilometers
        case .data: return .bytes
        }
    }

    public var allUnits: [AUnit] {
        AUnit.allCases.filter { unit in
            unit.unitType == self
        }
    }
}
```

### File: Sources/AUnit/Ref.swift

```swift
import Foundation

enum Ref {
    static let none: String = NSLocalizedString("None", bundle: .module, comment: "")
}
```

### File: Sources/AUnit/Units/SpecialUnits.swift

```swift
// ---------FuelEfficiency------------
public enum AUFuelEfficiency: AUnitProtocol, Identifiable {
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon

    public var id: AUnit {
        switch self {
        case .litersPer100Kilometers: return .litersPer100Kilometers
        case .milesPerImperialGallon: return .milesPerImperialGallon
        case .milesPerGallon: return .milesPerGallon
        }
    }

    public static var baseUnit: AUFuelEfficiency = .litersPer100Kilometers

    public func toBaseValue(value: Double) -> Double {
        switch self {
        case .litersPer100Kilometers:
            return value
        case .milesPerImperialGallon:
            return 282.4809362796091 / value
        case .milesPerGallon:
            return 235.2145833333333 / value
        }
    }

    public func fromBaseValue(value: Double) -> Double {
        switch self {
        case .litersPer100Kilometers:
            return value
        case .milesPerImperialGallon:
            return 282.4809362796091 / value
        case .milesPerGallon:
            return 235.2145833333333 / value
        }
    }
}

/// Enumeration representing various units of temperature.
/// 表示各种温度单位的枚举。
public enum AUTemperature: AUnitProtocol, Identifiable {
    case kelvin, celsius, fahrenheit, rankine

    /// Coefficient for converting units to Celsius.
    /// 将单位转换为摄氏度的系数。
    private var coefficient: Double {
        switch self {
        // Temperature
        case .kelvin, .celsius: return 1.0
        case .fahrenheit, .rankine: return 5.0 / 9.0
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .celsius: return 273.15
        case .fahrenheit: return 459.67
        case .kelvin, .rankine: return 0
        }
    }

    /// The associated `AUnit` value for this unit.
    /// 此单位关联的 `AUnit` 值。
    public var id: AUnit {
        switch self {
        case .celsius: return .celsius
        case .fahrenheit: return .fahrenheit
        case .kelvin: return .kelvin
        case .rankine: return .rankine
        }
    }

    /// The base unit for temperature is Celsius.
    /// 温度的基本单位是摄氏度。
    public static var baseUnit: AUTemperature = .kelvin

    /// Converts a value to the base unit (Kelvin).
    /// 将一个值转换为基础单位（Kelvin）。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in Kelvin.
    ///            以Kelvin为单位的值。
    public func toBaseValue(value: Double) -> Double {
        (value + constant) * coefficient
    }

    /// Converts a value from the base unit (Kelvin).
    /// 从基础单位（Kelvin）转换值。
    /// - Parameter value: The value in Kelvin.
    ///                    以Kelvin为单位的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    public func fromBaseValue(value: Double) -> Double {
        (value / coefficient) - constant
    }
}
```

### File: Sources/AUnit/Units/ProportionalUnits.swift

```swift
// MARK: - Length

public enum AULength: AProportionalUnitProtocol, Identifiable {
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    public var coefficient: Double {
        switch self {
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1000000.0
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1e-06
        case .nanometers: return 1e-09
        case .picometers: return 1e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 10000.0
        case .lightyears: return 9.4607304725808e+15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 149597870700.0
        case .parsecs: return 3.085677581491367e+16
        }
    }

    public var id: AUnit {
        switch self {
        case .feet: return .feet
        case .nauticalMiles: return .nauticalMiles
        case .meters: return .meters
        case .kilometers: return .kilometers
        case .miles: return .miles
        case .megameters: return .megameters
        case .hectometers: return .hectometers
        case .decameters: return .decameters
        case .decimeters: return .decimeters
        case .centimeters: return .centimeters
        case .millimeters: return .millimeters
        case .micrometers: return .micrometers
        case .nanometers: return .nanometers
        case .picometers: return .picometers
        case .inches: return .inches
        case .yards: return .yards
        case .scandinavianMiles: return .scandinavianMiles
        case .lightyears: return .lightyears
        case .fathoms: return .fathoms
        case .furlongs: return .furlongs
        case .astronomicalUnits: return .astronomicalUnits
        case .parsecs: return .parsecs
        }
    }

    public static var baseUnit: AULength = .meters
}

// MARK: - Speed

public enum AUSpeed: AProportionalUnitProtocol, Identifiable {
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond
    public var coefficient: Double {
        switch self {
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        }
    }

    public var id: AUnit {
        switch self {
        case .knots: return .knots
        case .metersPerSecond: return .metersPerSecond
        case .feetPerMinute: return .feetPerMinute
        case .kilometersPerHour: return .kilometersPerHour
        case .feetPerSecond: return .feetPerSecond
        case .milesPerHour: return .milesPerHour
        case .inchesPerSecond: return .inchesPerSecond
        case .yardsPerSecond: return .yardsPerSecond
        }
    }

    public static var baseUnit: AUSpeed = .metersPerSecond
}

// MARK: - Pressure

public enum AUPressure: AProportionalUnitProtocol, Identifiable {
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch
    public var coefficient: Double {
        switch self {
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1000000000.0
        case .megapascals: return 1000000.0
        case .kilopascals: return 1000.0
        case .bars: return 100000.0
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        }
    }

    public var id: AUnit {
        switch self {
        case .hectopascals: return .hectopascals
        case .inchesOfMercury: return .inchesOfMercury
        case .millimetersOfMercury: return .millimetersOfMercury
        case .newtonsPerMetersSquared: return .newtonsPerMetersSquared
        case .gigapascals: return .gigapascals
        case .megapascals: return .megapascals
        case .kilopascals: return .kilopascals
        case .bars: return .bars
        case .millibars: return .millibars
        case .poundsForcePerSquareInch: return .poundsForcePerSquareInch
        }
    }

    public static var baseUnit: AUPressure = .newtonsPerMetersSquared
}

// MARK: - TemperatureDifference

public enum AUTemperatureDifference: AProportionalUnitProtocol, Identifiable {
    case celsiusDelta, fahrenheitDelta
    public var coefficient: Double {
        switch self {
        case .celsiusDelta: return 1.0
        case .fahrenheitDelta: return 0.5555555555555556
        }
    }

    public var id: AUnit {
        switch self {
        case .celsiusDelta: return .celsiusDelta
        case .fahrenheitDelta: return .fahrenheitDelta
        }
    }

    public static var baseUnit: AUTemperatureDifference = .celsiusDelta
}

// MARK: - Mass

public enum AUMass: AProportionalUnitProtocol, Identifiable {
    case metricTons, shortTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, stones, carats, ouncesTroy, slugs
    public var coefficient: Double {
        switch self {
        case .metricTons: return 1000000.0
        case .shortTons: return 907184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 453592.37
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1e-06
        case .nanograms: return 1e-09
        case .picograms: return 1e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        }
    }

    public var id: AUnit {
        switch self {
        case .metricTons: return .metricTons
        case .shortTons: return .shortTons
        case .kilograms: return .kilograms
        case .kilopounds: return .kilopounds
        case .pounds: return .pounds
        case .ounces: return .ounces
        case .grams: return .grams
        case .decigrams: return .decigrams
        case .centigrams: return .centigrams
        case .milligrams: return .milligrams
        case .micrograms: return .micrograms
        case .nanograms: return .nanograms
        case .picograms: return .picograms
        case .stones: return .stones
        case .carats: return .carats
        case .ouncesTroy: return .ouncesTroy
        case .slugs: return .slugs
        }
    }

    public static var baseUnit: AUMass = .grams
}

// MARK: - Volume

public enum AUVolume: AProportionalUnitProtocol, Identifiable {
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
    public var coefficient: Double {
        switch self {
        case .liters: return 1.0
        case .quarts: return 0.946352946
        case .cubicMeters: return 1000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.785411784
        case .megaliters: return 1000000.0
        case .kiloliters: return 1000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1000000000000.0
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1e-06
        case .cubicInches: return 0.016387064
        case .cubicFeet: return 28.316846592
        case .cubicYards: return 764.554857984
        case .cubicMiles: return 4168181825440.5796
        case .acreFeet: return 1233481.83754752
        case .bushels: return 35.23907016688
        case .teaspoons: return 0.00492892159375
        case .tablespoons: return 0.01478676478125
        case .fluidOunces: return 0.0295735295625
        case .cups: return 0.24
        case .pints: return 0.473176473
        case .imperialTeaspoons: return 0.00591938802083333
        case .imperialTablespoons: return 0.0177581640625
        case .imperialFluidOunces: return 0.0284130625
        case .imperialPints: return 0.56826125
        case .imperialQuarts: return 1.1365225
        case .imperialGallons: return 4.54609
        case .metricCups: return 0.25
        }
    }

    public var id: AUnit {
        switch self {
        case .liters: return .liters
        case .quarts: return .quarts
        case .cubicMeters: return .cubicMeters
        case .cubicCentimeters: return .cubicCentimeters
        case .gallons: return .gallons
        case .megaliters: return .megaliters
        case .kiloliters: return .kiloliters
        case .deciliters: return .deciliters
        case .centiliters: return .centiliters
        case .milliliters: return .milliliters
        case .cubicKilometers: return .cubicKilometers
        case .cubicDecimeters: return .cubicDecimeters
        case .cubicMillimeters: return .cubicMillimeters
        case .cubicInches: return .cubicInches
        case .cubicFeet: return .cubicFeet
        case .cubicYards: return .cubicYards
        case .cubicMiles: return .cubicMiles
        case .acreFeet: return .acreFeet
        case .bushels: return .bushels
        case .teaspoons: return .teaspoons
        case .tablespoons: return .tablespoons
        case .fluidOunces: return .fluidOunces
        case .cups: return .cups
        case .pints: return .pints
        case .imperialTeaspoons: return .imperialTeaspoons
        case .imperialTablespoons: return .imperialTablespoons
        case .imperialFluidOunces: return .imperialFluidOunces
        case .imperialPints: return .imperialPints
        case .imperialQuarts: return .imperialQuarts
        case .imperialGallons: return .imperialGallons
        case .metricCups: return .metricCups
        }
    }

    public static var baseUnit: AUVolume = .liters
}

// MARK: - Acceleration

public enum AUAcceleration: AProportionalUnitProtocol, Identifiable {
    case metersPerSecondSquared, gravity
    public var coefficient: Double {
        switch self {
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        }
    }

    public var id: AUnit {
        switch self {
        case .metersPerSecondSquared: return .metersPerSecondSquared
        case .gravity: return .gravity
        }
    }

    public static var baseUnit: AUAcceleration = .metersPerSecondSquared
}

// MARK: - Power

public enum AUPower: AProportionalUnitProtocol, Identifiable {
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower
    public var coefficient: Double {
        switch self {
        case .terawatts: return 1000000000000.0
        case .gigawatts: return 1000000000.0
        case .megawatts: return 1000000.0
        case .kilowatts: return 1000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1e-06
        case .nanowatts: return 1e-09
        case .picowatts: return 1e-12
        case .femtowatts: return 1e-15
        case .horsepower: return 745.6998715822702
        }
    }

    public var id: AUnit {
        switch self {
        case .terawatts: return .terawatts
        case .gigawatts: return .gigawatts
        case .megawatts: return .megawatts
        case .kilowatts: return .kilowatts
        case .watts: return .watts
        case .milliwatts: return .milliwatts
        case .microwatts: return .microwatts
        case .nanowatts: return .nanowatts
        case .picowatts: return .picowatts
        case .femtowatts: return .femtowatts
        case .horsepower: return .horsepower
        }
    }

    public static var baseUnit: AUPower = .watts
}

// MARK: - Angle

public enum AUAngle: AProportionalUnitProtocol, Identifiable {
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions
    public var coefficient: Double {
        switch self {
        case .degrees: return 1.0
        case .arcMinutes: return 0.016666666666666666
        case .arcSeconds: return 0.0002777777777777778
        case .radians: return 57.29577951308232
        case .gradians: return 0.9
        case .revolutions: return 360.0
        }
    }

    public var id: AUnit {
        switch self {
        case .degrees: return .degrees
        case .arcMinutes: return .arcMinutes
        case .arcSeconds: return .arcSeconds
        case .radians: return .radians
        case .gradians: return .gradians
        case .revolutions: return .revolutions
        }
    }

    public static var baseUnit: AUAngle = .degrees
}

// MARK: - AngularVelocity

public enum AUAngularVelocity: AProportionalUnitProtocol, Identifiable {
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond
    public var coefficient: Double {
        switch self {
        case .radiansPerSecond: return 57.29577951308232
        case .degreesPerSecond: return 1.0
        case .revolutionsPerMinute: return 6.0
        case .revolutionsPerSecond: return 360.0
        }
    }

    public var id: AUnit {
        switch self {
        case .radiansPerSecond: return .radiansPerSecond
        case .degreesPerSecond: return .degreesPerSecond
        case .revolutionsPerMinute: return .revolutionsPerMinute
        case .revolutionsPerSecond: return .revolutionsPerSecond
        }
    }

    public static var baseUnit: AUAngularVelocity = .degreesPerSecond
}

// MARK: - Area

public enum AUArea: AProportionalUnitProtocol, Identifiable {
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares
    public var coefficient: Double {
        switch self {
        case .squareMegameters: return 1000000000000.0
        case .squareKilometers: return 1000000.0
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1e-06
        case .squareMicrometers: return 1e-12
        case .squareNanometers: return 1e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.09290304
        case .squareYards: return 0.83612736
        case .squareMiles: return 2589988.110336
        case .acres: return 4046.8564224
        case .ares: return 100.0
        case .hectares: return 10000.0
        }
    }

    public var id: AUnit {
        switch self {
        case .squareMegameters: return .squareMegameters
        case .squareKilometers: return .squareKilometers
        case .squareMeters: return .squareMeters
        case .squareCentimeters: return .squareCentimeters
        case .squareMillimeters: return .squareMillimeters
        case .squareMicrometers: return .squareMicrometers
        case .squareNanometers: return .squareNanometers
        case .squareInches: return .squareInches
        case .squareFeet: return .squareFeet
        case .squareYards: return .squareYards
        case .squareMiles: return .squareMiles
        case .acres: return .acres
        case .ares: return .ares
        case .hectares: return .hectares
        }
    }

    public static var baseUnit: AUArea = .squareMeters
}

// MARK: - Concentration

public enum AUConcentration: AProportionalUnitProtocol, Identifiable {
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion
    public var coefficient: Double {
        switch self {
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .gramsPerLiter: return .gramsPerLiter
        case .milligramsPerDeciliter: return .milligramsPerDeciliter
        case .partsPerMillion: return .partsPerMillion
        }
    }

    public static var baseUnit: AUConcentration = .gramsPerLiter
}

// MARK: - Time

public enum AUTime: AProportionalUnitProtocol, Identifiable {
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries
    public var coefficient: Double {
        switch self {
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1e-06
        case .nanoseconds: return 1e-09
        case .picoseconds: return 1e-12
        case .days: return 86400.0
        case .weeks: return 604800.0
        case .years: return 31557600.0
        case .decades: return 315576000.0
        case .centuries: return 3155760000.0
        }
    }

    public var id: AUnit {
        switch self {
        case .hours: return .hours
        case .minutes: return .minutes
        case .seconds: return .seconds
        case .milliseconds: return .milliseconds
        case .microseconds: return .microseconds
        case .nanoseconds: return .nanoseconds
        case .picoseconds: return .picoseconds
        case .days: return .days
        case .weeks: return .weeks
        case .years: return .years
        case .decades: return .decades
        case .centuries: return .centuries
        }
    }

    public static var baseUnit: AUTime = .seconds
}

// MARK: - ElectricChargeCapacity

public enum AUElectricChargeCapacity: AProportionalUnitProtocol, Identifiable {
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, coulombs
    public var coefficient: Double {
        switch self {
        case .megaampereHours: return 3600000000.0
        case .kiloampereHours: return 3600000.0
        case .ampereHours: return 3600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .coulombs: return 1.0
        }
    }

    public var id: AUnit {
        switch self {
        case .megaampereHours: return .megaampereHours
        case .kiloampereHours: return .kiloampereHours
        case .ampereHours: return .ampereHours
        case .milliampereHours: return .milliampereHours
        case .microampereHours: return .microampereHours
        case .coulombs: return .coulombs
        }
    }

    public static var baseUnit: AUElectricChargeCapacity = .coulombs
}

// MARK: - ElectricCurrent

public enum AUElectricCurrent: AProportionalUnitProtocol, Identifiable {
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes
    public var coefficient: Double {
        switch self {
        case .megaamperes: return 1000000.0
        case .kiloamperes: return 1000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megaamperes: return .megaamperes
        case .kiloamperes: return .kiloamperes
        case .amperes: return .amperes
        case .milliamperes: return .milliamperes
        case .microamperes: return .microamperes
        }
    }

    public static var baseUnit: AUElectricCurrent = .amperes
}

// MARK: - ElectricPotential

public enum AUElectricPotential: AProportionalUnitProtocol, Identifiable {
    case megavolts, kilovolts, volts, millivolts, microvolts
    public var coefficient: Double {
        switch self {
        case .megavolts: return 1000000.0
        case .kilovolts: return 1000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megavolts: return .megavolts
        case .kilovolts: return .kilovolts
        case .volts: return .volts
        case .millivolts: return .millivolts
        case .microvolts: return .microvolts
        }
    }

    public static var baseUnit: AUElectricPotential = .volts
}

// MARK: - ElectricResistance

public enum AUElectricResistance: AProportionalUnitProtocol, Identifiable {
    case megaohms, kiloohms, ohms, milliohms, microohms
    public var coefficient: Double {
        switch self {
        case .megaohms: return 1000000.0
        case .kiloohms: return 1000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1e-06
        }
    }

    public var id: AUnit {
        switch self {
        case .megaohms: return .megaohms
        case .kiloohms: return .kiloohms
        case .ohms: return .ohms
        case .milliohms: return .milliohms
        case .microohms: return .microohms
        }
    }

    public static var baseUnit: AUElectricResistance = .ohms
}

// MARK: - Energy

public enum AUEnergy: AProportionalUnitProtocol, Identifiable {
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours
    public var coefficient: Double {
        switch self {
        case .kilojoules: return 1000.0
        case .joules: return 1.0
        case .kilocalories: return 4184.0
        case .calories: return 4.184
        case .kilowattHours: return 3600000.0
        case .wattHours: return 3600.0
        }
    }

    public var id: AUnit {
        switch self {
        case .kilojoules: return .kilojoules
        case .joules: return .joules
        case .kilocalories: return .kilocalories
        case .calories: return .calories
        case .kilowattHours: return .kilowattHours
        case .wattHours: return .wattHours
        }
    }

    public static var baseUnit: AUEnergy = .joules
}

// MARK: - Frequency

public enum AUFrequency: AProportionalUnitProtocol, Identifiable {
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond
    public var coefficient: Double {
        switch self {
        case .terahertz: return 1000000000000.0
        case .gigahertz: return 1000000000.0
        case .megahertz: return 1000000.0
        case .kilohertz: return 1000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1e-06
        case .nanohertz: return 1e-09
        case .framesPerSecond: return 1.0
        }
    }

    public var id: AUnit {
        switch self {
        case .terahertz: return .terahertz
        case .gigahertz: return .gigahertz
        case .megahertz: return .megahertz
        case .kilohertz: return .kilohertz
        case .hertz: return .hertz
        case .millihertz: return .millihertz
        case .microhertz: return .microhertz
        case .nanohertz: return .nanohertz
        case .framesPerSecond: return .framesPerSecond
        }
    }

    public static var baseUnit: AUFrequency = .hertz
}

// MARK: - Data

public enum AUData: AProportionalUnitProtocol, Identifiable {
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits
    public var coefficient: Double {
        switch self {
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1e+24
        case .zettabytes: return 1e+21
        case .exabytes: return 1e+18
        case .petabytes: return 1000000000000000.0
        case .terabytes: return 1000000000000.0
        case .gigabytes: return 1000000000.0
        case .megabytes: return 1000000.0
        case .kilobytes: return 1000.0
        case .yottabits: return 1.25e+23
        case .zettabits: return 1.25e+20
        case .exabits: return 1.25e+17
        case .petabits: return 125000000000000.0
        case .terabits: return 125000000000.0
        case .gigabits: return 125000000.0
        case .megabits: return 125000.0
        case .kilobits: return 125.0
        case .yobibytes: return 1.2089258196146292e+24
        case .zebibytes: return 1.1805916207174113e+21
        case .exbibytes: return 1.152921504606847e+18
        case .pebibytes: return 1125899906842624.0
        case .tebibytes: return 1099511627776.0
        case .gibibytes: return 1073741824.0
        case .mebibytes: return 1048576.0
        case .kibibytes: return 1024.0
        case .yobibits: return 1.5111572745182865e+23
        case .zebibits: return 1.4757395258967641e+20
        case .exbibits: return 1.4411518807585587e+17
        case .pebibits: return 140737488355328.0
        case .tebibits: return 137438953472.0
        case .gibibits: return 134217728.0
        case .mebibits: return 131072.0
        case .kibibits: return 128.0
        }
    }

    public var id: AUnit {
        switch self {
        case .bytes: return .bytes
        case .bits: return .bits
        case .nibbles: return .nibbles
        case .yottabytes: return .yottabytes
        case .zettabytes: return .zettabytes
        case .exabytes: return .exabytes
        case .petabytes: return .petabytes
        case .terabytes: return .terabytes
        case .gigabytes: return .gigabytes
        case .megabytes: return .megabytes
        case .kilobytes: return .kilobytes
        case .yottabits: return .yottabits
        case .zettabits: return .zettabits
        case .exabits: return .exabits
        case .petabits: return .petabits
        case .terabits: return .terabits
        case .gigabits: return .gigabits
        case .megabits: return .megabits
        case .kilobits: return .kilobits
        case .yobibytes: return .yobibytes
        case .zebibytes: return .zebibytes
        case .exbibytes: return .exbibytes
        case .pebibytes: return .pebibytes
        case .tebibytes: return .tebibytes
        case .gibibytes: return .gibibytes
        case .mebibytes: return .mebibytes
        case .kibibytes: return .kibibytes
        case .yobibits: return .yobibits
        case .zebibits: return .zebibits
        case .exbibits: return .exbibits
        case .pebibits: return .pebibits
        case .tebibits: return .tebibits
        case .gibibits: return .gibibits
        case .mebibits: return .mebibits
        case .kibibits: return .kibibits
        }
    }

    public static var baseUnit: AUData = .bytes
}
```

### File: Sources/AUnit/AUnit.swift

```swift
import Foundation

/// Enum representing various units.
/// 表示各种单位的枚举。
public enum AUnit: Codable, Sendable, Hashable, CaseIterable, Identifiable {
    // Length
    case feet, nauticalMiles, meters, kilometers, miles, megameters, hectometers, decameters, decimeters, centimeters, millimeters, micrometers, nanometers, picometers, inches, yards, scandinavianMiles, lightyears, fathoms, furlongs, astronomicalUnits, parsecs
    // Speed
    case knots, metersPerSecond, feetPerMinute, kilometersPerHour, feetPerSecond, milesPerHour, inchesPerSecond, yardsPerSecond
    // Pressure
    case hectopascals, inchesOfMercury, millimetersOfMercury, newtonsPerMetersSquared, gigapascals, megapascals, kilopascals, bars, millibars, poundsForcePerSquareInch
    // Temperature
    case kelvin, celsius, fahrenheit, rankine
    // TemperatureDifference
    case celsiusDelta, fahrenheitDelta
    // Mass
    case metricTons, kilograms, kilopounds, pounds, ounces, grams, decigrams, centigrams, milligrams, micrograms, nanograms, picograms, shortTons, stones, carats, ouncesTroy, slugs
    // Volume
    case liters, quarts, cubicMeters, cubicCentimeters, gallons, megaliters, kiloliters, deciliters, centiliters, milliliters, cubicKilometers, cubicDecimeters, cubicMillimeters, cubicInches, cubicFeet, cubicYards, cubicMiles, acreFeet, bushels, teaspoons, tablespoons, fluidOunces, cups, pints, imperialTeaspoons, imperialTablespoons, imperialFluidOunces, imperialPints, imperialQuarts, imperialGallons, metricCups
    // Acceleration
    case metersPerSecondSquared, gravity
    // Power
    case terawatts, gigawatts, megawatts, kilowatts, watts, milliwatts, microwatts, nanowatts, picowatts, femtowatts, horsepower
    // Angle
    case degrees, arcMinutes, arcSeconds, radians, gradians, revolutions
    // Angular Velocity
    case radiansPerSecond, degreesPerSecond, revolutionsPerMinute, revolutionsPerSecond
    // Area
    case squareMegameters, squareKilometers, squareMeters, squareCentimeters, squareMillimeters, squareMicrometers, squareNanometers, squareInches, squareFeet, squareYards, squareMiles, acres, ares, hectares
    // Concentration
    case gramsPerLiter, milligramsPerDeciliter, partsPerMillion
    // Time
    case hours, minutes, seconds, milliseconds, microseconds, nanoseconds, picoseconds, days, weeks, years, decades, centuries
    // ElectricChargeCapacity
    case megaampereHours, kiloampereHours, ampereHours, milliampereHours, microampereHours, coulombs
    // ElectricCurrent
    case megaamperes, kiloamperes, amperes, milliamperes, microamperes
    // ElectricPotential
    case megavolts, kilovolts, volts, millivolts, microvolts
    // ElectricResistance
    case megaohms, kiloohms, ohms, milliohms, microohms
    // Energy
    case kilojoules, joules, kilocalories, calories, kilowattHours, wattHours
    // Frequency
    case terahertz, gigahertz, megahertz, kilohertz, hertz, millihertz, microhertz, nanohertz, framesPerSecond
    // FuelEfficiency
    case litersPer100Kilometers, milesPerImperialGallon, milesPerGallon
    // Data
    case bytes, bits, nibbles, yottabytes, zettabytes, exabytes, petabytes, terabytes, gigabytes, megabytes, kilobytes, yottabits, zettabits, exabits, petabits, terabits, gigabits, megabits, kilobits, yobibytes, zebibytes, exbibytes, pebibytes, tebibytes, gibibytes, mebibytes, kibibytes, yobibits, zebibits, exbibits, pebibits, tebibits, gibibits, mebibits, kibibits

    /// The unit type of the unit.
    /// 单位的类型。
    public var unitType: AUnitType {
        switch self {
        case .feet, .nauticalMiles, .meters, .kilometers, .miles, .megameters, .hectometers, .decameters, .decimeters, .centimeters, .millimeters, .micrometers, .nanometers, .picometers, .inches, .yards, .scandinavianMiles, .lightyears, .fathoms, .furlongs, .astronomicalUnits, .parsecs:
            return .length
        case .feetPerSecond, .knots, .kilometersPerHour, .metersPerSecond, .milesPerHour, .feetPerMinute, .inchesPerSecond, .yardsPerSecond:
            return .speed
        case .hectopascals, .inchesOfMercury, .millimetersOfMercury, .newtonsPerMetersSquared, .gigapascals, .megapascals, .kilopascals, .bars, .millibars, .poundsForcePerSquareInch:
            return .pressure
        case .celsius, .fahrenheit, .kelvin, .rankine:
            return .temperature
        case .celsiusDelta, .fahrenheitDelta:
            return .temperatureDifference
        case .kilograms, .grams, .decigrams, .centigrams, .milligrams, .micrograms, .nanograms, .picograms, .ounces, .pounds, .stones, .metricTons, .shortTons, .carats, .ouncesTroy, .slugs, .kilopounds:
            return .mass
        case .liters, .quarts, .cubicMeters, .cubicCentimeters, .gallons, .megaliters, .kiloliters, .deciliters, .centiliters, .milliliters, .cubicKilometers, .cubicDecimeters, .cubicMillimeters, .cubicInches, .cubicFeet, .cubicYards, .cubicMiles, .acreFeet, .bushels, .teaspoons, .tablespoons, .fluidOunces, .cups, .pints, .imperialTeaspoons, .imperialTablespoons, .imperialFluidOunces, .imperialPints, .imperialQuarts, .imperialGallons, .metricCups:
            return .volume
        case .metersPerSecondSquared, .gravity:
            return .acceleration
        case .terawatts, .gigawatts, .megawatts, .kilowatts, .watts, .milliwatts, .microwatts, .nanowatts, .picowatts, .femtowatts, .horsepower:
            return .power
        case .degrees, .arcMinutes, .arcSeconds, .radians, .gradians, .revolutions:
            return .angle
        case .radiansPerSecond, .degreesPerSecond, .revolutionsPerMinute, .revolutionsPerSecond:
            return .angularVelocity
        case .squareMegameters, .squareKilometers, .squareMeters, .squareCentimeters, .squareMillimeters, .squareMicrometers, .squareNanometers, .squareInches, .squareFeet, .squareYards, .squareMiles, .acres, .ares, .hectares:
            return .area
        case .gramsPerLiter, .milligramsPerDeciliter, .partsPerMillion:
            return .concentration
        case .hours, .minutes, .seconds, .milliseconds, .microseconds, .nanoseconds, .picoseconds, .days, .weeks, .years, .decades, .centuries:
            return .time
        case .megaampereHours, .kiloampereHours, .ampereHours, .milliampereHours, .microampereHours, .coulombs:
            return .electricChargeCapacity
        case .megaamperes, .kiloamperes, .amperes, .milliamperes, .microamperes:
            return .electricCurrent
        case .megavolts, .kilovolts, .volts, .millivolts, .microvolts:
            return .electricPotential
        case .megaohms, .kiloohms, .ohms, .milliohms, .microohms:
            return .electricResistance
        case .kilojoules, .joules, .kilocalories, .calories, .kilowattHours, .wattHours:
            return .energy
        case .terahertz, .gigahertz, .megahertz, .kilohertz, .hertz, .millihertz, .microhertz, .nanohertz, .framesPerSecond:
            return .frequency
        case .litersPer100Kilometers, .milesPerImperialGallon, .milesPerGallon:
            return .fuelEfficiency
        case .bytes, .bits, .nibbles, .yottabytes, .zettabytes, .exabytes, .petabytes, .terabytes, .gigabytes, .megabytes, .kilobytes, .yottabits, .zettabits, .exabits, .petabits, .terabits, .gigabits, .megabits, .kilobits, .yobibytes, .zebibytes, .exbibytes, .pebibytes, .tebibytes, .gibibytes, .mebibytes, .kibibytes, .yobibits, .zebibits, .exbibits, .pebibits, .tebibits, .gibibits, .mebibits, .kibibits:
            return .data
        }
    }

    public var id: AUnit { self }

    /// The coefficient for conversion.
    /// 转换系数。
    public var coefficient: Double {
        switch self {
        // Length
        case .feet: return 0.3048
        case .nauticalMiles: return 1852.0
        case .meters: return 1.0
        case .kilometers: return 1000.0
        case .miles: return 1609.344
        case .megameters: return 1.0e6
        case .hectometers: return 100.0
        case .decameters: return 10.0
        case .decimeters: return 0.1
        case .centimeters: return 0.01
        case .millimeters: return 0.001
        case .micrometers: return 1.0e-6
        case .nanometers: return 1.0e-9
        case .picometers: return 1.0e-12
        case .inches: return 0.0254
        case .yards: return 0.9144
        case .scandinavianMiles: return 1.0e4
        case .lightyears: return 9.4607304725808e15
        case .fathoms: return 1.8288
        case .furlongs: return 201.168
        case .astronomicalUnits: return 1.495978707e11
        case .parsecs: return 3.0856775814913673e16
        // Speed
        case .knots: return 0.514444
        case .metersPerSecond: return 1.0
        case .feetPerMinute: return 0.00508
        case .kilometersPerHour: return 0.277778
        case .feetPerSecond: return 0.3048
        case .milesPerHour: return 0.44704
        case .inchesPerSecond: return 0.0254
        case .yardsPerSecond: return 0.9144
        // Pressure
        case .hectopascals: return 100.0
        case .inchesOfMercury: return 3386.389
        case .millimetersOfMercury: return 133.322
        case .newtonsPerMetersSquared: return 1.0
        case .gigapascals: return 1.0e9
        case .megapascals: return 1.0e6
        case .kilopascals: return 1000.0
        case .bars: return 1.0e5
        case .millibars: return 100.0
        case .poundsForcePerSquareInch: return 6894.757
        // Temperature
        case .kelvin, .celsius, .celsiusDelta: return 1.0
        case .fahrenheit, .rankine, .fahrenheitDelta: return 5.0 / 9.0
        // Mass
        case .metricTons: return 1.0e6
        case .shortTons: return 907184.74
        case .kilograms: return 1000.0
        case .kilopounds: return 4.5359237e5
        case .pounds: return 453.59237
        case .ounces: return 28.349523125
        case .grams: return 1.0
        case .decigrams: return 0.1
        case .centigrams: return 0.01
        case .milligrams: return 0.001
        case .micrograms: return 1.0e-6
        case .nanograms: return 1.0e-9
        case .picograms: return 1.0e-12
        case .stones: return 6350.29318
        case .carats: return 0.2
        case .ouncesTroy: return 31.1034768
        case .slugs: return 14593.9029372
        // Volume
        case .liters: return 1.0
        case .quarts: return 0.946352946
        case .cubicMeters: return 1000.0
        case .cubicCentimeters: return 0.001
        case .gallons: return 3.785411784
        case .megaliters: return 1.0e6
        case .kiloliters: return 1000.0
        case .deciliters: return 0.1
        case .centiliters: return 0.01
        case .milliliters: return 0.001
        case .cubicKilometers: return 1.0e12
        case .cubicDecimeters: return 1.0
        case .cubicMillimeters: return 1.0e-6
        case .cubicInches: return 0.016387064
        case .cubicFeet: return 28.316846592
        case .cubicYards: return 764.554857984
        case .cubicMiles: return 4.168181825440579584e12
        case .acreFeet: return 1233481.83754752
        case .bushels: return 35.23907016688
        case .teaspoons: return 0.00492892159375
        case .tablespoons: return 0.01478676478125
        case .fluidOunces: return 0.0295735295625
        case .cups: return 0.24
        case .pints: return 0.473176473
        case .imperialTeaspoons: return 0.00591938802083333
        case .imperialTablespoons: return 0.0177581640625
        case .imperialFluidOunces: return 0.0284130625
        case .imperialPints: return 0.56826125
        case .imperialQuarts: return 1.1365225
        case .imperialGallons: return 4.54609
        case .metricCups: return 0.25
        // Acceleration
        case .metersPerSecondSquared: return 1.0
        case .gravity: return 9.80665
        // Power
        case .terawatts: return 1.0e12
        case .gigawatts: return 1.0e9
        case .megawatts: return 1.0e6
        case .kilowatts: return 1000.0
        case .watts: return 1.0
        case .milliwatts: return 0.001
        case .microwatts: return 1.0e-6
        case .nanowatts: return 1.0e-9
        case .picowatts: return 1.0e-12
        case .femtowatts: return 1.0e-15
        case .horsepower: return 745.69987158227022
        // Angle
        case .degrees: return 1.0
        case .arcMinutes: return 1.0 / 60.0
        case .arcSeconds: return 1.0 / 3600.0
        case .radians: return 57.29577951308232
        case .gradians: return 0.9
        case .revolutions: return 360.0
        // Angular Velocity
        case .radiansPerSecond: return 57.29577951308232
        case .degreesPerSecond: return 1.0
        case .revolutionsPerMinute: return 6.0
        case .revolutionsPerSecond: return 360.0
        // Area
        case .squareMegameters: return 1.0e12
        case .squareKilometers: return 1.0e6
        case .squareMeters: return 1.0
        case .squareCentimeters: return 0.0001
        case .squareMillimeters: return 1.0e-6
        case .squareMicrometers: return 1.0e-12
        case .squareNanometers: return 1.0e-18
        case .squareInches: return 0.00064516
        case .squareFeet: return 0.09290304
        case .squareYards: return 0.83612736
        case .squareMiles: return 2.589988110336e6
        case .acres: return 4046.8564224
        case .ares: return 100.0
        case .hectares: return 10000.0
        // Concentration
        case .gramsPerLiter: return 1.0
        case .milligramsPerDeciliter: return 0.01
        case .partsPerMillion: return 1.0e-6
        // Time
        case .hours: return 3600.0
        case .minutes: return 60.0
        case .seconds: return 1.0
        case .milliseconds: return 0.001
        case .microseconds: return 1.0e-6
        case .nanoseconds: return 1.0e-9
        case .picoseconds: return 1.0e-12
        case .days: return 86400.0
        case .weeks: return 604800.0
        case .years: return 3.15576e7
        case .decades: return 3.15576e8
        case .centuries: return 3.15576e9
        // ElectricChargeCapacity
        case .megaampereHours: return 3.6e9
        case .kiloampereHours: return 3.6e6
        case .ampereHours: return 3600.0
        case .milliampereHours: return 3.6
        case .microampereHours: return 0.0036
        case .coulombs: return 1.0
        // ElectricCurrent
        case .megaamperes: return 1.0e6
        case .kiloamperes: return 1000.0
        case .amperes: return 1.0
        case .milliamperes: return 0.001
        case .microamperes: return 1.0e-6
        // ElectricPotential
        case .megavolts: return 1.0e6
        case .kilovolts: return 1000.0
        case .volts: return 1.0
        case .millivolts: return 0.001
        case .microvolts: return 1.0e-6
        // ElectricResistance
        case .megaohms: return 1.0e6
        case .kiloohms: return 1000.0
        case .ohms: return 1.0
        case .milliohms: return 0.001
        case .microohms: return 1.0e-6
        // Energy
        case .kilojoules: return 1000.0
        case .joules: return 1.0
        case .kilocalories: return 4184.0
        case .calories: return 4.184
        case .kilowattHours: return 3.6e6
        case .wattHours: return 3600.0
        // Frequency
        case .terahertz: return 1.0e12
        case .gigahertz: return 1.0e9
        case .megahertz: return 1.0e6
        case .kilohertz: return 1000.0
        case .hertz: return 1.0
        case .millihertz: return 0.001
        case .microhertz: return 1.0e-6
        case .nanohertz: return 1.0e-9
        case .framesPerSecond: return 1.0
        // FuelEfficiency （特殊）
        // 注意：100公里多少升、和加仑能跑多少英里时反的
        case .litersPer100Kilometers: return 1.0
        case .milesPerImperialGallon: return 282.4809362796091
        case .milesPerGallon: return 235.2145833333333
        // Data
        case .bytes: return 1.0
        case .bits: return 0.125
        case .nibbles: return 0.5
        case .yottabytes: return 1.0e24
        case .zettabytes: return 1.0e21
        case .exabytes: return 1.0e18
        case .petabytes: return 1.0e15
        case .terabytes: return 1.0e12
        case .gigabytes: return 1.0e9
        case .megabytes: return 1.0e6
        case .kilobytes: return 1000.0
        case .yottabits: return 1.0e24 * 0.125
        case .zettabits: return 1.0e21 * 0.125
        case .exabits: return 1.0e18 * 0.125
        case .petabits: return 1.0e15 * 0.125
        case .terabits: return 1.0e12 * 0.125
        case .gigabits: return 1.0e9 * 0.125
        case .megabits: return 1.0e6 * 0.125
        case .kilobits: return 125.0
        case .yobibytes: return 1.2089258196146292e24
        case .zebibytes: return 1.1805916207174113e21
        case .exbibytes: return 1.152921504606847e18
        case .pebibytes: return 1.125899906842624e15
        case .tebibytes: return 1.099511627776e12
        case .gibibytes: return 1.073741824e9
        case .mebibytes: return 1.048576e6
        case .kibibytes: return 1024.0
        case .yobibits: return 1.2089258196146292e24 * 0.125
        case .zebibits: return 1.1805916207174113e21 * 0.125
        case .exbibits: return 1.152921504606847e18 * 0.125
        case .pebibits: return 1.125899906842624e15 * 0.125
        case .tebibits: return 1.099511627776e12 * 0.125
        case .gibibits: return 1.073741824e9 * 0.125
        case .mebibits: return 1.048576e6 * 0.125
        case .kibibits: return 1024.0 * 0.125
        }
    }

    /// The constant for temperature conversion.
    /// 温度转换的常数。
    public var constant: Double {
        switch self {
        case .celsius: return 273.15
        case .fahrenheit: return 459.67
        default: return 0
        }
    }

    /// The symbol for the unit.
    /// 单位的符号。
    public var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit.
    /// 单位的短名称。
    public var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit.
    /// 单位的全名称。
    public var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit.
    /// 单位的详细介绍。
    public var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// Converts a value from this unit to another unit.
    /// 将值从此单位转换为另一单位。
    /// - Parameters:
    ///   - value: The value to convert.
    ///   - unit: The target unit.
    /// - Returns: The converted value, or nil if conversion is not possible.
    public func convert(value: Double, to unit: AUnit) -> Double? {
        guard self.unitType == unit.unitType else { return nil }
        // Temperature conversion
        if self.unitType == .temperature {
            let valueInKelvin = (value + self.constant) * self.coefficient
            return (valueInKelvin / unit.coefficient) - unit.constant
        }

        // 油效率比较特殊，需要反算
        if self.unitType == .fuelEfficiency {
            if self == .litersPer100Kilometers {
                if unit == .milesPerGallon {
                    return 235.2145833333333 / value
                } else if unit == .milesPerImperialGallon {
                    return 282.4809362796091 / value
                }
            } else if self == .milesPerGallon {
                if unit == .litersPer100Kilometers {
                    return 235.2145833333333 / value
                } else if unit == .milesPerImperialGallon {
                    return (235.2145833333333 / value) * (235.2145833333333 / 282.4809362796091)
                }
            } else if self == .milesPerImperialGallon {
                if unit == .litersPer100Kilometers {
                    return 282.4809362796091 / value
                } else if unit == .milesPerGallon {
                    return (282.4809362796091 / value) * (282.4809362796091 / 235.2145833333333)
                }
            }
        }
        // General conversion
        return (value * self.coefficient) / unit.coefficient
    }
}
```

### File: Sources/AUnit/Views/AUnitAnyTypeEasySelectorView.swift

```swift
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit from any unit type easily.
/// 提供选择任意单位类型的视图。
public struct AUnitAnyTypeEasySelectorView: View {
    @Binding private var unit: AUnit?

    public var body: some View {
        AUnitAnyTypeSelectorView(showNil: true) { unit in
            Text(unit.symbol + " / " + unit.longName)
        } content: {
            if let unit = unit {
                Text(unit.shortName)
            } else {
                Text(Ref.none)
            }
        } onSelect: {
            unit = $0
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeEasySelectorView`.
    /// 初始化 `AUnitAnyTypeEasySelectorView` 的新实例。
    /// - Parameter unit: A binding to the selected unit.
    ///   绑定到选定单位的绑定。
    public init(unit: Binding<AUnit?>) {
        self._unit = unit
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct Example: View {
    @State private var unit: AUnit? = nil
    var body: some View {
        AUnitAnyTypeEasySelectorView(unit: $unit)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    Example()
}
```

### File: Sources/AUnit/Views/AUnitBindNumberViews.swift

```swift
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
public struct AUnitBindNumberViews: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit?
    private var digits: Int
    private var placeholder: String
    private var allowInput: Bool

    public var body: some View {
        if let originalUnit = originalUnit {
            if allowInput {
                AUnitInputViews(value: $value, unit: $unit, originalUnit, digits: digits, placeholder: placeholder)
            } else {
                AUnitValueViews(unit: $unit, value: value, originalUnit: originalUnit, digits: digits)
            }
        } else {
            if allowInput {
                TextField(placeholder, value: $value, format: .number.precision(.significantDigits(0 ... digits)))
                    .modifier(NumberKeyboardModifier(value: $value, digits: digits))
            } else {
                Spacer()
                if let value = value {
                    Text("= ")
                        +
                        Text(value, format: .number.precision(.significantDigits(0 ... digits)))
                } else {
                    Text(verbatim: "-")
                }
            }
        }
    }

    public init(value: Binding<Double?>, unit: Binding<AUnit?>, origin originalUnit: AUnit?, digits: Int, placeholder: String, allowInput: Bool) {
        self._value = value
        self._unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        self.allowInput = allowInput
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, *)
@available(watchOS, unavailable)
#Preview {
    List {
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.fahrenheit), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.fahrenheit), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: true)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.celsius), origin: .celsius, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(5), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
        HStack {
            Text("Hello")
            AUnitBindNumberViews(value: .constant(nil), unit: .constant(.fahrenheit), origin: nil, digits: 5, placeholder: "Hello", allowInput: false)
        }
    }
}
```

### File: Sources/AUnit/Views/AUnitTypeConversionsAppView.swift

```swift
import SwiftUI

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
public struct AUnitTypeConversionsAppView: View {
    public var body: some View {
        List {
            ForEach(AUnitType.allCases) { unitType in
                NavigationLink {
                    List {
                        Section(unitType.longName) {
                            AUnitTypeConversionsForeachView(unitType: .constant(unitType))
                        }
                    }
                    .navigationTitle(unitType.shortName)
                } label: {
                    Label(unitType.longName, systemImage: unitType.systemImage)
                }
            }
        }
    }

    public init() {}
}

@available(iOS 16.0, macOS 13.0, tvOS 16.0, watchOS 9.0, *)
#Preview {
    NavigationView {
        AUnitTypeConversionsAppView()
            .navigationTitle("Units")
    }
}
```

### File: Sources/AUnit/Views/AUnitValueViews.swift

```swift
import SwiftUI

/// A view for viewing a value and selecting a unit.
/// 提供显示值和选择单位的视图。
@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
public struct AUnitValueViews: View {
    @Binding private var unit: AUnit?
    private var value: Double?
    private var originalUnit: AUnit
    private var digits: Int

    private var bindUnit: Binding<AUnit> {
        Binding {
            guard originalUnit.unitType == unit?.unitType
            else { return originalUnit }
            return unit ?? originalUnit
        } set: {
            unit = $0
        }
    }

    private var convertedValue: Double? {
        guard let value = value
        else { return value }
        return originalUnit.convert(value: value, to: bindUnit.wrappedValue)
    }

    public var body: some View {
        Spacer()
        if let convertedValue = convertedValue {
            Text("=")
            Menu {
                AUnitForeachView(typeFilter: originalUnit.unitType) { someUnit in
                    Button {
                        unit = someUnit
                    } label: {
                        Label(someUnit.symbol + " / " + someUnit.longName, systemImage: someUnit.unitType.systemImage)
                    }
                }
            } label: {
                Text(convertedValue, format: .number.precision(.significantDigits(0 ... digits)))
                    +
                    Text(" " + bindUnit.wrappedValue.symbol)
            }
        } else {
            Text("-")
        }
    }

    public init(unit: Binding<AUnit?>, value: Double?, originalUnit: AUnit, digits: Int) {
        self._unit = unit
        self.value = value
        self.originalUnit = originalUnit
        self.digits = digits
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct Example: View {
    @State private var unit: AUnit?
    private var value: Double? = 5
    private var originalUnit: AUnit = .meters
    private var digits: Int = 5
    var body: some View {
        List {
            HStack {
                Text("Value")
                AUnitValueViews(unit: $unit, value: value, originalUnit: originalUnit, digits: digits)
            }
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    Example()
}
```

### File: Sources/AUnit/Views/AUnitForeachView.swift

```swift
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
/// A view for iterating over units of a specific type.
/// 提供遍历特定类型单位的视图。
public struct AUnitForeachView<Content: View>: View {
    private var typeFilter: AUnitType
    private var content: (AUnit) -> Content

    private var unitsOfTheSameType: [AUnit] {
        AUnit.allCases.filter { unit in
            unit.unitType == typeFilter
        }
    }

    public var body: some View {
        ForEach(unitsOfTheSameType) { unit in
            content(unit)
        }
    }

    /// Initializes a new instance of `AUnitForeachView`.
    /// 初始化 `AUnitForeachView` 的新实例。
    /// - Parameters:
    ///   - typeFilter: The unit type to filter by.
    ///     要过滤的单位类型。
    ///   - content: A view builder that provides the content for each unit.
    ///     为每个单位提供内容的视图构建器。
    public init(typeFilter: AUnitType, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.typeFilter = typeFilter
        self.content = content
    }
}

@available(iOS 15.0, macOS 12.0, tvOS 15.0, watchOS 8.0, *)
#Preview {
    List(AUnitType.allCases) { unitType in
        Section(unitType.shortName) {
            AUnitForeachView(typeFilter: unitType) { unit in
                DisclosureGroup(unit.symbol) {
                    VStack(alignment: .leading) {
                        Text(unit.shortName)
                        Text(unit.longName)
                        Text(unit.detailedIntroduction)
                    }
                }
            }
        }
    }
    .environment(\.locale, .init(identifier: "zh-Hans"))
}
```

### File: Sources/AUnit/Views/AUnitAnyTypeForeachMenuView.swift

```swift
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A menu view for selecting units from any unit type.
/// 提供从任意单位类型中选择单位的菜单视图。
public struct AUnitAnyTypeForeachMenuView<Label: View, Content: View>: View {
    private var label: (AUnitType) -> Label
    private var content: (AUnit) -> Content

    public var body: some View {
        ForEach(AUnitType.allCases) { typeFilter in
            Menu {
                AUnitForeachView(typeFilter: typeFilter) {
                    content($0)
                }
            } label: {
                label(typeFilter)
            }
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeForeachMenuView`.
    /// 初始化 `AUnitAnyTypeForeachMenuView` 的新实例。
    /// - Parameters:
    ///   - label: A view builder that provides the label for each unit type.
    ///     为每个单位类型提供标签的视图构建器。
    ///   - content: A view builder that provides the content for each unit.
    ///     为每个单位提供内容的视图构建器。
    public init(@ViewBuilder label: @escaping (AUnitType) -> Label, @ViewBuilder content: @escaping (AUnit) -> Content) {
        self.label = label
        self.content = content
    }
}
```

### File: Sources/AUnit/Views/NumberKeyboardModifier.swift

```swift
import SwiftUI

#if os(iOS)
@available(iOS 15.0, *)
struct NumberKeyboardModifier: ViewModifier {
    @Binding var value: Double?
    var digits: Int

    @State private var rotationAngle: Double = 0 // State variable to track rotation
    @FocusState private var isFocused: Bool

    func body(content: Content) -> some View {
        content
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
                        Image(systemName: "arrow.counterclockwise")
                            .foregroundStyle(.blue)
                            .onTapGesture {
                                value = nil
                                withAnimation {
                                    rotationAngle -= 360
                                }
                            }
                            .rotationEffect(.degrees(rotationAngle)) // Apply rotation effect
                    }
                }
            }
    }
}
#endif
```

### File: Sources/AUnit/Views/AUnitTypeConversionsForeachView.swift

```swift
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
public struct AUnitTypeConversionsForeachView: View {
    @Binding var unitType: AUnitType
    @State private var value: Double?

    var digits: Int

    @AppStorage("18E422F5-8307-47ED-AD8E-434402A64A35 unitValues")
    private var storedData: Data?

    private func loadValue() {
        let jsonDecoder = JSONDecoder()
        guard let data = storedData,
              let dictionary = try? jsonDecoder.decode([AUnitType: Double].self, from: data)
        else { return }
        value = dictionary[unitType]
    }

    private func saveValue() {
        let jsonDecoder = JSONDecoder()
        var dictionary = (try? jsonDecoder.decode([AUnitType: Double].self, from: storedData ?? Data())) ?? [:]
        dictionary[unitType] = value
        storedData = try? JSONEncoder().encode(dictionary)
    }

    private var allUnits: [AUnit] {
        unitType.allUnits
    }

    public var body: some View {
        ForEach(allUnits) { unit in
            AUnitInputHStackFixedUnit(value: $value, unit: unit, originalUnit: unitType.baseUnit, digits: 10, placeholder: unit.shortName)
        }
        .onAppear {
            loadValue()
        }
        .onDisappear {
            saveValue()
        }
    }

    init(unitType: Binding<AUnitType>, digits: Int = 10) {
        _unitType = unitType
        self.digits = digits
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    NavigationView {
        List {
            ForEach(AUnitType.allCases) { unitType in
                Section(unitType.shortName) {
                    AUnitTypeConversionsForeachView(unitType: .constant(unitType))
                }
            }
        }
    }
}
```

### File: Sources/AUnit/Views/AUnitEasySelectorView.swift

```swift
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit of a specific type.
/// 提供选择特定类型单位的视图。
public struct AUnitEasySelectorView: View {
    @Binding private var unit: AUnit?
    private var typeFilter: AUnitType

    public var body: some View {
        Menu {
            Button(Ref.none) {
                unit = nil
            }
            AUnitForeachView(typeFilter: typeFilter) { unit in
                Button {
                    self.unit = unit
                } label: {
                    Label(unit.symbol + " / " + unit.longName, systemImage: unit.unitType.systemImage)
                }
            }
        } label: {
            if let unit = unit {
                Text(unit.symbol)
            } else {
                Text(Ref.none)
            }
        }
    }

    /// Initializes a new instance of `AUnitSelectorView`.
    /// 初始化 `AUnitSelectorView` 的新实例。
    /// - Parameters:
    ///   - unit: A binding to the selected unit.
    ///   - typeFilter: The unit type to filter by.
    ///     要过滤的单位类型。
    public init(unit: Binding<AUnit?>, filter typeFilter: AUnitType) {
        self._unit = unit
        self.typeFilter = typeFilter
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct AUnitSelectorViewExample: View {
    @State private var unit: AUnit? = .meters

    var body: some View {
        AUnitEasySelectorView(unit: $unit, filter: .length)
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitSelectorViewExample()
}
```

### File: Sources/AUnit/Views/AUnitInputViews.swift

```swift
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
/// A view for inputting a value and selecting a unit.
/// 提供输入值和选择单位的视图。
public struct AUnitInputViews: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit
    private var digits: Int
    private var placeholder: String

    private var bindUnit: Binding<AUnit?> {
        Binding {
            guard originalUnit.unitType == unit?.unitType
            else { return originalUnit }
            return unit
        } set: {
            unit = $0
        }
    }

    private var convertedValue: Binding<Double?> {
        Binding<Double?>(
            get: {
                guard let value = value,
                      let unit = bindUnit.wrappedValue
                else { return value }
                return originalUnit.convert(value: value, to: unit)
            },
            set: { newValue in
                guard let newValue = newValue,
                      let unit = bindUnit.wrappedValue
                else {
                    value = newValue
                    return
                }
                value = unit.convert(value: newValue, to: originalUnit)
            }
        )
    }

    public var body: some View {
        TextField(
            placeholder,
            value: convertedValue,
            format: .number.precision(.significantDigits(0 ... digits))
        )
        .multilineTextAlignment(.trailing)
        #if os(iOS)
            .modifier(NumberKeyboardModifier(value: convertedValue, digits: digits))
        #endif
        AUnitEasySelectorView(unit: bindUnit, filter: originalUnit.unitType)
    }

    /// Initializes a new instance of `UnitInputView`.
    /// 初始化 `UnitInputView` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field.
    ///   - label: A view builder for the label to be displayed before the text field.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String) {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct UnitInputViewExample: View {
    @State private var value: Double? = 1500
    @State private var unit1: AUnit? = .fahrenheit
    @State private var unit2: AUnit? = .feet

    var body: some View {
        NavigationView {
            List {
                AUnitInputHStack(
                    value: $value,
                    unit: $unit1,
                    .meters,
                    digits: 5,
                    placeholder: "1"
                )
                AUnitInputHStack(
                    value: $value,
                    unit: $unit2,
                    .meters,
                    digits: 5,
                    placeholder: "2"
                )
            }
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    UnitInputViewExample()
}
```

### File: Sources/AUnit/Views/AUnitInputHStackFixedUnit.swift

```swift
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
public struct AUnitInputHStackFixedUnit: View {
    @Binding private var value: Double?
    private var unit: AUnit
    private var originalUnit: AUnit
    private var digits: Int
    private var placeholder: String

    private var actualUnit: AUnit {
        guard originalUnit.unitType == unit.unitType
        else { return originalUnit }
        return unit
    }

    private var convertedValue: Binding<Double?> {
        Binding<Double?>(
            get: {
                guard let value = value
                else { return value }
                return originalUnit.convert(value: value, to: actualUnit)
            },
            set: { newValue in
                guard let newValue = newValue
                else {
                    value = newValue
                    return
                }
                value = actualUnit.convert(value: newValue, to: originalUnit)
            }
        )
    }

    public var body: some View {
        HStack {
            TextField(
                placeholder,
                value: convertedValue,
                format: .number.precision(.significantDigits(0 ... digits))
            )
            #if os(iOS)
            .modifier(NumberKeyboardModifier(value: convertedValue, digits: digits))
            #endif
            Menu(actualUnit.symbol) {
                Label(actualUnit.longName, systemImage: actualUnit.unitType.systemImage)
            }
        }
    }

    public init(value: Binding<Double?>, unit: AUnit, originalUnit: AUnit, digits: Int, placeholder: String) {
        _value = value
        self.unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
    }
}
```

### File: Sources/AUnit/Views/AUnitTranslationPreviewView.swift

```swift
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
private struct AUnitTranslationPreviewView: View {
    // 获取所有可用的本地化列表，过滤掉 Base 本地化
    let localizations: [String] = Bundle.module.localizations.filter { $0 != "Base" }

    // 当前选择的语言
    @State private var selectedLocalization: String

    init() {
        // 默认选择第一个本地化语言
        _selectedLocalization = State(initialValue: localizations.first ?? "en")
    }

    var body: some View {
        VStack {
            // 语言选择器
            languagePicker
                .padding() // 添加内边距
                .background(Color.gray.opacity(0.1)) // 设置背景颜色
                .cornerRadius(8) // 设置圆角
                .padding(.horizontal) // 添加水平内边距

            // 单位列表
            unitList
        }
        .environment(\.locale, .init(identifier: selectedLocalization)) // 设置当前环境的语言
    }

    // 语言选择器视图
    private var languagePicker: some View {
        Picker("Select Language", selection: $selectedLocalization) { // 语言选择器
            ForEach(localizations, id: \.self) { localization in // 遍历所有本地化语言
                Text(Locale.current.localizedString(forIdentifier: localization) ?? localization).tag(localization) // 显示语言名称
            }
        }
    }

    // 单位列表视图
    private var unitList: some View {
        List(AUnitType.allCases) { unitType in // 遍历所有单位类型
            Section(header: Text(localizedString("\(unitType).longName")) // 段头
                .font(.headline) // 设置字体
                .foregroundColor(.primary)) // 设置颜色
            {
                AUnitForeachView(typeFilter: unitType) { unit in // 遍历每个单位类型的单位
                    VStack(alignment: .leading, spacing: 4) { // 垂直堆叠视图
                        Text("\(localizedString("\(unit).symbol"))") // 显示符号
                            .font(.subheadline) // 设置子标题字体
                            .foregroundColor(.secondary) // 设置次要颜色
                        Text("Short Name: \(localizedString("\(unit).shortName"))") // 显示短名称
                            .font(.body) // 设置正文字体
                        Text("Long Name: \(localizedString("\(unit).longName"))") // 显示长名称
                            .font(.body) // 设置正文字体
                        Text("\(localizedString("\(unit).detailedIntroduction"))") // 显示长名称
                            .font(.body) // 设置正文字体
                    }
                    .padding(.vertical, 4) // 添加垂直内边距
                }
            }
        }
    }

    // 获取本地化字符串的方法
    private func localizedString(_ key: String) -> String {
        guard let bundlePath = Bundle.module.path(forResource: selectedLocalization, ofType: "lproj"), // 获取本地化文件路径
              let localizedBundle = Bundle(path: bundlePath) // 获取本地化 Bundle
        else {
            return key // 如果未找到，返回键值
        }
        return NSLocalizedString(key, bundle: localizedBundle, comment: "") // 返回本地化字符串
    }
}

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
#Preview {
    AUnitTranslationPreviewView() // 预览视图
}
```

### File: Sources/AUnit/Views/AUnitAnyTypeSelectorView.swift

```swift
import SwiftUI

@available(iOS 14.0, macOS 11.0, tvOS 17.0, *)
@available(watchOS, unavailable)
/// A view for selecting a unit from any unit type with customizable labels and content.
/// 提供从任意单位类型中选择单位的视图，并且可以自定义标签和内容。
public struct AUnitAnyTypeSelectorView<Label: View, Content: View>: View {
    private var showNil: Bool
    private var label: (AUnit) -> Label
    private var content: () -> Content
    private var onSelect: (AUnit?) -> Void

    public var body: some View {
        Menu {
            if showNil {
                Button(Ref.none) {
                    onSelect(nil)
                }
            }
            AUnitAnyTypeForeachMenuView { unitType in
                SwiftUI.Label(unitType.shortName, systemImage: unitType.systemImage)
            } content: { unit in
                Button {
                    onSelect(unit)
                } label: {
                    label(unit)
                }
            }
        } label: {
            content()
        }
    }

    /// Initializes a new instance of `AUnitAnyTypeSelectorView`.
    /// 初始化 `AUnitAnyTypeSelectorView` 的新实例。
    /// - Parameters:
    ///   - showNil: A boolean indicating whether to show a "None" option.
    ///     指示是否显示“None”选项的布尔值。
    ///   - label: A view builder that provides the label for each unit.
    ///     为每个单位提供标签的视图构建器。
    ///   - content: A view builder that provides the content for the menu.
    ///     为菜单提供内容的视图构建器。
    ///   - onSelect: A closure that is called when a unit is selected.
    ///     选择单位时调用的闭包。
    public init(showNil: Bool, @ViewBuilder label: @escaping (AUnit) -> Label, @ViewBuilder content: @escaping () -> Content, onSelect: @escaping (AUnit?) -> Void) {
        self.showNil = showNil
        self.label = label
        self.content = content
        self.onSelect = onSelect
    }
}
```

### File: Sources/AUnit/Views/AUnitInputHStack.swift

```swift
import SwiftUI

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
/// A view for inputting a value and selecting a unit.
/// 提供输入值和选择单位的视图。
public struct AUnitInputHStack<ALabel: View>: View {
    @Binding private var value: Double?
    @Binding private var unit: AUnit?
    private var originalUnit: AUnit
    private var digits: Int
    private var placeholder: String
    private var label: () -> ALabel

    public var body: some View {
        HStack {
            label()
            AUnitInputViews(value: $value, unit: $unit, originalUnit, digits: digits, placeholder: placeholder)
        }
    }

    /// Initializes a new instance of `AUnitInputHStack`.
    /// 初始化 `AUnitInputHStack` 的新实例。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field.
    ///   - label: A view builder for the label to be displayed before the text field.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String, @ViewBuilder label: @escaping () -> ALabel) {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        self.label = label
    }

    /// Initializes a new instance of `AUnitInputHStack` with a default label.
    /// 初始化 `AUnitInputHStack` 的新实例，并使用默认标签。
    /// - Parameters:
    ///   - value: A binding to the value to be input.
    ///   - unit: A binding to the selected unit.
    ///   - originalUnit: The original unit.
    ///   - digits: The number of decimal places to retain.
    ///   - placeholder: The placeholder text for the text field, which is also used as the label.
    public init(value: Binding<Double?>, unit: Binding<AUnit?>, _ originalUnit: AUnit, digits: Int, placeholder: String) where ALabel == Text {
        _value = value
        _unit = unit
        self.originalUnit = originalUnit
        self.digits = digits
        self.placeholder = placeholder
        label = { Text(placeholder) }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
private struct UnitInputViewExample: View {
    @State private var value: Double? = 1500
    @State private var unit1: AUnit? = .fahrenheit
    @State private var unit2: AUnit? = .feet

    var body: some View {
        NavigationView {
            List {
                AUnitInputHStack(
                    value: $value,
                    unit: $unit1,
                    .meters,
                    digits: 5,
                    placeholder: "1"
                )
                AUnitInputHStack(
                    value: $value,
                    unit: $unit2,
                    .meters,
                    digits: 5,
                    placeholder: "2"
                )
            }
        }
    }
}

@available(macOS 12.0, iOS 15.0, tvOS 15.0, watchOS 8.0, *)
@available(watchOS, unavailable)
#Preview {
    UnitInputViewExample()
}
```

### File: Sources/AUnit/Protocols/AQuantityProtocol.swift

```swift
import Foundation

/// Protocol representing a measurement with a specific value and unit.
/// 表示具有特定值和单位的测量协议。
public protocol AQuantityProtocol: Codable, Hashable, Sendable {
    associatedtype UnitType: AUnitProtocol

    /// The value of the measurement.
    /// 测量的值。
    var value: Double { get set }

    /// The unit of the measurement.
    /// 测量的单位。
    var unit: UnitType { get set }

    /// Initializes a new measurement with the given value and unit.
    /// 使用给定的值和单位初始化一个新的测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///   - unit: The unit of the measurement.
    init(value: Double, unit: UnitType)
}

public extension AQuantityProtocol {
    /// Converts the measurement to a specified unit.
    /// 将测量值转换为指定单位。
    /// - Parameter newUnit: The target unit to convert to.
    ///                      要转换的目标单位。
    mutating func convertSelf(to newUnit: UnitType) {
        self.value = unit.convert(value: value, to: newUnit)
        self.unit = newUnit
    }

    /// Returns a new measurement converted to a specified unit.
    /// 返回一个转换为指定单位的新测量值。
    /// - Parameter newUnit: The target unit to convert to.
    ///                      要转换的目标单位。
    /// - Returns: A new measurement converted to the target unit.
    ///            转换为目标单位的新测量值。
    func converted(to newUnit: UnitType) -> Self {
        let newValue = unit.convert(value: value, to: newUnit)
        return .init(value: newValue, unit: newUnit)
    }

    /// Checks if this measurement is equal to another measurement within a specified tolerance.
    /// 检查此测量值是否在指定的容差范围内等于另一个测量值。
    /// - Parameters:
    ///   - other: The other measurement to compare.
    ///   - epsilon: The tolerance within which the measurements are considered equal.
    /// - Returns: A boolean indicating whether the measurements are equal within the specified tolerance.
    func isEqual(to other: Self, epsilon: Double = 1e-10) -> Bool {
        let convertedOther = other.converted(to: unit)
        return abs(value - convertedOther.value) <= epsilon
    }
}
```

### File: Sources/AUnit/Protocols/AUnitProtocol.swift

```swift
import Foundation

/// Protocol representing a unit of measurement with conversion capabilities.
/// 表示具有转换功能的测量单位的协议。
public protocol AUnitProtocol: Codable, Sendable, Hashable, CaseIterable {
    /// Converts a value from the current unit to another unit.
    /// 将一个值从当前单位转换为另一个单位。
    /// - Parameters:
    ///   - value: The value to be converted.
    ///            要转换的值。
    ///   - unit: The target unit to convert to.
    ///           要转换到的目标单位。
    /// - Returns: The converted value.
    ///            转换后的值。
    func convert(value: Double, to unit: Self) -> Double

    /// Converts a value to the base unit value.
    /// 将一个值转换为基础单位值。
    /// - Parameter value: The value to be converted.
    ///                    要转换的值。
    /// - Returns: The value in the base unit.
    ///            基础单位中的值。
    func toBaseValue(value: Double) -> Double

    /// Converts a value from the base unit value.
    /// 从基础单位值转换一个值。
    /// - Parameter value: The value in the base unit.
    ///                    基础单位中的值。
    /// - Returns: The converted value.
    ///            转换后的值。
    func fromBaseValue(value: Double) -> Double

    /// Associated AUnit enumeration value.
    /// 关联的 AUnit 枚举值。
    var id: AUnit { get }

    /// The base unit for this unit type.
    /// 此单位类型的基础单位。
    static var baseUnit: Self { get }
}

public extension AUnitProtocol {
    /// The symbol for the unit.
    /// 单位的符号。
    var symbol: String {
        return NSLocalizedString("\(self).symbol", bundle: .module, comment: "")
    }

    /// The short name for the unit.
    /// 单位的短名称。
    var shortName: String {
        return NSLocalizedString("\(self).shortName", bundle: .module, comment: "")
    }

    /// The long name for the unit.
    /// 单位的全名称。
    var longName: String {
        return NSLocalizedString("\(self).longName", bundle: .module, comment: "")
    }

    /// The detailed introduction for the unit.
    /// 单位的详细介绍。
    var detailedIntroduction: String {
        return NSLocalizedString("\(self).detailedIntroduction", bundle: .module, comment: "")
    }

    /// Converts a value from the current unit to another unit of the same type.
    /// 将一个值从当前单位转换为相同类型的另一个单位。
    /// - Parameters:
    ///   - value: The value to be converted.
    ///            要转换的值。
    ///   - unit: The target unit to convert to.
    ///           要转换到的目标单位。
    /// - Returns: The converted value.
    ///            转换后的值。
    func convert(value: Double, to unit: Self) -> Double {
        let baseValue = self.toBaseValue(value: value)
        return unit.fromBaseValue(value: baseValue)
    }
}
```

### File: Sources/AUnit/Protocols/AProportionalUnitProtocol.swift

```swift
import Foundation

// 符合比例的UnitProtocol
public protocol AProportionalUnitProtocol: AUnitProtocol {
    var coefficient: Double { get }
}

public extension AProportionalUnitProtocol {
    func toBaseValue(value: Double) -> Double {
        return value * self.coefficient
    }

    func fromBaseValue(value: Double) -> Double {
        return value / self.coefficient
    }
}
```

### File: Sources/AUnit/AMeasurement.swift

```swift
import Foundation

/// A struct representing a measurement with a specific value and unit.
/// 表示具有特定值和单位的测量结构。
public struct AMeasurement: Codable, Sendable, Hashable, CustomStringConvertible {
    /// The value of the measurement.
    /// 测量的值。
    public var value: Double
    /// The unit of the measurement.
    /// 测量的单位。
    public var unit: AUnit

    /// Initializes a new measurement with the given value and unit.
    /// 使用给定的值和单位初始化一个新的测量。
    /// - Parameters:
    ///   - value: The value of the measurement.
    ///   - unit: The unit of the measurement.
    public init(value: Double, unit: AUnit) {
        self.value = value
        self.unit = unit
    }

    /// Converts the measurement to a target unit.
    /// 将测量值转换为目标单位。
    /// - Parameter targetUnit: The unit to convert to.
    /// - Returns: A new measurement converted to the target unit, or nil if conversion is not possible.
    public func converted(to targetUnit: AUnit) -> AMeasurement? {
        guard let convertedValue = unit.convert(value: value, to: targetUnit) else { return nil }
        return AMeasurement(value: convertedValue, unit: targetUnit)
    }

    /// A description of the measurement.
    /// 测量的描述。
    public var description: String {
        return "\(value) \(unit.symbol)"
    }

    /// Adds another measurement to this measurement.
    /// 将另一个测量值添加到此测量值中。
    /// - Parameter other: The other measurement to add.
    /// - Returns: A new measurement representing the sum, or nil if the units are incompatible.
    public func adding(_ other: AMeasurement) -> AMeasurement? {
        switch unit {
        case .fahrenheit, .rankine:
            guard let otherConverted = other.converted(to: .fahrenheitDelta)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        case .celsius, .kelvin:
            guard let otherConverted = other.converted(to: .celsiusDelta)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        default:
            guard unit.unitType == other.unit.unitType,
                  unit.unitType != .fuelEfficiency, // 燃油效率特殊，不能相加减
                  let otherConverted = other.converted(to: unit)
            else { return nil }
            return AMeasurement(value: value + otherConverted.value, unit: unit)
        }
    }

    /// Subtracts another measurement from this measurement.
    /// 从此测量值中减去另一个测量值。
    /// - Parameter other: The other measurement to subtract.
    /// - Returns: A new measurement representing the difference, or nil if the units are incompatible.
    public func subtracting(_ other: AMeasurement) -> AMeasurement? {
        switch unit {
        case .fahrenheit, .rankine:
            guard let otherConverted = other.converted(to: .fahrenheitDelta)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        case .celsius, .kelvin:
            guard let otherConverted = other.converted(to: .celsiusDelta)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        default:
            guard unit.unitType == other.unit.unitType,
                  unit.unitType != .fuelEfficiency, // 燃油效率特殊，不能相加减
                  let otherConverted = other.converted(to: unit)
            else { return nil }
            return AMeasurement(value: value - otherConverted.value, unit: unit)
        }
    }

    /// Multiplies this measurement by another measurement.
    /// 将此测量值乘以另一个测量值。
    /// - Parameter other: The other measurement to multiply by.
    /// - Returns: A new measurement representing the product, or nil if the units are incompatible.
    public func multiplying(by other: AMeasurement, recalculate: Bool = false) -> AMeasurement? {
        switch (unit.unitType, other.unit.unitType) {
        case (.length, .length):
            guard let selfInMeters = converted(to: .meters),
                  let otherInMeters = other.converted(to: .meters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInMeters.value, unit: .squareMeters)
        case (.length, .area):
            guard let selfInMeters = converted(to: .meters),
                  let otherInSquareMeters = other.converted(to: .squareMeters) else { return nil }
            return AMeasurement(value: selfInMeters.value * otherInSquareMeters.value, unit: .cubicMeters)
        case (.electricCurrent, .electricPotential):
            guard let selfInAmperes = converted(to: .amperes),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInAmperes.value * otherInVolts.value, unit: .watts)
        case (.power, .time):
            guard let selfInWatts = converted(to: .watts),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInWatts.value * otherInSeconds.value, unit: .joules)
        case (.speed, .time):
            guard let selfInMetersPerSecond = converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value * otherInSeconds.value, unit: .meters)
        case (.acceleration, .time):
            guard let selfInMetersPerSecondSquared = converted(to: .metersPerSecondSquared),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecondSquared.value * otherInSeconds.value, unit: .metersPerSecond)
        case (.electricChargeCapacity, .electricPotential):
            guard let selfInAmpereHours = converted(to: .ampereHours),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInAmpereHours.value * otherInVolts.value, unit: .wattHours)
        case (.angularVelocity, .time):
            guard let selfInRadiansPerSecond = converted(to: .radiansPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInRadiansPerSecond.value * otherInSeconds.value, unit: .radians)
        case (.time, .angularVelocity):
            guard let selfInSeconds = converted(to: .seconds),
                  let otherInRadiansPerSecond = other.converted(to: .radiansPerSecond) else { return nil }
            return AMeasurement(value: selfInSeconds.value * otherInRadiansPerSecond.value, unit: .radians)
        // 其他乘法操作（可根据需要扩展）
        default:
            guard recalculate else { return other.multiplying(by: self, recalculate: true) }
            return nil
        }
    }

    /// Multiplies this measurement by a scalar.
    /// 将此测量值乘以一个标量。
    /// - Parameter scalar: The scalar to multiply by.
    /// - Returns: A new measurement representing the product.
    public func multiplying(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: value * scalar, unit: unit)
    }

    /// Divides this measurement by another measurement.
    /// 将此测量值除以另一个测量值。
    /// - Parameter other: The other measurement to divide by.
    /// - Returns: A new measurement representing the quotient, or nil if the units are incompatible.
    public func dividing(by other: AMeasurement) -> AMeasurement? {
        switch (unit.unitType, other.unit.unitType) {
        case (.length, .time):
            guard let selfInMeters = converted(to: .meters),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMeters.value / otherInSeconds.value, unit: .metersPerSecond)
        case (.mass, .volume):
            guard let selfInKilograms = converted(to: .grams),
                  let otherInLiters = other.converted(to: .liters) else { return nil }
            return AMeasurement(value: selfInKilograms.value / otherInLiters.value, unit: .gramsPerLiter)
        case (.electricPotential, .electricCurrent):
            guard let selfInVolts = converted(to: .volts),
                  let otherInAmperes = other.converted(to: .amperes) else { return nil }
            return AMeasurement(value: selfInVolts.value / otherInAmperes.value, unit: .ohms)
        case (.energy, .time):
            guard let selfInJoules = converted(to: .joules),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInSeconds.value, unit: .watts)
        case (.speed, .time):
            guard let selfInMetersPerSecond = converted(to: .metersPerSecond),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInMetersPerSecond.value / otherInSeconds.value, unit: .metersPerSecondSquared)
        case (.energy, .electricPotential):
            guard let selfInJoules = converted(to: .wattHours),
                  let otherInVolts = other.converted(to: .volts) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInVolts.value, unit: .ampereHours)
        case (.energy, .electricChargeCapacity):
            guard let selfInJoules = converted(to: .wattHours),
                  let otherInAmpereHours = other.converted(to: .ampereHours) else { return nil }
            return AMeasurement(value: selfInJoules.value / otherInAmpereHours.value, unit: .volts)
        case (.volume, .area):
            guard let selfInCubicMeters = converted(to: .cubicMeters),
                  let otherInSquareMeters = other.converted(to: .squareMeters) else { return nil }
            return AMeasurement(value: selfInCubicMeters.value / otherInSquareMeters.value, unit: .meters)
        case (.volume, .length):
            guard let selfInCubicMeters = converted(to: .cubicMeters),
                  let otherInMeters = other.converted(to: .meters) else { return nil }
            return AMeasurement(value: selfInCubicMeters.value / otherInMeters.value, unit: .squareMeters)
        case (.angle, .time):
            guard let selfInRadians = converted(to: .radians),
                  let otherInSeconds = other.converted(to: .seconds) else { return nil }
            return AMeasurement(value: selfInRadians.value / otherInSeconds.value, unit: .radiansPerSecond)
        // 其他除法操作（可根据需要扩展）
        default:
            return nil
        }
    }

    /// Divides this measurement by a scalar.
    /// 将此测量值除以一个标量。
    /// - Parameter scalar: The scalar to divide by.
    /// - Returns: A new measurement representing the quotient.
    public func dividing(by scalar: Double) -> AMeasurement {
        return AMeasurement(value: value / scalar, unit: unit)
    }

    /// Performs the modulo operation on this measurement by another measurement.
    /// 对该测量值执行取模运算。
    /// - Parameter other: The other measurement to use as the divisor.
    /// - Returns: A new measurement representing the remainder, or nil if the units are incompatible or temperature units.
    public func modulo(by other: AMeasurement) -> AMeasurement? {
        guard unit.unitType == other.unit.unitType,
              unit.unitType != .temperature,
              unit.unitType != .fuelEfficiency,
              let otherConverted = other.converted(to: unit) else { return nil }
        return AMeasurement(value: value.truncatingRemainder(dividingBy: otherConverted.value), unit: unit)
    }

    /// Checks if this measurement is equal to another measurement within a specified tolerance.
    /// 检查此测量值是否在指定的容差范围内等于另一个测量值。
    /// - Parameters:
    ///   - other: The other measurement to compare.
    ///   - epsilon: The tolerance within which the measurements are considered equal.
    /// - Returns: A boolean indicating whether the measurements are equal within the specified tolerance.
    public func equal(to other: AMeasurement, epsilon: Double = 1e-10) -> Bool {
        guard let convertedOther = other.converted(to: unit)
        else { return false }
        return abs(value - convertedOther.value) <= epsilon
    }
}
```
