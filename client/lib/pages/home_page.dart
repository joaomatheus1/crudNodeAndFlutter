import 'package:client/pages/graficos_page.dart';
import 'package:client/widgets/detalhes_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final List<Map<String, dynamic>> data = [
    {
      'nome': ["João", "Fabio", "Tainá"],
      'workshop': "Criptografia",
      'data': "20/07/2023",
      'desc': "Descrição do workshop de Criptografia",
    },
    {
      'nome': ["João", "Maria", "Fabio"],
      'workshop': "Machine Learning",
      'data': "25/07/2023",
      'desc': "Descrição do workshop de Machine Learning",
    },
    {
      'nome': ["Maria", "Tainá", "João", "José", "Felipe"],
      'workshop': "Segurança",
      'data': "24/07/2023",
      'desc': "Descrição do workshop de Machine Learning",
    }
  ];
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _workshopController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  List<Map<String, dynamic>> filteredData = [];

  @override
  void initState() {
    super.initState();
    filteredData = data;

    _nomeController.addListener(_onFilterTextChanged);
    _workshopController.addListener(_onFilterTextChanged);
    _dataController.addListener(_onFilterTextChanged);
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _workshopController.dispose();
    _dataController.dispose();
    super.dispose();
  }

  void _onFilterTextChanged() {
    String searchText = _nomeController.text.toLowerCase();
    String workshopText = _workshopController.text.toLowerCase();
    String dateText = _dataController.text.toLowerCase();

    setState(() {
      filteredData = data.where((item) {
        List<String> nomes = List<String>.from(item['nome']);
        bool nameMatches = nomes
            .map((nome) => nome.toLowerCase())
            .any((nome) => nome.contains(searchText));
        return nameMatches &&
            item['workshop'].toLowerCase().contains(workshopText) &&
            item['data'].toLowerCase().contains(dateText);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: const Center(
          child: Text(
            "Ata de presença",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white
            ),
            ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nomeController,
                    decoration: const InputDecoration(labelText: 'Nome'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _workshopController,
                    decoration: const InputDecoration(labelText: 'Workshop'),
                  ),
                ),
                const SizedBox(width: 16.0),
                Expanded(
                  child: TextField(
                    controller: _dataController,
                    decoration: const InputDecoration(labelText: 'Data',)
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => GraficosPage(data: data),
                  ),
                );
              },
              child: Text(
                'Ver Gráficos',
                style: TextStyle(
                  color: Colors.white
                ),
                ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.deepPurple
              ),
            ),
            const SizedBox(height: 16.0),
            Expanded(
              child: ListView(
                children: [
                  for (final item in filteredData)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16.0),
                      child: DetalhesPage(
                        nome: List<String>.from(item['nome']),
                        workshop: item['workshop'],
                        data: item['data'],
                        desc: item['desc'],
                      ),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
