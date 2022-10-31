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

pub fn (fab FunnyAnimalBuilder) create_new() interfaces.IAnimal {
	hair := fab.genome.get_one('Hair') or {
		ndx := rand.intn(builders.default_hair_genes.len) or { 0 }
		builders.default_hair_genes[ndx]
	}
  
	sex := fab.genome['Sex'][1]
	bt := fab.genome['BodyType'][2]

	mut genes := {
		'Hair':     [hair]
		'Sex':      [sex]
		'BodyType': [bt]
	}

	mut animal := &animals.Funny{
		generation_nbr: 1
		genes: core.GeneSequence(genes)
	}
	return interfaces.IAnimal(animal)
}
