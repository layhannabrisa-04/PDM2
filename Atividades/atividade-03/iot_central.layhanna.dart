import 'dart:io';

void main() async {
  final server = await ServerSocket.bind('127.0.0.1', 4040);
  print('🖥️ Central iniciada na porta 4040. Aguardando sensores...');

  await for (final socket in server) {
    print('✅ Novo sensor conectado: ${socket.remoteAddress.address}');
    socket.listen((data) {
      final mensagem = String.fromCharCodes(data).trim();
      print('📥 Dados recebidos -> $mensagem');
    });
  }
}
