#!/bin/bash
firefox "data:text/html;base64,$(base64 -w 0 <&0)"
