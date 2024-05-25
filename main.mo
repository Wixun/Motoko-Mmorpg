import Debug "mo:base/Debug";

actor Counter {

  stable var sword = 0;
  stable var yang = 0; // default money
  stable var power = 10;
  stable var whiteOachArcherMonster = 10;
  stable var catacombMonster = 50;
  stable var nagaMonster = 90;
  stable var exp = 16; // default exp
  stable var level = 1; // default exp

  // Get the value of the counter.
  public func upgrade() : async () {

    if (sword == 0) {
      sword += 1;
      power += 35;
      if (yang > 100000) {
        sword += 1;
        power += 35;
        yang -= 100000;
      } else if (sword == 1) {
        sword += 1;
        power += 35;
        if (yang > 300000) {
          sword += 1;
          power += 35;
          yang -= 300000;
        };
      } else if (sword == 2) {
        if (yang > 500000) {
          sword += 1;
          power += 35;
          yang -= 500000;
        };
      };
    };
  };
  public func getMonsterMap(input : Nat) : async Text {
    switch (input) {
      case (0) {
        if (power > whiteOachArcherMonster) {
          yang += 100000;
          exp += 500;
          return ("You killed Monster");
        } else {
          return ("You need upgrade sword");
        };
      };
      case (1) {
        if (power > catacombMonster) {
          yang += 300000;
          exp += 500;
          return ("You killed Monster");
        } else {
          return ("You need upgrade sword");
        };
      };
      case (2) {
        if (power > nagaMonster) {
          yang += 400000;
          exp += 500;
          return ("You killed Monster");
        } else {
          return ("You need upgrade sword");
        };
      };
    };
  };
  public func levelUp() : async Text {
    if (exp > 1000) {
      level += 1;
      exp -= 1000;
      return "Level Up!";
    }
    else {
      return "You need kill monster";
    }
  };

  public func getMoney() : async Nat {
    return yang;
  };

  public func getSword() : async Nat {
    return sword;
  };

  public func getPower() : async Nat {
    return power;
  };
};
