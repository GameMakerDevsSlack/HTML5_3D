{
    "id": "520ab320-8de8-4ec3-905f-d6b7406cb4e3",
    "modelName": "GMExtension",
    "mvc": "1.0",
    "name": "JS",
    "IncludedResources": [
        
    ],
    "androidPermissions": [
        
    ],
    "androidProps": true,
    "androidactivityinject": "",
    "androidclassname": "",
    "androidinject": "",
    "androidmanifestinject": "",
    "androidsourcedir": "",
    "author": "",
    "classname": "",
    "copyToTargets": -1,
    "date": "2017-28-15 02:06:49",
    "description": "",
    "extensionName": "",
    "files": [
        {
            "id": "ef91126c-35bb-4c0a-b207-5daddb64b66d",
            "modelName": "GMExtensionFile",
            "mvc": "1.0",
            "ProxyFiles": [
                
            ],
            "constants": [
                
            ],
            "copyToTargets": 9223372036854775807,
            "filename": "js.js",
            "final": "",
            "functions": [
                {
                    "id": "595ba667-416d-4ecb-a613-c9cff5c6d9b7",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "js_init",
                    "help": "dj_init() : Initializes extension and wipes currently stored functions",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_init",
                    "returnType": 2
                },
                {
                    "id": "ca41ca69-67d8-4286-8705-b2e271cea534",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "js_add",
                    "help": "dj_add(index, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_add",
                    "returnType": 2
                },
                {
                    "id": "7bb3d87c-e3a4-4301-b6ac-f70916d09811",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "js_call",
                    "help": "dj_call(index) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_call",
                    "returnType": 2
                },
                {
                    "id": "ddd5f0e2-996c-4880-be72-636bebeab99f",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "js_exists",
                    "help": "js_exists(index) : Returns if function with given index exists",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_exists",
                    "returnType": 2
                },
                {
                    "id": "9e57a654-d0f0-43be-9869-302cbcf21f68",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 0,
                    "args": [
                        
                    ],
                    "externalName": "js_count",
                    "help": "js_count() : Returns total number of functions loaded",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_count",
                    "returnType": 2
                },
                {
                    "id": "75e0361f-5d7a-456b-9685-422850c17e67",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        1
                    ],
                    "externalName": "js_add1",
                    "help": "js_add1(index, a1, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_add1",
                    "returnType": 2
                },
                {
                    "id": "2491e91f-8fd7-4c61-9679-bc38e4347baf",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 3,
                    "args": [
                        1,
                        1
                    ],
                    "externalName": "js_call1",
                    "help": "js_call1(index, a1) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_call1",
                    "returnType": 2
                },
                {
                    "id": "dfb5e553-a080-487f-a16d-429912947140",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 5,
                    "args": [
                        1,
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "js_add3",
                    "help": "dj_add3(index, a1, a2, a3, code) : Sets contents of function[index] to given code",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_add3",
                    "returnType": 2
                },
                {
                    "id": "ac9b8f1f-160b-46ff-9e26-6873757998b6",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 4,
                    "args": [
                        1,
                        1,
                        1,
                        1
                    ],
                    "externalName": "js_call3",
                    "help": "dj_call3(index, a1, a2, a3) : Calls given function",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_call3",
                    "returnType": 2
                },
                {
                    "id": "31f34c65-1348-4bd1-9bf3-0cbbf76e33ea",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 1,
                    "args": [
                        1
                    ],
                    "externalName": "js_run",
                    "help": "dj_run(code) : Executes piece of code without storing it anywhere",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_run",
                    "returnType": 2
                },
                {
                    "id": "2674c69b-eb91-4ed0-96ce-b91710a57bf5",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        2,
                        1
                    ],
                    "externalName": "js_var_def",
                    "help": "dj_var_def(expr, name)",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_var_def",
                    "returnType": 2
                },
                {
                    "id": "11f710c0-79c0-4e0d-80e5-5dadb1dfc26c",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": 2,
                    "args": [
                        1,
                        2
                    ],
                    "externalName": "js_var_set",
                    "help": "dj_var_set(name, value)",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_var_set",
                    "returnType": 2
                },
                {
                    "id": "b10703be-031a-43c0-b909-99da500c6900",
                    "modelName": "GMExtensionFunction",
                    "mvc": "1.0",
                    "argCount": -1,
                    "args": [
                        
                    ],
                    "externalName": "js_i",
                    "help": "",
                    "hidden": false,
                    "kind": 11,
                    "name": "js_i",
                    "returnType": 2
                }
            ],
            "init": "js_init",
            "kind": 5,
            "order": [
                "595ba667-416d-4ecb-a613-c9cff5c6d9b7",
                "ca41ca69-67d8-4286-8705-b2e271cea534",
                "7bb3d87c-e3a4-4301-b6ac-f70916d09811",
                "ddd5f0e2-996c-4880-be72-636bebeab99f",
                "9e57a654-d0f0-43be-9869-302cbcf21f68",
                "75e0361f-5d7a-456b-9685-422850c17e67",
                "2491e91f-8fd7-4c61-9679-bc38e4347baf",
                "dfb5e553-a080-487f-a16d-429912947140",
                "ac9b8f1f-160b-46ff-9e26-6873757998b6",
                "31f34c65-1348-4bd1-9bf3-0cbbf76e33ea",
                "2674c69b-eb91-4ed0-96ce-b91710a57bf5",
                "11f710c0-79c0-4e0d-80e5-5dadb1dfc26c",
                "b10703be-031a-43c0-b909-99da500c6900"
            ],
            "origname": "extensions\\js.js",
            "uncompress": false
        }
    ],
    "gradleinject": "",
    "helpfile": "",
    "installdir": "",
    "iosProps": true,
    "iosSystemFrameworkEntries": [
        
    ],
    "iosThirdPartyFrameworkEntries": [
        
    ],
    "iosplistinject": "",
    "license": "",
    "maccompilerflags": "",
    "maclinkerflags": "",
    "macsourcedir": "",
    "packageID": "",
    "productID": "",
    "sourcedir": "",
    "version": "1.0.0"
}