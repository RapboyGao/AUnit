# AUnit 🌍⚖️📏

**AUnit** ist ein Swift-Paket, das entwickelt wurde, um Einheitenumrechnungen und Operationen einfach zu machen. Egal ob Längen, Geschwindigkeiten, Temperaturen oder Drücke – mit AUnit kannst du all dies schnell und effizient bearbeiten! 🚀

## 🌍 Mehrsprachige README

Wähle deine bevorzugte Sprache für die Dokumentation:

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

## 🌟 Funktionen

- **Vielfältige Einheitstypen**: Länge, Geschwindigkeit, Temperatur, Druck und viele mehr! 🌡️📏
- **Umrechnungen**: Einheiten mühelos ineinander umrechnen. 🔄
- **Arithmetische Operationen**: Addiere, subtrahiere, multipliziere und dividiere Einheiten wie ein Profi! ➕➖✖️➗
- **Lokalisierte Einheitsnamen**: Anpassbare Symbole, Kurzbezeichnungen und Beschreibungen für verschiedene Sprachen. 🗣️🌐

## 📦 Installation

Um **AUnit** zu deinem Projekt hinzuzufügen, füge es in deine `Package.swift`-Datei ein:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "DeinProjektName",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "DeinProjektZiel",
            dependencies: ["AUnit"]),
    ]
)
```

Danach führe `swift build` aus, um das Paket zu starten! 🛠️

## 🎓 Nutzung

### 1. **Import des Pakets**

```swift
import AUnit
```

### 2. **Beispiel für Einheitenumrechnung**

Konvertiere Einheiten einfach:

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceInKilometers = distance.converted(to: .kilometers) {
    print(distanceInKilometers) // Ausgabe: 0,1 km
}
```

### 3. **Addiere Messwerte**

Addiere Messwerte mit kompatiblen Einheiten:

```swift
let time1 = AMeasurement(value: 120, unit: .seconds)
let time2 = AMeasurement(value: 2, unit: .minutes)

if let totalTime = time1.adding(time2) {
    print(totalTime) // Ausgabe: 240 Sekunden
}
```

### 4. **Multiplikation und Division**

Multipliziere oder dividiere Messwerte:

```swift
let speed = AMeasurement(value: 10, unit: .metersPerSecond)
let time = AMeasurement(value: 5, unit: .seconds)

if let distance = speed.multiplying(by: time) {
    print(distance) // Ausgabe: 50 Meter
}
```

### 5. **Gleichheit überprüfen**

Prüfe, ob zwei Messwerte gleich sind:

```swift
let weight1 = AMeasurement(value: 1000, unit: .grams)
let weight2 = AMeasurement(value: 1, unit: .kilograms)

if weight1.equal(to: weight2) {
    print("Gewichte sind gleich")
}
```

### 6. **Komplexe Berechnungen**

AUnit unterstützt komplexe Berechnungen wie das Kombinieren oder Skalieren von Einheiten.

#### Beispiel: Flächenberechnung aus Länge

Um eine Fläche zu berechnen, indem du zwei Längenmaße multiplizierst:

```swift
let length1 = AMeasurement(value: 5, unit: .meters)
let length2 = AMeasurement(value: 10, unit: .meters)

if let area = length1.multiplying(by: length2) {
    print(area) // Ausgabe: 50 Quadratmeter
}
```

#### Beispiel: Leistung berechnen

Berechne die Leistung durch Multiplikation von Stromstärke und Spannung:

```swift
let current = AMeasurement(value: 5, unit: .amperes)
let voltage = AMeasurement(value: 220, unit: .volts)

if let power = current.multiplying(by: voltage) {
    print(power) // Ausgabe: 1100 Watt
}
```

### 7. **Temperaturumrechnung und Arithmetik**

AUnit kann auch Temperaturumrechnungen und -arithmetik behandeln:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let tempDifference = AMeasurement(value: 10, unit: .celsiusDelta)

if let newTemp = temp1.adding(tempDifference) {
    print(newTemp) // Ausgabe: 35°C
}
```

## 📜 Lizenz

**AUnit** steht unter der MIT-Lizenz zur Verfügung. Weitere Informationen findest du in der `LICENSE`-Datei. 📄

---

Viel Spaß beim Programmieren mit **AUnit**! 💻✨
