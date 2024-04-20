def add_numbers(x, y, fancy_answer=None):

    def use_fancy_answer(z):

        print(f'The answer, milord, is equal to {z}')

    z = x + y

    if fancy_answer is True:

        use_fancy_answer(z)

    else:

        print(f'The answer is: {z}')

add_numbers(12832, 74843, fancy_answer=True)
