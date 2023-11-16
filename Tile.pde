

class Tile {
  int x, y, s, id;
  boolean active = true;
  ArrayList<Option> options = new ArrayList<Option>();
  Option picked = null;
  float elevation = -1;
  Tile(int i, int xp, int yp, int size, ArrayList<Option> o) {
    x = xp;
    y = yp;
    s = size;
    id = i;
    for (Option to : o) {
      options.add(to);
    }
  }
  void update() {
    for (Option co : country.options) {
      for (int i = 0; i < options.size(); i++) {
        if (options.get(i).handle == co.handle && co.left <= 0) {
          options.remove(i);
        }
      }
    }
  }
  void draw() {
    if (active) {
      pushMatrix();
      translate(x*s, y*s);
      if (picked != null) {
        fill(colors[picked.id]);
        //rect(0, 0, s, s);
        picked.draw(s);
        //image(picked.img, 0, 0, (width/dim), (width/dim));
      } else {
        float r = map(elevation, 0, 1, 150, 255);
        fill(r);
        rect(0, 0, s, s);
      }
      popMatrix();
    }
  }

  void pick() {
    if (options.size() > 0) {
      try {
        Tile[] tt = {
          tiles.get( ((x-1) * dim) + (y) ),
          tiles.get( ((x+1) * dim) + (y) ),
          tiles.get( (x * dim) + (y-1) ),
          tiles.get( (x * dim) + (y+1) )
        };
        Option highestChance = null;
        float h = -1;
        for (Option o : options) {
          o.chance = 0;
          for (Tile t : tt) {
            if (t!= null && t.picked!=null) {
              if (o.handle == t.picked.handle) {
                o.chance+= o.prio;
              }
            }
          }
          if (o.chance > h) {
            h = o.chance;
            highestChance = o;
          }
        }
        if (h >=2) {
          picked = highestChance;
        } else {

          picked = options.get(floor(random(options.size())));
        }
        options = new ArrayList<Option>();



        country.subtract(picked);

        for (Tile t : tt) {
          if (t!= null) {
            t.removeOnOption(picked);
          }
        }
      }
      catch(IndexOutOfBoundsException e) {
        println(e);
      }
    }
  }

  void pick(Option p) {
    picked = p;
    options = new ArrayList<Option>();
    country.subtract(p);

    // up
    if (y != 0) {
      tiles.get( (x * dim) + (y-1) ).removeOnOption(picked);
    }
    if (y != dim-1) {
      tiles.get( (x * dim) + (y+1) ).removeOnOption(picked);
    }

    if (x != 0) {
      tiles.get( ((x-1) * dim) + (y) ).removeOnOption(picked);
    }
    if (x != dim-1) {
      tiles.get( ((x+1) * dim) + (y) ).removeOnOption(picked);
    }
  }

  void pickWater() {
    if (options.size() > 0) {
      picked = options.get(8);
      options = new ArrayList<Option>();
    }
  }

  void removeOnOption(Option p) {
    int checking = 0;
    while (checking != options.size()) {
      boolean found = false;
      for (int o : p.allows) {
        if (o == options.get(checking).id) {
          found = true;
        }
      }
      if (!found && options.get(checking).id != p.id) {
        options.remove(checking);
        
        if(options.size() == 1) {
         pick(options.get(0));
        }
      } else {
        checking++;
      }
    }
  }
}
