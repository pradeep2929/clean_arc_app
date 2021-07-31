import 'package:alchemy/data/mappers/event_details_model_mapper.dart';
import 'package:alchemy/data/mappers/event_model_mapper.dart';
import 'package:alchemy/data/network/event_provider.dart';
import 'package:alchemy/data/repositoryImpl/remote/baes_remote_client_impl.dart';
import 'package:alchemy/domain/entities/event_detail_model.dart';
import 'package:alchemy/domain/entities/event_model.dart';

import '../event_repository_impl.dart';

class EventRemoteClientImpl extends BaseRemoteClientImpl implements EventRemoteClient {
  var eventProvider = EventProvider();
  @override
  Future<List<Event>> getAllEvent() {
    return eventProvider.getEvents().then((response){
      handleError(response);
      return EventModelMapper.map(response.body).list;
    });
  }

  @override
  Future<List<EventDetail>> getAllEventDetails() {
    return eventProvider.getEventsDetails().then((response){
      handleError(response);
      return EventDetailsModelMapper.map(response.body).list;
    });
  }
}