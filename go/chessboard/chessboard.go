package chessboard

// Declare a type named File which stores if a square is occupied by a piece - this will be a slice of bools
type File []bool

// Declare a type named Chessboard which contains a map of eight Files, accessed with keys from "A" to "H"
type Chessboard map[string]File

// CountInFile returns how many squares are occupied in the chessboard,
// within the given file.
func CountInFile(cb Chessboard, file string) (sum int) {
	for _, v := range cb[file] {
		if v {
			sum++
		}
	}
	return
}

// CountInRank returns how many squares are occupied in the chessboard,
// within the given rank.
func CountInRank(cb Chessboard, rank int) (sum int) {
	if rank < 1 || rank > 8 {
		return
	}
	for _, file := range cb {
		if file[rank-1] {
			sum++
		}
	}
	return
}

// CountAll should count how many squares are present in the chessboard.
func CountAll(cb Chessboard) (sum int) {
	for _, file := range cb {
		for range file {
			sum++
		}
	}

	return
}

// CountOccupied returns how many squares are occupied in the chessboard.
func CountOccupied(cb Chessboard) (sum int) {
	for _, file := range cb {
		for _, square := range file {
			if square {
				sum++
			}
		}
	}

	return
}
