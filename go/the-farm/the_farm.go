package thefarm

import (
	"errors"
	"fmt"
)

func DivideFood(fc FodderCalculator, cows int) (float64, error) {
	amount, err := fc.FodderAmount(cows)
	if err != nil {
		return 0.0, err
	}

	factor, err := fc.FatteningFactor()
	if err != nil {
		return 0.0, err
	}

	return amount * factor / float64(cows), nil
}

func ValidateInputAndDivideFood(fc FodderCalculator, cows int) (float64, error) {
	if cows <= 0 {
		return 0.0, errors.New("invalid number of cows")
	}

	return DivideFood(fc, cows)
}

func ValidateNumberOfCows(cows int) error {
	if cows < 0 {
		return &InvalidCowsError{cows: cows, message: "there are no negative cows"}
	} else if cows == 0 {
		return &InvalidCowsError{cows: cows, message: "no cows don't need food"}
	}

	return nil
}

type InvalidCowsError struct {
	cows    int
	message string
}

func (err *InvalidCowsError) Error() string {
	return fmt.Sprintf("%d cows are invalid: %s", err.cows, err.message)
}
