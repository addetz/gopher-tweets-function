SHELL := /bin/bash
.PHONY: build deploy start test

build:
	sam build

deploy:
	sam deploy --parameter-overrides \
      "TwitterConsumerKey=$(TWITTER_CONSUMER_KEY)" \
      "TwitterConsumerSecret=$(TWITTER_CONSUMER_SECRET)" \
      "TwitterLoginCallback=$(TWITTER_LOGIN_CALLBACK)" \
      "FrontendRedirect=$(FRONTEND_REDIRECT)"  \
      "SessionSecretKey=$(SESSION_SECRET_KEY)"  \
      --no-confirm-changeset --no-fail-on-empty-changeset

start:
	@ sam local start-api --parameter-overrides \
	    "TwitterConsumerKey=$(TWITTER_CONSUMER_KEY)" \
        "TwitterConsumerSecret=$(TWITTER_CONSUMER_SECRET)" \
        "TwitterLoginCallback=$(TWITTER_LOGIN_CALLBACK)" \
        "FrontendRedirect=$(FRONTEND_REDIRECT)"  \
        "SessionSecretKey=$(SESSION_SECRET_KEY)"
test:
	go test ./...
