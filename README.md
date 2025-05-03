geth 프로젝트 구조 확인:
    프로젝트 가져오기:
        $ git clone "https://github.com/ethereum/go-ethereum.git"
        
체인 브랜드 변경:
    브랜치를 releases/1.10 으로 변경:
        $ git switch releases/1.10

    .git 폴더 삭제:
        $ cd go-ethereum/
        $ rm -rf .git

    폴더 명 변경:
        $ cd ..
        $ mv go-ethereum go-dogeum

    쉘 파일 실행:
        $ sh brand.sh
        $ sh dir.sh

다른 체인 살펴보기 (1) 이더리움 클래식:
    개요:
        2016년 이더리움 플랫폼에서 발생한 'DAO 해킹 사건'
            DAO(Decentralized Autonomous Organization): 
                이더리움 블록체인 위에서 운영되는 분산형 자율조직으로, 투자자들이 자금을 모아 다양한 프로젝트에 투자하는 목적으로 설계되었다.
                2016년, 이더리움 커뮤니티는 'The DAO'라는 이름의 대규모 투자 펀드를 만들었으며, 이는 당시 최대 규모의 스마트 계약 프로젝트 중 하나였습니다.

    core-geth 프로젝트 구조 확인:
        프로젝트 가져오기:
            $ git clone "https://github.com/etclabscore/core-geth.git"

    ECIP 1099: 
        Calibrate Epoch Duration 는 이더리움 클래식(ETC) 네트워크의 업그레이드 제안으로, 네트워크의 안정성과 효율성을 높이기 위해 에포크(epochs)의 지속 시간을 조정하는 내용을 담고 있다.

다른 체인 살펴보기 (2) 클레이튼:
    개요:
        https://docs.klaytn.foundation/ko/docs/learn/

    klaytn 프로젝트 구조 확인:
        프로젝트 가져오기:
            $ git clone "https://github.com/klaytn/klaytn.git"

        klaytn - 초기 자산 할당 해시 확인:
            blockchain\genesis_alloc.go    

    클레이튼 스캐너 사이트:
        https://scope.klaytn.com

다른 체인 살펴보기 (3) 폴리곤:
    개요:
        https://docs.polygon.technology/pos/architecture/overview/?h=arch#architectural-overview

    polygon 프로젝트 구조 확인:
        heimdal 프로젝트 가져오기:
            $ git clone "https://github.com/maticnetwork/heimdall.git"
        
        bor 프로젝트 가져오기:
            $ git clone "https://github.com/maticnetwork/bor.git"

        polygon - 초기 자산 할당 해시 확인:
            bor\core\allocs\bor_mainnet.json

    폴리곤 스캐너 사이트:
        https://polygonscan.com/

    Polygon Edge:
        Polygon 생태계 내에서 맞춤형 블록체인 네트워크를 빠르게 만들고 관리하는 도구
        Polygon Edge 프로젝트 가져오기:
            $ git clone "https://github.com/0xPolygon/polygon-edge.git"

다른 체인 살펴보기 (4) 위믹스:
    개요:
        https://docs.wemix.com/ko#wemix3.0-overview

    WEMIX 프로젝트 구조 확인:
        go-wemix 프로젝트 가져오기:
            $ git clone "https://github.com/wemixarchive/go-wemix.git"
    
제네시스 블록 코드 수정 (1) 코드 살펴보기:
    geth 코드 - 제네시스 블록 확인:
        go-ethereum\core\genesis.go
    
제네시스 블록 코드 수정 (2) 프로퍼티 값 수정하기:
    Keccak-256 해시 함수 사용:
        https://emn178.github.io/online-tools/keccak_256.html, input: simple

    제네시스 블록 설정:
        geth 코드 - DefaultGenesisBlock 함수 수정:
            go-ethereum\core\genesis.go, line: 446
            func DefaultGenesisBlock() *Genesis {
                return &Genesis{
                    Config: params.MainnetChainConfig,
                    Nonce:  66,
                    ExtraData:  hexutil.MustDecode("Keccak-256 해시 함수"),
                    GasLimit:   8000000,
                    Difficulty: big.NewInt(17179),
                    Alloc:      decodePrealloc(mainnetAllocData),
                }
            }

    메인넷 체인 구성:
        geth 코드 - MainnetChainConfig 변수 수정:
            go-ethereum\params\config.go, line: 60
            MainnetChainConfig = &ChainConfig{
                ChainID:                       big.NewInt(213972), // simple
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

    신뢰할 수 있는 체크포인트:
        geth 코드 - MainnetTrustedCheckpoint 변수 주석 처리:
            go-ethereum\params\config.go, line: 108, 116
            MainnetTrustedCheckpoint = &TrustedCheckpoint{
                // SectionIndex: 451,
                // SectionHead:  common.HexToHash("0xe47f84b9967eb2ad2afff74d59901b63134660011822fdababaf8fdd18a75aa6"),
                // CHTRoot:      common.HexToHash("0xc31e0462ca3d39a46111bb6b63ac4e1cac84089472b7474a319d582f72b3f0c0"),
                // BloomRoot:    common.HexToHash("0x7c9f25ce3577a3ab330d52a7343f801899cf9d4980c69f81de31ccc1a055c809"),
            }

    특정 체크포인트(중요한 블록 또는 상태)를 검증하고 제공:
        geth 코드 - MainnetCheckpointOracle 변수 주석 처리:
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

제네시스 블록 코드 수정 (3) bip32 wallet 생성 실습:
    BIP 32 (Bitcoin Improvement Proposal 32):
        목적: HD(Hierarchical Deterministic) 지갑을 위한 표준
        기능: 하나의 시드(비밀 문구 또는 키)로부터 여러 개의 계좌, 주소를 계층적으로 생성할 수 있게 해준다.
        특징: 계층적 구조를 통해 주소와 키를 체계적으로 관리할 수 있어, 복구와 백업이 용이하다.
    
    BIP 39 (Bitcoin Improvement Proposal 39)
        목적: 사용자 친화적인 시드 생성 표준
        기능: 무작위로 생성된 숫자(엔트로피)를 니모닉 코드(인간이 읽기 쉬운 12개 또는 24개 단어)로 변환한다.
        특징: 이 단어 목록을 통해 시드를 쉽게 기억하거나 백업할 수 있으며, 이를 다시 복원하여 지갑을 복구할 수 있다.
    
    ethereum-hdwallet 디렉토리 생성:
        https://www.npmjs.com/package/ethereum-hdwallet
        $ npm init -y
        $ npm i -D bip39 ethereum-hdwallet

제네시스 블록 코드 수정 (4) 제네시스 블록에 EOA 수정:
    EOA(외부 소유 계정):
        사용자가 소유하고 제어하는 계정으로, 암호화된 개인 키를 통해 자산을 관리하거나 트랜잭션을 수행하는 역할을 한다.

    wallet.txt 기반으로 작성한 제네시스 파일:
    {
        "gasLimit" : "0x0",
        "difficulty" : "0x0",
        "alloc" : {
            "e4eae9a6f00a0f491b11c39f5f1d3290e235d3b1" : {"balance" : "10000000000000000000000000"},
            "5cae8fc105b965159d5c6c58eec3354e32bf94a3" : {"balance" : "10000000000000000000000000"},
            "1cc3ae70d0485f063ca4de0c5512823672576427" : {"balance" : "10000000000000000000000000"},
            "afeb1e979cab33337a26f1e72620ba3991a2432c" : {"balance" : "10000000000000000000000000"},
            "aa5008e9aa401993a32a08bca4ffc9b1071cd212" : {"balance" : "10000000000000000000000000"},
            "673b445b80a70f971e1306fd6efdb83803c92bd5" : {"balance" : "10000000000000000000000000"},
            "9cf22b063bfe425cbdf009e949c8cca53d708371" : {"balance" : "10000000000000000000000000"},
            "5e592f6a984a39311ea39b881dd29d6aaf054f7a" : {"balance" : "10000000000000000000000000"},
            "e44a336bcee12624f07b2434e2eef5da02c9a9b5" : {"balance" : "10000000000000000000000000"},
            "02bd60af9f4450ded4eb590b84b5bbaf25d36bf8" : {"balance" : "10000000000000000000000000"},
            "1882ec962a1720652429e26c57871ae8be63f175" : {"balance" : "10000000000000000000000000"},
            "bff7a62149a3c6e76baa92f7b205a9214f0ff6ed" : {"balance" : "10000000000000000000000000"},
            "d6aa835aef466b230aec7a79248f37a25068a9d2" : {"balance" : "10000000000000000000000000"},
            "b541573b7afd4b4f9ba77a7cddf266071ae63732" : {"balance" : "10000000000000000000000000"},
            "da6cebd93f3bca10770c376969255b02f5ff79aa" : {"balance" : "10000000000000000000000000"},
            "12649604e9eeb96e9b1d766177329f4bda5cb0c8" : {"balance" : "10000000000000000000000000"},
            "55685134409b823e0ee767f21bd494bfe98e03d0" : {"balance" : "10000000000000000000000000"},
            "aa41835deacb73d007f1ccf249a85464c0a64a65" : {"balance" : "10000000000000000000000000"},
            "47897598f63c98ba197b89838a4d6130a57eb40a" : {"balance" : "10000000000000000000000000"},
            "a82241d5cf29695b8e9cc9b445db13bd1927e00d" : {"balance" : "10000000000000000000000000"}
        }
    }

    geth 코드 - 동적 메모리 할당:
        go-ethereum\core\mkalloc.go, line: 20
        $ go run mkalloc.go genesis.json:
            $ cd core/
            $ go run mkalloc.go ../genesis.json
        const allocData = "\xf9\x02\xa8\xe1\x94\x02\xbd`\xaf\x9fDP\xde\xd4\xebY\v\x84\xb5\xbb\xaf%\xd3k\xf8\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x12d\x96\x04\xe9\xee\xb9n\x9b\x1dvaw2\x9fK\xda\\\xb0\u020b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x18\x82\xec\x96*\x17 e$)\xe2lW\x87\x1a\xe8\xbec\xf1u\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x1c\u00eep\xd0H_\x06<\xa4\xde\fU\x12\x826rWd'\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94G\x89u\x98\xf6<\x98\xba\x19{\x89\x83\x8aMa0\xa5~\xb4\n\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94UhQ4@\x9b\x82>\x0e\xe7g\xf2\x1b\u0514\xbf\xe9\x8e\x03\u040b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\\\xae\x8f\xc1\x05\xb9e\x15\x9d\\lX\xee\xc35N2\xbf\x94\xa3\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94^Y/j\x98J91\x1e\xa3\x9b\x88\x1d\u049dj\xaf\x05Oz\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94g;D[\x80\xa7\x0f\x97\x1e\x13\x06\xfdn\xfd\xb88\x03\xc9+\u054b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u151c\xf2+\x06;\xfeB\\\xbd\xf0\t\xe9I\xc8\u0325=p\x83q\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u1528\"A\xd5\xcf)i[\x8e\x9c\u0274E\xdb\x13\xbd\x19'\xe0\r\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152aA\x83]\xea\xcbs\xd0\a\xf1\xcc\xf2I\xa8Td\xc0\xa6Je\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152aP\b\xe9\xaa@\x19\x93\xa3*\b\xbc\xa4\xff\u0271\a\x1c\xd2\x12\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152f\xeb\x1e\x97\x9c\xab33z&\xf1\xe7& \xba9\x91\xa2C,\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u1535AW;z\xfdKO\x9b\xa7z|\xdd\xf2f\a\x1a\xe672\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u153f\xf7\xa6!I\xa3\xc6\xe7k\xaa\x92\xf7\xb2\x05\xa9!O\x0f\xf6\xed\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\u05aa\x83Z\xefFk#\n\xeczy$\x8f7\xa2Ph\xa9\u048b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xdal\xeb\xd9?;\xca\x10w\f7ii%[\x02\xf5\xffy\xaa\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xe4J3k\xce\xe1&$\xf0{$4\xe2\xee\xf5\xda\x02\u0269\xb5\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xe4\xea\xe9\xa6\xf0\n\x0fI\x1b\x11\u00df_\x1d2\x90\xe25\u04f1\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00"

    geth 코드 - 초기 블록 생성 go-ethereum\core\genesis_alloc.go, line: 24
        const mainnetAllocData = "\xf9\x02\xa8\xe1\x94\x02\xbd`\xaf\x9fDP\xde\xd4\xebY\v\x84\xb5\xbb\xaf%\xd3k\xf8\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x12d\x96\x04\xe9\xee\xb9n\x9b\x1dvaw2\x9fK\xda\\\xb0\u020b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x18\x82\xec\x96*\x17 e$)\xe2lW\x87\x1a\xe8\xbec\xf1u\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\x1c\u00eep\xd0H_\x06<\xa4\xde\fU\x12\x826rWd'\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94G\x89u\x98\xf6<\x98\xba\x19{\x89\x83\x8aMa0\xa5~\xb4\n\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94UhQ4@\x9b\x82>\x0e\xe7g\xf2\x1b\u0514\xbf\xe9\x8e\x03\u040b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\\\xae\x8f\xc1\x05\xb9e\x15\x9d\\lX\xee\xc35N2\xbf\x94\xa3\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94^Y/j\x98J91\x1e\xa3\x9b\x88\x1d\u049dj\xaf\x05Oz\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94g;D[\x80\xa7\x0f\x97\x1e\x13\x06\xfdn\xfd\xb88\x03\xc9+\u054b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u151c\xf2+\x06;\xfeB\\\xbd\xf0\t\xe9I\xc8\u0325=p\x83q\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u1528\"A\xd5\xcf)i[\x8e\x9c\u0274E\xdb\x13\xbd\x19'\xe0\r\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152aA\x83]\xea\xcbs\xd0\a\xf1\xcc\xf2I\xa8Td\xc0\xa6Je\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152aP\b\xe9\xaa@\x19\x93\xa3*\b\xbc\xa4\xff\u0271\a\x1c\xd2\x12\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u152f\xeb\x1e\x97\x9c\xab33z&\xf1\xe7& \xba9\x91\xa2C,\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u1535AW;z\xfdKO\x9b\xa7z|\xdd\xf2f\a\x1a\xe672\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\u153f\xf7\xa6!I\xa3\xc6\xe7k\xaa\x92\xf7\xb2\x05\xa9!O\x0f\xf6\xed\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\u05aa\x83Z\xefFk#\n\xeczy$\x8f7\xa2Ph\xa9\u048b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xdal\xeb\xd9?;\xca\x10w\f7ii%[\x02\xf5\xffy\xaa\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xe4J3k\xce\xe1&$\xf0{$4\xe2\xee\xf5\xda\x02\u0269\xb5\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00\xe1\x94\xe4\xea\xe9\xa6\xf0\n\x0fI\x1b\x11\u00df_\x1d2\x90\xe25\u04f1\x8b\bE\x95\x16\x14\x01HJ\x00\x00\x00"

역대 이더리움 하드포크 살펴보기:
    https://ethereum.org/en/history/

체인 하드포크 (1) 메인넷 컨피그에 하드포크 코드 추가:
    geth 코드 - 블록체인 네트워크(메인넷) 구성 설정:
        go-ethereum\params\config.go, line: 102
        MainnetChainConfig = &ChainConfig{
            SimpleBlock:                   big.NewInt(100),
        }

    geth 코드 - Ethash 프로토콜 변경 사항:
        go-ethereum\params\config.go, line: 297
        AllEthashProtocolChanges = &ChainConfig{big.NewInt(1337), big.NewInt(0), nil, false, big.NewInt(0), common.Hash{}, big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), b 시 할당된 계좌 및 자산 정의:
       ig.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), nil, nil, nil, nil, false, new(EthashConfig), nil}
    
    geth 코드 - Clique 프로토콜 변경 사항:
        go-ethereum\params\config.go, line: 304
        AllCliqueProtocolChanges = &ChainConfig{big.NewInt(1337), big.NewInt(0), nil, false, big.NewInt(0), common.Hash{}, big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), nil, nil, nil, nil, nil, nil, false, nil, &CliqueConfig{Period: 0, Epoch: 30000}}

    geth 코드 - 테스트 환경 변경 사항:
        go-ethereum\params\config.go, line: 306 
        TestChainConfig = &ChainConfig{big.NewInt(1), big.NewInt(0), nil, false, big.NewInt(0), common.Hash{}, big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), big.NewInt(0), nil, nil, nil, nil, false, new(EthashConfig), nil}

    geth 코드 - 하드포크와 업그레이드 시점 설정:
        go-ethereum\params\config.go, line: 396
        type ChainConfig struct {
            SimpleBlock         *big.Int `json:"simpleBlock,omitempty"`
        }

    geth 코드 - 블록체인 네트워크(메인넷)의 구성 정보를 문자열로 출력하는 기능:
        go-ethereum\params\config.go, line: 492
        func (c *ChainConfig) String() string {
            if c.SimpleBlock != nil {
                banner += fmt.Sprintf(" - Simple:                %-8v (https://github.com/ethereum/execution-specs/blob/master/network-upgrades/mainnet-upgrades/gray-glacier.md)\n", c.SimpleBlock)
            }
        }

    geth 코드 - 포크된 상태인지 여부를 판단:
        go-ethereum\params\config.go, line: 590
        func (c *ChainConfig) IsSimple(num *big.Int) bool {
            return isForked(c.SimpleBlock, num)
        }

    geth 코드 - 하드포크들이 올바른 순서로 활성화되었는지 확인:
        go-ethereum\params\config.go, line: 632
        func (c *ChainConfig) CheckConfigForkOrder() error {
            for _, cur := range []fork{
                {name: "simpleBlock", block: c.SimpleBlock},
            }
        }

    geth 코드 - 블록 번호와 네트워크 상태에 따라 적절한 규칙을 동적으로 생성:
        go-ethereum\params\config.go, line: 818
        func (c *ChainConfig) Rules(num *big.Int, isMerge bool) Rules {
            return Rules{
                IsSimple:         c.IsSimple(num),
            }
        }

체인 하드포크 (2) 블록 리워드 코드 추가:
    geth 코드 - 여러 가지 상수와 난이도 조정 알고리즘:
        go-ethereum\consensus\ethash\consensus.go, line: 45
        var (
            SimpleBlockReward             = big.NewInt(2e+18)
        )

    geth 코드 - 채굴 보상(리워드) 계산:
        go-ethereum\consensus\ethash\consensus.go, line: 662
        func accumulateRewards(config *params.ChainConfig, state *state.StateDB, header *types.Header, uncles []*types.Header) {
            if config.IsSimple(header.Number) {
                blockReward = SimpleBlockReward
            }
        }
	
    geth 코드 - 블록체인 또는 스마트 컨트랙트 관련 설정값들을 기본값으로 초기화하는 함수
        go-ethereum\core\vm\runtime\runtime.go, line: 71
        func setDefaults(cfg *Config) {
            if cfg.ChainConfig == nil {
                cfg.ChainConfig = &params.ChainConfig{
                    SimpleBlock:         new(big.Int),
                }
            }
        }

체인 하드포크 (3) 블록 생성 컨센서스 코드 추가:
    geth 코드 - 상수 선언:
        go-ethereum\consensus\ethash\consensus.go, line: 71
        var (
            big5          = big.NewInt(5)
        )

    geth 코드 - 이더리움의 난이도 계산 방식:
        go-ethereum\consensus\ethash\consensus.go, line: 397
        func makeDifficultyCalculator(bombDelay *big.Int) func(time uint64, parent *types.Header) *big.Int {
            return func(time uint64, parent *types.Header) *big.Int {
                x.Div(x, big5)
            }
        }

        go-ethereum\consensus\ethash\difficulty.go, line: 148
        func MakeDifficultyCalculatorU256(bombDelay *big.Int) func(time uint64, parent *types.Header) *big.Int {
            return func(time uint64, parent *types.Header) *big.Int {
                x := (time - parent.Time) / 5
            }   
        }

체인 하드포크 (4) 난이도와 난이도 폭탄 코드 추가:
    geth 코드 - EIP 5133: 
        총 1,140만 블록에 걸쳐 명시된 난이도 조정 알고리즘으로 '폭탄'을 조정하는 역할
        go-ethereum\consensus\ethash\consensus.go, line: 55
        var (
            calcDifficultyEip5133 = makeDifficultyCalculator(big.NewInt(11_400_000))
        )

    geth 코드 - 난이도 조정 알고리즘 추가:
        go-ethereum\consensus\ethash\consensus.go, line: 50
        var (
            calcDifficultySimple = makeDifficultyCalculator(big.NewInt(15_000_000))
        )

        go-ethereum\consensus\ethash\consensus.go, line: 346
        func CalcDifficulty(config *params.ChainConfig, time uint64, parent *types.Header) *big.Int {
            next := new(big.Int).Add(parent.Number, big1)
            switch {
            case config.IsSimple(next):
                return calcDifficultySimple(time, parent)
            }
        }