# AUnit 🌍⚖️📏

**AUnit** est un package Swift conçu pour faciliter les conversions et opérations entre différentes unités. Que vous travailliez avec des longueurs, des vitesses, des températures ou des pressions, AUnit rend le processus simple et efficace ! 🚀

## 🌍 README Multilingue

Choisissez votre langue préférée pour la documentation :

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

## 🌟 Fonctionnalités

- **Multiples types d'unités** : Longueur, vitesse, température, pression et bien plus encore ! 🌡️📏
- **Conversions** : Convertissez facilement entre différentes unités. 🔄
- **Opérations arithmétiques** : Ajoutez, soustrayez, multipliez et divisez des unités avec facilité. ➕➖✖️➗
- **Noms des unités localisés** : Noms personnalisables, symboles et descriptions pour diverses langues. 🗣️🌐

## 📦 Installation

Pour ajouter **AUnit** à votre projet, incluez-le dans votre fichier `Package.swift` :

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "VotreProjet",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "VotreCibleDeProjet",
            dependencies: ["AUnit"]),
    ]
)
```

Ensuite, exécutez `swift build` pour commencer. 🛠️

## 🎓 Utilisation

### 1. **Importer le package**

```swift
import AUnit
```

### 2. **Exemple de conversion d'unités**

Convertissez des unités facilement :

```swift
let distance = AMeasurement(value: 100, unit: .meters)
if let distanceEnKilometres = distance.converted(to: .kilometers) {
    print(distanceEnKilometres) // Sortie : 0,1 km
}
```

### 3. **Ajouter des mesures**

Ajoutez des mesures avec des unités compatibles :

```swift
let temps1 = AMeasurement(value: 120, unit: .seconds)
let temps2 = AMeasurement(value: 2, unit: .minutes)

if let tempsTotal = temps1.adding(temps2) {
    print(tempsTotal) // Sortie : 240 secondes
}
```

### 4. **Multiplier et diviser**

Multipliez ou divisez des mesures :

```swift
let vitesse = AMeasurement(value: 10, unit: .metersPerSecond)
let temps = AMeasurement(value: 5, unit: .seconds)

if let distance = vitesse.multiplying(by: temps) {
    print(distance) // Sortie : 50 mètres
}
```

### 5. **Vérifier l'égalité**

Vérifiez si deux mesures sont égales :

```swift
let poids1 = AMeasurement(value: 1000, unit: .grams)
let poids2 = AMeasurement(value: 1, unit: .kilograms)

if poids1.equal(to: poids2) {
    print("Les poids sont égaux")
}
```

### 6. **Opérations complexes**

AUnit prend également en charge les opérations complexes telles que la combinaison ou le redimensionnement d'unités.

#### Exemple : Calcul de surface à partir de la longueur

Pour calculer une surface en multipliant deux longueurs :

```swift
let longueur1 = AMeasurement(value: 5, unit: .meters)
let longueur2 = AMeasurement(value: 10, unit: .meters)

if let surface = longueur1.multiplying(by: longueur2) {
    print(surface) // Sortie : 50 mètres carrés
}
```

#### Exemple : Calcul de puissance

Calculez la puissance en multipliant le courant électrique et la tension :

```swift
let courant = AMeasurement(value: 5, unit: .amperes)
let tension = AMeasurement(value: 220, unit: .volts)

if let puissance = courant.multiplying(by: tension) {
    print(puissance) // Sortie : 1100 watts
}
```

### 7. **Conversion et arithmétique des températures**

AUnit gère également les conversions de température et les opérations arithmétiques :

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let diffTemp = AMeasurement(value: 10, unit: .celsiusDelta)

if let nouvelleTemp = temp1.adding(diffTemp) {
    print(nouvelleTemp) // Sortie : 35°C
}
```

## 📜 Licence

**AUnit** est disponible sous la licence MIT. Consultez le fichier `LICENSE` pour plus de détails. 📄

---

Bon codage avec **AUnit** ! 💻✨
