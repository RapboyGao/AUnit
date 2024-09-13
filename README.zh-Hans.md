# AUnit 🌍⚖️📏

**AUnit** 是一个 Swift 包，旨在简化不同单位之间的转换和操作。无论是长度、速度、温度还是压力，AUnit 都能让您的工作变得简单高效！🚀

## 🌍 多语言 README

选择您偏好的文档语言：

- [🇬🇧 English](./README.md)
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

## 🌟 功能

- **多种单位类型**：支持长度、速度、温度、压力等单位类型！🌡️📏
- **单位转换**：轻松实现不同单位间的转换。🔄
- **算术操作**：轻松进行单位的加、减、乘、除运算。➕➖✖️➗
- **本地化单位名称**：支持多语言的单位符号、简称和描述。🗣️🌐

## 📦 安装

要将 **AUnit** 添加到您的项目中，请在 `Package.swift` 文件中加入以下内容：

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "YourProject",
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

然后运行 `swift build` 来开始使用！🛠️

## 🎓 使用方法

### 1. **导入包**

```swift
import AUnit
```

### 2. **单位转换示例**

轻松实现单位转换：

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // 输出：0.1 公里
}
```

### 3. **添加单位测量**

将具有相同类型单位的测量值相加：

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // 输出：240 秒
}
```

### 4. **乘法和除法操作**

对测量值进行乘除运算：

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // 输出：50 米
}
```

### 5. **检查单位是否相等**

检查两个测量值是否相等：

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("两个重量相等")
}
```

### 6. **复杂计算**

AUnit 支持复杂的计算操作，例如组合或缩放单位。

#### 示例：根据长度计算面积

通过将两个长度测量值相乘来计算面积：

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // 输出：50 平方米
}
```

#### 示例：计算功率

通过电流和电压来计算功率：

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // 输出：1100 瓦特
}
```

### 7. **温度转换和运算**

AUnit 也可以处理温度转换和运算：

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // 输出：35°C
}
```

## 📜 许可证

**AUnit** 根据 MIT 许可证发布。详情请参见 `LICENSE` 文件。📄

---

使用 **AUnit** 编码愉快！💻✨
