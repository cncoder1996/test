pragma solidity >=0.4.24 <0.6.0;
contract Simple {
function buyTokensPresale() public payable onlyInState(State.PresaleRunning)
    {
        // min - 1 ETH
        require(msg.value >= (1 ether / 1 wei));
        uint newTokens = msg.value * PRESALE_PRICE;

        require(presaleSoldTokens + newTokens <= PRESALE_TOKEN_SUPPLY_LIMIT);

        balances[msg.sender] += newTokens;
        supply+= newTokens;
        presaleSoldTokens+= newTokens;
        totalSoldTokens+= newTokens;

        LogBuy(msg.sender, newTokens);
    }

    function buyTokensICO() public payable onlyInState(State.ICORunning)
    {
        // min - 0.01 ETH
        require(msg.value >= ((1 ether / 1 wei) / 100));
        uint newTokens = msg.value * getPrice();

        require(totalSoldTokens + newTokens <= TOTAL_SOLD_TOKEN_SUPPLY_LIMIT);

        balances[msg.sender] += newTokens;
        supply+= newTokens;
        icoSoldTokens+= newTokens;
        totalSoldTokens+= newTokens;

        LogBuy(msg.sender, newTokens);
    }
    }
