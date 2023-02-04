# Use modern completion system
autoload -Uz compinit
autoload -U bashcompinit

compinit
bashcompinit

eval "$(register-python-argcomplete3 ros2)"
eval "$(register-python-argcomplete3 colcon)"