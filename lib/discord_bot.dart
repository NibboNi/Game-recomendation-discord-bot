import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';

void bot(){
  List<String> juegos = [
    "Juego 1",
    "Juego 2",
    "Juego 3",
    "Juego 4",
    "Juego 5",
    "Juego 6",
    ];

  final dotenv = DotEnv(includePlatformEnvironment: true)..load();

  final bot = NyxxFactory.createNyxxWebsocket(dotenv['TOKEN']!, GatewayIntents.allUnprivileged | GatewayIntents.messageContent);

  bot.eventsWs.onMessageReceived.listen((event) {
    if (event.message.content.toLowerCase() == '!recomienda') {
    final replyBuilder = ReplyBuilder.fromMessage(event.message);
    final allowedMentions = AllowedMentions()..allow(reply: false);
    event.message.channel.sendMessage(MessageBuilder.content("Te recomiendo ${(juegos..shuffle()).first}")..replyBuilder = replyBuilder..allowedMentions = allowedMentions);
    }
  });

  bot.connect();
}