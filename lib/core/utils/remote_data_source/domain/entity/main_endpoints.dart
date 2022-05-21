enum MainEndpoint {
  fetchTodos,
}

extension MainEndpointExtension on MainEndpoint {
  String get endpointName {
    switch (this) {
      case MainEndpoint.fetchTodos:
        return "todos";
    }
  }
}
