#!/bin/sh

apt-get -qq update && apt-get -qq --yes install net-tools vim curl tree git
# apt-get update && apt-get --yes install net-tools vim