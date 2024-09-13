# AUnit 🌍⚖️📏

**AUnit** เป็นแพ็กเกจของ Swift ที่ออกแบบมาเพื่อช่วยให้การแปลงและการคำนวณระหว่างหน่วยต่างๆ เป็นเรื่องง่าย ไม่ว่าจะเป็นหน่วยความยาว ความเร็ว อุณหภูมิ หรือความดัน AUnit จะทำให้การทำงานของคุณรวดเร็วและมีประสิทธิภาพ! 🚀

## 🌍 README หลายภาษา

เลือกภาษาที่คุณต้องการสำหรับเอกสาร:

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

## 🌟 คุณสมบัติ

- **รองรับหลายหน่วย**: ความยาว ความเร็ว อุณหภูมิ ความดัน และอีกมากมาย! 🌡️📏
- **การแปลงหน่วย**: แปลงหน่วยต่างๆ ได้อย่างง่ายดาย 🔄
- **การคำนวณทางคณิตศาสตร์**: บวก ลบ คูณ และหารหน่วยต่างๆ ได้อย่างง่ายดาย ➕➖✖️➗
- **ชื่อหน่วยที่รองรับหลายภาษา**: รองรับการตั้งค่าสัญลักษณ์ ชื่อย่อ และคำอธิบายสำหรับภาษาต่างๆ 🗣️🌐

## 📦 การติดตั้ง

ในการเพิ่ม **AUnit** ไปยังโปรเจกต์ของคุณ ให้เพิ่มในไฟล์ `Package.swift` ของคุณ:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ชื่อโปรเจกต์ของคุณ",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ชื่อเป้าหมายของคุณ",
            dependencies: ["AUnit"]),
    ]
)
```

จากนั้นให้รันคำสั่ง `swift build` เพื่อเริ่มต้น! 🛠️

## 🎓 การใช้งาน

### 1. **การนำเข้าแพ็กเกจ**

```swift
import AUnit
```

### 2. **ตัวอย่างการแปลงหน่วย**

แปลงหน่วยต่างๆ ได้อย่างง่ายดาย:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // ผลลัพธ์: 0.1 กม.
}
```

### 3. **การบวกหน่วยวัด**

บวกค่าที่มีหน่วยเดียวกันได้อย่างง่ายดาย:

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // ผลลัพธ์: 240 วินาที
}
```

### 4. **การคูณและการหาร**

คูณหรือหารค่าต่างๆ ได้:

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // ผลลัพธ์: 50 เมตร
}
```

### 5. **การตรวจสอบความเท่ากัน**

ตรวจสอบว่าค่าสองค่ามีค่าเท่ากันหรือไม่:

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("น้ำหนักเท่ากัน")
}
```

### 6. **การคำนวณที่ซับซ้อน**

AUnit รองรับการคำนวณที่ซับซ้อน เช่น การรวมหน่วยหรือการปรับขนาดหน่วย

#### ตัวอย่าง: การคำนวณพื้นที่จากความยาว

เพื่อคำนวณพื้นที่โดยการคูณค่าความยาวสองค่า:

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // ผลลัพธ์: 50 ตารางเมตร
}
```

#### ตัวอย่าง: การคำนวณกำลังไฟฟ้า

คำนวณกำลังไฟฟ้าด้วยการคูณค่ากระแสไฟฟ้าและแรงดันไฟฟ้า:

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // ผลลัพธ์: 1100 วัตต์
}
```

### 7. **การแปลงอุณหภูมิและการคำนวณ**

AUnit สามารถจัดการการแปลงอุณหภูมิและการคำนวณทางคณิตศาสตร์เกี่ยวกับอุณหภูมิได้:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // ผลลัพธ์: 35°C
}
```

## 📜 ใบอนุญาต

**AUnit** เผยแพร่ภายใต้ใบอนุญาต MIT ดูรายละเอียดเพิ่มเติมในไฟล์ `LICENSE` 📄

---

ขอให้สนุกกับการเขียนโค้ดด้วย **AUnit**! 💻✨
