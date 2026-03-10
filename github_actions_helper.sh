#!/bin/zsh

if bundle exec rubocop; then
  echo "No offenses detected by rubocop"
  if bin/rails db:test:prepare; then
    echo "Test DB prepare OK!"
    if bin/rails test; then
      echo "Tests passed"
    else
      echo "Tests failed. Run bundle exec rubocop to check "
    fi
  else
    echo "Test DB prepare error. Run bin/rails db:test:prepare to check"
  fi
else
  echo "Offenses detected. Run bin/rails test to check"
fi
