import 'dart:async';
import 'dart:io';
import 'dart:math';

void main() async {
  final socket = await Socket.connect('127.0.0.1', 4040);
  print('🔌 Sensor conectado à central!');

  final random = Random();

  Timer.periodic(Duration(seconds: 2), (timer) {
    final temperatura = 20 + random.nextInt(10); // temperatura entre 20 e 30
    final dados = 'Temperatura: $temperatura °C';
    socket.writeln(dados);
    print('📡 Enviando -> $dados');
  });
}