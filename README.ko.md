# AUnit 🌍⚖️📏

**AUnit**은 다양한 단위 간 변환과 계산을 쉽게 처리할 수 있도록 설계된 Swift 패키지입니다. 길이, 속도, 온도, 압력 등 여러 단위의 작업을 효율적이고 간편하게 수행할 수 있습니다! 🚀

## 🌍 다국어 README

원하는 언어로 문서를 확인하세요:

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

## 🌟 기능

- **다양한 단위 유형**: 길이, 속도, 온도, 압력 등 여러 유형의 단위를 지원합니다. 🌡️📏
- **단위 변환**: 서로 다른 단위 간의 변환을 손쉽게 처리할 수 있습니다. 🔄
- **산술 연산**: 단위를 더하거나 빼고, 곱하거나 나누는 연산을 쉽게 할 수 있습니다. ➕➖✖️➗
- **현지화된 단위 이름**: 다양한 언어에 맞춰 단위의 기호, 약칭, 설명을 커스터마이징할 수 있습니다. 🗣️🌐

## 📦 설치

**AUnit**을 프로젝트에 추가하려면 `Package.swift` 파일에 아래 내용을 포함하세요:

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

그런 다음 `swift build` 명령을 실행하여 시작할 수 있습니다! 🛠️

## 🎓 사용법

### 1. **패키지 임포트**

```swift
import AUnit
```

### 2. **단위 변환 예시**

단위를 손쉽게 변환할 수 있습니다:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // 출력: 0.1 km
}
```

### 3. **단위 추가**

호환되는 단위의 값을 더할 수 있습니다:

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // 출력: 240초
}
```

### 4. **곱셈과 나눗셈**

단위를 곱하거나 나눌 수 있습니다:

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // 출력: 50미터
}
```

### 5. **동일성 확인**

두 단위가 같은지 확인할 수 있습니다:

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("무게가 동일합니다")
}
```

### 6. **복잡한 연산**

AUnit은 단위 결합 또는 단위 크기 조정과 같은 복잡한 연산도 지원합니다.

#### 예시: 길이로 면적 계산

두 길이 단위를 곱하여 면적을 계산할 수 있습니다:

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // 출력: 50제곱미터
}
```

#### 예시: 전력 계산

전류와 전압을 곱하여 전력을 계산할 수 있습니다:

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // 출력: 1100와트
}
```

### 7. **온도 변환 및 산술 연산**

AUnit은 온도 변환과 관련된 연산도 처리할 수 있습니다:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // 출력: 35°C
}
```

## 📜 라이선스

**AUnit**은 MIT 라이선스 하에 제공됩니다. 자세한 내용은 `LICENSE` 파일을 확인하세요. 📄

---

**AUnit**을 사용한 즐거운 코딩 되세요! 💻✨
