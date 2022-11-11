module core

pub type Gene = AbstractGene | BodyType | Hair | Sex

pub struct AbstractGene {
	id     int
	marker string
	weight f64
}

pub fn new_gene<T>(gene AbstractGene) &T {
	return &T{
		id: gene.id
		weight: gene.weight
		marker: gene.marker
	}
}

pub struct GeneConfig {
	id     int
	weight f64
}

pub struct BodyType {
	AbstractGene
}

pub fn new_bodytype(gene GeneConfig) &BodyType {
	return new_gene<BodyType>(id: gene.id, weight: gene.weight, marker: 'BT')
}

pub struct Sex {
	AbstractGene
}

pub fn new_sex(gene AbstractGene) &Sex {
	return new_gene<Sex>(id: gene.id, weight: gene.weight, marker: 'SX')
}

pub struct Hair {
	AbstractGene
}

pub fn new_hair(gene AbstractGene) &Hair {
	return new_gene<Hair>(id: gene.id, weight: gene.weight, marker: 'HR')
}

pub const (
	black_hair  = new_hair(id: 0, weight: .3)
	red_hair    = new_hair(id: 1, weight: .1)
	brown_hair  = new_hair(id: 2, weight: .1)
	silver_hair = new_hair(id: 3, weight: .15)
	blonde_hair = new_hair(id: 4, weight: .2)
	hairless    = new_hair(id: 5, weight: .15)
)

pub const (
	male_sex   = new_sex(id: 0, weight: .45)
	female_sex = new_sex(id: 1, weight: .55)
)

pub const (
	unfit_bodytype    = new_bodytype(id: 0, weight: .25)
	athletic_bodytype = new_bodytype(id: 1, weight: .25)
	average_bodytype  = new_bodytype(id: 2, weight: .5)
)

pub const (
	body_type_max = 2
	sex_max       = 1
	hair_max      = 5
)

pub const (
	sex_genes       = [Gene(male_sex), female_sex]
	body_type_genes = [Gene(unfit_bodytype), average_bodytype, athletic_bodytype]
)

pub fn (g Gene) str() string {
	return '${g.marker}_${g.id}_${int(g.weight * 100)}'
}
