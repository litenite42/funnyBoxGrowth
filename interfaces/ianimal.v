module interfaces

import core

pub interface IAnimal {
	IEntity
	health int
	energy int
	genes core.GeneSequence
	generation_nbr int
	str() string
	str_arr() []string
}
