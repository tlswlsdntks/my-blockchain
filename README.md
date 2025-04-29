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