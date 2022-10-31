module core

pub type Gene = AbstractGene | BodyType | Hair | Sex

pub struct AbstractGene {
	name   string
	id     int
	weight f64
}

pub enum BodyType {
	unfit
	average
	athletic
}

pub enum Sex {
	male
	female
}

pub enum Hair {
	black
	brown
	red
	silver
	hairless
}

pub const (
	sex_genes       = [Gene(Sex.male), Sex.female]
	body_type_genes = [Gene(BodyType.unfit), BodyType.average, BodyType.athletic]
)
