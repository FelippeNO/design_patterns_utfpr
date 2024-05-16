abstract class Prototype {
  Prototype clone();
}

class SalesReport implements Prototype {
  final List<String> _salesDates = [];

  @override
  Prototype clone() {
    return SalesReport();
  }
}

class InventoryReport implements Prototype {
  final List<String> _products = [];

  @override
  Prototype clone() {
    return InventoryReport();
  }
}

class ReportManager {
  Map<String, Prototype> _reportPrototypes = {};

  void register(String name, Prototype prototype) {
    _reportPrototypes[name] = prototype;
  }

  Prototype? getPrototype(String name) {
    return _reportPrototypes[name]?.clone();
  }
}

void main() {
  var reportManager = ReportManager();
  reportManager.register("SalesReport", SalesReport());
  reportManager.register("InventoryReport", InventoryReport());

  var salesReport = reportManager.getPrototype("SalesReport");
  var inventoryReport = reportManager.getPrototype("InventoryReport");
}
