STACK_STD	=	std_stack

STACK_FT	=	ft_stack

STACK_SRC =	./mains/stack_tester.cpp

STACK_OBJ =	$(STACK_SRC:.cpp=.o)

VEC_STD	=	std_vector

VEC_FT	=	ft_vector

VEC_SRC =	./mains/vector_tester.cpp

VEC_OBJ =	$(VEC_SRC:.cpp=.o)

CHECKER = checker

CHECKER_SRC = ./utils/checker.cpp

CHECKER_OBJ = $(CHECKER_SRC:.cpp=.o)

TESTOUT = ./testOutput/

TESTPATH = mains/

CFLAGS	=   #-Wall -Werror -Wextra

CC		=	c++

all		:	dir vector stack checker

dir :
	mkdir -p exe
	mkdir -p diff
	mkdir -p testOutput

stack: $(STACK_OBJ) dir checker
	$(CC) $(CFLAGS) -D STD -c $(STACK_SRC) -o $(STACK_OBJ)
	$(CC) $(CFLAGS) -o exe/$(STACK_STD) $(STACK_OBJ)
	$(CC) $(CFLAGS) -D FT -c $(STACK_SRC) -o $(STACK_OBJ)
	$(CC) $(CFLAGS) -o exe/$(STACK_FT) $(STACK_OBJ)

vector: $(VEC_OBJ) dir checker
	$(CC) $(CFLAGS) -D STD -c $(VEC_SRC) -o $(VEC_OBJ)
	$(CC) $(CFLAGS) -o exe/$(VEC_STD) $(VEC_OBJ)
	$(CC) $(CFLAGS) -D FT -c $(VEC_SRC) -o $(VEC_OBJ)
	$(CC) $(CFLAGS) -o exe/$(VEC_FT) $(VEC_OBJ)


checker : $(CHECKER_OBJ)
	$(CC) $(CFLAGS) -c $(CHECKER_SRC) -o $(CHECKER_OBJ)
	$(CC) $(CFLAGS) -o exe/$(CHECKER) $(CHECKER_OBJ)

clean	:
	rm -f $(VEC_OBJ) $(STACK_OBJ) $(CHECKER_OBJ)

fclean	:	clean
	rm -rf exe
	rm -rf diff
	rm -rf testOutput

re		:	fclean all

.phony	:	re clean fclean .c.o checker stack vector