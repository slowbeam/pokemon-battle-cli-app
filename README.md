#POKEMON BATTLE Version 1.0 06/20/2018

Pokemon Battle is an interactive CLI game that allows you to choose and battle against a Pokemon enemy. All Pokemon stats and information are loaded into the game via the Pokemon API(https://pokeapi.co/).


#INSTALLATION
In order to play:
1. Enter into the correct directory where the game is located.
2. Run bundle install in your terminal. If you are having issues with installing Rmagick, the following steps should help you complete the installation:
 a. brew uninstall imagemagick
 b. brew install imagemagick@6
 c. export PATH="/usr/local/opt/imagemagick@6/bin:$PATH"
 d. brew link --force imagemagick@6
 e. gem install rmagick
3. Run rake db:seed in your terminal.
4. In your terminal, run ruby bin/run.rb

#CONTRIBUTOR'S GUIDE
1. On GitHub, the repository is located here: <https://github.com/slowbeam/pokemon-battle-cli-app>
2. When contributing to this repository, please discuss the change you wish to make with the owners of the repository prior to making the changes.
3. PULL REQUEST GUIDELINES:
 a. Update the README.md with details of the changes to the project interface, increase the version number.
 b. Ensure that your commit and pull request message includes details of the changes made in that specific commit. Please also aim to make smaller commits for easier review.
 c. You may merge the pull request once it has been approved by the main contributors of this project- Sandy Edwards, Changmin Lim, and Sarah Rivas.  
4. CODE OF CONDUCT
   As contributors and maintainers, we foster an opening and welcoming environment. Project maintainers have the right and responsibility to remove, edit, or reject comments, commits, code that are not aligned to our mission of keeping our environment, open, welcoming and harrassment-free.  

#LICENSE
Pokemon Battle is a an interactive CLI game that allows you to choose a Pokemon and battle others.
   Copyright (C) June 20, 2018 Sandy Edwards (slowbeam@github.com), Changmin Lim (cl2534@github.com), Sarah Rivas (sarahrivas@github.com).

   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU Affero General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU Affero General Public License for more details.
