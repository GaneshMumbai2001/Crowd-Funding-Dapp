// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.9;

contract CrowdFunding {
    struct Campaign {
        address owner;
        string title;
        string description;
        uint target;
        uint amountCollected;
        uint deadline;
        string image;
        address[] donators;
        uint[] donations;
    }
    mapping (uint => Campaign) public Campaign;

    uint public numberOfCampaigns = 0;

    function createCampaign(string memory _title,string memory _description,string memory _Owner,uint memory _target,uint memory _amountCollected,uint memory _deadline,string memory _image) public returns {uint}{
        Campaign storage Campaign = Campaigns[numberOfCampaigns];
        require(
            Campaign.deadline > block.timestamp,
            "deadline must be in future"
        );

        Campaign.owner=_Owner;
        Campaign.title=_title;
        Campaign.description=_description;
        Campaign.amountCollected=_amountCollected;
        Campaign.target=_target;
        Campaign.deadline=_deadline;
        Campaign.image=_image;

        numberOfCampaigns++;
            return (numberOfCampaigns -1);

    }

    function donateToCampaign() public {}

    function getDonators() public {}

    function getCampaigns() public {}

}
