# AUnit 🌍⚖️📏

**AUnit** es un paquete de Swift diseñado para facilitar las conversiones y operaciones entre diferentes unidades. Ya sea que estés trabajando con longitudes, velocidades, temperaturas o presiones, ¡AUnit hace el proceso simple y eficiente! 🚀

## 🌍 README Multilingüe

Elige tu idioma preferido para la documentación:

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

## 🌟 Características

- **Tipos de unidades múltiples**: Longitud, velocidad, temperatura, presión y muchas más. 🌡️📏
- **Conversiones**: Convierte entre diferentes unidades sin esfuerzo. 🔄
- **Operaciones aritméticas**: Suma, resta, multiplica y divide unidades con facilidad. ➕➖✖️➗
- **Nombres de unidades localizados**: Nombres personalizables, abreviaturas y descripciones en varios idiomas. 🗣️🌐

## 📦 Instalación

Para agregar **AUnit** a tu proyecto, inclúyelo en tu archivo `Package.swift`:

```swift
// swift-tools-version: 5.10
import PackageDescription

let package = Package(
    name: "TuProyecto",
    dependencies: [
        .package(url: "https://github.com/RapboyGao/AUnit.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "TuObjetivoDeProyecto",
            dependencies: ["AUnit"]),
    ]
)
```

Luego ejecuta `swift build` para comenzar. 🛠️

## 🎓 Uso

### 1. **Importar el paquete**

```swift
import AUnit
```

### 2. **Ejemplo de conversión de unidades**

Convierte unidades fácilmente:

```swift
let distancia = AMeasurement(value: 100, unit: .meters)
if let distanciaEnKilometros = distancia.converted(to: .kilometers) {
    print(distanciaEnKilometros) // Salida: 0.1 km
}
```

### 3. **Sumar mediciones**

Suma mediciones con unidades compatibles:

```swift
let tiempo1 = AMeasurement(value: 120, unit: .seconds)
let tiempo2 = AMeasurement(value: 2, unit: .minutes)

if let tiempoTotal = tiempo1.adding(tiempo2) {
    print(tiempoTotal) // Salida: 240 segundos
}
```

### 4. **Multiplicar y dividir**

Multiplica o divide mediciones:

```swift
let velocidad = AMeasurement(value: 10, unit: .metersPerSecond)
let tiempo = AMeasurement(value: 5, unit: .seconds)

if let distancia = velocidad.multiplying(by: tiempo) {
    print(distancia) // Salida: 50 metros
}
```

### 5. **Comprobar igualdad**

Comprueba si dos mediciones son iguales:

```swift
let peso1 = AMeasurement(value: 1000, unit: .grams)
let peso2 = AMeasurement(value: 1, unit: .kilograms)

if peso1.equal(to: peso2) {
    print("Los pesos son iguales")
}
```

### 6. **Operaciones complejas**

AUnit también admite operaciones complejas como la combinación o el escalado de unidades.

#### Ejemplo: Calcular área a partir de la longitud

Para calcular un área multiplicando dos longitudes:

```swift
let longitud1 = AMeasurement(value: 5, unit: .meters)
let longitud2 = AMeasurement(value: 10, unit: .meters)

if let area = longitud1.multiplying(by: longitud2) {
    print(area) // Salida: 50 metros cuadrados
}
```

#### Ejemplo: Cálculo de potencia

Para calcular la potencia multiplicando corriente eléctrica y voltaje:

```swift
let corriente = AMeasurement(value: 5, unit: .amperes)
let voltaje = AMeasurement(value: 220, unit: .volts)

if let potencia = corriente.multiplying(by: voltaje) {
    print(potencia) // Salida: 1100 vatios
}
```

### 7. **Conversión y aritmética de temperaturas**

AUnit también maneja conversiones de temperatura y operaciones aritméticas:

```swift
let temp1 = AMeasurement(value: 25, unit: .celsius)
let diferenciaDeTemp = AMeasurement(value: 10, unit: .celsiusDelta)

if let nuevaTemp = temp1.adding(diferenciaDeTemp) {
    print(nuevaTemp) // Salida: 35°C
}
```

## 📜 Licencia

**AUnit** está disponible bajo la Licencia MIT. Consulta el archivo `LICENSE` para más detalles. 📄

---

¡Feliz programación con **AUnit**! 💻✨
