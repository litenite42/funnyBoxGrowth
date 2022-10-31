module animals

import core

pub const (
	box_hair_genes = [core.Gene(core.Hair.black), core.Hair.brown, core.Hair.red, core.Hair.silver]
)

pub struct Box {
	id    int
	genes core.GeneSequence
}
