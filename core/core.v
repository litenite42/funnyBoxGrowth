module core
pub type Gene = Hair | Sex | BodyType | AbstractGene
pub type GeneSequence = map[string][]Gene

pub fn (gs GeneSequence) has(gene string) bool {
  return gene in gs
}

pub fn (gs GeneSequence) get_all(gene string) []Gene {
  return if gs.has(gene) {
    gs[gene]
  } else {
    []Gene{}
  }
}

pub fn (gs GeneSequence) get_one(ndx int, gene string) ?Gene {
    sequence := gs.get_all(gene)

    return if sequence.len <= 0 {
      error('No sequence found for gene ${gene}')
    }
    else if ndx > sequence.len {
      error('Gene Sequence position ${ndx}  not applicable to gene ${gene}')
    } else {
     sequence[ndx]
    }
}

pub struct AbstractGene {
  name string
  id int
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
	sex_genes = [Gene(Sex.male), Sex.female]
	body_type_genes = [Gene(BodyType.unfit), BodyType.average, BodyType.athletic]
)
