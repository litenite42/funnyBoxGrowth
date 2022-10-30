module main

type Gene = Hair | Sex | BodyType
type GeneSequence = map[string][]Gene

enum BodyType {
	unfit
	average
	athletic
}

enum Sex {
	male
	female
}

enum Hair {
	black
	brown
	red
	silver
	hairless
}

const (
	funny_hair_genes = [Gene(Hair.black), Hair.brown, Hair.red]
	box_hair_genes = [Gene(Hair.black), Hair.brown, Hair.red, Hair.silver]
	sex_genes = [Gene(Sex.male), Sex.female]
	body_type_genes = [Gene(BodyType.unfit), BodyType.average, BodyType.athletic]
)

interface IEntity {
	id int
}

interface IAnimal {
	IEntity
	genes GeneSequence
	generation_nbr int
}

interface IAnimalBuilder {
mut:
	generation int
	genome GeneSequence
	population []IAnimal
	init(GeneSequence)
	create_new() IAnimal
}

struct FunnyAnimal {
	id int
	genes GeneSequence
	generation_nbr int
}

struct FunnyAnimalBuilder {
mut:
	generation int
	genome GeneSequence
	population []IAnimal
}

pub fn (mut fab FunnyAnimalBuilder) init(allowed_genes GeneSequence) {
	fab.genome = allowed_genes
}

pub fn (fab FunnyAnimalBuilder) create_new() IAnimal {
	hair := fab.genome['Hair'][0]
	sex := fab.genome['Sex'][1]
	bt := fab.genome['BodyType'][2]

	mut genes := {
		'Hair' : [hair]
		'Sex' : [sex]
		'BodyType' : [bt]
	}

	mut animal := &FunnyAnimal{
		generation_nbr: 1
		genes: GeneSequence(genes)
	}
	return IAnimal(animal)
}

struct Box {
	id int
	genes GeneSequence
}


fn main() {
	mut fab := FunnyAnimalBuilder{}

	fab.init({
		'Hair' : funny_hair_genes,
		'Sex' : sex_genes,
		'BodyType' : body_type_genes
	})

	mut animal := fab.create_new()
	println(animal)
}
