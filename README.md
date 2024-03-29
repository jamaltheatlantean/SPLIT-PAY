<a name="readme-top"></a>
[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]
[![Issues][issues-shield]][issues-url]
[![MIT License][license-shield]][license-url]
[![LinkedIn][linkedin-shield]][linkedin-url]


<!-- PROJECT LOGO -->
<br />
<div align="center">
  <a href="[https://github.com/jamaltheatlantean/SPLIT-PAY](https://github.com/jamaltheatlantean/SPLIT-PAY/)">
  </a>

<h3 align="center">SPLIT-PAY</h3>

  <p align="center">
    A contract to help you split your pay with your friends/team/family.
    <br />
    <a href="https://github.com/jamaltheatlantean/SPLIT-PAY"><strong>Explore the docs »</strong></a>
    <br />
    <br />
    <a href="https://github.com/jamaltheatlantean/SPLIT-PAY/issues">Report Bug</a>
    ·
    <a href="https://github.com/jamaltheatlantean/SPLIT-PAY/issues">Request Feature</a>
  </p>
</div>

<!-- TABLE OF CONTENTS -->
<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#prerequisites">Prerequisites</a></li>
        <li><a href="#installation">Installation</a></li>
      </ul>
    </li>
    <li><a href="#usage">Usage</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#contributing">Contributing</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#contact">Contact</a></li>
    <li><a href="#acknowledgments">Acknowledgments</a></li>
  </ol>
</details>

<!-- ABOUT THE PROJECT -->
## About The Project

This contract was created for the sole purpose of team collaborations. As a team, there are situations where it might be quite unecessary to send your client or employer the address of every individual on the team. So this contract is designed to store the address of all team members in the contract address. It is also designed to automatically activate immediately it receives Ether and then evenly divide the value of the Ether by the number of addresses saved in it as payLoad. Each address in the contract is then sent an even share of the payLoad.
But i understand that this project has grown beyond the use of receiving eth from team collaborations. 

<p align="right">(<a href="#readme-top">back to top</a>)</p>



### Built With

* [![Solidity][Soliditylang.org]][Solidity-url]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->
## Getting Started

### Prerequisites

* npm
  ```sh
  npm install npm@latest -g
  ```


### Installation

1. Get a free API Key at [https://alchemy.com](https://alchemy.com)
2. Clone the repo
   ```sh
   git clone https://github.com/jamaltheatlantean/SPLIT-PAY.git
   ```
3. Install NPM packages
   ```sh
   npm install
   ```
4. Enter your API in `config.js`
   ```js
   const API_KEY = 'ENTER YOUR API';
   ```

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- USAGE EXAMPLES -->
## Usage

i.) If you're a freelance developer in partnership with other developers who put in an equal amount of effort to complete the project, this contract is for you.                                                                                                                                                        
ii.) If you don't want to have to do the maths of calculating how to pay a group of people you hired, register their account in the contract, deploy it and worry less.                                                                                                                                              
_And so many more use cases..._


See the [open issues](https://github.com/jamaltheatlantean/SPLIT_PAY) for a full list of proposed features (and known issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

## Features

- Splits payment made to the contract evenly between `payees`.
- Add or remove new `payees` through a multi-sig like system.

## Events
- `PaymentReceived(uint indexed payload):` This event is emitted when funds are transfered to the contract. It emits the amount of funds that were transfered into the contract.
- `PaymentReleased(uint indexed payLoad)`:This event is emitted when the funds are transfered to the payees. It emits the amount of funds that were transfered out.
- `PayeeAdded(address indexed _payee, uint timestamp)`: This event is emitted when a new payee is added to the array of payees. It emits the address and time.
- `PayeeRemoved(address indexed _payee, uint timestamp)`: This event is emitted whenever a payee has been removed from the address of payee. It emits the address of the removed payee and timestamp.


## Modifier
The contract uses only one modifier
`onlyPayees()`: This limits control of the addPayee and removePayee so only the addresses registered as payee can call them.


## Incoming features

A basic front end made with React and [Moralis](https://moralis.io) for easier interaction with the contract.



<!-- CONTRIBUTING -->
## Contributing

Contributions are what make the open source community such an amazing place to learn, inspire, and create. Any contributions you make are **greatly appreciated**.

If you have a suggestion that would make this better, please fork the repo and create a pull request. You can also simply open an issue with the tag "enhancement".
Don't forget to give the project a star! Thanks again!

1. Fork the Project
2. Create your Feature Branch (`git checkout -b feature/AmazingFeature`)
3. Commit your Changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the Branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- LICENSE -->
## License

Distributed under the MIT License. See `LICENSE.txt` for more information.

<p align="right">(<a href="#readme-top">back to top</a>)</p>


<!-- CONTACT -->
## Contact

Jamal The Atlantean(Gabriel Isobara)                                
Send me a tweet - [@twitter](https://twitter.com/ThatAtlantean)                                                            

Or write me a mail - jamaltheatlantean@gmail.com

Project Link: [https://github.com/jamaltheatlantean/SPLIT-PAY](https://github.com/jamaltheatlantean/SPLIT-PAY)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- ACKNOWLEDGMENTS -->
## Acknowledgments

* [Openzeppelin](https://docs.openzeppelin.com/contracts/4.x/api/finance#PaymentSplitter)

<p align="right">(<a href="#readme-top">back to top</a>)</p>



<!-- MARKDOWN LINKS & IMAGES -->
[contributors-shield]: https://img.shields.io/github/contributors/jamaltheatlantean/SPLIT-PAY.svg?style=for-the-badge
[contributors-url]: https://github.com/jamaltheatlantean/SPLIT-PAY/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/jamaltheatlantean/SPLIT-PAY.svg?style=for-the-badge
[forks-url]: https://github.com/jamaltheatlantean/SPLIT-PAY/network/members
[stars-shield]: https://img.shields.io/github/stars/jamaltheatlantean/SPLIT-PAY.svg?style=for-the-badge
[stars-url]: https://github.com/jamaltheatlantean/SPLIT-PAY/stargazers
[issues-shield]: https://img.shields.io/github/issues/jamaltheatlantean/SPLIT-PAY.svg?style=for-the-badge
[issues-url]: https://github.com/jamaltheatlantean/SPLIT-PAY/issues
[license-shield]: https://img.shields.io/github/license/jamaltheatlantean/SPLIT-PAY.svg?style=for-the-badge
[license-url]: https://github.com/jamaltheatlantean/SPLIT-PAY/blob/master/LICENSE.txt
[linkedin-shield]: https://img.shields.io/badge/-LinkedIn-black.svg?style=for-the-badge&logo=linkedin&colorB=555
[linkedin-url]: https://linkedin.com/in/gabriel-isobara
[Soliditylang.org]: https://img.shields.io/badge/solidity-lang-lightgrey
[Solidity-url]: https://soliditylang.org/ 
