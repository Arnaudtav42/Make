NAME = libftprintf.a
SRC = 					 	ft_get_flags.c \
							ft_write_int.c \
							ft_write_char.c \
							ft_write_str.c \
							ft_write_unsigned.c \
							ft_printf.c\
							
OBJ = ${SRC:.c=.o}
CC = gcc
RM = rm -rf
FLAGS = -Wall -Wextra -Werror

all: ${NAME}

.c.o:
		${CC} ${FLAGS} -c $< -o $@

${NAME} : ${OBJ}
		${MAKE} all -C ./libft
		cp libft/libft.a ${NAME}
		ar rcs ${NAME} ${OBJ}
all: ${NAME}

clean:
		${MAKE} clean -C ./libft
		${RM} $(OBJ)

fclean: clean
		${MAKE} fclean -C ./libft
		${RM} $(NAME)

re: fclean ${NAME} 

.PHONY: libftprintf.a all clean fclean re
