module builders

import core
import interfaces
import animals
import rand

const (
	default_hair_genes = [core.Gene(core.Hair.black), core.Hair.brown, core.Hair.red]
)

pub struct FunnyAnimalBuilder {
mut:
	generation int
	genome     core.GeneSequence
	population []interfaces.IAnimal
}

pub fn (mut fab FunnyAnimalBuilder) init(allowed_genes core.GeneSequence) {
	fab.genome = allowed_genes
}

pub fn (mut fab FunnyAnimalBuilder) create_new() {
	hair := fab.genome.get_one('Hair') or {
		ndx := rand.intn(builders.default_hair_genes.len) or { 0 }
		builders.default_hair_genes[ndx]
	}

	sex := fab.genome.get_one('Sex') or {
		core.rand_enum<core.Sex>(core.sex_max)
	}

	bt := fab.genome.get_one('BodyType') or {
		core.rand_enum<core.BodyType>(core.body_type_max)
	}

	mut genes := {
		'Hair':     [hair]
		'Sex':      [sex]
		'BodyType': [bt]
	}

	mut animal := &animals.Funny{
		generation_nbr: 1
		genes: core.GeneSequence(genes)
	}
	
	fab.population << interfaces.IAnimal(animal)
}

pub fn (fab FunnyAnimalBuilder) get_population() []interfaces.IAnimal {
	return fab.population
}
