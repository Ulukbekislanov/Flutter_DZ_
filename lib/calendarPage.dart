import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  final VoidCallback onToggleLanguage;

  const CalendarPage({
    super.key,
    required this.onToggleLanguage,
  });

  @override
  State<CalendarPage> createState() => _CalendarAppState();
}

class _CalendarAppState extends State<CalendarPage> {
  DateTime _selectedDay = DateTime.now();
  DateTime _focusedDay = DateTime.now();

  final Map<DateTime, List<String>> _events = {};

  List<String> _getEventsForDay(DateTime day) {
    final key = DateTime(day.year, day.month, day.day);
    return _events[key] ?? [];
  }

  void _addEvent() {
    final controller = TextEditingController();

    showDialog(
      context: context,
      builder: (__) => AlertDialog(
        title: const Text('Новое событие'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Название события',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                final key = DateTime(
                  _selectedDay.year,
                  _selectedDay.month,
                  _selectedDay.day,
                );

                setState(() {
                  _events.putIfAbsent(key, () => []);
                  _events[key]!.add(controller.text);
                });
              }

              Navigator.pop(context);
            },
            child: const Text('Добавить'),
          ),
        ],
      ),
    );
  }

  void _editEvent(int index) {
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    final controller = TextEditingController(
      text: _events[key]![index],
    );

    showDialog(
      context: context,
      builder: (__) => AlertDialog(
        title: const Text('Редактировать событие'),
        content: TextField(
          controller: controller,
          decoration: const InputDecoration(
            hintText: 'Введите новое название',
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Отмена'),
          ),
          ElevatedButton(
            onPressed: () {
              if (controller.text.isNotEmpty) {
                setState(() {
                  _events[key]![index] = controller.text;
                });
              }

              Navigator.pop(context);
            },
            child: const Text('Сохранить'),
          ),
        ],
      ),
    );
  }

  void _deleteEvent(int index) {
    final key = DateTime(
      _selectedDay.year,
      _selectedDay.month,
      _selectedDay.day,
    );

    setState(() {
      _events[key]!.removeAt(index);

      if (_events[key]!.isEmpty) {
        _events.remove(key);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final events = _getEventsForDay(_selectedDay);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        centerTitle: true,
        title: const Text('Приложение календарь'),
        actions: [
          IconButton(
            onPressed: widget.onToggleLanguage,
            icon: const Icon(Icons.language),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.green,
        onPressed: _addEvent,
        child: const Icon(Icons.add),
      ),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: _selectedDay,
            firstDate: DateTime(2020),
            lastDate: DateTime(2030),
            onDateChanged: (date) {
              setState(() {
                _selectedDay = date;
                _focusedDay = date;
              });
            },
          ),
          const SizedBox(height: 16),
          Text(
            'Выбрано: ${_selectedDay.day}.${_selectedDay.month}.${_selectedDay.year}',
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: events.isEmpty
                ? const Center(
                    child: Text(
                      'Событий нет',
                      style: TextStyle(fontSize: 18),
                    ),
                  )
                : ListView.builder(
                    itemCount: events.length,
                    itemBuilder: (_, index) => Card(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 6,
                      ),
                      child: ListTile(
                        leading: const Icon(
                          Icons.event,
                          color: Colors.green,
                        ),
                        title: Text(events[index]),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(
                                Icons.edit,
                                color: Colors.blue,
                              ),
                              onPressed: () {
                                _editEvent(index);
                              },
                            ),
                            IconButton(
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                              onPressed: () {
                                _deleteEvent(index);
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
          ),
        ],
      ),
    );
  }
}