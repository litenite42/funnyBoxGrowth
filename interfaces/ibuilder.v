module interfaces

import core

pub interface IAnimalBuilder {
mut:
	generation int
	genome core.GeneSequence
	population []IAnimal
	init(core.GeneSequence)
	create_new()
	get_population() []IAnimal
}
