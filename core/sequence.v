module core

import rand

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

pub fn (gs GeneSequence) get_one(gene string) ?Gene {
	sequence := gs.get_all(gene)

	return if sequence.len <= 0 {
		error('No sequence found for gene $gene')
	} else {
		ndx := rand.intn(sequence.len) or { 0 }
		sequence[ndx]
	}
}
