import 'package:flutter/material.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class BuildSignersTab extends StatelessWidget {
  const BuildSignersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // const Spacer(),
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
          const Text(
            'Seleccionar certificado',
            textAlign: TextAlign.start,
          ),
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
          // const Spacer(),
          const CustomInput(
            label: 'Contraseña',
            type: TextInputType.name,
          ),
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
