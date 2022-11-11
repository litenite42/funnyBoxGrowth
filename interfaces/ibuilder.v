module interfaces

import core

pub interface IAnimalBuilder {
mut:
	generation int
	current_id int
	genome core.GeneSequence
	population []IAnimal
	init(core.GeneSequence)
	create_new()
	get_population() []IAnimal
}

pub fn (mut i IAnimalBuilder) increment_generation() {
	i.generation++
}

pub struct AsexualSpawnConfig {
	nbr int = 1
}

pub fn (mut i IAnimalBuilder) create_n(config AsexualSpawnConfig) {
	for _ in 0 .. config.nbr {
		i.create_new()
	}
}
