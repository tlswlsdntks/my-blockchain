#!/bin/sh

# go-dogeum 디렉토리 내의 모든 파일에서 "ethereum" 이라는 단어를 "dogeum" 으로 일괄 변경하는 작업을 수행
find go-dogeum -type f -exec sed -i "s/ethereum/dogeum/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Ethereum/Dogeum/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/ETHEREUM/DOGEUM/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/ether/doge/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Ether/Doge/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/ETHER/DOGE/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/geth/gdoge/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Geth/Gdoge/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/GETH/GDOGE/g" {} ";" 

find go-dogeum -type f -exec sed -i "s/dogebase/etherbase/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Dogebase/Etherbase/g" {} ";" 
find go-dogeum -type f -exec sed -i "s|github.com/dogeum|github.com/tlswlsdntks|g" {} ";" 
find go-dogeum -type f -exec sed -i "s|tlswlsdntks/EIPs|ethereum/EIPSs|g" {} ";" 
find go-dogeum -type f -exec sed -i "s/dogeum.Dogeum/ethereum.Ethereum/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/dogeum.org/ethereum.org/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/eips.dogeum/eips.ethereum/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/whdoge/whether/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Whdoge/Whether/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/todoge/together/g" {} ";" 
find go-dogeum -type f -exec sed -i "s/Todoge/Together/g" {} ";" 
