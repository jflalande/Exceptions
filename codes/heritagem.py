class Vehicule():
    def __init__(self):
        print("Vehicule")
    def a(self):
        print("a")

class SigneDeRichesse():
    def __init__(self):
        print("La classe !")
    def b(self):
        print("b")
    def a(self):
        print("je suis riche !")

class Voiture(Vehicule, SigneDeRichesse):
    def __init__(self):
        super(Voiture, self).__init__()
        print("Voiture")

v = Voiture()
v.a()
v.b()
