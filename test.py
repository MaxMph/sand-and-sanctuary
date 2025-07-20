
# name = input("what your name? ")
choice_1 = ("yes", "no", "who are you?", "...")
choice_2 = ()

def show_choices(choice):
    for i in choice:
        #print(choice_1.index(i),": " , i)
        print(f"{choice_1.index(i) + 1}: ", i)

def intro():
    print("hello travler.")
    #name
    name = input("what your name? ")
    print("Nice to meet you", name)
    input("seems like you hit your head pretty hard.")
    print("do you know where you are?")
    show_choices(choice_1)
    input
    # for i in choice_1:
    #     #print(choice_1.index(i),": " , i)
    #     print(f"{choice_1.index(i) + 1}: ", i)
        
    #input("Your lucky you still alive after that,")
    #input("I didnt see the what happened, but based on your current condition, I cant immagine it went very well.")
    #choices = ("ask what happened", )
    #print("what is your name?")
    #input

# print("hello world")
# print("this is another line")
# print("-------------------")
intro()