enum HealthOptions {
  weight(name: "Weight", unitsOfMeasurement: ["Kg", "Tonnes", "Pounds"]),
  bloodPressure(name: "Blood Pressure", unitsOfMeasurement: ["mmHg"]),
  waterContent(name: "Water/Blood Content", unitsOfMeasurement: ["Kg"]);

  const HealthOptions({required this.name, required this.unitsOfMeasurement});

  final String name;
  final List<String> unitsOfMeasurement;
}
