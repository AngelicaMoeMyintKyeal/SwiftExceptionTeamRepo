<p align="center">
<img width="120" alt="IdeaBankLogo" src="https://user-images.githubusercontent.com/74500135/217266584-fe6d83db-0d41-414a-bce4-a34cb4f58be3.png">
<h1 align="center">Swift Exception Team's Repository </h1>
<div style="text" align="center">

![Version](https://img.shields.io/static/v1?label=Version&message=1.0&color=brightgreen)
![Swift Version](https://img.shields.io/static/v1?label=Swift%20Version&message=5&color=brightgreen&logo=swift)
![Frameworks](https://img.shields.io/static/v1?label=Frameworks&message=SwiftUI&color=brightgreen&logo=swift)

</div>
</p>

<details>
  <summary>Table of Contents</summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
    </li>
    <li>
      <a href="#application-name">Application Name</a>
    </li>
    <li><a href="#application-description">Application Description</a></li>
    <li><a href="#branches">Branches</a></li>
    <li><a href="#installation">Installation</a></li>
    <li><a href="#roadmap">Roadmap</a></li>
    <li><a href="#authors-and-contributors">Authors and Contributors</a></li>
    <li><a href="#license">License</a></li>
    <li><a href="#project-status">Project Status</a></li>
  </ol>
</details>

## About The Project

Brainstorming ideas can be fun, but also frustrating sometimes. 

Our main goal is to help users brainstorm ideas by providing random words and asking the user to come up with ideas based on them. To make it more fun, we have implmented addictive animations where users can swipe left or right on the cards to select or discard the word. 

We originally used an API to get the definitions of our random words. However, this was not particularly useful so it was discarded.
The information about the public `API` implemented in this project can found here -> [Free Dictionary API](https://dictionaryapi.dev)

Our project release schedule style is weekly sprint.

## Application Name
`
Idea Bank
`

## Application Description

Our application presents random words displayed on cards to the user. The user can swipe to select or discard a word. When 10 words are selected, we display three of the selected words at random and prompt the users to come up with an idea based on them. The user can select which ideas to save. 

## Branches

`main` - most stable branch and contains the final codes release

`dev-master` - branch for merging of the currently in progress codes

## Installation

1. Clone the repository (either with https or ssh)

  - https

  ```sh
  git clone https://github.com/AngelicaMoeMyintKyeal/SwiftExceptionTeamRepo.git
  ```

  - ssh
  
  ```sh
  git clone git@github.com:AngelicaMoeMyintKyeal/SwiftExceptionTeamRepo.git
  ```

2. Open the `.xcodeproj` file.

## Roadmap

- Week One (09/January/2023 - 13/January/2023)
  - Release initial first screen 
  - Shuffle cards animation

- Week Two (16/January/2023 - 20/January/2023)
  - Release additional second screen
  - Implement the API to get the random words' definitions.
  - Support both Light and Dark modes system.

- Week Three (23/January/2023 - 27/January/2023)
  - Release all the finished screens
  - Implement core data to store the definitions of the words given from the API.
  
- Week Four (30/January/2023 - 03/February/2023)
  - Release additional phase screen
  - Codes clean up and refactoring
  - Fortify the project's software architecture
  - Do some final codes changes

## Authors and Contributors

- [Htet Myat Moe Myin Kyeal](https://gitlab.com/AngelicaMoeMyintKyeal)
- [Séamus Ó Connor](https://github.com/shinra-electric)
- [Pierpaolo Siciliano](https://github.com/PierSic-dev)
- [Andrea Copellino](https://github.com/andreacopellino1)

## License

- GNU General Public License (GPLv3)

## Project Status

- Complete
