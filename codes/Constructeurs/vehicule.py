class Vehicule:

    def __init__(self):
        self.marque = "Peugeot"

    def __init__(self, marque): # Vient d'écraser le constructeur précédent
        self.marque = marque

# v = Vehicule() # Plante ! Pas de surcharge de constructeur !
m2 = "Toyota"
v2 = Vehicule(m2)
m3 = "Nissan"
v3 = Vehicule(m3)
print("v2.marque: " + v2.marque)
print("v3.marque: " + v3.marque)
