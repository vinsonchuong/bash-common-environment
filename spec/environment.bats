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

teardown() {
  rm -rf "${BATS_TEST_DIRNAME}/package"
}

@test 'sets some environment variables' {
	run "${BATS_TEST_DIRNAME}/package/bin/script"
	[[ $status = 0 ]]
	[[ $output = *"BIN: script"* ]]
	[[ $output = *"LIB: ${BATS_TEST_DIRNAME}/package/bin/../lib"* ]]
	[[ $output = *"HELP: ${BATS_TEST_DIRNAME}/package/bin/../help/script"* ]]
}
