/// name : "Camden Town Football Event"
/// dateTime : "2/12/2021 16:00:00"
/// bookBy : "2/7/2021 16:00:00"
/// ticketsSold : 5
/// maxTickets : 20
/// friendsAttending : 2
/// price : 10
/// isPartnered : true
/// sport : "Football"
/// totalPrize : 150
/// location : "34 Crest Rd, London, NW2 7LX"
/// description : "Our last kickabout in Camden was a wild success! We had loads of people coming along, played some amazing football with a great group, and some of you even managed to take home a massive prize. The event will be remembered as one of the greatest football games that we've ever hosted. This next game is going to be even better, unlike anything we've ever done before. You really won't want to miss it so make sure you grab your tickets now! "
/// venueInformation : "Bring your own trainers, balls will be provided. Only trainers with flat sole are allowed. No metal studs or blades. No food or chewing gum is allowed on the pitch. This facility has floodlights meaning that you can play all year round. There are no changing facilities available currently due to COVID-19 Restrictions. "
/// eventCreator : "Tim Smith"
/// teamInformation : "10 v 10"
/// tags : "[\"sport\",\"event\",\"football\",\"ball\"]"
/// mainImage : "https://i.pinimg.com/originals/a9/88/a4/a988a47e605cacc02b0bb41c85270de3.jpg"
/// id : 2

class EventDetail {
  String? _name;
  String? _dateTime;
  String? _bookBy;
  int? _ticketsSold;
  int? _maxTickets;
  int? _friendsAttending;
  dynamic _price;
  bool? _isPartnered;
  String? _sport;
  int? _totalPrize;
  String? _location;
  String? _description;
  String? _venueInformation;
  String? _eventCreator;
  String? _teamInformation;
  String? _tags;
  String? _mainImage;
  int? _id;

  String? get name => _name;
  String? get dateTime => _dateTime;
  String? get bookBy => _bookBy;
  int? get ticketsSold => _ticketsSold;
  int? get maxTickets => _maxTickets;
  int? get friendsAttending => _friendsAttending;
  dynamic get price => _price;
  bool? get isPartnered => _isPartnered;
  String? get sport => _sport;
  int? get totalPrize => _totalPrize;
  String? get location => _location;
  String? get description => _description;
  String? get venueInformation => _venueInformation;
  String? get eventCreator => _eventCreator;
  String? get teamInformation => _teamInformation;
  String? get tags => _tags;
  String? get mainImage => _mainImage;
  int? get id => _id;

  EventDetail({
      String? name, 
      String? dateTime, 
      String? bookBy, 
      int? ticketsSold, 
      int? maxTickets, 
      int? friendsAttending,
      dynamic price,
      bool? isPartnered, 
      String? sport, 
      int? totalPrize, 
      String? location, 
      String? description, 
      String? venueInformation, 
      String? eventCreator, 
      String? teamInformation, 
      String? tags, 
      String? mainImage, 
      int? id}){
    _name = name;
    _dateTime = dateTime;
    _bookBy = bookBy;
    _ticketsSold = ticketsSold;
    _maxTickets = maxTickets;
    _friendsAttending = friendsAttending;
    _price = price;
    _isPartnered = isPartnered;
    _sport = sport;
    _totalPrize = totalPrize;
    _location = location;
    _description = description;
    _venueInformation = venueInformation;
    _eventCreator = eventCreator;
    _teamInformation = teamInformation;
    _tags = tags;
    _mainImage = mainImage;
    _id = id;
}

  EventDetail.fromJson(dynamic json) {
    _name = json["name"];
    _dateTime = json["dateTime"];
    _bookBy = json["bookBy"];
    _ticketsSold = json["ticketsSold"];
    _maxTickets = json["maxTickets"];
    _friendsAttending = json["friendsAttending"];
    _price = json["price"];
    _isPartnered = json["isPartnered"];
    _sport = json["sport"];
    _totalPrize = json["totalPrize"];
    _location = json["location"];
    _description = json["description"];
    _venueInformation = json["venueInformation"];
    _eventCreator = json["eventCreator"];
    _teamInformation = json["teamInformation"];
    _tags = json["tags"];
    _mainImage = json["mainImage"];
    _id = json["id"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = _name;
    map["dateTime"] = _dateTime;
    map["bookBy"] = _bookBy;
    map["ticketsSold"] = _ticketsSold;
    map["maxTickets"] = _maxTickets;
    map["friendsAttending"] = _friendsAttending;
    map["price"] = _price;
    map["isPartnered"] = _isPartnered;
    map["sport"] = _sport;
    map["totalPrize"] = _totalPrize;
    map["location"] = _location;
    map["description"] = _description;
    map["venueInformation"] = _venueInformation;
    map["eventCreator"] = _eventCreator;
    map["teamInformation"] = _teamInformation;
    map["tags"] = _tags;
    map["mainImage"] = _mainImage;
    map["id"] = _id;
    return map;
  }

}