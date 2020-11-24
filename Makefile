M = $(shell printf "\033[34;1m▶\033[0m")

######################
### MAIN FUNCTIONS ###
######################

.PHONY: build
build: ## Build the application for linux
	go build -o ./bin/gauth .

.PHONY: build_windows
build_windows: ## Build the application for windows
	env GOOS=windows GOARCH=amd64 go build -o ./bin/gauth.exe .

.PHONY: help
help: ## Prints this help message
	@grep -E '^[a-zA-Z_-]+:.*## .*$$' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'

.DEFAULT_GOAL := help