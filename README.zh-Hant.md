# AUnit 🌍⚖️📏

**AUnit** 是一個 Swift 套件，旨在簡化不同單位之間的轉換與操作。無論是長度、速度、溫度還是壓力，AUnit 都能讓您的工作變得簡單高效！🚀

## 🌍 多語言 README

選擇您偏好的文檔語言：

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

- **多種類型單位**：支持長度、速度、溫度、壓力等多種單位類型！🌡️📏
- **單位轉換**：輕鬆實現不同單位之間的轉換。🔄
- **數學運算**：輕鬆進行單位的加、減、乘、除運算。➕➖✖️➗
- **本地化單位名稱**：支持多語言的單位符號、簡稱和詳細描述。🗣️🌐

## 📦 安裝

要將 **AUnit** 添加到您的項目中，請在 `Package.swift` 文件中加入以下內容：

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

然後運行 `swift build` 來開始使用！🛠️

## 🎓 使用方法

### 1. **導入套件**

```swift
import AUnit
```

### 2. **單位轉換示例**

輕鬆實現單位轉換：

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // 輸出：0.1 公里
}
```

### 3. **單位加法操作**

將具有相同類型單位的測量值相加：

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // 輸出：240 秒
}
```

### 4. **乘法與除法操作**

對測量值進行乘除運算：

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // 輸出：50 米
}
```

### 5. **檢查單位是否相等**

檢查兩個測量值是否相等：

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("兩個重量相等")
}
```

### 6. **複雜計算**

AUnit 支持複雜的計算操作，例如結合或縮放單位。

#### 示例：根據長度計算面積

通過將兩個長度測量值相乘來計算面積：

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // 輸出：50 平方米
}
```

#### 示例：計算功率

通過電流和電壓來計算功率：

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // 輸出：1100 瓦特
}
```

### 7. **溫度轉換與運算**

AUnit 也可以處理溫度轉換和運算：

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // 輸出：35°C
}
```

## 📜 授權

**AUnit** 根據 MIT 授權發佈。詳情請參閱 `LICENSE` 文件。📄

---

使用 **AUnit** 開心編程！💻✨
