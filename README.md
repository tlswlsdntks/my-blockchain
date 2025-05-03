geth 프로젝트 구조 확인:
    프로젝트 가져오기:
        git clone "https://github.com/ethereum/go-ethereum.git"
        
체인 브랜드 변경:
    브랜치를 releases/1.10 으로 변경:
        git switch releases/1.10

    .git 폴더 삭제:
        cd go-ethereum/
        rm -rf .git

    폴더 명 변경:
        cd ..
        mv go-ethereum go-dogeum

    쉘 파일 실행:
        sh brand.sh
        sh dir.sh

다른 체인 살펴보기 (1) 이더리움 클래식:
    개요:
        2016년 이더리움 플랫폼에서 발생한 'DAO 해킹 사건'

    core-geth 프로젝트 구조 확인:
        프로젝트 가져오기:
            git clone "https://github.com/etclabscore/core-geth.git"

    ECIP 1099: 
        Calibrate Epoch Duration 는 이더리움 클래식(ETC) 네트워크의 업그레이드 제안으로, 네트워크의 안정성과 효율성을 높이기 위해 에포크(epochs)의 지속 시간을 조정하는 내용을 담고 있다.

다른 체인 살펴보기 (2) 클레이튼:
    개요:
        https://docs.klaytn.foundation/ko/docs/learn/

    klaytn 프로젝트 구조 확인:
        프로젝트 가져오기:
            git clone "https://github.com/klaytn/klaytn.git"

        초기 자산 할당 해시 확인:
            blockchain\genesis_alloc.go    

    클레이튼 스캐너 사이트:
        https://scope.klaytn.com

다른 체인 살펴보기 (3) 폴리곤:
    개요:
        https://docs.polygon.technology/pos/architecture/overview/?h=arch#architectural-overview

    polygon 프로젝트 구조 확인:
        heimdal 프로젝트 가져오기:
            git clone "https://github.com/maticnetwork/heimdall.git"
        
        bor 프로젝트 가져오기:
            git clone "https://github.com/maticnetwork/bor.git"

        초기 자산 할당 해시 확인:
            bor\core\allocs\bor_mainnet.json

    폴리곤 스캐너 사이트:
        https://polygonscan.com/

    Polygon Edge:
        Polygon 생태계 내에서 맞춤형 블록체인 네트워크를 빠르게 만들고 관리하는 도구
        Polygon Edge 프로젝트 가져오기:
            git clone "https://github.com/0xPolygon/polygon-edge.git"

다른 체인 살펴보기 (4) 위믹스:
    개요:
        https://docs.wemix.com/ko#wemix3.0-overview

    WEMIX 프로젝트 구조 확인:
        go-wemix 프로젝트 가져오기:
            git clone "https://github.com/wemixarchive/go-wemix.git"
    