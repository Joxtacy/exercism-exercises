package lasagna

func PreparationTime(layers []string, prepTime int) int {
	if prepTime == 0 {
		prepTime = 2
	}

	return len(layers) * prepTime
}

func Quantities(layers []string) (noodles int, sauce float64) {
	for _, layer := range layers {
		if layer == "noodles" {
			noodles += 50
		} else if layer == "sauce" {
			sauce += 0.2
		}
	}

	return
}

func AddSecretIngredient(friend, mine []string) {
	mine[len(mine)-1] = friend[len(friend)-1]
}

func ScaleRecipe(quantities []float64, portions int) []float64 {
	scaled := make([]float64, len(quantities))
	for index, quantity := range quantities {
		scaled[index] = quantity * float64(portions) / 2
	}
	return scaled
}

// Your first steps could be to read through the tasks, and create
// these functions with their correct parameter lists and return types.
// The function body only needs to contain `panic("")`.
//
// This will make the tests compile, but they will fail.
// You can then implement the function logic one by one and see
// an increasing number of tests passing as you implement more
// functionality.
