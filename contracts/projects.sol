// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract PriceOracleBTCUSD {
    address public owner;
    uint256 public latestPrice;
    uint256 public lastUpdated;

    struct PriceData {
        uint256 price;
        uint256 timestamp;
    }

    mapping(uint256 => PriceData) public priceHistory;
    uint256 public updateCount;

    event PriceUpdated(uint256 indexed newPrice, uint256 indexed timestamp);
    event OwnerChanged(address indexed oldOwner, address indexed newOwner);

    modifier onlyOwner() {
        require(msg.sender == owner, "Not authorized");
        _;
    }

    constructor(uint256 _initialPrice) {
        owner = msg.sender;
        latestPrice = _initialPrice;
        lastUpdated = block.timestamp;
        updateCount = 1;
        priceHistory[updateCount] = PriceData(_initialPrice, block.timestamp);
        emit PriceUpdated(_initialPrice, block.timestamp);
    }

    function updatePrice(uint256 _newPrice) public onlyOwner {
        require(_newPrice > 0, "Invalid price");
        latestPrice = _newPrice;
        lastUpdated = block.timestamp;
        updateCount++;
        priceHistory[updateCount] = PriceData(_newPrice, block.timestamp);
        emit PriceUpdated(_newPrice, block.timestamp);
    }

    function getLatestPrice() public view returns (uint256, uint256) {
        return (latestPrice, lastUpdated);
    }

    function getPriceAt(uint256 _updateId) public view returns (uint256, uint256) {
        require(_updateId > 0 && _updateId <= updateCount, "Invalid update ID");
        PriceData memory data = priceHistory[_updateId];
        return (data.price, data.timestamp);
    }

    function transferOwnership(address _newOwner) public onlyOwner {
        require(_newOwner != address(0), "Invalid address");
        emit OwnerChanged(owner, _newOwner);
        owner = _newOwner;
    }
}
