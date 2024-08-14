# AUnit Package

![Swift](https://img.shields.io/badge/Swift-5.10-orange.svg)
![Platforms](https://img.shields.io/badge/Platforms-iOS%20%7C%20macOS%20%7C%20watchOS%20%7C%20tvOS-blue.svg)
![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)
![Build](https://img.shields.io/badge/Build-Passing-brightgreen.svg)
![Tests](https://img.shields.io/badge/tests-passing-brightgreen)

## Translations

[🇺🇸 English](#english) | [🇨🇳 简体中文](#简体中文) | [🇯🇵 日本語](#日本語) | [🇫🇷 Français](#français) | [🇰🇷 한국어](#한국어) | [🇷🇺 Русский](#русский) | [🇵🇹 Português](#português) | [🇪🇸 Español](#español) | [🇹🇭 ไทย](#ไทย) | [🇩🇪 Deutsch](#deutsch)

## English

Welcome to the **AUnit** package! This package offers a powerful and comprehensive framework for handling various unit conversions, operations, and localizations in Swift. This guide will help you effectively use this package.

### Installation

Add the following dependency to your `Package.swift` file to use the **AUnit** package:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### Usage

#### Basic Usage

To start using **AUnit**, import the package and create an instance of `AMeasurement` with a specific value and unit.

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 meters
print(measurement) // Output: "100 m"
```

#### Unit Conversion

You can easily convert between units of the same type using the `converted(to:)` method.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 meter
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Output: "0.001 km"
}
```

#### Arithmetic Operations

The package supports arithmetic operations between measurements with compatible units.

- **Addition**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 meter
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 centimeters (1 meter)
if let sum = length1.adding(length2) {
    print(sum) // Output: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 meter
let length4 = AMeasurement(value: 1, unit: .meters) // 1 meter
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // Output: "2.0 m"
}
```

- **Subtraction**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 meter
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 centimeters (0.83 meter)
if let difference = length5.subtracting(length6) {
    print(difference) // Output: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 meters
let length8 = AMeasurement(value: 1, unit: .meters) // 1 meter
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // Output: "1.0 m"
}
```

- **Multiplication**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 meter
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 centimeters (1 meter)
let area = length9.multiplying(by: length10)
print(area) // Output: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 meters
let length12 = AMeasurement(value: 3, unit: .meters) // 3 meters
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // Output: "6.0 m²"

// Current (A) * Voltage (V) = Power (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // Output: "2300 W"

// Charge (mAh) * Voltage (V) = Energy (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // Output: "18.5 Wh"
```

- **Division**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 meter
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 seconds
let speed = length13.dividing(by: time1) // 1 meter divided by 2 seconds
print(speed) // Output: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 meters
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 seconds
let speed2 = length14.dividing(by: time2)
print(speed2) // Output: "2.0 m/s"

// Distance (d) / Time (t) = Speed (v)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 hours
let speed = distance.dividing(by: time)
print(speed) // Output: "50 km/h"
```

#### Localization

This package supports multiple localizations. You can get localized names of the units.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Output: "km"
```

### Examples

#### Length Conversion

Convert 1 foot to meters:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 foot
if let meters = feet.converted(to: .meters) {
    print(meters) // Output: "0.3048 m"
}
```

Convert 1 mile to kilometers:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 mile
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Output: "1.60934 km"
}
```

#### Mass Conversion

Convert 1 kilogram to grams:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 kilogram
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Output: "1000 g"
}
```

Convert 1 pound to kilograms:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 pound
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Output: "0.453592 kg"
}
```

#### Volume Conversion

Convert 1 liter to cubic meters:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 liter
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Output: "0.001 m³"
}
```

Convert 1 gallon to liters:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 gallon
if let liters = gallon.converted(to: .liters) {
    print(liters) // Output: "3.78541 L"
}
```

#### Speed Conversion

Convert 60 miles per hour to kilometers per hour:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 miles per hour
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Output: "96.5606 km/h"
}
```

Convert 1 knot to meters per second:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 knot
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Output: "0.514444 m/s"
}
```

### Temperature Conversion

Convert 32 degrees Fahrenheit to Celsius:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Output: "0 °C"
}
```

Convert 100 degrees Celsius to Kelvin

:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Output: "373.15 K"
}
```

#### Power Conversion

Convert 1 horsepower to watts:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 horsepower
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Output: "745.7 W"
}
```

Convert 1 kilowatt to watts:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 kilowatt
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Output: "1000 W"
}
```

#### Energy Conversion

Convert 1 kilocalorie to joules:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 kilocalorie
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Output: "4184 J"
}
```

Convert 1 kilowatt-hour to joules:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // Output: "3.6e6 J"
}
```

#### Frequency Conversion

Convert 1 gigahertz to hertz:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Output: "1e9 Hz"
}
```

Convert 1 megahertz to kilohertz:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // Output: "1000 kHz"
}
```

---

With **AUnit**, you can perform precise unit conversions and conduct complex arithmetic operations. Harness the power of this package for all your Swift applications that require advanced unit management.

---

## 简体中文

欢迎使用 **AUnit** 套件！此套件提供强大且全面的框架，用于在 Swift 中处理各种单位转换、运算和本地化。本指南将帮助您有效地使用此套件。

### 安装

在您的 `Package.swift` 文件中添加以下依赖项，以便使用 **AUnit** 套件：

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### 使用方法

#### 基本使用

要开始使用 **AUnit**，请导入该套件并使用特定的值和单位创建 `AMeasurement` 的实例。

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 米
print(measurement) // 输出: "100 m"
```

#### 单位转换

您可以使用 `converted(to:)` 方法轻松地在相同类型的单位之间进行转换。

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 米
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // 输出: "0.001 km"
}
```

#### 算术运算

该套件支持在具有兼容单位的测量值之间进行算术运算。

- **加法**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 米
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 厘米 (1 米)
if let sum = length1.adding(length2) {
    print(sum) // 输出: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 米
let length4 = AMeasurement(value: 1, unit: .meters) // 1 米
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // 输出: "2.0 m"
}
```

- **减法**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 米
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 厘米 (0.83 米)
if let difference = length5.subtracting(length6) {
    print(difference) // 输出: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 米
let length8 = AMeasurement(value: 1, unit: .meters) // 1 米
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // 输出: "1.0 m"
}
```

- **乘法**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 米
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 厘米 (1 米)
let area = length9.multiplying(by: length10)
print(area) // 输出: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 米
let length12 = AMeasurement(value: 3, unit: .meters) // 3 米
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // 输出: "6.0 m²"

// 电流 (A) * 电压 (V) = 功率 (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // 输出: "2300 W"

// 电量 (mAh) * 电压 (V) = 能量 (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // 输出: "18.5 Wh"
```

- **除法**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 米
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 秒
let speed = length13.dividing(by: time1) // 1 米除以 2 秒
print(speed) // 输出: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 米
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 秒
let speed2 = length14.dividing(by: time2)
print(speed2) // 输出: "2.0 m/s"

// 距离 (km) / 时间 (h) = 速度 (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 公里
let time = AMeasurement(value: 2, unit: .hours) // 2 小时
let speed = distance.dividing(by: time)
print(speed) // 输出: "50 km/h"
```

#### 本地化

此套件支持多种本地化。您可以获得单位的本地化名称。

```swift
let unit = AUnit.kilometers
print(unit.shortName) // 输出: "km"
```

### 示例

#### 长度转换

将 1 英尺转换为米：

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 英尺
if let meters = feet.converted(to: .meters) {
    print(meters) // 输出: "0.3048 m"
}
```

将 1 英里转换为公里：

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 英里
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // 输出: "1.60934 km"
}
```

#### 质量转换

将 1 千克转换为克：

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 千克
if let grams = kilogram.converted(to: .grams) {
    print(grams) // 输出: "1000 g"
}
```

将 1 磅转换为千克：

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 磅
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // 输出: "

0.453592 kg"
}
```

#### 体积转换

将 1 升转换为立方米：

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 升
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // 输出: "0.001 m³"
}
```

将 1 加仑转换为升：

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 加仑
if let liters = gallon.converted(to: .liters) {
    print(liters) // 输出: "3.78541 L"
}
```

#### 速度转换

将 60 英里每小时转换为公里每小时：

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 英里每小时
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // 输出: "96.5606 km/h"
}
```

将 1 节转换为米每秒：

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 节
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // 输出: "0.514444 m/s"
}
```

### 温度转换

将 32 华氏度转换为摄氏度：

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // 输出: "0 °C"
}
```

将 100 摄氏度转换为开尔文：

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // 输出: "373.15 K"
}
```

#### 功率转换

将 1 马力转换为瓦特：

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 马力
if let watts = horsepower.converted(to: .watts) {
    print(watts) // 输出: "745.7 W"
}
```

将 1 千瓦转换为瓦特：

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 千瓦
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // 输出: "1000 W"
}
```

#### 能量转换

将 1 千瓦时转换为焦耳：

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 千瓦时
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // 输出: "3.6e6 J"
}
```

#### 频率转换

将 1 千兆赫兹转换为赫兹：

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 千兆赫兹
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // 输出: "1e9 Hz"
}
```

将 1 兆赫兹转换为千赫兹：

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 兆赫兹
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // 输出: "1000 kHz"
}
```

---

使用 **AUnit**，您可以进行精确的单位转换并执行复杂的算术运算。利用此包的强大功能，满足所有需要高级单位管理的 Swift 应用程序。

---

## 日本語

**AUnit** パッケージへようこそ！このパッケージは、Swift でさまざまな単位変換、演算、およびローカライゼーションを処理するための強力で包括的なフレームワークを提供します。このガイドでは、このパッケージを効果的に使用する方法を説明します。

### インストール

**AUnit** パッケージを使用するには、`Package.swift` ファイルに次の依存関係を追加します：

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### 使用法

#### 基本的な使用法

**AUnit** を使用開始するには、パッケージをインポートし、特定の値と単位で `AMeasurement` のインスタンスを作成します。

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 メートル
print(measurement) // 出力: "100 m"
```

#### 単位変換

`converted(to:)` メソッドを使用して、同じタイプの単位間で簡単に変換できます。

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 メートル
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // 出力: "0.001 km"
}
```

#### 算術演算

このパッケージは、互換性のある単位の測定値間の算術演算をサポートしています。

- **加算**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 メートル
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 センチメートル (1 メートル)
if let sum = length1.adding(length2) {
    print(sum) // 出力: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 メートル
let length4 = AMeasurement(value: 1, unit: .meters) // 1 メートル
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // 出力: "2.0 m"
}
```

- **減算**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 メートル
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 センチメートル (0.83 メートル)
if let difference = length5.subtracting(length6) {
    print(difference) // 出力: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 メートル
let length8 = AMeasurement(value: 1, unit: .meters) // 1 メートル
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // 出力: "1.0 m"
}
```

- **乗算**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 メートル
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 センチメートル (1 メートル)
let area = length9.multiplying(by: length10)
print(area) // 出力: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 メートル
let length12 = AMeasurement(value: 3, unit: .meters) // 3 メートル
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // 出力: "6.0 m²"

// 電流 (A) * 電圧 (V) = 電力 (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // 出力: "2300 W"

// 電荷 (mAh) * 電圧 (V) = エネルギー (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // 出力: "18.5 Wh"
```

- **除算**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 メートル
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 秒
let speed = length13.dividing(by: time1) // 1 メートルを2秒で割る
print(speed) // 出力: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 メートル
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 秒
let speed2 = length14.dividing(by: time2)
print(speed2) // 出力: "2.0 m/s"

// 距離 (km) / 時間 (h) = 速度 (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 時間
let speed = distance.dividing(by: time)
print(speed) // 出力: "50 km/h"
```

#### ローカライズ

このパッケージは複数のローカライゼーションをサポートしています。単位のローカライズされた名前を取得できます。

```swift
let unit = AUnit.kilometers
print(unit.shortName) // 出力: "km"
```

### 例

#### 長さの変換

1 フィートをメートルに変換：

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 フィート
if let meters = feet.converted(to: .meters) {
    print(meters) // 出力: "0.3048 m"
}
```

1 マイルをキロメートルに変換：

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 マイル
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // 出力: "1.60934 km"
}
```

#### 質量の変換

1 キログラムをグラムに変換：

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 キログラム
if let grams = kilogram.converted(to: .grams) {
    print(grams) // 出力: "1000 g"
}
```

1 ポンドをキログラムに変換：

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 ポンド
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // 出力: "0

.453592 kg"
}
```

#### 体積の変換

1 リットルを立方メートルに変換：

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 リットル
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // 出力: "0.001 m³"
}
```

1 ガロンをリットルに変換：

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 ガロン
if let liters = gallon.converted(to: .liters) {
    print(liters) // 出力: "3.78541 L"
}
```

#### 速度の変換

時速 60 マイルをキロメートル毎時に変換：

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 時速 60 マイル
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // 出力: "96.5606 km/h"
}
```

1 ノットをメートル毎秒に変換：

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 ノット
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // 出力: "0.514444 m/s"
}
```

### 温度の変換

華氏 32 度を摂氏に変換：

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // 出力: "0 °C"
}
```

摂氏 100 度をケルビンに変換：

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // 出力: "373.15 K"
}
```

#### 電力の変換

1 馬力をワットに変換：

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 馬力
if let watts = horsepower.converted(to: .watts) {
    print(watts) // 出力: "745.7 W"
}
```

1 キロワットをワットに変換：

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 キロワット
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // 出力: "1000 W"
}
```

#### エネルギーの変換

1 キロカロリーをジュールに変換：

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 キロカロリー
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // 出力: "4184 J"
}
```

1 キロワット時をジュールに変換：

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // 出力: "3.6e6 J"
}
```

#### 周波数の変換

1 ギガヘルツをヘルツに変換：

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // 出力: "1e9 Hz"
}
```

1 メガヘルツをキロヘルツに変換：

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // 出力: "1000 kHz"
}
```

---

**AUnit** を使用すると、正確な単位変換を実行し、複雑な算術演算を行うことができます。このパッケージのパワーを活用して、高度な単位管理を必要とするすべての Swift アプリケーションに対応しましょう。

---

## Français

Bienvenue dans le package **AUnit** ! Ce package offre un cadre puissant et complet pour gérer diverses conversions d'unités, opérations et localisations en Swift. Ce guide vous aidera à utiliser efficacement ce package.

### Installation

Ajoutez la dépendance suivante dans votre fichier `Package.swift` pour utiliser le package **AUnit** :

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### Utilisation

#### Utilisation de base

Pour commencer à utiliser **AUnit**, importez le package et créez une instance de `AMeasurement` avec une valeur et une unité spécifiques.

```swift
import AUnit

let mesure = AMeasurement(value: 100, unit: .meters) // 100 mètres
print(mesure) // Output: "100 m"
```

#### Conversion d'unités

Vous pouvez facilement convertir entre des unités du même type en utilisant la méthode `converted(to:)`.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 mètre
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Output: "0.001 km"
}
```

#### Opérations arithmétiques

Le package prend en charge les opérations arithmétiques entre des mesures avec des unités compatibles.

- **Addition**

```swift
let longueur1 = AMeasurement(value: 1, unit: .meters) // 1 mètre
let longueur2 = AMeasurement(value: 100, unit: .centimeters) // 100 centimètres (1 mètre)
if let somme = longueur1.adding(longueur2) {
    print(somme) // Output: "2.0 m"
}

let longueur3 = AMeasurement(value: 1, unit: .meters) // 1 mètre
let longueur4 = AMeasurement(value: 1, unit: .meters) // 1 mètre
if let sommeSameUnit = longueur3.adding(longueur4) {
    print(sommeSameUnit) // Output: "2.0 m"
}
```

- **Soustraction**

```swift
let longueur5 = AMeasurement(value: 1, unit: .meters) // 1 mètre
let longueur6 = AMeasurement(value: 83, unit: .centimeters) // 83 centimètres (0.83 mètre)
if let difference = longueur5.subtracting(longueur6) {
    print(difference) // Output: "0.17 m"
}

let longueur7 = AMeasurement(value: 2, unit: .meters) // 2 mètres
let longueur8 = AMeasurement(value: 1, unit: .meters) // 1 mètre
if let differenceSameUnit = longueur7.subtracting(longueur8) {
    print(differenceSameUnit) // Output: "1.0 m"
}
```

- **Multiplication**

```swift
let longueur9 = AMeasurement(value: 1, unit: .meters) // 1 mètre
let longueur10 = AMeasurement(value: 100, unit: .centimeters) // 100 centimètres (1 mètre)
let area = longueur9.multiplying(by: longueur10)
print(area) // Output: "1.0 m²"

let longueur11 = AMeasurement(value: 2, unit: .meters) // 2 mètres
let longueur12 = AMeasurement(value: 3, unit: .meters) // 3 mètres
let areaSameUnit = longueur11.multiplying(by: longueur12)
print(areaSameUnit) // Output: "6.0 m²"

// Tension (V) * Courant (I) = Puissance (P)
let tension = AMeasurement(value: 230, unit: .volts) // 230 V
let courant = AMeasurement(value: 10, unit: .amperes) // 10 A
let puissance = tension.multiplying(by: courant)
print(puissance) // Output: "2300 W"

// Charge (mAh) * Tension (V) = Énergie (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let tension2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energie = charge.multiplying(by: tension2)
print(energie) // Output: "18.5 Wh"
```

- **Division**

```swift
let longueur13 = AMeasurement(value: 1, unit: .meters) // 1 mètre
let temps1 = AMeasurement(value: 2,

 unit: .seconds) // 2 secondes
let vitesse = longueur13.dividing(by: temps1) // 1 mètre divisé par 2 secondes
print(vitesse) // Output: "0.5 m/s"

let longueur14 = AMeasurement(value: 6, unit: .meters) // 6 mètres
let temps2 = AMeasurement(value: 3, unit: .seconds) // 3 secondes
let vitesse2 = longueur14.dividing(by: temps2)
print(vitesse2) // Output: "2.0 m/s"

// Distance (d) / Temps (t) = Vitesse (v)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let temps = AMeasurement(value: 2, unit: .hours) // 2 heures
let vitesse = distance.dividing(by: temps)
print(vitesse) // Output: "50 km/h"
```

#### Localisation

Ce package prend en charge plusieurs localisations. Vous pouvez obtenir les noms localisés des unités.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Output: "km"
```

### Exemples

#### Conversion de longueur

Convertir 1 pied en mètres：

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 pied
if let meters = feet.converted(to: .meters) {
    print(meters) // Output: "0.3048 m"
}
```

Convertir 1 mile en kilomètres：

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 mile
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Output: "1.60934 km"
}
```

#### Conversion de masse

Convertir 1 kilogramme en grammes：

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 kilogramme
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Output: "1000 g"
}
```

Convertir 1 livre en kilogrammes：

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 livre
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Output: "0.453592 kg"
}
```

#### Conversion de volume

Convertir 1 litre en mètres cubes：

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 litre
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Output: "0.001 m³"
}
```

Convertir 1 gallon en litres：

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 gallon
if let liters = gallon.converted(to: .liters) {
    print(liters) // Output: "3.78541 L"
}
```

#### Conversion de vitesse

Convertir 60 miles par heure en kilomètres par heure：

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 miles par heure
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Output: "96.5606 km/h"
}
```

Convertir 1 nœud en mètres par seconde：

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 nœud
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Output: "0.514444 m/s"
}
```

### Conversion de température

Convertir 32 degrés Fahrenheit en Celsius：

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Output: "0 °C"
}
```

Convertir 100 degrés Celsius en Kelvin：

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Output: "373.15 K"
}
```

#### Conversion de puissance

Convertir 1 cheval-vapeur en watts：

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 cheval-vapeur
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Output: "745.7 W"
}
```

Convertir 1 kilowatt en watts：

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 kilowatt
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Output: "1000 W"
}
```

#### Conversion d'énergie

Convertir 1 kilocalorie en joules：

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 kilocalorie
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Output: "4184 J"
}
```

Convertir 1 kilowattheure en joules：

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // Output: "3.6e6 J"
}
```

#### Conversion de fréquence

Convertir 1 gigahertz en hertz：

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Output: "1e9 Hz"
}
```

Convertir 1 mégahertz en kilohertz：

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // Output: "1000 kHz"
}
```

---

Avec **AUnit**, vous pouvez effectuer des conversions d'unités précises et effectuer des opérations arithmétiques complexes. Profitez de la puissance de ce package pour toutes vos applications Swift nécessitant une gestion avancée des unités.

---

## 한국어

**AUnit** 패키지에 오신 것을 환영합니다! 이 패키지는 다양한 단위 변환, 연산 및 로컬라이제이션을 Swift에서 처리할 수 있는 강력하고 포괄적인 프레임워크를 제공합니다. 이 가이드는 이 패키지를 효율적으로 사용하는 데 도움이 될 것입니다.

### 설치

**AUnit** 패키지를 사용하려면 `Package.swift` 파일에 다음 의존성을 추가하십시오.

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### 사용법

#### 기본 사용법

**AUnit**을 사용하려면 패키지를 가져오고 특정 값과 단위로 `AMeasurement` 인스턴스를 생성하십시오.

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 미터
print(measurement) // 출력: "100 m"
```

#### 단위 변환

동일한 유형의 단위 간에 쉽게 변환할 수 있습니다.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 미터
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // 출력: "0.001 km"
}
```

#### 산술 연산

패키지는 호환 가능한 단위의 측정 값 간의 산술 연산을 지원합니다.

- **더하기**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 미터
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 센티미터 (1 미터)
if let sum = length1.adding(length2) {
    print(sum) // 출력: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 미터
let length4 = AMeasurement(value: 1, unit: .meters) // 1 미터
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // 출력: "2.0 m"
}
```

- **빼기**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 미터
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 센티미터 (0.83 미터)
if let difference = length5.subtracting(length6) {
    print(difference) // 출력: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters)

 // 2 미터
let length8 = AMeasurement(value: 1, unit: .meters) // 1 미터
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // 출력: "1.0 m"
}
```

- **곱하기**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 미터
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 센티미터 (1 미터)
let area = length9.multiplying(by: length10)
print(area) // 출력: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 미터
let length12 = AMeasurement(value: 3, unit: .meters) // 3 미터
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // 출력: "6.0 m²"

// 전류 (A) * 전압 (V) = 전력 (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // 출력: "2300 W"

// 전하량 (mAh) * 전압 (V) = 에너지 (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // 출력: "18.5 Wh"
```

- **나누기**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 미터
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 초
let speed = length13.dividing(by: time1) // 1 미터를 2 초로 나눔
print(speed) // 출력: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 미터
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 초
let speed2 = length14.dividing(by: time2)
print(speed2) // 출력: "2.0 m/s"

// 거리 (km) / 시간 (h) = 속도 (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 시간
let speed = distance.dividing(by: time)
print(speed) // 출력: "50 km/h"
```

#### 로컬라이제이션

이 패키지는 여러 로컬라이제이션을 지원합니다. 단위의 로컬라이즈된 이름을 얻을 수 있습니다.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // 출력: "km"
```

### 예제

#### 길이 변환

1 피트를 미터로 변환:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 피트
if let meters = feet.converted(to: .meters) {
    print(meters) // 출력: "0.3048 m"
}
```

1 마일을 킬로미터로 변환:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 마일
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // 출력: "1.60934 km"
}
```

#### 질량 변환

1 킬로그램을 그램으로 변환:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 킬로그램
if let grams = kilogram.converted(to: .grams) {
    print(grams) // 출력: "1000 g"
}
```

1 파운드를 킬로그램으로 변환:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 파운드
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // 출력: "0.453592 kg"
}
```

#### 부피 변환

1 리터를 입방미터로 변환:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 리터
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // 출력: "0.001 m³"
}
```

1 갤런을 리터로 변환:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 갤런
if let liters = gallon.converted(to: .liters) {
    print(liters) // 출력: "3.78541 L"
}
```

#### 속도 변환

시속 60마일을 시속 킬로미터로 변환:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 시속 60 마일
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // 출력: "96.5606 km/h"
}
```

1 노트를 미터/초로 변환:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 노트
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // 출력: "0.514444 m/s"
}
```

### 온도 변환

32도 화씨를 섭씨로 변환:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // 출력: "0 °C"
}
```

섭씨 100도를 켈빈으로 변환:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // 출력: "373.15 K"
}
```

#### 전력 변환

1 마력을 와트로 변환:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 마력
if let watts = horsepower.converted(to: .watts) {
    print(watts) // 출력: "745.7 W"
}
```

1 킬로와트를 와트로 변환:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 킬로와트
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // 출력: "1000 W"
}
```

#### 에너지 변환

1 킬로칼로리를 줄로 변환:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 킬로칼로리
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // 출력: "4184 J"
}
```

1 킬로와트시를 줄로 변환:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // 출력: "3.6e6 J"
}
```

#### 주파수 변환

1 기가헤르츠를 헤르츠로 변환:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // 출력: "1e9 Hz"
}
```

1 메가헤르츠를 킬로헤르츠로 변환:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // 출력: "1000 kHz"
}
```

---

**AUnit**을 사용하면 정확한 단위 변환 및 복잡한 산술 연산을 수행할 수 있습니다. 이 강력한 패키지를 사용하여 고급 단위 관리를 필요로 하는 모든 Swift 응용 프로그램을 위한 솔루션을 만들어보세요.

---

## Русский

Добро пожаловать в пакет **AUnit**! Этот пакет предоставляет мощную и полную систему для работы с различными преобразованиями единиц измерения, операциями и локализациями в Swift. Это руководство поможет вам эффективно использовать этот пакет.

### Установка

Добавьте следующ

ую зависимость в ваш файл `Package.swift` для использования пакета **AUnit**:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### Использование

#### Основное использование

Чтобы начать использовать **AUnit**, импортируйте пакет и создайте экземпляр `AMeasurement` с определенным значением и единицей измерения.

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 метров
print(measurement) // Вывод: "100 m"
```

#### Преобразование единиц измерения

Вы можете легко конвертировать между единицами одного типа, используя метод `converted(to:)`.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 метр
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Вывод: "0.001 km"
}
```

#### Арифметические операции

Пакет поддерживает арифметические операции между измерениями с совместимыми единицами.

- **Сложение**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 метр
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 сантиметров (1 метр)
if let sum = length1.adding(length2) {
    print(sum) // Вывод: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 метр
let length4 = AMeasurement(value: 1, unit: .meters) // 1 метр
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // Вывод: "2.0 m"
}
```

- **Вычитание**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 метр
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 сантиметра (0.83 метра)
if let difference = length5.subtracting(length6) {
    print(difference) // Вывод: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 метра
let length8 = AMeasurement(value: 1, unit: .meters) // 1 метр
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // Вывод: "1.0 m"
}
```

- **Умножение**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 метр
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 сантиметров (1 метр)
let area = length9.multiplying(by: length10)
print(area) // Вывод: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 метра
let length12 = AMeasurement(value: 3, unit: .meters) // 3 метра
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // Вывод: "6.0 m²"

// Ток (A) * Напряжение (V) = Мощность (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 В
let current = AMeasurement(value: 10, unit: .amperes) // 10 А
let power = voltage.multiplying(by: current)
print(power) // Вывод: "2300 W"

// Заряд (mAh) * Напряжение (В) = Энергия (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 мА*ч
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 В
let energy = charge.multiplying(by: voltage2)
print(energy) // Вывод: "18.5 Wh"
```

- **Деление**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 метр
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 секунды
let speed = length13.dividing(by: time1) // 1 метр делить на 2 секунды
print(speed) // Вывод: "0.5 м/с"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 метров
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 секунды
let speed2 = length14.dividing(by: time2)
print(speed2) // Вывод: "2.0 м/с"

// Расстояние (км) / Время (ч) = Скорость (км/ч)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 км
let time = AMeasurement(value: 2, unit: .hours) // 2 часа
let speed = distance.dividing(by: time)
print(speed) // Вывод: "50 км/ч"
```

#### Локализация

Пакет поддерживает несколько локализаций. Вы можете получить локализованные названия единиц измерения.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Вывод: "km"
```

### Примеры

#### Преобразование длины

Преобразование 1 фута в метры:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 фут
if let meters = feet.converted(to: .meters) {
    print(meters) // Вывод: "0.3048 м"
}
```

Преобразование 1 мили в километры:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 миля
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Вывод: "1.60934 км"
}
```

#### Преобразование массы

Преобразование 1 килограмма в граммы:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 килограмм
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Вывод: "1000 г"
}
```

Преобразование 1 фунта в килограммы:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 фунт
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Вывод: "0.453592 кг"
}
```

#### Преобразование объема

Преобразование 1 литра в кубические метры:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 литр
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Вывод: "0.001 м³"
}
```

Преобразование 1 галлона в литры:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 галлон
if let liters = gallon.converted(to: .liters) {
    print(liters) // Вывод: "3.78541 л"
}
```

#### Преобразование скорости

Преобразование 60 миль в час в километры в час:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 миль в час
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Вывод: "96.5606 км/ч"
}
```

Преобразование 1 узла в метры в секунду:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 узел
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Вывод: "0.514444 м/с"
}
```

### Преобразование температуры

Преобразование 32 градусов Фаренгейта в Цельсий:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Вывод: "0 °C"
}
```

Преобразование 100 градусов Цельсия в Кельвин:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Вывод: "373.15 K"
}
```

#### Преобразование мощности

Преобразование 1 лошадиной силы в ватты:

```swift
let horsepower = AMeasurement(value:

 1, unit: .horsepower) // 1 лошадиная сила
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Вывод: "745.7 Вт"
}
```

Преобразование 1 киловатта в ватты:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 киловатт
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Вывод: "1000 Вт"
}
```

#### Преобразование энергии

Преобразование 1 килокалории в джоули:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 килокалория
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Вывод: "4184 Дж"
}
```

Преобразование 1 киловатт-часа в джоули:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 кВт*ч
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // Вывод: "3.6e6 Дж"
}
```

#### Преобразование частоты

Преобразование 1 гигагерца в герцы:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 ГГц
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Вывод: "1e9 Гц"
}
```

Преобразование 1 мегагерца в килогерцы:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 МГц
if let kilohertz = megahertz.converted(to: .kilогерц) {
    print(kilohertz) // Вывод: "1000 кГц"
}
```

---

С **AUnit** вы можете выполнять точные преобразования единиц и выполнять сложные арифметические операции. Воспользуйтесь мощью этого пакета для всех ваших приложений Swift, требующих передового управления единицами измерения.

---

## Português

Bem-vindo ao pacote **AUnit**! Este pacote oferece uma estrutura poderosa e abrangente para lidar com várias conversões de unidades, operações e localizações em Swift. Este guia irá ajudá-lo a usar este pacote de forma eficaz.

### Instalação

Adicione a seguinte dependência ao seu arquivo `Package.swift` para usar o pacote **AUnit**:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### Uso

#### Uso básico

Para começar a usar **AUnit**, importe o pacote e crie uma instância de `AMeasurement` com um valor e uma unidade específicos.

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 metros
print(measurement) // Saída: "100 m"
```

#### Conversão de unidades

Você pode facilmente converter entre unidades do mesmo tipo usando o método `converted(to:)`.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 metro
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Saída: "0.001 km"
}
```

#### Operações aritméticas

O pacote suporta operações aritméticas entre medidas com unidades compatíveis.

- **Adição**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 centímetros (1 metro)
if let sum = length1.adding(length2) {
    print(sum) // Saída: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length4 = AMeasurement(value: 1, unit: .meters) // 1 metro
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // Saída: "2.0 m"
}
```

- **Subtração**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 centímetros (0.83 metro)
if let difference = length5.subtracting(length6) {
    print(difference) // Saída: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 metros
let length8 = AMeasurement(value: 1, unit: .meters) // 1 metro
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // Saída: "1.0 m"
}
```

- **Multiplicação**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 centímetros (1 metro)
let area = length9.multiplying(by: length10)
print(area) // Saída: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 metros
let length12 = AMeasurement(value: 3, unit: .meters) // 3 metros
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // Saída: "6.0 m²"

// Corrente (A) * Tensão (V) = Potência (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // Saída: "2300 W"

// Carga (mAh) * Tensão (V) = Energia (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // Saída: "18.5 Wh"
```

- **Divisão**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 metro
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 segundos
let speed = length13.dividing(by: time1) // 1 metro dividido por 2 segundos
print(speed) // Saída: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 metros
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 segundos
let speed2 = length14.dividing(by: time2)
print(speed2) // Saída: "2.0 m/s"

// Distância (km) / Tempo (h) = Velocidade (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 horas
let speed = distance.dividing(by: time)
print(speed) // Saída: "50 km/h"
```

#### Localização

O pacote suporta várias localizações. Você pode obter os nomes localizados das unidades.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Saída: "km"
```

### Exemplos

#### Conversão de comprimento

Converter 1 pé em metros:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 pé
if let meters = feet.converted(to: .meters) {
    print(meters) // Saída: "0.3048 m"
}
```

Converter 1 milha em quilômetros:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 milha
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Saída: "1.60934 km"
}
```

#### Conversão de massa

Converter 1 quilograma em gramas:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 quilograma
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Saída: "1000 g"
}
```

Converter 1 libra em quilogramas:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 libra
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Saída: "0.453592 kg"
}
```

#### Conversão de volume

Converter 1 litro em metros cú

bicos:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 litro
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Saída: "0.001 m³"
}
```

Converter 1 galão em litros:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 galão
if let liters = gallon.converted(to: .liters) {
    print(liters) // Saída: "3.78541 L"
}
```

#### Conversão de velocidade

Converter 60 milhas por hora em quilômetros por hora:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 milhas por hora
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Saída: "96.5606 km/h"
}
```

Converter 1 nó em metros por segundo:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 nó
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Saída: "0.514444 m/s"
}
```

### Conversão de temperatura

Converter 32 graus Fahrenheit em Celsius:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Saída: "0 °C"
}
```

Converter 100 graus Celsius em Kelvin:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Saída: "373.15 K"
}
```

#### Conversão de potência

Converter 1 cavalo-vapor em watts:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 cavalo-vapor
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Saída: "745.7 W"
}
```

Converter 1 quilowatt em watts:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 quilowatt
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Saída: "1000 W"
}
```

#### Conversão de energia

Converter 1 quilocaloria em joules:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 quilocaloria
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Saída: "4184 J"
}
```

Converter 1 quilowatt-hora em joules:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // Saída: "3.6e6 J"
}
```

#### Conversão de frequência

Converter 1 gigahertz em hertz:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Saída: "1e9 Hz"
}
```

Converter 1 megahertz em quilohertz:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // Saída: "1000 kHz"
}
```

---

Com **AUnit**, você pode realizar conversões precisas de unidades e realizar operações aritméticas complexas. Aproveite o poder deste pacote para todos os seus aplicativos Swift que exigem gerenciamento avançado de unidades.

---

## Español

¡Bienvenido al paquete **AUnit**! Este paquete ofrece un marco poderoso y completo para manejar diversas conversiones de unidades, operaciones y localizaciones en Swift. Esta guía le ayudará a utilizar eficazmente este paquete.

### Instalación

Agregue la siguiente dependencia a su archivo `Package.swift` para usar el paquete **AUnit**:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### Uso

#### Uso básico

Para comenzar a usar **AUnit**, importe el paquete y cree una instancia de `AMeasurement` con un valor y una unidad específicos.

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 metros
print(measurement) // Salida: "100 m"
```

#### Conversión de unidades

Puede convertir fácilmente entre unidades del mismo tipo utilizando el método `converted(to:)`.

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 metro
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Salida: "0.001 km"
}
```

#### Operaciones aritméticas

El paquete admite operaciones aritméticas entre medidas con unidades compatibles.

- **Adición**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 centímetros (1 metro)
if let sum = length1.adding(length2) {
    print(sum) // Salida: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length4 = AMeasurement(value: 1, unit: .meters) // 1 metro
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // Salida: "2.0 m"
}
```

- **Sustracción**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 centímetros (0.83 metros)
if let difference = length5.subtracting(length6) {
    print(difference) // Salida: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 metros
let length8 = AMeasurement(value: 1, unit: .meters) // 1 metro
if let differenceSameUnit = length7.subtracting(length8) {
    print(differenceSameUnit) // Salida: "1.0 m"
}
```

- **Multiplicación**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 metro
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 centímetros (1 metro)
let area = length9.multiplying(by: length10)
print(area) // Salida: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 metros
let length12 = AMeasurement(value: 3, unit: .meters) // 3 metros
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // Salida: "6.0 m²"

// Corriente (A) * Voltaje (V) = Potencia (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // Salida: "2300 W"

// Carga (mAh) * Voltaje (V) = Energía (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // Salida: "18.5 Wh"
```

- **División**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 metro
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 segundos
let speed = length13.dividing(by: time1) // 1 metro dividido por 2 segundos
print(speed) // Salida: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 metros
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 segundos
let speed2 = length14.dividing(by: time2)
print(speed2) // Salida: "2.0 m/s"

// Distancia (km) / Tiempo (h) = Velocidad (km/h)
let distance = AMeasurement(value

: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 horas
let speed = distance.dividing(by: time)
print(speed) // Salida: "50 km/h"
```

#### Localización

El paquete admite varias localizaciones. Puede obtener los nombres localizados de las unidades.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Salida: "km"
```

### Ejemplos

#### Conversión de longitud

Convertir 1 pie en metros:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 pie
if let meters = feet.converted(to: .meters) {
    print(meters) // Salida: "0.3048 m"
}
```

Convertir 1 milla en kilómetros:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 milla
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Salida: "1.60934 km"
}
```

#### Conversión de masa

Convertir 1 kilogramo en gramos:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 kilogramo
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Salida: "1000 g"
}
```

Convertir 1 libra en kilogramos:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 libra
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Salida: "0.453592 kg"
}
```

#### Conversión de volumen

Convertir 1 litro en metros cúbicos:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 litro
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Salida: "0.001 m³"
}
```

Convertir 1 galón en litros:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 galón
if let liters = gallon.converted(to: .liters) {
    print(liters) // Salida: "3.78541 L"
}
```

#### Conversión de velocidad

Convertir 60 millas por hora en kilómetros por hora:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 millas por hora
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Salida: "96.5606 km/h"
}
```

Convertir 1 nudo en metros por segundo:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 nudo
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Salida: "0.514444 m/s"
}
```

### Conversión de temperatura

Convertir 32 grados Fahrenheit en Celsius:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Salida: "0 °C"
}
```

Convertir 100 grados Celsius en Kelvin:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Salida: "373.15 K"
}
```

#### Conversión de potencia

Convertir 1 caballo de fuerza en vatios:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 caballo de fuerza
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Salida: "745.7 W"
}
```

Convertir 1 kilovatio en vatios:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 kilovatio
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Salida: "1000 W"
}
```

#### Conversión de energía

Convertir 1 kilocaloría en julios:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 kilocaloría
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Salida: "4184 J"
}
```

Convertir 1 kilovatio-hora en julios:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .julios) {
    print(joules) // Salida: "3.6e6 J"
}
```

#### Conversión de frecuencia

Convertir 1 gigahercio en hercios:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Salida: "1e9 Hz"
}
```

Convertir 1 megahercio en kilohertz:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // Salida: "1000 kHz"
}
```

---

Con **AUnit**, puede realizar conversiones precisas de unidades y realizar operaciones aritméticas complejas. Aproveche el poder de este paquete para todas sus aplicaciones Swift que requieren una gestión avanzada de unidades.

---

## ไทย

ยินดีต้อนรับสู่แพ็กเกจ **AUnit**! แพ็กเกจนี้นำเสนอเฟรมเวิร์กที่ทรงพลังและครอบคลุมสำหรับจัดการการแปลงหน่วยต่างๆ การดำเนินการ และการแปลใน Swift คำแนะนำนี้จะช่วยให้คุณใช้แพ็กเกจนี้ได้อย่างมีประสิทธิภาพ

### การติดตั้ง

เพิ่มการพึ่งพาต่อไปนี้ในไฟล์ `Package.swift` ของคุณเพื่อใช้แพ็กเกจ **AUnit**:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0")
]
```

### การใช้งาน

#### การใช้งานพื้นฐาน

ในการเริ่มต้นใช้งาน **AUnit** ให้นำเข้าแพ็กเกจและสร้างอินสแตนซ์ของ `AMeasurement` ด้วยค่าที่ระบุและหน่วยที่เฉพาะเจาะจง

```swift
import AUnit

let measurement = AMeasurement(value: 100, unit: .meters) // 100 เมตร
print(measurement) // Output: "100 m"
```

#### การแปลงหน่วย

คุณสามารถแปลงระหว่างหน่วยประเภทเดียวกันได้อย่างง่ายดายโดยใช้เมธอด `converted(to:)`

```swift
let meters = AMeasurement(value: 1, unit: .meters) // 1 เมตร
if let kilometers = meters.converted(to: .kilometers) {
    print(kilometers) // Output: "0.001 km"
}
```

#### การดำเนินการทางคณิตศาสตร์

แพ็กเกจนี้รองรับการดำเนินการทางคณิตศาสตร์ระหว่างการวัดที่มีหน่วยที่เข้ากันได้

- **การบวก**

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
let length2 = AMeasurement(value: 100, unit: .centimeters) // 100 เซนติเมตร (1 เมตร)
if let sum = length1.adding(length2) {
    print(sum) // Output: "2.0 m"
}

let length3 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
let length4 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
if let sumSameUnit = length3.adding(length4) {
    print(sumSameUnit) // Output: "2.0 m"
}
```

- **การลบ**

```swift
let length5 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
let length6 = AMeasurement(value: 83, unit: .centimeters) // 83 เซนติเมตร (0.83 เมตร)
if let difference = length5.subtracting(length6) {
    print(difference) // Output: "0.17 m"
}

let length7 = AMeasurement(value: 2, unit: .meters) // 2 เมตร
let length8 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
if let differenceSameUnit = length7.subtract

ing(length8) {
    print(differenceSameUnit) // Output: "1.0 m"
}
```

- **การคูณ**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
let length10 = AMeasurement(value: 100, unit: .centimeters) // 100 เซนติเมตร (1 เมตร)
let area = length9.multiplying(by: length10)
print(area) // Output: "1.0 m²"

let length11 = AMeasurement(value: 2, unit: .meters) // 2 เมตร
let length12 = AMeasurement(value: 3, unit: .meters) // 3 เมตร
let areaSameUnit = length11.multiplying(by: length12)
print(areaSameUnit) // Output: "6.0 m²"

// กระแส (A) * แรงดันไฟฟ้า (V) = กำลังไฟฟ้า (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // Output: "2300 W"

// ประจุ (mAh) * แรงดันไฟฟ้า (V) = พลังงาน (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // Output: "18.5 Wh"
```

- **การหาร**

```swift
let length13 = AMeasurement(value: 1, unit: .meters) // 1 เมตร
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 วินาที
let speed = length13.dividing(by: time1) // 1 เมตรหารด้วย 2 วินาที
print(speed) // Output: "0.5 m/s"

let length14 = AMeasurement(value: 6, unit: .meters) // 6 เมตร
let time2 = AMeasurement(value: 3, unit: .seconds) // 3 วินาที
let speed2 = length14.dividing(by: time2)
print(speed2) // Output: "2.0 m/s"

// ระยะทาง (km) / เวลา (h) = ความเร็ว (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 ชั่วโมง
let speed = distance.dividing(by: time)
print(speed) // Output: "50 km/h"
```

#### การแปล

แพ็กเกจนี้รองรับการแปลหลายภาษา คุณสามารถรับชื่อหน่วยที่แปลได้

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Output: "km"
```

### ตัวอย่าง

#### การแปลงความยาว

แปลง 1 ฟุตเป็นเมตร:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 ฟุต
if let meters = feet.converted(to: .meters) {
    print(meters) // Output: "0.3048 m"
}
```

แปลง 1 ไมล์เป็นกิโลเมตร:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 ไมล์
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Output: "1.60934 km"
}
```

#### การแปลงมวล

แปลง 1 กิโลกรัมเป็นกรัม:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 กิโลกรัม
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Output: "1000 g"
}
```

แปลง 1 ปอนด์เป็นกิโลกรัม:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 ปอนด์
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Output: "0.453592 kg"
}
```

#### การแปลงปริมาตร

แปลง 1 ลิตรเป็นลูกบาศก์เมตร:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 ลิตร
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Output: "0.001 m³"
}
```

แปลง 1 แกลลอนเป็นลิตร:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 แกลลอน
if let liters = gallon.converted(to: .liters) {
    print(liters) // Output: "3.78541 L"
}
```

#### การแปลงความเร็ว

แปลง 60 ไมล์ต่อชั่วโมงเป็นกิโลเมตรต่อชั่วโมง:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 ไมล์ต่อชั่วโมง
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Output: "96.5606 km/h"
}
```

แปลง 1 นอตเป็นเมตรต่อวินาที:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 นอต
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Output: "0.514444 m/s"
}
```

### การแปลงอุณหภูมิ

แปลง 32 องศาฟาเรนไฮต์เป็นเซลเซียส:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Output: "0 °C"
}
```

แปลง 100 องศาเซลเซียสเป็นเคลวิน:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Output: "373.15 K"
}
```

#### การแปลงกำลังไฟฟ้า

แปลง 1 แรงม้าเป็นวัตต์:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) // 1 แรงม้า
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Output: "745.7 W"
}
```

แปลง 1 กิโลวัตต์เป็นวัตต์:

```swift
let kilowatt = AMeasurement(value: 1, unit: .kilowatts) // 1 กิโลวัตต์
if let watts = kilowatt.converted(to: .watts) {
    print(watts) // Output: "1000 W"
}
```

#### การแปลงพลังงาน

แปลง 1 กิโลแคลอรี่เป็นจูล:

```swift
let kilocalorie = AMeasurement(value: 1, unit: .kilocalories) // 1 กิโลแคลอรี่
if let joules = kilocalorie.converted(to: .joules) {
    print(joules) // Output: "4184 J"
}
```

แปลง 1 กิโลวัตต์-ชั่วโมงเป็นจูล:

```swift
let kilowattHour = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kilowattHour.converted(to: .joules) {
    print(joules) // Output: "3.6e6 J"
}
```

#### การแปลงความถี่

แปลง 1 กิกะเฮิรตซ์เป็นเฮิรตซ์:

```swift
let gigahertz = AMeasurement(value: 1, unit: .gigahertz) // 1 GHz
if let hertz = gigahertz.converted(to: .hertz) {
    print(hertz) // Output: "1e9 Hz"
}
```

แปลง 1 เมกะเฮิรตซ์เป็นกิโลเฮิรตซ์:

```swift
let megahertz = AMeasurement(value: 1, unit: .megahertz) // 1 MHz
if let kilohertz = megahertz.converted(to: .kilohertz) {
    print(kilohertz) // Output: "1000 kHz"
}
```

---

ด้วย **AUnit** คุณสามารถดำเนินการแปลงหน่วยที่แม่นยำและดำเนินการทางคณิตศาสตร์ที่ซับซ้อนได้ ใช้พลังของแพ็กเก

จนี้สำหรับแอปพลิเคชัน Swift ทั้งหมดของคุณที่ต้องการการจัดการหน่วยขั้นสูง

---

## Deutsch

### Einführung

**AUnit** ist ein leistungsstarkes Swift-Paket zur Umwandlung und Berechnung von Einheiten. Es unterstützt eine Vielzahl von Einheiten und ermöglicht präzise Berechnungen und Umwandlungen.

### Installation

Fügen Sie das Paket in Ihrem `Package.swift` hinzu:

```swift
dependencies: [
    .package(url: "https://github.com/RapboyGao/Unit.git", from: "1.0.0"),
]
```

### Verwendung

#### Einheitenumwandlung

Verwenden Sie **AUnit**, um Einheiten einfach umzuwandeln. Hier sind einige Beispiele:

```swift
let length1 = AMeasurement(value: 1, unit: .meters) // 1 Meter
if let length2 = length1.converted(to: .centimeters) {
    print(length2) // Output: "100.0 cm"
}
```

#### Mathematische Operationen

Mit **AUnit** können Sie auch mathematische Operationen wie Addition, Subtraktion, Multiplikation und Division durchführen.

- **Addition**

```swift
let length3 = AMeasurement(value: 1, unit: .meters) // 1 Meter
let length4 = AMeasurement(value: 100, unit: .centimeters) // 100 Zentimeter (1 Meter)
if let totalLength = length3.adding(length4) {
    print(totalLength) // Output: "2.0 m"
}
```

- **Subtraktion**

```swift
let length5 = AMeasurement(value: 2, unit: .meters) // 2 Meter
let length6 = AMeasurement(value: 100, unit: .centimeters) // 100 Zentimeter (1 Meter)
if let remainingLength = length5.subtracting(length6) {
    print(remainingLength) // Output: "1.0 m"
}
```

- **Multiplikation**

```swift
let length7 = AMeasurement(value: 1, unit: .meters) // 1 Meter
let length8 = AMeasurement(value: 100, unit: .centimeters) // 100 Zentimeter (1 Meter)
let area = length7.multiplying(by: length8)
print(area) // Output: "1.0 m²"

// Strom (A) * Spannung (V) = Leistung (W)
let voltage = AMeasurement(value: 230, unit: .volts) // 230 V
let current = AMeasurement(value: 10, unit: .amperes) // 10 A
let power = voltage.multiplying(by: current)
print(power) // Output: "2300 W"

// Ladung (mAh) * Spannung (V) = Energie (Wh)
let charge = AMeasurement(value: 5000, unit: .milliampereHours) // 5000 mAh
let voltage2 = AMeasurement(value: 3.7, unit: .volts) // 3.7 V
let energy = charge.multiplying(by: voltage2)
print(energy) // Output: "18.5 Wh"
```

- **Division**

```swift
let length9 = AMeasurement(value: 1, unit: .meters) // 1 Meter
let time1 = AMeasurement(value: 2, unit: .seconds) // 2 Sekunden
let speed = length9.dividing(by: time1) // 1 Meter / 2 Sekunden
print(speed) // Output: "0.5 m/s"

// Entfernung (km) / Zeit (h) = Geschwindigkeit (km/h)
let distance = AMeasurement(value: 100, unit: .kilometers) // 100 km
let time = AMeasurement(value: 2, unit: .hours) // 2 Stunden
let speed2 = distance.dividing(by: time)
print(speed2) // Output: "50 km/h"
```

#### Übersetzungen

Dieses Paket unterstützt mehrere Sprachen. Sie können die übersetzten Namen der Einheiten abrufen.

```swift
let unit = AUnit.kilometers
print(unit.shortName) // Output: "km"
```

### Beispiele

#### Längenumwandlung

Umwandlung von 1 Fuß in Meter:

```swift
let feet = AMeasurement(value: 1, unit: .feet) // 1 Fuß
if let meters = feet.converted(to: .meters) {
    print(meters) // Output: "0.3048 m"
}
```

Umwandlung von 1 Meile in Kilometer:

```swift
let miles = AMeasurement(value: 1, unit: .miles) // 1 Meile
if let kilometers = miles.converted(to: .kilometers) {
    print(kilometers) // Output: "1.60934 km"
}
```

#### Massenumwandlung

Umwandlung von 1 Kilogramm in Gramm:

```swift
let kilogram = AMeasurement(value: 1, unit: .kilograms) // 1 Kilogramm
if let grams = kilogram.converted(to: .grams) {
    print(grams) // Output: "1000 g"
}
```

Umwandlung von 1 Pfund in Kilogramm:

```swift
let pound = AMeasurement(value: 1, unit: .pounds) // 1 Pfund
if let kilograms = pound.converted(to: .kilograms) {
    print(kilograms) // Output: "0.453592 kg"
}
```

#### Volumenumwandlung

Umwandlung von 1 Liter in Kubikmeter:

```swift
let liter = AMeasurement(value: 1, unit: .liters) // 1 Liter
if let cubicMeters = liter.converted(to: .cubicMeters) {
    print(cubicMeters) // Output: "0.001 m³"
}
```

Umwandlung von 1 Gallone in Liter:

```swift
let gallon = AMeasurement(value: 1, unit: .gallons) // 1 Gallone
if let liters = gallon.converted(to: .liters) {
    print(liters) // Output: "3.78541 L"
}
```

#### Geschwindigkeitsumwandlung

Umwandlung von 60 Meilen pro Stunde in Kilometer pro Stunde:

```swift
let mph = AMeasurement(value: 60, unit: .milesPerHour) // 60 Meilen pro Stunde
if let kph = mph.converted(to: .kilometersPerHour) {
    print(kph) // Output: "96.5606 km/h"
}
```

Umwandlung von 1 Knoten in Meter pro Sekunde:

```swift
let knot = AMeasurement(value: 1, unit: .knots) // 1 Knoten
if let metersPerSecond = knot.converted(to: .metersPerSecond) {
    print(metersPerSecond) // Output: "0.514444 m/s"
}
```

#### Temperaturumwandlung

Umwandlung von 32 Grad Fahrenheit in Celsius:

```swift
let fahrenheit = AMeasurement(value: 32, unit: .fahrenheit) // 32 °F
if let celsius = fahrenheit.converted(to: .celsius) {
    print(celsius) // Output: "0 °C"
}
```

Umwandlung von 100 Grad Celsius in Kelvin:

```swift
let celsius = AMeasurement(value: 100, unit: .celsius) // 100 °C
if let kelvin = celsius.converted(to: .kelvin) {
    print(kelvin) // Output: "373.15 K"
}
```

#### Leistungsumwandlung

Umwandlung von 1 Pferdestärke in Watt:

```swift
let horsepower = AMeasurement(value: 1, unit: .horsepower) //

 1 PS
if let watts = horsepower.converted(to: .watts) {
    print(watts) // Output: "745.7 W"
}
```

#### Energieumwandlung

Umwandlung von 1 Kilowattstunde in Joule:

```swift
let kWh = AMeasurement(value: 1, unit: .kilowattHours) // 1 kWh
if let joules = kWh.converted(to: .joules) {
    print(joules) // Output: "3600000 J"
}
```

Das war eine Einführung in **AUnit**. Weitere Informationen und Beispiele finden Sie in der [Dokumentation](https://github.com/RapboyGao/Unit).

---
