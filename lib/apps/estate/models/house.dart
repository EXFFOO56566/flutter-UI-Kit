import 'agent.dart';

class House {
  final String name,
      image,
      location,
      price,
      bedrooms,
      bathrooms,
      floors,
      area,
      description;
  final Agent agent;
  House(this.name, this.image, this.location, this.price, this.bedrooms,
      this.bathrooms, this.floors, this.area, this.description, this.agent);

  static List<House> houseList() {
    List<House> list = [];
    list.add(House(
        'Duplex Home',
        'assets/images/apps/estate/estate7.jpg',
        '1691 DownTown, Boston',
        '\$22,200',
        '5 Beds',
        '2 Baths',
        '2 Floors',
        '150 sqft',
        'DownTown is a very spacious place. It is in the center of the town and all the daily valuables are available in the shops found here... ',
        Agent.getOne()));

    list.add(House(
        'Bluish Homie',
        'assets/images/apps/estate/estate4.jpg',
        '2715, Bell Street, San Jose',
        '\$1800/month',
        '3 Beds',
        '1 Baths',
        '1 Floors',
        '120 squ.feet',
        'San Jose is a very spacious place. It is in the center of the town and all the daily valuables are available in the shops found here... ',
        Agent.getOne()));

    list.add(House(
        'Black Modern House',
        'assets/images/apps/estate/estate6.jpg',
        'New York Street, 1260',
        '\$2000/month',
        '4 Beds',
        '2 Baths',
        '2 Floors',
        '180 squ.feet',
        'New York is a very spacious place. It is in the center of the town and all the daily valuables are available in the shops found here... ',
        Agent.getOne()));

    list.add(House(
        'Central Edmon',
        'assets/images/apps/estate/estate2.jpg',
        '118 Street, West Edmonton, Alberta',
        '\$15,000',
        '8 Beds',
        '3 Baths',
        '3 Floors',
        '220 squ.feet',
        'Edmonton is a very spacious place. It is in the center of the town and all the daily valuables are available in the shops found here... ',
        Agent.getOne()));

    return list;
  }

  static House getOne() {
    return House(
        'Black Modern House',
        'assets/images/apps/estate/estate1.jpg',
        'New York Street, 1260',
        '\$2000/month',
        '4 Bedrooms',
        '2 Bathrooms',
        '2 Floors',
        '180 squ.feet',
        'DownTown is a very spacious place. It is in the center of the town and all the daily valuables are available in the shops found here... ',
        Agent.getOne());
  }
}
