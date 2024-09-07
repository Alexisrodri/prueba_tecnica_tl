import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class BuildSignersTab extends StatelessWidget {
  const BuildSignersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'Tu Firma',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.blue),
          ),
          const SizedBox(height: 8),
          const Text(
            'Firmante Registrado: Paúl Quiñonez',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          const Text(
            'paul.quinonez@todolegal.com',
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          const SizedBox(height: 20),
          DropdownButtonFormField<String>(
            decoration: const InputDecoration(
              labelText: 'Seleccionar certificado',
              border: OutlineInputBorder(),
            ),
            items: <String>['Certificado 1', 'Certificado 2', 'Certificado 3']
                .map((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(value),
              );
            }).toList(),
            onChanged: (_) {},
          ),
          const SizedBox(height: 20),
          TextFormField(
            decoration: const InputDecoration(
              labelText: 'Contraseña',
              border: OutlineInputBorder(),
              suffixIcon: Icon(Icons.visibility_off),
            ),
            obscureText: true,
          ),
          const SizedBox(height: 20),
          CustomButton(
            text: 'Cancelar',
            onPress: () {},
            isOutlined: true,
          ),
          const SizedBox(
            height: 10,
          ),
          CustomButton(
            text: 'Continuar',
            onPress: () {},
            isDisabled: true,
          ),
          const Spacer(),
          const Text(
            'Prueba tecnica - Alex Avila',
            style: TextStyle(fontSize: 12, color: Colors.grey),
          ),
        ],
      ),
    );
  }
}
