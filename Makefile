NAME :=so_long

INCLUDES 		:= ./includes
PATH_SRC 		:= ./src

PATH_LIBFT 		:= ${INCLUDES}/libft
libftincludes 	:= ${PATH_LIBFT}/
libft.a 		:= ${PATH_LIBFT}/libft.a

PATH_GNL        := ${INCLUDES}/gnl
gnlincludes 	:= ${PATH_GNL}/
gnl.a			:= ${PATH_GNL}/gnl.a

SRC 			:= src/draw.c \
					src/exit.c \
					src/main.c \
					src/parseur.c \
					src/utils.c \
					src/utils2.c

OBJS 			:=${SRC:.c=.o}
bin 			:=./${NAME}

#MY_CFLAGS 		:=-Wshadow -Wdouble-promotion -std=c89 -Os -pipe
CFLAG  			:=-Wall -Wextra -Werror -fsanitize=address
MY_CPPFLAGS		:=-I${INCLUDES} -I${libftincludes} -I${mlxincludes} -I${gnlincludes}

CC 				:= gcc
CFLAGS			:=${CFLAG} ${MY_CFLAGS} 
CPPFLAGS		:=${MY_CPPFLAGS}
LDLIBS     		:=$(libft.a) ${gnl.a}  -lmlx -framework OpenGL -framework AppKit


all:
	@$(MAKE) -j $(NAME)

${NAME}: ${OBJS}
			@$(MAKE) -j -s --no-print-directory -C includes/libft/
			@$(MAKE) -j -s --no-print-directory -C includes/gnl/
			$(CC) $(LDLIBS) $(CFLAGS) ${OBJS} includes/libft/libft.a includes/gnl/gnl.a -o ${NAME}

%.o : %.c
		${CC} -c ${CPPFLAGS} ${CFLAGS} -o $@ $<

clean:
		@$(MAKE) -s --no-print-directory -C includes/libft/ clean
			@$(MAKE) -s --no-print-directory -C includes/gnl/ clean
			${RM} ${OBJS}

fclean: 	clean
			@$(MAKE) -s --no-print-directory -C includes/libft/ fclean
			@$(MAKE) -s --no-print-directory -C includes/gnl/ fclean
			${RM} ${bin}

re: 		fclean all

.PHONY: all clean fclean re
