module base

import core

struct Animal {
  id int
  health int = 100
  energy int = 100
  genes core.GeneSequence
  generation_nbr int
}

pub const (
  animal_headers = ['Animal ID', 'Health', 'Energy', 'Gen #', 'Genes']
)

pub fn (a Animal) str_arr() []string {
  return [a.id.str(), a.health.str(), a.energy.str(), a.generation_nbr.str(), a.genes.str()]
}

pub fn (a Animal) str() string {
	return '#${a.id:5d} | ${a.health:6d} | ${a.energy:6d} | ${a.generation_nbr:5d}'
}
