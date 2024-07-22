import 'package:flutter/material.dart';

class WorkshopDetalhes extends StatelessWidget {
  final String workshop;
  final String data;
  final String desc;
  final List<String> nomes;

  const WorkshopDetalhes({
    super.key,
    required this.workshop,
    required this.data,
    required this.desc,
    required this.nomes,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(workshop, 
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white
            ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            titles('Data de criação:', data, 18, Colors.black),
            const SizedBox(height: 12.0),
            titles('Descrição:', desc, 16, Colors.black54),
            const SizedBox(height: 24.0),
            titles('Colaboradores:', '', 18, Colors.black),
            const SizedBox(height: 12.0),
            Expanded(
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.symmetric(vertical: 4.0),
                    elevation: 3,
                    child: ListTile(
                      leading: Icon(Icons.person, color: Colors.grey[500]),
                      title: Text(nomes[index]),
                      contentPadding: const EdgeInsets.all(12.0),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget titles(String title, String? value, double fontSize, Color color) {
    return Text(
      value == '' ? title : '$title $value',
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
        color: color,
      ),
    );
  }
}
