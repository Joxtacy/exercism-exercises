package parsinglogfiles

import (
	"fmt"
	"regexp"
	"strings"
)

func IsValidLine(text string) bool {
	re := regexp.MustCompile(`^\[(TRC|DBG|INF|WRN|ERR|FTL)\] `)
	return re.MatchString(text)
}

func SplitLogLine(text string) []string {
	re := regexp.MustCompile(`<(\~|\*|\=|\-)*>`)
	return re.Split(text, -1)
}

func CountQuotedPasswords(lines []string) int {
	re := regexp.MustCompile(`".*password.*"`)
	count := 0
	for _, line := range lines {
		if re.MatchString(strings.ToLower(line)) {
			count++
		}
	}
	return count
}

func RemoveEndOfLineText(text string) string {
	re := regexp.MustCompile(`end-of-line\d+`)
	return re.ReplaceAllString(text, "")
}

func TagWithUserName(lines []string) []string {
	re := regexp.MustCompile(`User +(\w+)`)
	for i, line := range lines {
		matches := re.FindStringSubmatch(line)
		if matches != nil {
			username := matches[len(matches)-1]
			lines[i] = fmt.Sprintf("[USR] %s %s", username, line)
		}
	}
	return lines
}
