import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class DatePicker extends StatefulWidget {
  final TextEditingController dateController;
  final TextEditingController monthController;
  final TextEditingController yearController;

  const DatePicker({
    Key? key,
    required this.dateController,
    required this.monthController,
    required this.yearController,
  }) : super(key: key);

  @override
  State<DatePicker> createState() => _DatePickerState();
}

class _DatePickerState extends State<DatePicker> {
  int selectedDay = DateTime.now().day;
  int selectedMonth = DateTime.now().month;
  int selectedYear = DateTime.now().year;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              controller: widget.dateController,
              readOnly: true,
              onTap: () => _showDatePickerDialog(context),
              decoration: const InputDecoration(
                labelText: 'date',
                suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: TextFormField(
                controller: widget.monthController,
                readOnly: true,
                onTap: () => _showMonthPickerDialog(context),
                decoration: const InputDecoration(
                  labelText: 'Month',
                  suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
                ),
              ),
            ),
          ),
          Expanded(
            child: TextFormField(
              controller: widget.yearController,
              readOnly: true,
              onTap: () => _showYearPickerDialog(context),
              decoration: const InputDecoration(
                labelText: 'Year',
                suffixIcon: Icon(Icons.keyboard_arrow_down_rounded),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDatePickerDialog(BuildContext context) async {
    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return _buildPickerDialog(
          context,
          31,
          selectedDay - 1,
              (int index) {
            selectedDay = index + 1;
          },
        );
      },
    );

    setState(() {
      widget.dateController.text = selectedDay.toString();
    });
  }

  void _showMonthPickerDialog(BuildContext context) async {
    final List<String> months = [
      'january',
      'february',
      'march',
      'april',
      'may',
      'june',
      'july',
      'august',
      'september',
      'october',
      'november',
      'december',
    ];

    await showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return _buildPickerDialog(
          context,
          12,
          DateTime.now().month - 1,
              (int index) {
            selectedMonth = index + 1;
          },
          items: months,
        );
      },
    );

    setState(() {
      widget.monthController.text = months[selectedMonth - 1];
    });
  }

  void _showYearPickerDialog(BuildContext context) async {
    int currentYear = DateTime.now().year;

    await showDialog<int>(
      context: context,
      builder: (BuildContext context) {
        return _buildPickerDialog(
          context,
          100,
          currentYear - 1990,
              (int index) {
            selectedYear = currentYear - index;
          },
        );
      },
    );

    setState(() {
      widget.yearController.text = selectedYear.toString();
    });
  }

  Widget _buildPickerDialog(
      BuildContext context,
      int itemCount,
      int initialItem,
      ValueChanged<int> onSelectedItemChanged, {
        List<String>? items,
      }) {
    return AlertDialog(
      content: Container(
        height: 200,
        width: double.maxFinite,
        child: CupertinoPicker(
          scrollController: FixedExtentScrollController(
            initialItem: initialItem,
          ),
          itemExtent: 40,
          onSelectedItemChanged: onSelectedItemChanged,
          children: List.generate(itemCount, (index) {
            return Center(
              child: Text(
                items != null ? items[index] : (index + 1).toString(),
                style: const TextStyle(fontSize: 20),
              ),
            );
          }),
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('OK'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
