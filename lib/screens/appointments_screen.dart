import 'package:barbershop/screens/finished_screen.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AppointmentsScreen extends StatefulWidget {
  const AppointmentsScreen({Key? key}) : super(key: key);

  @override
  _AppointmentsScreenState createState() => _AppointmentsScreenState();
}

class _AppointmentsScreenState extends State<AppointmentsScreen> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _telefoneController = TextEditingController();
  final TextEditingController _pagamentoController = TextEditingController();
  final TextEditingController _dataController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  String? _selectedHorario;
  String? _selectedServico;
  String? _selectedProfissional;

  final List<String> _horariosDisponiveis = [
    '09:00',
    '10:00',
    '11:00',
    '14:00',
    '15:00',
    '16:00',
    '17:00',
    '18:00'
  ];
  final List<String> _servicos = ['Corte de Cabelo', 'Barba', 'Corte + Barba'];
  final List<String> _profissionais = ['Everton Ramos'];
  final List<String> _pagamentos = ['Cartão', 'Pix', 'Dinheiro'];
  final Set<String> _horariosOcupados = {};

  void _salvarAppointment() {
    if (_nomeController.text.isEmpty ||
        _telefoneController.text.isEmpty ||
        _selectedHorario == null ||
        _selectedServico == null ||
        _selectedProfissional == null ||
        _pagamentoController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
            content: Text('Por favor, preencha todos os campos'),
            backgroundColor: Colors.red,
            behavior: SnackBarBehavior.floating,
            margin: EdgeInsets.only(top: 50)),
      );
      return;
    }

    setState(() {
      _horariosOcupados.add(_selectedHorario!);
    });
  }

  Future<void> _selectDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (picked != null && picked != _selectedDate) {
      setState(() {
        _selectedDate = picked;
        _dataController.text = DateFormat('dd/MM/yyyy').format(_selectedDate);
      });
    }
  }

  void _showConfirmationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Confirmar Agendamento'),
          content: SingleChildScrollView(
            child: ListBody(
              children: [
                Text('Nome: ${_nomeController.text}'),
                Text('Telefone: ${_telefoneController.text}'),
                Text('Data: ${_dataController.text}'),
                Text('Horário: $_selectedHorario'),
                Text('Serviço: $_selectedServico'),
                Text('Profissional: $_selectedProfissional'),
                Text('Método de Pagamento: ${_pagamentoController.text}')
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                _salvarAppointment();

                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => FinishedScreen(
                      nome: _nomeController.text,
                      telefone: _telefoneController.text,
                      data: _dataController.text,
                      horario: _selectedHorario!,
                      servico: _selectedServico!,
                      profissional: _selectedProfissional!,
                      pagamento: _pagamentoController.text,
                    ),
                  ),
                );
              },
              child: const Text('Confirmar'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // Get screen width and height
    double screenWidth = MediaQuery.of(context).size.width;
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Império do Corte'),
        backgroundColor: Colors.white30,
      ),
      body: Padding(
        padding: EdgeInsets.all(screenWidth * 0.05), // Dynamic padding
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextField(
                controller: _nomeController,
                decoration: const InputDecoration(
                  labelText: 'Digite seu nome',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _telefoneController,
                decoration: const InputDecoration(
                  labelText: 'Telefone',
                  border: OutlineInputBorder(),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _dataController,
                decoration: InputDecoration(
                  labelText: 'Selecione a data',
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: _selectDate,
                  ),
                ),
                readOnly: true, // Prevents text input, only date picker
                onTap: _selectDate, // Allows the user to tap to select the date
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedHorario,
                items: _horariosDisponiveis.map((horario) {
                  return DropdownMenuItem<String>(
                    value: horario,
                    child: Text(
                      horario,
                      style: TextStyle(
                        color: _horariosOcupados.contains(horario)
                            ? Colors.grey
                            : Colors.black,
                      ),
                    ),
                    enabled: !_horariosOcupados.contains(horario),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedHorario = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Horário',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedServico,
                items: _servicos.map((servico) {
                  return DropdownMenuItem<String>(
                    value: servico,
                    child: Text(servico),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedServico = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Serviço',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedProfissional,
                items: _profissionais.map((profissional) {
                  return DropdownMenuItem<String>(
                    value: profissional,
                    child: Text(profissional),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedProfissional = value;
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Profissional',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _pagamentoController.text.isEmpty
                    ? null
                    : _pagamentoController.text,
                items: _pagamentos.map((metodo) {
                  return DropdownMenuItem<String>(
                    value: metodo,
                    child: Text(metodo),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _pagamentoController.text = value ?? '';
                  });
                },
                decoration: const InputDecoration(
                  labelText: 'Método de Pagamento',
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: screenWidth,
                child: ElevatedButton(
                  onPressed: _showConfirmationDialog,
                  child: const Text('Agendar'),
                  style: ElevatedButton.styleFrom(
                    padding:
                        EdgeInsets.symmetric(vertical: screenHeight * 0.02),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
