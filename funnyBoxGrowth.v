module main
import core
import builders
import animals

fn main() {
	mut fab := builders.FunnyAnimalBuilder{}

	fab.init({
		'Sex' : core.sex_genes,
		'BodyType' : core.body_type_genes
	})

	mut animal := fab.create_new()
	println(animal)
}
