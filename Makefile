# Tools

SHELL := /bin/bash

# Default command and help messages

.PHONY: default help
default: help

#!
#! Running the application:
up:          ## Launch the entire application
console:     ## Launch a Rails console
test:        ## Run tests

#!
#! Installation, setup, and maintenance:
setup:       ## Create a seed database (WILL DESTROY EXISTING DATA)
migrate:     ## Run migrations
bundle:      ## Install gems
mysql:       ## Connect to mysql server

#!
#! Other:
# See https://gist.github.com/prwhite/8168133
help:      ## Show this message
	@egrep -h "##|#!" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//' | sed -e 's/: /  /' | sed -e 's/^/  make /' | sed -e 's/^[ ]*make #![ ]*//'
	@echo

#!
#! To run the application for the first time, use:
#! $ make setup && make up

# Commands

.PHONY: up
up: bundle migrate
	bundle exec foreman start

.PHONY: console
console: bundle migrate
	bin/console

.PHONY: test
test: bundle migrate
	bundle exec rake test

.PHONY: setup
setup: bundle
	bin/setup

.PHONY: migrate
migrate: bundle
	cmp -s .last_migrate <(md5 -q <(ls db/migrate)) || \
		(bundle exec bin/rake db:migrate && md5 -q <(ls db/migrate) > .last_migrate)

.PHONY: bundle
bundle:
	cmp -s .last_bundle_installed <(md5 -q Gemfile Gemfile.lock) || \
		(bundle install && md5 -q Gemfile Gemfile.lock > .last_bundle_installed)

# Include any local customizations

-include Makefile.local
