import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class FinishedScreen extends StatelessWidget {
  final String nome;
  final String telefone;
  final String data;
  final String horario;
  final String servico;
  final String profissional;
  final String pagamento;

  final String endereco =
      'Av. Pico das Agulhas Negras, 1184 - Jardim Altos de Santana, São José dos Campos - SP, 12214-000, Brasil';

  FinishedScreen({
    super.key,
    required this.nome,
    required this.telefone,
    required this.data,
    required this.horario,
    required this.servico,
    required this.profissional,
    required this.pagamento,
  });

  Future<void> _openMaps() async {
    final String googleMapsUrl =
        'https://www.google.com/maps/search/?q=$endereco';

    if (await canLaunch(googleMapsUrl)) {
      await launch(googleMapsUrl);
    } else {
      throw 'Não foi possível abrir o Google Maps.';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Confirmação de Agendamento'),
        backgroundColor: Colors.white30,
        automaticallyImplyLeading: false,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Agradecemos a sua preferência 💈',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 16),
              const Text(
                'Detalhes do seu agendamento:',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              _buildInfoTile('Nome', nome),
              _buildInfoTile('Telefone', telefone),
              _buildInfoTile('Data', data),
              _buildInfoTile('Horário', horario),
              _buildInfoTile('Serviço', servico),
              _buildInfoTile('Profissional', profissional),
              _buildInfoTile('Método de Pagamento', pagamento),
              const SizedBox(height: 16),
              const Text(
                'Localização da Barbearia:',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: _openMaps,
                child: const Text('Ver no Google Maps'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildInfoTile(String title, String value) {
    return ListTile(
      title: Text(
        title,
        style: const TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(value),
    );
  }
}
