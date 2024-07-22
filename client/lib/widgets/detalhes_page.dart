import 'package:client/pages/workshop_detalhes.dart';
import 'package:flutter/material.dart';

class DetalhesPage extends StatelessWidget {
  final List<String> nome;
  final String workshop;
  final String data;
  final String desc;

  const DetalhesPage({
    super.key, 
    required this.nome,
    required this.workshop,
    required this.data,
    required this.desc,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        onTap: () => {
          Navigator.push(context, MaterialPageRoute(builder: (context) => WorkshopDetalhes(workshop: workshop, data: data, desc: desc, nomes: nome)))
        },
        title: Text(
          workshop,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Text(
              "Data: $data",
              style: const TextStyle(
                color: Colors.black,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              desc,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600]
              ),
            ),
          ],
        ),
      ),
    );
  }
}