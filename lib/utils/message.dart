import 'package:get/get.dart';

class Message extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en': {
          'button_title': 'Login',
          'welcome': 'Welcome',
          'search': 'Search',
          'search_home': 'Search by Event, code, location',
          'recommended_events': 'Recommended Events',
          'view_all': 'View All',
          'all_events': 'All events',
          'total_price': 'Total prize:',
          'time_left_to_book': 'Time left to Book: ',
          'attending_total': 'attending total'
        },
        'en_US': {
          'button_title': 'Login',
          'welcome': 'Welcome',
          'search': 'Search',
          'view_all': 'View All',
          'recommended_events': 'Recommended Events',
          'search_home': 'Search by Event, code, location',
          'all_events': 'All events',
          'total_price': 'Total prize:',
          'time_left_to_book': 'Time left to Book: ',
          'attending_total': 'attending total'
        },
      };
}
