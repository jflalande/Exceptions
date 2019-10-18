public class Vehicule {

    public String marque = null;
    public Moteur m = null;
    /* Constructeur par défaut */
    public Vehicule() { this.marque = "Peugeot"; this.m = new Moteur(); }
    /* Constructeur sympa */
    public Vehicule(String marque) {
        this.marque = marque;
        this.m = new Moteur();
    }
    /* Constructeur par recopie */
    public Vehicule(Vehicule v) {
        // this.moteur = v.moteur; // Hérésie
        this.m = new Moteur(); // Pas top, mais mieux
        this.marque = v.marque; // Possible et toléré car String immutable
        this.marque = new String(v.marque);
    }
}