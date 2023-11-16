
void prepare() {
  // ice on highest points
  int iceID = -1;
  int cityID = -1;
  int bareID = -1;
  int waterID = -1;
  for (int i = 0; i < country.options.size(); i++) {
    if (country.options.get(i).handle == "ice") {
      iceID = i;
    }
    if (country.options.get(i).handle == "urban") {
      cityID = i;
    }
    if (country.options.get(i).handle == "bare") {
      bareID = i;
    }
    if (country.options.get(i).handle == "water") {
      waterID = i;
    }
  }
  while (country.options.get(iceID).left > 0) {
    float highest = -1;
    int highestID = -1;
    for (Tile t : tiles) {
      if (t.elevation  > highest && t.options.size()>0) {
        highest = t.elevation;
        highestID = t.id;
      }
    }
    tiles.get(highestID).pick(country.options.get(iceID));
  }

  // bare (beaches?)
  float startAmount = country.options.get(bareID).left / 3;
  while (country.options.get(bareID).left > startAmount) {
    float lowest = 1000;
    int lowestID = -1;
    for (Tile t : tiles) {
      if (t.elevation  < lowest && t.options.size()>0) {
        lowest = t.elevation;
        lowestID = t.id;
      }
    }
    if (bareID > 0) {
      tiles.get(lowestID).pick(country.options.get(bareID));
    }
  }

  // place city starts
  startAmount = country.options.get(cityID).left * 0.98;
  while (country.options.get(cityID).left > startAmount) {
    float smallestDiff = 1000;
    int lowestID = -1;
    for (Tile t : tiles) {
      if (abs(0.3 - t.elevation) < smallestDiff && t.options.size()>0) {
        smallestDiff = abs(0.3 - t.elevation);
        lowestID = t.id;
      }
    }
    tiles.get(lowestID).pick(country.options.get(cityID));
  }


  // place water starts
  float wstartAmount = country.options.get(waterID).left * 0.15;
  while (country.options.get(waterID).left > wstartAmount) {
    float smallestDiff = 1000;
    int lowestID = -1;
    for (Tile t : tiles) {
      if (abs(0.4 - t.elevation) < smallestDiff && t.options.size()>0) {
        smallestDiff = abs(0.4 - t.elevation);
        lowestID = t.id;
      }
    }
    tiles.get(lowestID).pick(country.options.get(waterID));
  }
}
