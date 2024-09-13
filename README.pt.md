# AUnit 🌍⚖️📏

**AUnit** é um pacote Swift projetado para facilitar a conversão e operações entre diferentes unidades de medida. Seja para comprimento, velocidade, temperatura ou pressão, o AUnit torna o processo simples e eficiente! 🚀

## 🌍 README Multilíngue

Escolha seu idioma preferido para a documentação:

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

## 🌟 Funcionalidades

- **Múltiplos tipos de unidade**: Comprimento, velocidade, temperatura, pressão e muito mais! 🌡️📏
- **Conversões**: Converta entre diferentes unidades com facilidade. 🔄
- **Operações aritméticas**: Some, subtraia, multiplique e divida unidades sem esforço. ➕➖✖️➗
- **Nomes de unidades localizados**: Nomes, símbolos e descrições personalizáveis para vários idiomas. 🗣️🌐

## 📦 Instalação

Para adicionar **AUnit** ao seu projeto, inclua-o no seu arquivo `Package.swift`:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "SeuProjeto",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "SeuAlvo",
            dependencies: ["AUnit"]),
    ]
)
```

Depois, execute `swift build` para começar! 🛠️

## 🎓 Uso

### 1. **Importar o pacote**

```swift
import AUnit
```

### 2. **Exemplo de conversão de unidades**

Converta unidades facilmente:

```swift
let distancia = AMeasurement(value: 100, unit: .meters)
if let distanciaEmQuilometros = distancia.converted(to: .kilometers) {
    print(distanciaEmQuilometros) // Saída: 0,1 km
}
```

### 3. **Adicionar medições**

Some medições com unidades compatíveis:

```swift
let tempo1 = AMeasurement(value: 120, unit: .seconds)
let tempo2 = AMeasurement(value: 2, unit: .minutes)

if let tempoTotal = tempo1.adding(tempo2) {
    print(tempoTotal) // Saída: 240 segundos
}
```

### 4. **Multiplicar e dividir**

Multiplique ou divida medições:

```swift
let velocidade = AMeasurement(value: 10, unit: .metersPerSecond)
let tempo = AMeasurement(value: 5, unit: .seconds)

if let distancia = velocidade.multiplying(by: tempo) {
    print(distancia) // Saída: 50 metros
}
```

### 5. **Verificar igualdade**

Verifique se duas medições são iguais:

```swift
let peso1 = AMeasurement(value: 1000, unit: .grams)
let peso2 = AMeasurement(value: 1, unit: .kilograms)

if peso1.equal(to: peso2) {
    print("Os pesos são iguais")
}
```

### 6. **Operações complexas**

O AUnit também suporta operações mais complexas, como combinar ou escalonar unidades.

#### Exemplo: Cálculo de área a partir de comprimento

Para calcular uma área multiplicando duas medições de comprimento:

```swift
let comprimento1 = AMeasurement(value: 5, unit: .meters)
let comprimento2 = AMeasurement(value: 10, unit: .meters)

if let area = comprimento1.multiplying(by: comprimento2) {
    print(area) // Saída: 50 metros quadrados
}
```

#### Exemplo: Cálculo de potência

Calcule a potência multiplicando corrente elétrica e tensão:

```swift
let corrente = AMeasurement(value: 5, unit: .amperes)
let tensao = AMeasurement(value: 220, unit: .volts)

if let potencia = corrente.multiplying(by: tensao) {
    print(potencia) // Saída: 1100 watts
}
```

### 7. **Conversão e operações aritméticas com temperatura**

O AUnit também lida com conversões de temperatura e operações aritméticas:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let diferencaTemp = AMeasurement(value: 10, unit: .celsiusDelta)

if let novaTemp = temp1.adding(diferencaTemp) {
    print(novaTemp) // Saída: 35°C
}
```

## 📜 Licença

**AUnit** está disponível sob a licença MIT. Veja o arquivo `LICENSE` para mais detalhes. 📄

---

Feliz codificação com **AUnit**! 💻✨
