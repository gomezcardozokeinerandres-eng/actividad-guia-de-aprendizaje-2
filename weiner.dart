void main() {
  List<Vehiculo> vehiculos = [];

  vehiculos.add(
    Carro("Toyota", "Corolla", anio: 2010, numeroPuertas: 4, estado: "activo"),
  );

  vehiculos.add(
    Motocicleta("Yamaha", "R15", anio: 2018, cilindraje: 250, estado: "activo"),
  );

  vehiculos.add(
    Carro("Mazda", "CX5", anio: 2005, numeroPuertas: 5, estado: "inactivo"),
  );

  print("=== LISTA DE VEHÍCULOS ===");

  for (var v in vehiculos) {
    print("\n-------------------");
    v.mostrarInfo();
    print("Costo servicio: ${v.calcularCostoServicio()}");
  }
}

class Vehiculo {
  String marca;
  String modelo;
  int anio;
  String _estado;

  //  Constructor (posicional + nombrados)
  Vehiculo(
    this.marca,
    this.modelo, {
    required this.anio,
    String estado = "activo",
  }) : _estado = estado;

  //  Getter y Setter
  String get estado => _estado;

  set estado(String nuevoEstado) {
    _estado = nuevoEstado;
  }

  // Método
  void mostrarInfo() {
    print("Marca: $marca");
    print("Modelo: $modelo");
    print("Año: $anio");
    print("Estado: $_estado");
  }

  //  Método a sobrescribir
  double calcularCostoServicio() {
    return 0;
  }
}

class Carro extends Vehiculo {
  int numeroPuertas;

  //  Constructor con super
  Carro(
    String marca,
    String modelo, {
    required int anio,
    required this.numeroPuertas,
    String estado = "activo",
  }) : super(marca, modelo, anio: anio, estado: estado);

  //  Override
  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Vehículo no disponible para servicio");
      return 0;
    }

    double costo = 50000;

    if (numeroPuertas > 4) {
      costo += 20000;
    } else {
      costo += 10000;
    }

    int edad = DateTime.now().year - anio;
    if (edad > 10) {
      costo += 15000;
    }

    return costo;
  }

  //  Método adicional
  bool esFamiliar() {
    return numeroPuertas > 4;
  }
}

class Motocicleta extends Vehiculo {
  int cilindraje;

  // Constructor
  Motocicleta(
    String marca,
    String modelo, {
    required int anio,
    required this.cilindraje,
    String estado = "activo",
  }) : super(marca, modelo, anio: anio, estado: estado);

  //  Override
  @override
  double calcularCostoServicio() {
    if (estado == "inactivo") {
      print("Motocicleta no disponible para servicio");
      return 0;
    }

    double costo = 30000;

    if (cilindraje > 200) {
      costo += 25000;
    } else {
      costo += 10000;
    }

    int edad = DateTime.now().year - anio;
    if (edad > 5) {
      costo += 10000;
    }

    return costo;
  }

  //  Método adicional
  bool esAltaCilindraje() {
    return cilindraje > 200;
  }
}
