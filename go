#!/bin/bash

set -eu

function task_build {
  embedmd markdown.md > markdown.md.gen
}

function task_test1 {
  bundle exec rspec spec/example1/example_spec.rb
}

function task_test2 {
  bundle exec rspec spec/example2/example2_spec.rb
}

function task_test3 {
  bundle exec rspec spec/example3/example3_spec.rb
}

function task_usage {
    echo "Usage: $0 build | test1 | test2 | test3"
    exit 1
}


CMD=${1:-}
shift || true
case ${CMD} in
  build) task_build ;;
  test1) task_test1 ;;
  test2) task_test2 ;;
  test3) task_test3 ;;
  *) task_usage ;;
esac
