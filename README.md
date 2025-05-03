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
    geth 프로젝트 구조 확인:
        프로젝트 가져오기:
            git clone "https://github.com/etclabscore/core-geth.git"

    ECIP 1099: 
        Calibrate Epoch Duration 는 이더리움 클래식(ETC) 네트워크의 업그레이드 제안으로, 네트워크의 안정성과 효율성을 높이기 위해 에포크(epochs)의 지속 시간을 조정하는 내용을 담고 있다.