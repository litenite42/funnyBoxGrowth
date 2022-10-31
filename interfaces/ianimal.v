module interfaces

import core

pub interface IAnimal {
	IEntity
	genes core.GeneSequence
	generation_nbr int
}
