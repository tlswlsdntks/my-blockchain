#!/bin/sh

# 각각 파일 이름 또는 파일 내용에서 "ethereum" 을 "dogeum" 으로 일괄 변경하는 작업을 수행
find . -exec rename "s/ethereum/dogeum/" {} ";"
find . -exec rename "s/ether/doge/" {} ";"
find . -exec rename "s/geth/gdoge/" {} ";"