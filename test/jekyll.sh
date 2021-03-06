#!/usr/bin/env bash

# Developer:
# ---------
# Name:      Maik Ellerbrock
# GitHub:    https://github.com/ellerbrock
# Twitter:   https://twitter.com/frapsoft
# Docker:    https://hub.docker.com/u/ellerbrock
# Quay:      https://quay.io/user/ellerbrock
#
# Description:
# -----------
# Travis Test for Jekyll Sites

set -e

# CONFIGURATION
SITE_ROOT="./site"

cd ${SITE_ROOT}

bundle install
bundle exec jekyll build

# run for each file to prevent timeout by travis
find ./_site -name *.html -type f -exec htmlproofer {} \;

# bundle exec htmlproofer ./_site/os
# bundle exec htmlproofer ./_site/rancher --as-links

# bundle exec check-links ./_site/os --no-warnings
# bundle exec check-links ./_site/rancher --no-warnings

