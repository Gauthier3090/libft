# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: gpladet <marvin@42.fr>                     +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2019/10/09 11:55:40 by gpladet           #+#    #+#              #
#    Updated: 2019/11/23 23:16:38 by gpladet          ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

NAME = libft.a

CC = gcc

CFLAGS = -Wall -Werror -Wextra

LIBFT_PATH = ./libft/

INC_PATH = ./

SRC_PATH = ./

OBJ_PATH = ./objs/

OBJ_BONUS_PATH = ./objsbonus/

INC_NAME = libft.h

SRCS =  ft_memset.c		\
		ft_bzero.c 		\
		ft_memcpy.c 	\
		ft_memccpy.c 	\
		ft_memmove.c 	\
		ft_memchr.c 	\
		ft_memcmp.c 	\
 		ft_strlen.c 	\
		ft_isalpha.c 	\
		ft_isdigit.c 	\
 		ft_isalnum.c 	\
		ft_isascii.c 	\
		ft_isprint.c	\
 		ft_toupper.c	\
		ft_tolower.c	\
		ft_strchr.c		\
 		ft_strrchr.c	\
		ft_strncmp.c	\
		ft_strlcpy.c	\
 		ft_strlcat.c	\
		ft_strnstr.c	\
		ft_atoi.c		\
 		ft_calloc.c		\
		ft_strdup.c		\
		ft_substr.c		\
 		ft_strjoin.c	\
		ft_strtrim.c	\
		ft_split.c		\
		ft_itoa.c		\
		ft_strmapi.c	\
		ft_putchar_fd.c	\
		ft_putstr_fd.c 	\
		ft_putendl_fd.c	\
		ft_putnbr_fd.c

SRCSBONUS = ft_lstnew_bonus.c 			\
 			ft_lstadd_front_bonus.c		\
			ft_lstsize_bonus.c			\
 			ft_lstlast_bonus.c			\
			ft_lstadd_back_bonus.c		\
 			ft_lstdelone_bonus.c 		\
			ft_lstclear_bonus.c			\
 			ft_lstiter_bonus.c			\
			ft_lstmap_bonus.c

OBJ_NAME = $(SRCS:.c=.o)
OBJBONUS_NAME = $(SRCSBONUS:.c=.o)

SRC = $(sort $(addprefix $(SRC_PATH), $(SRCS)))

SRCBONUS = $(sort $(addprefix $(SRC_PATH), $(SRCS)))

INC = $(sort $(addprefix $(INC_PATH), $(INC_NAME)))

OBJ = $(sort $(addprefix $(OBJ_PATH), $(OBJ_NAME)))

OBJBONUS = $(sort $(addprefix $(OBJ_BONUS_PATH), $(OBJBONUS_NAME)))

all: $(NAME) bonus

$(NAME): $(OBJ)
	@echo "\033[91mCreation of $(NAME) ...\033[0m"
	@ar rc $(NAME) $(OBJ)
	@echo "\033[92m$(NAME) created\n\033[0m"

$(OBJ_PATH)%.o: $(SRC_PATH)%.c
	@mkdir $(OBJ_PATH) 2> /dev/null || true
	@$(CC) -o $@ -c $< $(CFLAGS)

bonus: $(OBJBONUS)
	@echo "\033[91mAdd bonus in $(NAME) ...\033[0m"
	@ar rc $(NAME) $(OBJBONUS)
	@echo "\033[92mBonus added in $(NAME)\n\033[0m"

$(OBJ_BONUS_PATH)%.o: $(SRC_PATH)%.c
	@mkdir $(OBJ_BONUS_PATH) 2> /dev/null || true
	@$(CC) -o $@ -c $< $(CFLAGS)

clean:
	@echo "\033[91mDelete .o files of $(NAME) ...\033[0m"
	@rm -f $(OBJ) $(OBJBONUS)
	@rmdir $(OBJ_PATH) 2>/dev/null || true
	@rmdir $(OBJ_BONUS_PATH) 2>/dev/null || true
	@echo "\033[92mFiles .o deleted\n\033[0m"

fclean: clean
	@echo "\033[91mDelete $(NAME)...\033[0m"
	@rm -f $(NAME)
	@echo "\033[92m$(NAME) deleted\n\033[0m"

re: fclean all
