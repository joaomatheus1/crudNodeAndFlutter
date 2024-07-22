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
        title: Text(workshop),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Data: $data',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Text(
              'Descrição: $desc',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16.0),
            Text(
              'Colaboradores:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 8.0),
            Expanded(
              child: ListView.builder(
                itemCount: nomes.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(nomes[index]),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}