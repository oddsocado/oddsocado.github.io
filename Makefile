DEFAULT_GOAL := help

help:
    @awk 'BEGIN {FS = ":.*##"; \
    printf "\033[32mMakefile\033[0m version \033[33m%s\033[0m\n \
    \n\033[33mUsage:\033[0m\n  make <target>\n\n\033[33mAvailable targets:\033[0m\n", $(VERSION) } \
    /^[a-zA-Z_-]+:.*?##/ { printf "  \033[32m%-20s\033[0m %s\n", $$1, $$2 } \
    /^##/ { printf "\033[33m%s\033[0m\n", substr($$0, 3) } ' $(MAKEFILE_LIST)
.PHONY: help

.PHONY: create_new_post
run-local:
	hugo server -D