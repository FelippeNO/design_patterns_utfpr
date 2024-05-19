// Interface Prototype que define o método de clonagem
abstract class Prototype {
  Prototype clone();
}

// Implementação concreta do relatório de vendas
class SalesReport implements Prototype {
  // Lista para armazenar datas de vendas
  final List<String> _salesDates = [];

  @override
  Prototype clone() {
    // Retorna uma nova instância de SalesReport
    return SalesReport();
  }
}

// Implementação concreta do relatório de inventário
class InventoryReport implements Prototype {
  // Lista para armazenar produtos
  final List<String> _products = [];

  @override
  Prototype clone() {
    // Retorna uma nova instância de InventoryReport
    return InventoryReport();
  }
}

// Classe para gerenciar protótipos de relatórios
class ReportManager {
  // Mapa para armazenar os protótipos de relatórios registrados
  Map<String, Prototype> _reportPrototypes = {};

  // Método para registrar um protótipo de relatório
  void register(String name, Prototype prototype) {
    _reportPrototypes[name] = prototype;
  }

  // Método para obter um protótipo clonado com base no nome registrado
  Prototype? getPrototype(String name) {
    return _reportPrototypes[name]?.clone();
  }
}

void main() {
  // Criação do gerenciador de relatórios
  var reportManager = ReportManager();

  // Registro dos protótipos de relatórios
  reportManager.register("SalesReport", SalesReport());
  reportManager.register("InventoryReport", InventoryReport());

  // Obtenção de clones dos protótipos registrados
  var salesReport = reportManager.getPrototype("SalesReport");
  var inventoryReport = reportManager.getPrototype("InventoryReport");
}
