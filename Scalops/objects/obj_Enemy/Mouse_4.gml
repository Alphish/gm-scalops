if (hp.is_empty())
    return;

var _dmg = irandom_range(10, 20);
hp.deplete(_dmg);
if (hp.is_empty())
    obj_FireWorker.money.collect(1);
