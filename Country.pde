

class Country {
  float totalSurface = 0;
  Table table;
  ArrayList<Option> options = new ArrayList<Option>();
  String name;
  Country(Table t, ArrayList<Option> o, String path) {
    table = t;
    for (int col = 1; col < table.getColumnCount(); col++) {
      if (table.getString(1, col).equals("null") == false) {
        totalSurface += table.getFloat(24, col);
      }
    }
    for (Option to : o) {
      options.add(to);
    }
    String p = split(path, "/data/")[1];
    String f = split(p, "_lc_class_areas.csv")[0];
    name = f;
  }
  void subtract(Option o) {
    for (Option to : options) {
      if (to.handle == o.handle) {
        to.left--;
      }
    }
  }
  float getValues(int row, String field) {
    float m = 0;

    switch(field) {
    case "crop":
      m += getCropland(row);
      m += getMosaicCrop(row);
      break;
    case "tree":
      m += getTreeCover(row);
      m += getMosaicShrub(row);
      m += getShrub(row);
      break;
    case "grass":
      m += getGrass(row);
      m += getMoss(row);
      m += getSparse(row);
      break;
    case "flooded":
      m += getFlooded(row);
      break;
    case "urban":
      m += getUrban(row);
      break;
    case "bare":
      m += getBare(row);
      break;
    case "water":
      m += getWater(row);
      break;
    case "ice":
      m += getIce(row);
      break;
    }

    return m;
  }
  float getCropland(int row) {
    float cropland = 0;
    cropland += table.getFloat(row, 1);
    cropland += table.getFloat(row, 2);
    cropland += table.getFloat(row, 3);
    cropland += table.getFloat(row, 4);
    return cropland;
  }
  float getMosaicCrop(int row) {
    float mosaic = 0;
    mosaic += table.getFloat(row, 5);
    mosaic += table.getFloat(row, 6);
    return mosaic;
  }
  float getTreeCover(int row) {
    float treeCover = 0;
    treeCover += table.getFloat(row, 7);
    treeCover += table.getFloat(row, 8);
    treeCover += table.getFloat(row, 9);
    treeCover += table.getFloat(row, 10);
    treeCover += table.getFloat(row, 11);
    treeCover += table.getFloat(row, 12);
    treeCover += table.getFloat(row, 13);
    treeCover += table.getFloat(row, 14);
    treeCover += table.getFloat(row, 15);
    treeCover += table.getFloat(row, 16);
    treeCover += table.getFloat(row, 17);
    return treeCover;
  }
  float getMosaicShrub(int row) {
    float m = 0;
    m += table.getFloat(row, 18);
    m += table.getFloat(row, 19);
    return m;
  }
  float getShrub(int row) {
    float m = 0;
    m += table.getFloat(row, 20);
    m += table.getFloat(row, 21);
    m += table.getFloat(row, 22);
    return m;
  }

  float getGrass(int row) {
    float m = 0;
    m += table.getFloat(row, 23);
    return m;
  }
  float getMoss(int row) {
    float m = 0;
    m += table.getFloat(row, 24);
    return m;
  }
  float getSparse(int row) {
    float m = 0;
    m += table.getFloat(row, 25);
    m += table.getFloat(row, 26);
    m += table.getFloat(row, 27);
    m += table.getFloat(row, 28);
    return m;
  }
  float getFlooded(int row) {
    float m = 0;
    m += table.getFloat(row, 29);
    m += table.getFloat(row, 30);
    m += table.getFloat(row, 31);
    return m;
  }

  float getUrban(int row) {
    float m = 0;
    m += table.getFloat(row, 32);
    return m;
  }
  float getBare(int row) {
    float m = 0;
    m += table.getFloat(row, 33);
    m += table.getFloat(row, 34);
    m += table.getFloat(row, 35);
    return m;
  }
  float getWater(int row) {
    float m = 0;
    m += table.getFloat(row, 36);
    return m;
  }
  float getIce(int row) {
    float m = 0;
    m += table.getFloat(row, 37);
    return m;
  }
}
