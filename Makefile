FILE=VERSION
ORB_VERSION := `cat $(FILE)`

.PHONY: validate
validate:
	@circleci orb validate orb.yml

.PHONY: publish-dev
publish-dev:
	@echo "Publishing orb to dev with version ${ORB_VERSION}"
	@circleci orb publish orb.yml jaysonesmith/demo@dev:${ORB_VERSION}

.PHONY: promote-dev
promote-dev:
	@echo "Promoting orb to prod from version ${ORB_VERSION}"
	@circleci orb publish promote jaysonesmith/demo@dev:$(ORB_VERSION) patch
