import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class TransactionForm extends StatefulWidget {
  final void Function(String, double, DateTime) onSubmit;
  TransactionForm(this.onSubmit);

  @override
  State<TransactionForm> createState() => _TransactionFormState();
}

class _TransactionFormState extends State<TransactionForm> {
  final titleController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final valueController = TextEditingController();
  _SubmitForm() {
    final title = titleController.text;

    final value = double.tryParse(valueController.text) ?? 0.0;
    if (title.isEmpty || value <= 0) {
      return;
    }
    widget.onSubmit(title, value, _selectedDate);
  }

  _showDatePicker() {
    showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(2021),
            lastDate: DateTime.now())
        .then((pickedDate) {
      if (pickedDate == null) {
        return null;
      }
      setState(() {
        _selectedDate = pickedDate;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(labelText: 'Titulo'),
            ),
            TextField(
              controller: valueController,
              keyboardType: TextInputType.numberWithOptions(decimal: true),
              onSubmitted: (value) => _SubmitForm(),
              decoration: InputDecoration(labelText: 'Valor (R\$)'),
            ),
            Container(
              height: 70,
              child: Row(
                children: [
                  Text(_selectedDate == null
                      ? 'Nenhuma Data selecionada!'
                      : DateFormat('d/M/y').format(_selectedDate)),
                  TextButton(
                    onPressed: _showDatePicker,
                    child: Text("Selecione a Data",
                        style: TextStyle(color: Colors.purple)),
                  )
                ],
              ),
            ),
            Row(
              children: [
                ElevatedButton(
                  onPressed: _SubmitForm,
                  child: Text('Nova Transacao',
                      style: TextStyle(color: Colors.white)),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
