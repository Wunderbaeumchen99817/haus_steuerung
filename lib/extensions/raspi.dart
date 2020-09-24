
class Raspi {
  Future<bool> send(title, tempS) async {
    ///todo
    ///implement http post
    try {
      print(title);
      print(tempS);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<List> get(title) async {
    ///todo
    ///get current values from raspi
    try {
      ///return state, temperature soll, temperature ist
      bool state = false;
      int temperatureS = 25;
      int temperatureI = 26;
      return [temperatureS, temperatureI, state];
    } catch (e) {
      return null;
    }
  }
}