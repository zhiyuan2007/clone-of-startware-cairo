touch src/.env
paste:
export STARKNET_ACCOUNT=katana-0
export STARKNET_RPC=http://0.0.0.0:5050

# scarb

scarb build

run in next terminal:
katana 

# declare

starkli declare target/dev/smartcase_hello.contract_class.json
````````````````````
Sierra compiler version not specified. Attempting to automatically decide version to use...
Unknown network. Falling back to the default compiler version 2.1.0. Use the --compiler-version flag to choose a different version.
Declaring Cairo 1 class: 0x00b9535d9e97b840cc8bbf73b207875cafd1d948d420362e33418fd4a53fe36e
Compiling Sierra class to CASM with compiler version 2.1.0...
CASM class hash: 0x05f2d2a3a5bc9f40d2ac9e2b63d19d74829478833b3ddb824e46e2325df79c49
Contract declaration transaction: 0x05a2e023eabfcfe2d1aba0a83e94824d755763fe0f6ed495d2569b70689390f1
Class hash declared:
0x00b9535d9e97b840cc8bbf73b207875cafd1d948d420362e33418fd4a53fe36e

# deploy

require 
1. contract's hash code
2. Constructor arguments

## starkli to-cairo-string hellosmart

0x68656c6c6f736d617274

##  deploy and output

`
starkli deploy 0x00b9535d9e97b840cc8bbf73b207875cafd1d948d420362e33418fd4a53fe36e  0x68656c6c6f736d617274
Deploying class 0x00b9535d9e97b840cc8bbf73b207875cafd1d948d420362e33418fd4a53fe36e with salt 0x07184a76a681f316cbf19f606067148f5fefecd9c969954fd7f79c75aa2278d9...
The contract will be deployed at address 0x002d19d5de44c5d17eb6422b4aed8d1d0a1089a011ed224ae7ec85f09c017b04
Contract deployment transaction: 0x0130ea9e91b60a46c71e4409fcc11f98559e4c921053c1d7efd6aa245a0ff9a2
Contract deployed:
0x002d19d5de44c5d17eb6422b4aed8d1d0a1089a011ed224ae7ec85f09c017b04
`

# interacting with Starknet contracts

two methods:
1. call : read-only
2. invoke  : alter the state

starkli call 0x002d19d5de44c5d17eb6422b4aed8d1d0a1089a011ed224ae7ec85f09c017b04  get_name
[
    "0x0000000000000000000000000000000000000000000068656c6c6f736d617274"
]

starkli parse-cairo-string 0x68656c6c6f736d617274
hellosmart

# modeify contract state

starkli to-cairo-string hellomybaby
0x68656c6c6f6d7962616279

starkli invoke 0x002d19d5de44c5d17eb6422b4aed8d1d0a1089a011ed224ae7ec85f09c017b04 set_name 0x68656c6c6f6d7962616279
Invoke transaction: 0x05c8e9e5bc3b6efb0a4ed467fb67a94c3445649750b304675ec895b5909931c6

starkli call 0x002d19d5de44c5d17eb6422b4aed8d1d0a1089a011ed224ae7ec85f09c017b04  get_name
[
    "0x00000000000000000000000000000000000000000068656c6c6f6d7962616279"
]

starkli parse-cairo-string 0x68656c6c6f6d7962616279
hellomybaby
