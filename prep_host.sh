#!/bin/bash

#builtin admin for truenas
sudo groupadd -g 544 builtin_administrators
sudo usermod -aG builtin_administrators "$USER"