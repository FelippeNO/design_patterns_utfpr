// Interface que define o serviço remoto
abstract class RemoteService {
  String fetchData();
}

// Implementação concreta do serviço remoto
class RealRemoteService implements RemoteService {
  @override
  String fetchData() {
    // Simula uma chamada de rede demorada
    print("Fetching data from remote service...");
    return "Remote data";
  }
}

// Proxy que controla o acesso ao serviço remoto
class RemoteServiceProxy implements RemoteService {
  // Instância do serviço remoto real
  final RealRemoteService _realService = RealRemoteService();

  // Cache para armazenar os dados obtidos do serviço remoto
  String? _cachedData;

  @override
  String fetchData() {
    // Verifica se há dados no cache
    if (_cachedData != null) {
      // Retorna os dados do cache se disponíveis
      print("Returning cached data...");
      return _cachedData!;
    }

    // Se não houver dados no cache, faz a chamada ao serviço remoto
    _cachedData = _realService.fetchData();
    return _cachedData!;
  }
}

void main() {
  // Cria uma instância do proxy para acessar o serviço remoto
  var service = RemoteServiceProxy();

  // Primeira chamada obtém dados do serviço remoto e os armazena no cache
  print(service.fetchData()); // Output: Fetching data from remote service... Remote data

  // Segunda chamada retorna os dados do cache
  print(service.fetchData()); // Output: Returning cached data... Remote data
}
