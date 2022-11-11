module main

import core
import builders
import interfaces

fn main() {
	mut fab :=  interfaces.IAnimalBuilder(builders.FunnyAnimalBuilder{})

	fab.init({
		'Sex':      core.sex_genes
		'BodyType': core.body_type_genes
	})

	fab.create_n(nbr: 15)

	println(fab)
}
