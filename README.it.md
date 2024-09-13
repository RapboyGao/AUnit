# AUnit 🌍⚖️📏

**AUnit** è un pacchetto Swift progettato per semplificare le conversioni e le operazioni tra diverse unità di misura. Che tu stia lavorando con lunghezze, velocità, temperature o pressioni, AUnit rende il processo semplice ed efficiente! 🚀

## 🌍 README Multilingue

Scegli la tua lingua preferita per la documentazione:

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

## 🌟 Funzionalità

- **Molteplici tipi di unità**: Lunghezza, velocità, temperatura, pressione e molto altro! 🌡️📏
- **Conversioni**: Converte facilmente tra diverse unità. 🔄
- **Operazioni aritmetiche**: Somma, sottrai, moltiplica e dividi unità con facilità. ➕➖✖️➗
- **Nomi delle unità localizzati**: Nomi personalizzabili, simboli e descrizioni per diverse lingue. 🗣️🌐

## 📦 Installazione

Per aggiungere **AUnit** al tuo progetto, includilo nel tuo file `Package.swift`:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "IlTuoProgetto",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "IlTuoTarget",
            dependencies: ["AUnit"]),
    ]
)
```

Poi esegui `swift build` per iniziare! 🛠️

## 🎓 Utilizzo

### 1. **Importare il pacchetto**

```swift
import AUnit
```

### 2. **Esempio di conversione di unità**

Converti facilmente tra unità:

```swift
let distanza = AMeasurement(value: 100, unit: .meters)
if let distanzaInChilometri = distanza.converted(to: .kilometers) {
    print(distanzaInChilometri) // Output: 0,1 km
}
```

### 3. **Somma delle misurazioni**

Somma misurazioni con unità compatibili:

```swift
let tempo1 = AMeasurement(value: 120, unit: .seconds)
let tempo2 = AMeasurement(value: 2, unit: .minutes)

if let tempoTotale = tempo1.adding(tempo2) {
    print(tempoTotale) // Output: 240 secondi
}
```

### 4. **Moltiplicare e dividere**

Moltiplica o dividi misurazioni:

```swift
let velocità = AMeasurement(value: 10, unit: .metersPerSecond)
let tempo = AMeasurement(value: 5, unit: .seconds)

if let distanza = velocità.multiplying(by: tempo) {
    print(distanza) // Output: 50 metri
}
```

### 5. **Verificare l'uguaglianza**

Verifica se due misurazioni sono uguali:

```swift
let peso1 = AMeasurement(value: 1000, unit: .grams)
let peso2 = AMeasurement(value: 1, unit: .kilograms)

if peso1.equal(to: peso2) {
    print("I pesi sono uguali")
}
```

### 6. **Operazioni complesse**

AUnit supporta anche operazioni complesse come la combinazione o il ridimensionamento delle unità.

#### Esempio: Calcolo dell'area da una lunghezza

Per calcolare un'area moltiplicando due misurazioni di lunghezza:

```swift
let lunghezza1 = AMeasurement(value: 5, unit: .meters)
let lunghezza2 = AMeasurement(value: 10, unit: .meters)

if let area = lunghezza1.multiplying(by: lunghezza2) {
    print(area) // Output: 50 metri quadrati
}
```

#### Esempio: Calcolo della potenza

Calcola la potenza moltiplicando corrente elettrica e tensione:

```swift
let corrente = AMeasurement(value: 5, unit: .amperes)
let tensione = AMeasurement(value: 220, unit: .volts)

if let potenza = corrente.multiplying(by: tensione) {
    print(potenza) // Output: 1100 watt
}
```

### 7. **Conversione e aritmetica delle temperature**

AUnit gestisce anche la conversione delle temperature e le operazioni aritmetiche:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let differenzaTemp = AMeasurement(value: 10, unit: .celsiusDelta)

if let nuovaTemp = temp1.adding(differenzaTemp) {
    print(nuovaTemp) // Output: 35°C
}
```

## 📜 Licenza

**AUnit** è disponibile sotto la licenza MIT. Consulta il file `LICENSE` per maggiori dettagli. 📄

---

Buona programmazione con **AUnit**! 💻✨
