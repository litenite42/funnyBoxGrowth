module core
import rand

pub fn rand_enum<T>(max int) T {
	ndx := rand.intn(max) or { 0 }
	return unsafe {
		T(ndx)
	}
}
