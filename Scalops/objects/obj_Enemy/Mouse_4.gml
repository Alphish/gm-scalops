if (hp.is_empty())
    return;

var _dmg = irandom_range(10, 20);
hp.deplete(_dmg);
if (hp.is_empty()) {
    revive_cooldown.start();
    obj_FireWorker.money.collect(1);
}
