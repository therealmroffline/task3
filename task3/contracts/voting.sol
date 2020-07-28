pragma solidity >=0.4.21 <0.7.0;

contract voting {

    struct Candidate {
        uint id;
        uint votes;
        string name;
    }
      mapping(uint => Candidate) public candidates;


      uint candidateNo = 0;

      function addCandidate(string memory _name) private {
          candidateNo++;
          candidates[candidateNo] = Candidate(candidateNo, 0, _name);
      }
      function elections() public {
          addCandidate("Candidate 1: Ahmed");
          addCandidate("Candidate 2: Mohamed");
      }

      mapping(address => bool) public voters;

      function vote (uint _candidateId) public {
        require(!voters[msg.sender]);

        // require a valid candidate
        require(_candidateId > 0 && _candidateId <= candidateNo);

        voters[msg.sender] = true;

        candidates[_candidateId].votes ++;
    }
}
