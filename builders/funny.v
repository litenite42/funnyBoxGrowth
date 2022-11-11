module builders

import core
import interfaces
import animals
import animals.base
import rand
import serkonda7.termtable as tt

const (
	default_hair_genes = [core.black_hair, core.brown_hair, core.red_hair]
)

pub struct FunnyAnimalBuilder {
mut:
	current_id int
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
		core.Gene(builders.default_hair_genes[ndx])
	}

	sex := fab.genome.get_one('Sex') or { core.Gene(core.male_sex) }

	bt := fab.genome.get_one('BodyType') or { core.Gene(core.average_bodytype) }

	mut genes := {
		'Hair':     [hair]
		'Sex':      [sex]
		'BodyType': [bt]
	}

	fab.current_id++
	mut animal := &animals.Funny{
		generation_nbr: 1
		id: fab.current_id
		genes: core.GeneSequence(genes)
	}

	fab.population << interfaces.IAnimal(animal)
}

pub fn (fab FunnyAnimalBuilder) get_population() []interfaces.IAnimal {
	return fab.population
}

pub fn (fab FunnyAnimalBuilder) str() string {
	mut arr := [][]string{len: fab.population.len + 1}
	arr[0] = base.animal_headers

	for i in 0 .. fab.population.len {
		arr[i + 1] = fab.population[i].str_arr()
	}

	t := tt.Table{
		data: arr
	}

	return '\n' + t.str() + '\n'
}
