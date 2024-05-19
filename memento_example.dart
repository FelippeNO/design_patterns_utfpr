// Classe Memento que armazena o estado do texto
class TextMemento {
  // Atributo privado que mantém o estado do texto
  final String _text;

  // Construtor que inicializa o estado do texto
  TextMemento(this._text);

  // Método para obter o estado do texto armazenado
  String getText() => _text;
}

// Classe Originator que mantém o estado atual e pode criar Mementos
class TextEditor {
  // Atributo que mantém o texto atual
  String _text = '';

  // Método para adicionar texto ao editor
  void addText(String text) {
    _text += text;
  }

  // Método para definir o texto diretamente
  void setText(String text) {
    _text = text;
  }

  // Método para salvar o estado atual em um Memento
  TextMemento save() {
    return TextMemento(_text);
  }

  // Método para restaurar o estado do editor a partir de um Memento
  void restore(TextMemento? memento) {
    if (memento != null) _text = memento.getText();
  }

  // Método para imprimir o texto atual
  void printText() {
    print("Current Text: $_text");
  }
}

// Classe Caretaker que mantém uma lista de Mementos
class History {
  // Lista que mantém o histórico de Mementos
  final List<TextMemento> _history = [];

  // Método para adicionar um Memento ao histórico
  void addMemento(TextMemento memento) {
    _history.add(memento);
  }

  // Método para obter o último Memento do histórico
  TextMemento? getMemento() {
    if (_history.isNotEmpty) {
      final lastIndex = _history.length - 1;
      final lastMemento = _history[lastIndex];
      _history.removeAt(lastIndex);
      return lastMemento;
    }
    return null;
  }
}

void main() {
  // Cria um editor de texto e um histórico
  var editor = TextEditor();
  var history = History();

  // Adiciona texto ao editor e salva o estado atual no histórico
  editor.addText("Hello, ");
  history.addMemento(editor.save());

  // Adiciona mais texto ao editor
  editor.addText("world!");
  editor.printText(); // Output: Current Text: Hello, world!

  // Restaura o estado anterior do editor a partir do histórico
  var memento = history.getMemento();
  editor.restore(memento);
  editor.printText(); // Output: Current Text: Hello,
}
