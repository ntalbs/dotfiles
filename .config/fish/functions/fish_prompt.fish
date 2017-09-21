function fish_prompt
  echo -n (whoami)"@macbook "
  set_color $fish_color_cwd
  echo -n (prompt_pwd)
  set_color normal
  echo -n '> '
end
