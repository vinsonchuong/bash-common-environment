#!/usr/bin/env bats

setup() {
	mkdir -p "${BATS_TEST_DIRNAME}/package/bin"
	cat <<-'EOF' > "${BATS_TEST_DIRNAME}/package/bin/script"
	#!/usr/bin/env bash
	set -o errexit
	set -o nounset
	set -o pipefail
	eval "$(environment)"
	echo "BIN: $BIN"
	echo "LIB: $LIB"
	echo "HELP: $HELP"
	EOF
	chmod +x "${BATS_TEST_DIRNAME}/package/bin/script"
}

@test 'sets some environment variables' {
	run "${BATS_TEST_DIRNAME}/package/bin/script"
	echo "$output"
	[[ $status = 0 ]]
	[[ $output = *"BIN: ${BATS_TEST_DIRNAME}/package/bin/script"* ]]
	[[ $output = *"LIB: ${BATS_TEST_DIRNAME}/package/lib"* ]]
	[[ $output = *"HELP: ${BATS_TEST_DIRNAME}/package/help/script"* ]]
}
