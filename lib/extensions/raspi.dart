
class Raspi {
  Future<bool> send(title, tempS) async {
    ///todo
    ///implement http post

    print(tempS);
    return true;
  }

  Future<List> get(title) async {
    ///todo
    ///get current values from raspi

    ///return state, temperature soll, temperature ist
    bool state = true;
    int temperatureS = 25;
    int temperatureI = 26;
    return [temperatureS, temperatureI, state];
  }
}