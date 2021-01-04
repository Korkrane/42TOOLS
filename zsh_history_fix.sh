# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    zsh_history_fix                                    :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: bahaas <bahaas@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2021/01/04 13:21:28 by bahaas            #+#    #+#              #
#    Updated: 2021/01/04 13:21:38 by bahaas           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

#!/usr/bin/bash

# Fixes a corrupt .zsh_history file
mv ~/.zsh_history ~/.zsh_history_bad
strings ~/.zsh_history_bad > ~/.zsh_history
fc -R ~/.zsh_history
rm ~/.zsh_history_bad

