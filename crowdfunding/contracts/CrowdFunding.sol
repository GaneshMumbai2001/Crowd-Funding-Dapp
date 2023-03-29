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

    function createCampaign(string memory _title,string memory _description,string memory _Owner,uint memory _target,uint memory _amountCollected,uint memory _deadline,string memory _image) public returns (uint){
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

    function donateToCampaign(uint _id) public payable {
        uint amount = msg.value; //msg.value means amount sending by donator
        Campaign storage Campaign= Campaign[_id];
        Campaign.donators.push(msg.sender);
        Campaign.donations.push(amount);

        (bool sent,)= payable(Campaign.owner).call{value:amount} ("");
        if(sent){
            Campaign.amountCollected=Campaign.amountCollected+amount;
        }
    }

    function getDonators(uint _id) public view returns(address[] memory, uint[] memory) {
        return (Campaigns[_id].donators, Campaigns[_id].donations);
    }

    function getCampaigns() public view return(Campaign[] memory) {
Campaign[] memory allCampaigns = new Campaign[](numberOfCampaigns);
for(uint i = 0; i< numberOfCampaigns ; i++){
    Campaign storage item = Campaigns[i];
    allCampaigns[i] = items;
}
return allCampaigns
    }

}
