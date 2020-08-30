#!/usr/bin/env bash
set -Ceuo pipefail

# FinderKill
killall Finder

# MacBookの自動起動をオフにする
sudo nvram AutoBoot=%00
