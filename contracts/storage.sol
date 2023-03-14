pragma solidity >=0.7.0 <0.9.0

contract Upload {
    struct Access{
        address user;
        bool access;
    }

    mapping(address=>string[) value;
    mapping(address=>mapping(address=>bool)) ownership;
    mapping(address=>access[]) accessList;
    mapping(address=>mapping(address=>bool)) previousData;

    function add(address _user, string memory url) external {
        value[_user].push(url);
    }

    function allow(address user) external {
        ownership[msg.sender][user]=true;

        accessList[msg.sender].push(Access(user,true));
    }

    function disAllow(address user)public{
        ownership[msg.sender][user]=false;
    }
}