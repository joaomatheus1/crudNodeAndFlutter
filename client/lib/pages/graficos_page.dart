import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class GraficosPage extends StatelessWidget {
  final List<Map<String, dynamic>> data;

  const GraficosPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    final colaboradoresPorWorkshop = processarData();
    final pieSections = criarSections(colaboradoresPorWorkshop);
    final participantes = participantesWorkshop();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Text(
            "Gráficos",
            style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            construirPieChart(pieSections),
            construirBarChart(participantes),
          ],
        ),
      ),
    );
  }

  Container construirPieChart(List<PieChartSectionData> sections) {
    return Container(
      padding: EdgeInsets.all(8),
      height: 400,
      child: PieChart(
        PieChartData(
          sections: sections,
          sectionsSpace: 2,
          centerSpaceRadius: 30,
        ),
      ),
    );
  }

  Container construirBarChart(Map<String, int> participantes) {
    final maxY = participantes.values.reduce((a, b) => a > b ? a : b).toDouble() + 1;

    return Container(
      padding: const EdgeInsets.all(8),
      height: 350,
      child: BarChart(
        BarChartData(
          alignment: BarChartAlignment.spaceAround,
          maxY: maxY,
          titlesData: FlTitlesData(
            leftTitles: const AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  final names = participantes.keys.toList();
                  return SideTitleWidget(
                    axisSide: meta.axisSide,
                    child: Text(
                      names[value.toInt()],
                      style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(
            show: true,
            border: Border.all(color: Colors.deepPurple, width: 2),
          ),
          barGroups: participantes.entries
              .map(
                (entry) => BarChartGroupData(
                  x: participantes.keys.toList().indexOf(entry.key),
                  barRods: [
                    BarChartRodData(
                      toY: entry.value.toDouble(),
                      color: Colors.deepPurple,
                      width: 20,
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ),
    );
  }

  Map<String, int> processarData() {
    final colaboradoresPorWorkshop = <String, int>{};

    for (final item in data) {
      final workshop = item['workshop'] as String;
      final count = (item['nome'] as List).length;

      colaboradoresPorWorkshop.update(
        workshop,
        (value) => value + count,
        ifAbsent: () => count,
      );
    }

    return colaboradoresPorWorkshop;
  }

  List<PieChartSectionData> criarSections(Map<String, int> colaboradoresPorWorkshop) {
    return colaboradoresPorWorkshop.entries.map((entry) {
      final colorIndex = colaboradoresPorWorkshop.keys.toList().indexOf(entry.key) %
          Colors.primaries.length;
      return PieChartSectionData(
        color: Colors.primaries[colorIndex],
        value: entry.value.toDouble(),
        title: '${entry.key}: ${entry.value}',
        radius: 120,
        titleStyle: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        ),
      );
    }).toList();
  }

  Map<String, int> participantesWorkshop() {
    final colaboradores = <String, int>{};

    for (var workshop in data) {
      for (var nome in workshop['nome']) {
        colaboradores.update(nome, (value) => value + 1, ifAbsent: () => 1);
      }
    }
    return colaboradores;
  }
}
