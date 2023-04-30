import 'package:dotenv/dotenv.dart';
import 'package:nyxx/nyxx.dart';

void bot(){

  final dotenv = DotEnv(includePlatformEnvironment: true)..load();

  final bot = NyxxFactory.createNyxxWebsocket(dotenv['TOKEN']!, GatewayIntents.allUnprivileged | GatewayIntents.messageContent);

  bot.eventsWs.onMessageReceived.listen((event) {
    if (event.message.content.toLowerCase() == 'hola') {
    final replyBuilder = ReplyBuilder.fromMessage(event.message);
    final allowedMentions = AllowedMentions()..allow(reply: false);

    event.message.channel.sendMessage(MessageBuilder.content('adios')..replyBuilder = replyBuilder..allowedMentions = allowedMentions);
    }
  });

  bot.connect();
}