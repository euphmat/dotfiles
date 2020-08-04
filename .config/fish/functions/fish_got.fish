function got
  git status
  git add -A
  git status
  git commit -m "$argv"
  git status
  git push
  git status
end
