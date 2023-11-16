

class Option {
  int id;
  int[] allows;
  String handle;

  PImage img;
  float available = 0;
  int left = 0;

  float chance = 1;
  float prio;
  Option(int i, int[] a, String h, float p) {
    id = i;
    allows = a;
    handle = h;
    prio = p;
    //img = loadImage("tiles/t"+(i+1)+".png");
  }

  void draw(int s) {
    //for(int i = 0; i < s/2; i++) {
    fill(colors[id]);
    rect(0, 0, s, s);
    //switch(id) {
    //case 0:
    //  line(0, 0, s, s);
    //  break;
    //case 1:
    //  line(0, s, s, 0);
    //  break;
    //case 2:
    //  line((s/4)*1, 0, (s/4)*1, s);
    //  line((s/4)*3, 0, (s/4)*3, s);
    //  break;
    //case 3:
    //  line(0, (s/4)*1, s, (s/4)*1);
    //  line(0, (s/4)*3, s, (s/4)*3);
    //  break;
    //case 4:
    //  line((s/2), 0, (s/2), s);
    //  line(0, (s/2), s, (s/2));
    //  break;
    //case 5:
    //  line(0, 0, s, s);
    //  line(0, s, s, 0);
    //  break;
    //case 6:
    //  line(0, 0, s/2, s/2);
    //  break;
    //case 7:
    //  line(0, s/2, s/2, 0);
    //  break;


    //default:
    
    //  line((s/4)*1, s/2, (s/4)*1, s);
    //  line((s/4)*3, 0, (s/4)*3, s/2);
    //  break;
    //}
    //}
    noStroke();
  }
}
