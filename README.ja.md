# AUnit 🌍⚖️📏

**AUnit** は、さまざまな単位間の変換や操作を簡単にするために設計された Swift パッケージです。長さ、速度、温度、圧力など、AUnit を使用すれば効率的かつ簡単に作業できます！🚀

## 🌍 多言語対応 README

ドキュメントの言語を選択してください：

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

## 🌟 機能

- **さまざまな単位タイプ**：長さ、速度、温度、圧力など多岐にわたる単位をサポートします。🌡️📏
- **単位変換**：異なる単位間を簡単に変換できます。🔄
- **算術演算**：加算、減算、乗算、除算が簡単にできます。➕➖✖️➗
- **ローカライズされた単位名**：カスタマイズ可能なシンボル、短縮名、詳細な説明をさまざまな言語で対応。🗣️🌐

## 📦 インストール

**AUnit** をプロジェクトに追加するには、`Package.swift`ファイルに次のように記述します：

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "あなたのプロジェクト名",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "あなたのターゲット名",
            dependencies: ["AUnit"]),
    ]
)
```

その後、`swift build` を実行してスタートしましょう！🛠️

## 🎓 使い方

### 1. **パッケージのインポート**

```swift
import AUnit
```

### 2. **単位変換の例**

簡単に単位を変換できます：

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // 出力：0.1 km
}
```

### 3. **単位の加算**

互換性のある単位で計測値を加算します：

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // 出力：240 秒
}
```

### 4. **乗算と除算**

計測値を乗算または除算します：

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // 出力：50 メートル
}
```

### 5. **値の比較**

2 つの計測値が等しいかどうかを確認します：

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("重さは同じです")
}
```

### 6. **複雑な演算**

AUnit は、単位の組み合わせやスケーリングなど、複雑な演算もサポートしています。

#### 例：長さから面積を計算

2 つの長さの計測値を掛け合わせて面積を計算：

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // 出力：50 平方メートル
}
```

#### 例：電力の計算

電流と電圧を掛け合わせて電力を計算：

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // 出力：1100 ワット
}
```

### 7. **温度の変換と算術**

AUnit は温度の変換や算術演算も扱えます：

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // 出力：35°C
}
```

## 📜 ライセンス

**AUnit** は MIT ライセンスの下で提供されています。詳細については `LICENSE` ファイルをご確認ください。📄

---

**AUnit** で楽しくコーディングを！💻✨
