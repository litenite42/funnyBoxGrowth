module animals

import core

pub const (
	box_hair_genes = [core.black_hair, core.brown_hair, core.red_hair, core.silver_hair]
)

pub struct Box {
	id    int
	genes core.GeneSequence
}
