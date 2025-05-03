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
    
제네시스 블록 코드 수정 (1) 코드 살펴보기:
    geth 코드 - 제네시스 블록 확인:
        go-ethereum\core\genesis.go
    
제네시스 블록 코드 수정 (2) 프로퍼티 값 수정하기:
    Keccak-256 해시 함수 사용:
        https://emn178.github.io/online-tools/keccak_256.html, input: simple

    geth 코드 - DefaultGenesisBlock 함수 수정:
        go-ethereum\core\genesis.go, line: 446
        func DefaultGenesisBlock() *Genesis {
            return &Genesis{
                Config: params.MainnetChainConfig,
                Nonce:  66,
                ExtraData:  hexutil.MustDecode("3a784687a2b2ff9a2c72e22b001d33d9f2e2155a7858ff663b0990d35f14745d"),
                GasLimit:   8000000,
                Difficulty: big.NewInt(17179),
                Alloc:      decodePrealloc(mainnetAllocData),
            }
        }

    geth 코드 - MainnetChainConfig 변수 수정:
        go-ethereum\params\config.go, line: 60
        MainnetChainConfig = &ChainConfig{
            ChainID:                       big.NewInt(213912), // simple
            HomesteadBlock:                big.NewInt(0),
            DAOForkBlock:                  big.NewInt(0),
            DAOForkSupport:                true,
            EIP150Block:                   big.NewInt(0),
            EIP150Hash:                    common.Hash{},
            EIP155Block:                   big.NewInt(0),
            EIP158Block:                   big.NewInt(0),
            ByzantiumBlock:                big.NewInt(0),
            ConstantinopleBlock:           big.NewInt(0),
            PetersburgBlock:               big.NewInt(0),
            IstanbulBlock:                 big.NewInt(0),
            MuirGlacierBlock:              big.NewInt(0),
            BerlinBlock:                   big.NewInt(0),
            LondonBlock:                   big.NewInt(0),
            ArrowGlacierBlock:             big.NewInt(0),
            GrayGlacierBlock:              big.NewInt(0),
            TerminalTotalDifficulty:       nil,
            TerminalTotalDifficultyPassed: false,
            Ethash:                        new(EthashConfig),
        }

    geth 코드 - MainnetChainConfig & MainnetCheckpointOracle 변수 주석 처리:
        go-ethereum\params\config.go, line: 108, 116
        MainnetTrustedCheckpoint = &TrustedCheckpoint{
            // SectionIndex: 451,
            // SectionHead:  common.HexToHash("0xe47f84b9967eb2ad2afff74d59901b63134660011822fdababaf8fdd18a75aa6"),
            // CHTRoot:      common.HexToHash("0xc31e0462ca3d39a46111bb6b63ac4e1cac84089472b7474a319d582f72b3f0c0"),
            // BloomRoot:    common.HexToHash("0x7c9f25ce3577a3ab330d52a7343f801899cf9d4980c69f81de31ccc1a055c809"),
        }

        // MainnetCheckpointOracle contains a set of configs for the main network oracle.
        MainnetCheckpointOracle = &CheckpointOracleConfig{
            // Address: common.HexToAddress("0x9a9070028361F7AAbeB3f2F2Dc07F82C4a98A02a"),
            // Signers: []common.Address{
            // 	common.HexToAddress("0x1b2C260efc720BE89101890E4Db589b44E950527"), // Peter
            // 	common.HexToAddress("0x78d1aD571A1A09D60D9BBf25894b44e4C8859595"), // Martin
            // 	common.HexToAddress("0x286834935f4A8Cfb4FF4C77D5770C2775aE2b0E7"), // Zsolt
            // 	common.HexToAddress("0xb86e2B0Ab5A4B1373e40c51A7C712c70Ba2f9f8E"), // Gary
            // 	common.HexToAddress("0x0DF8fa387C602AE62559cC4aFa4972A7045d6707"), // Guillaume
            // },
            // Threshold: 2,
        }