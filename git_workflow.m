
% Creates initial repository tracking all files under some root folder
cd 'C:/Documents and Settings/jec164/My Documents/Dropbox/Batista Lab/Matlab/Trajectory Comparison Project'
git init

% Shows changes made to all files in repo (none so far)
git status

% Create a new file and add some code
edit foo.m

% Check repo status, after new file created
git status

% Add foo.m to your repo
git add foo.m

% Commit your changes to a new branch, with comments
git commit -m 'Created new file, foo.m'


% Other useful commands (replace ellipses with appropriate args)
git checkout ...       % To return to an earlier node in branch
git branch ...         % To create or move to another branch
git merge ...          % When merge conflicts arise
git diff ...           % See line-by-line changes

