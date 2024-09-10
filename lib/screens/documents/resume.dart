import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:prueba_tecnica_tl/widgets/widgets.dart';

class ResumeDocuments extends StatefulWidget {
  final TabController tabController;

  const ResumeDocuments({super.key, required this.tabController});

  @override
  State<ResumeDocuments> createState() => _ResumeDocumentsState();
}

class _ResumeDocumentsState extends State<ResumeDocuments> {
  bool rememberMe = false;
  bool sendDocuments = false;
  late PageController pageController;

  void _onRememberMeChanged(bool newValue) => setState(() {
        rememberMe = newValue;
      });

  void _sendDocuments() => setState(() {
        sendDocuments = true;
      });

  @override
  Widget build(BuildContext context) {
    return sendDocuments ? documentsSendSucess() : verifyDocumentToSend();
  }

  Widget documentsSendSucess() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          const Flex(direction: Axis.vertical, children: [
            Labels(text: '¡Tus documentos'),
            Labels(text: 'se han enviado con exito!'),
          ]),
          const Icon(
            Icons.check_circle,
            size: 90,
            color: Colors.green,
          ),
          CustomButton(
            text: 'Firmar otro documento',
            onPress: () {
              context.push('/sign-documents');
            },
          ),
          CustomButton(
            text: 'Volver al Dashboard',
            onPress: () {
              context.go('/home');
            },
            isOutlined: true,
          ),
        ],
      ),
    );
  }

  Widget verifyDocumentToSend() {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Labels(text: '¡Estamos listos!'),
          Image.asset(
            'assets/images/resume.png',
            width: 150,
          ),
          const Labels(
            text: 'Se enviaran los documentos a:',
            size: 12,
            color: Colors.black87,
          ),
          const Labels(
            text: 'Paul Quiñonez',
            size: 15,
            secondText: '@paul.quinonez@asb.todolegal.com',
          ),
          const Labels(
            text: 'Mario salas',
            size: 15,
            secondText: '@admin@asb.com',
          ),
          const Labels(
            text: 'Documento',
            color: Colors.black54,
            size: 15,
            secondText: 'Contrato de Arrendamiento',
          ),
          Container(
            padding: const EdgeInsets.all(20),
            child: CheckboxListTile(
              value: rememberMe,
              contentPadding: const EdgeInsets.symmetric(horizontal: 0),
              controlAffinity: ListTileControlAffinity.leading,
              title: const Text.rich(
                  style: TextStyle(fontSize: 10),
                  TextSpan(text: 'He leído y acepto los ', children: [
                    TextSpan(
                        text: 'Términos del Servicio',
                        style: TextStyle(decoration: TextDecoration.underline)),
                    TextSpan(
                      text: 'y',
                    ),
                    TextSpan(
                        text: 'Aviso de la Política de Privacidad',
                        style: TextStyle(decoration: TextDecoration.underline))
                  ])
                  // 'He leído y acepto los Términos del Servicio y Aviso de la Política de Privacidad',
                  // style: TextStyle(fontSize: 12),
                  ),
              onChanged: (value) => _onRememberMeChanged(value!),
            ),
          ),
          CustomButton(
            text: 'Enviar',
            onPress: _sendDocuments,
            isDisabled: !rememberMe,
          )
        ],
      ),
    );
  }
}
