module main
import core
import builders

fn main() {
	mut fab := builders.FunnyAnimalBuilder{}

	fab.init({
		'Sex' : core.sex_genes,
		'BodyType' : core.body_type_genes
	})

	fab.create_new()
	println(fab.get_population())
}
