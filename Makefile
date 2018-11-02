.DEFAULT_GOAL := help

site: ## Build the site into the cloudspinners.github.io folder
	gitbook build
	rsync -rlptD \
			--exclude .git\
			--exclude .gitignore \
			--exclude CNAME \
			--delete \
			./cloudspin-reference/_book/ \
			./cloudspinners.github.io/
	@echo "Now commit and push the files that are in ./cloudspinners.github.io"

preview: ## Run a local server with the working site content
	gitbook serve

help:
	@grep -h -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}'
