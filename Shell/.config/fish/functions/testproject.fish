function language_testing_directory_switcher
  set dir (fd . '/home/fs144/Projects/Testing/' -t d -E __pycache__ -d 2 | fzf)
  cd $dir
end

alias ct language_testing_directory_switcher

function project_directory_switcher
  set dir (fd . '/home/fs144/Projects/' -t d -E __pycache__ -E Testing -E Archived -d 1 | fzf)
  cd $dir
end

alias proj project_directory_switcher
