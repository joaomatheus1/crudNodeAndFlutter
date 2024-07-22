import 'package:flutter/material.dart';
import 'widgets/ataPresenca.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({Key? key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final List<Map<String, dynamic>> data = [
    {
      'nome': ["João Matheus", "Fabio", "Tainá"],
      'workshop': "Criptografia",
      'data': "20/07/2023",
      'desc': "Descrição do workshop de Criptografia",
    },
    {
      'nome': ["João Matheus", "Maria Silva", "Fabio"],
      'workshop': "Machine Learning",
      'data': "25/07/2023",
      'desc': "Descrição do workshop de Machine Learning",
    },
    {
      'nome': ["Maria Silva", "Tainá"],
      'workshop': "Machine Learning",
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
      bool nameMatches = nomes.map((nome) => nome.toLowerCase()).any((nome) => nome.contains(searchText));
      return nameMatches &&
          item['workshop'].toLowerCase().contains(workshopText) &&
          item['data'].toLowerCase().contains(dateText);
    }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fast',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Center(
            child: Text("Ata de presença"),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Inputs em linha
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _nomeController,
                      decoration: InputDecoration(labelText: 'Nome'),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _workshopController,
                      decoration: InputDecoration(labelText: 'Workshop'),
                    ),
                  ),
                  SizedBox(width: 16.0),
                  Expanded(
                    child: TextField(
                      controller: _dataController,
                      decoration: InputDecoration(labelText: 'Data'),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16.0),
              Expanded(
                child: ListView(
                  children: [
                    for (final item in filteredData)
                      Padding(
                        padding: const EdgeInsets.only(bottom: 16.0),
                        child: AtaPresenca(
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
      ),
    );
  }
}
