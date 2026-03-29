if (!hp.is_empty())
    hp.collect(0.2);
else if (revive_cooldown.recover())
    hp.set_value(hp.capacity);
