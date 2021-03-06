class PaletteMap {
	ArrayList<Palette> map;

	PaletteMap() {

	}
}

class Palette_HSB extends Palette {
  Palette_HSB() {
    super();
    add(color(255, 0, 0));
    add(color(255, 255, 0));
    add(color(0, 255, 0));
    add(color(0, 255, 255));
    add(color(0, 0, 255));
    add(color(255, 0, 255));
  }
}

class Palette_foo extends Palette {
  Palette_foo() {
    super();
    add(color(255, 128, 0));
    add(color(0, 0, 255));
  }
}

class Palette_BWGW extends Palette {
  Palette_BWGW() {
    super();
    add(color(0, 0, 255));
    add(color(0));
    add(color(0));
    add(color(255));
    add(color(0));
    add(color(0));
    add(color(0, 255, 0));
    add(color(0));
    add(color(0));
    add(color(255));
    add(color(0));
    add(color(0));
  }
}

class Palette_singleRed extends Palette {
  Palette_singleRed() {
    super();
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(128, 0, 0));
    add(color(255, 0, 0));
    add(color(255, 128, 128));
    add(color(255));
    add(color(255, 128, 128));
    add(color(255, 0, 0));
    add(color(128, 0, 0));
  }
}

class Palette_singleOrange extends Palette {
  Palette_singleOrange() {
    super();
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(128, 64, 0));
    add(color(255, 128, 0));
    add(color(255, 224, 128));
    add(color(0));
    add(color(255, 224, 128));
    add(color(255, 128, 0));
    add(color(128, 64, 0));
    add(color(128, 0, 0));
  }
}

class Palette_singleGreen extends Palette {
  Palette_singleGreen() {
    super();
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 128, 0));
    add(color(0, 255, 0));
    add(color(128, 255, 128));
    add(color(255));
    add(color(128, 255, 128));
    add(color(0, 255, 0));
    add(color(0, 128, 0));
  }
}


class Palette_singleBlue extends Palette {
  Palette_singleBlue() {
    super();
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 0, 0));
    add(color(0, 0, 128));
    add(color(0, 0, 255));
    add(color(128, 128, 255));
    add(color(255));
    add(color(128, 128, 255));
    add(color(0, 0, 255));
    add(color(0, 0, 128));
  }
}


