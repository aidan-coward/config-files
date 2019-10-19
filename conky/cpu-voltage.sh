#!/bin/bash
sensors | grep vddgfx | cut -d ' ' -f 8-
