class User {
  final String email, name, image;

  User(this.email, this.name, this.image);

  static User getOne() {
    return User("lawrence_car@gmail.com", "Lawrence M. Carlisle",
        "./assets/images/apps/cookify/avatar.jpg");
  }
}
