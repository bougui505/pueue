#############################################################################
# Author: Guillaume Bouvier -- guillaume.bouvier@pasteur.fr                 #
# https://research.pasteur.fr/en/member/guillaume-bouvier/                  #
# Copyright (c) 2025 Institut Pasteur                                       #
#############################################################################
#
# creation_date: Tue Jan  6 09:12:29 2026

SHELL := zsh
.ONESHELL:
.SHELLFLAGS := -eu -o pipefail -c

outputs=target1 target2
.PHONY: help clean #  which targets are not represented by files

help:
	@echo "\e[4mTargets:\e[0m"
	@grep '^[[:alnum:]].*:' Makefile

target:
	cargo build --release --locked

bin/pueued: target
	mkdir -p $(@D)
	cd $(@D)
	ln -s ../target/release/pueued

bin/pueue: target
	mkdir -p $(@D)
	cd $(@D)
	ln -s ../target/release/pueue
