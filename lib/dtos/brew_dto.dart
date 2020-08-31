//{
//"id": "be9e0706-2e43-47e2-8682-6a082fe23081",
//"productName": "Shou Mei",
//"temp": 100,
//"time": 120,
//"volume": 120,
//"weight": 10,
//"brewDate": {
//"year": 2020,
//"month": "JULY",
//"monthValue": 7,
//"dayOfMonth": 1,
//"chronology": {
//"id": "ISO",
//"calendarType": "iso8601"
//},
//"dayOfWeek": "WEDNESDAY",
//"leapYear": true,
//"dayOfYear": 183,
//"era": "CE"
//},
//"description": "Shou Mei to propozycja dla osób, które nie przepadają za delikatnymi białymi herbatami, których napar jest subtelny i blady. Ta herbata daje wyraźniejszy napar i mocniejszy smak, dzięki zawartości listków nieco bardziej oksydowanych, nuty smakowe jakie możemy wyciągnąć z niej przywodzą na myśl raczej herbaty oolong niż białe. Czasem przypisuje się jej aromat nieco korzenny, waniliowy.",
//"public": false
//}

class BrewDto {
  final String id;
  final String productName;
  final int temp;
  final int time;
  final int volume;
  final int weight;
//  final LocalDate localDate;
  final String description;
  final bool public;

  BrewDto({this.id, this.productName, this.temp, this.time, this.volume,
      this.weight, this.description, this.public});

  factory BrewDto.fromJson(Map<String, dynamic> json) {
    return BrewDto(
      id: json['id'],
      productName: json['productName'],
      temp: json['temp'],
      time: json['time'],
      volume: json['volume'],
      weight: json['weight'],
      description: json['description'],
      public: json['public']
    );
  }
}