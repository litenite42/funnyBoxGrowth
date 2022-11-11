module animals

import core
import animals.base

pub struct Funny {
	base.Animal
}

pub fn (f Funny) str() string {
	return 'Funny $f.Animal.str()'
}
