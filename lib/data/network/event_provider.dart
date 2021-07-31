import 'package:alchemy/data/network/apis_name.dart';
import 'package:alchemy/data/repositoryImpl/cache/auth.dart';
import 'package:get/get.dart';

import 'base_provider.dart';

class EventProvider extends GetConnect with BaseProvider {

  Future<Response> getEvents() => get(APIs.allEvents, headers: getHeader(Auth().token));

  Future<Response> getEventsDetails() => get(APIs.eventDetails, headers: getHeader(Auth().token));
}