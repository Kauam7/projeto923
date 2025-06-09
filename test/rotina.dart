import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
void main() {
  runApp( DuolingoOffensiveCalendarApp());
}

class DuolingoOffensiveCalendarApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calendário de Ofensiva',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: OffensiveCalendarPage(),
    );
  }
}

class OffensiveCalendarPage extends StatefulWidget {
  @override
  _OffensiveCalendarPageState createState() => _OffensiveCalendarPageState();
}

class _OffensiveCalendarPageState extends State<OffensiveCalendarPage> {
  // Data central do calendário e dia selecionahdo pelo usuário.
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  // Mapa de eventos: para cada data, uma lista de eventos (exemplo: "Praticou")
  late final Map<DateTime, List<String>> _events;

  @override
  void initState() {
    super.initState();
    // Para efeito de demonstração, marcamos alguns dias como praticados.
    // Certifique-se de usar apenas a parte da data (ano, mês, dia).
    _events = {
      DateTime.utc(DateTime.now().year, DateTime.now().month, 1): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 2): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 3): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 5): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 8): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 9): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 10): ['Praticou'],
      DateTime.utc(DateTime.now().year, DateTime.now().month, 11): ['Praticou'],
      // Você pode preencher com mais datas conforme necessário.
    };
  }

  // Retorna os eventos para um determinado dia
  List<String> _getEventsForDay(DateTime day) {
    return _events[DateTime.utc(day.year, day.month, day.day)] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calendário de Ofensiva"),
      ),
      body: Column(
        children: [
          // Exibe o calendário com customizações
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            locale: 'pt_BR', // Se desejar o calendário em português
            calendarStyle: CalendarStyle(
              // Define o estilo do dia selecionado (inspirado em Duolingo: cores vibrantes)
              selectedDecoration: BoxDecoration(
                color: Colors.green.shade700,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.green.shade300,
                shape: BoxShape.circle,
              ),
              markerDecoration: BoxDecoration(
                color: Colors.orange,
                shape: BoxShape.circle,
              ),
            ),
            eventLoader: _getEventsForDay,
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay; // atualiza o dia central do calendário
              });
            },
            onPageChanged: (newFocusedDay) {
              _focusedDay = newFocusedDay;
            },
            // Personalização dos marcadores para os dias com eventos
            calendarBuilders: CalendarBuilders(
              markerBuilder: (context, day, events) {
                if (events.isNotEmpty) {
                  return Positioned(
                    right: 1,
                    bottom: 1,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.orange, // cor para indicar a prática diária
                        shape: BoxShape.circle,
                      ),
                    ),
                  );
                }
                return null;
              },
            ),
          ),
          const SizedBox(height: 16),
          // Exibe uma lista ou mensagem com os eventos do dia selecionado
          Expanded(child: _buildEventList()),
        ],
      ),
    );
  }

  // Widget que exibe os eventos do dia selecionado
  Widget _buildEventList() {
    final events = _selectedDay != null ? _getEventsForDay(_selectedDay!) : [];
    return events.isEmpty
        ? Center(
      child: Text(
        "Nenhuma prática registrada para este dia.",
        style: TextStyle(fontSize: 16),
      ),
    )
        : ListView.builder(
      itemCount: events.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.check_circle, color: Colors.green),
          title: Text("Você praticou: ${events[index]}"),
        );
      },
    );
  }
}