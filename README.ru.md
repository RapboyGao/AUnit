# AUnit 🌍⚖️📏

**AUnit** — это пакет для Swift, предназначенный для облегчения преобразования и операций между различными единицами измерения. Будь то длина, скорость, температура или давление — с AUnit процесс становится простым и эффективным! 🚀

## 🌍 README на нескольких языках

Выберите предпочитаемый язык документации:

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

## 🌟 Особенности

- **Множество типов единиц**: длина, скорость, температура, давление и многое другое! 🌡️📏
- **Преобразования**: легкое преобразование между различными единицами. 🔄
- **Арифметические операции**: складывайте, вычитайте, умножайте и делите единицы легко. ➕➖✖️➗
- **Локализованные имена единиц**: поддержка кастомизированных символов, кратких имен и описаний на нескольких языках. 🗣️🌐

## 📦 Установка

Чтобы добавить **AUnit** в ваш проект, включите его в ваш файл `Package.swift`:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "ВашПроект",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "ВашЦель",
            dependencies: ["AUnit"]),
    ]
)
```

После этого выполните команду `swift build`, чтобы начать! 🛠️

## 🎓 Использование

### 1. **Импорт пакета**

```swift
import AUnit
```

### 2. **Пример преобразования единиц**

Легко преобразовывайте единицы:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // Вывод: 0.1 км
}
```

### 3. **Сложение измерений**

Складывайте измерения с совместимыми единицами:

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // Вывод: 240 секунд
}
```

### 4. **Умножение и деление**

Умножайте или делите измерения:

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // Вывод: 50 метров
}
```

### 5. **Проверка равенства**

Проверьте, равны ли два измерения:

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("Вес одинаков")
}
```

### 6. **Сложные операции**

AUnit поддерживает более сложные операции, такие как объединение или масштабирование единиц.

#### Пример: Расчет площади по длине

Чтобы вычислить площадь путем умножения двух измерений длины:

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // Вывод: 50 квадратных метров
}
```

#### Пример: Расчет мощности

Вычислите мощность, умножив электрический ток и напряжение:

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // Вывод: 1100 ватт
}
```

### 7. **Преобразование и арифметика с температурами**

AUnit также поддерживает преобразование температур и операции с ними:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // Вывод: 35°C
}
```

## 📜 Лицензия

**AUnit** доступен по лицензии MIT. Подробнее см. в файле `LICENSE`. 📄

---

Приятного программирования с **AUnit**! 💻✨
