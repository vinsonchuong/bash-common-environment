#!/usr/bin/env bats

@test 'it says hello world' {
	run environment
	[[ $status = 0 ]]
	[[ $output = *'Hello World!'* ]]
}
