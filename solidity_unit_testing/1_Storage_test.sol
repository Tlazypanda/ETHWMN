// SPDX-License-Identifier: GPL-3.0
// Test of the 1_Storage.sol file already present in the default remix workspace

pragma solidity >=0.7.0 <0.9.0;
import "remix_tests.sol"; // this import is automatically injected by Remix.
import "../contracts/1_Storage.sol";

contract StorageTest {
   
    Storage storageToTest;
    function beforeAll () public {
        storageToTest = new Storage();
        storageToTest.store(50);
    }
    
    function checkInitialRetrieve () public {
        assert(storageToTest.retrieve() == uint(50));
    }
    
    function checkStore () public {
        storageToTest.store(100);
        assert(storageToTest.retrieve() ==uint(100));
    }
    
}
