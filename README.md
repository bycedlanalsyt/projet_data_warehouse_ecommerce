# 🏢 Data Warehouse E-commerce - Projet Portfolio

> **Projet réalisé dans le cadre du MBA Big Data & IA à MBA ESG Paris**

Ce projet illustre la construction complète d'un Data Warehouse à partir de données fictives d'e-commerce, avec modélisation sous SQL Server et création d'un dashboard Power BI pour l'analyse des ventes, paiements et produits.

## 📋 Table des matières

- [Vue d'ensemble](#vue-densemble)
- [Objectifs du projet](#objectifs-du-projet)
- [Architecture du Data Warehouse](#architecture-du-data-warehouse)
- [Structure du projet](#structure-du-projet)
- [Technologies utilisées](#technologies-utilisées)
- [Installation et utilisation](#installation-et-utilisation)
- [Compétences démontrées](#compétences-démontrées)
- [Auteur](#auteur)

## 🎯 Vue d'ensemble

Ce projet démontre toutes les étapes d'un pipeline décisionnel complet :
- **Extraction** : Importation de données CSV
- **Transformation** : Nettoyage et structuration des données
- **Modélisation** : Schéma en étoile (Star Schema) sous SQL Server
- **Visualisation** : Dashboard Power BI avec mesures DAX avancées

## 🎯 Objectifs du projet

1. Modéliser un Data Warehouse avec un schéma en étoile
2. Gérer les relations entre tables de dimensions et table de faits
3. Créer des vues SQL optimisées pour l'analyse
4. Développer un dashboard Power BI interactif
5. Implémenter des mesures DAX (CA, MTD, YTD, croissance, panier moyen)

## 🏗️ Architecture du Data Warehouse

### Schéma en étoile (Star Schema)

Le Data Warehouse suit une architecture en étoile avec :

#### Tables de dimensions
- **`dim_customers`** : Informations sur les clients (nom, email, région)
- **`dim_products`** : Catalogue produits (nom, catégorie, prix)
- **`dim_regions`** : Géolocalisation des clients
- **`dim_payments`** : Méthodes et statuts de paiement
- **`dim_date`** : Dimension temporelle pour analyses temporelles

#### Table de faits
- **`fact_orders`** : Commandes avec quantité, montant, dates et relations aux dimensions

### Vues SQL pour Power BI

Le projet inclut plusieurs vues optimisées pour l'analyse :

- **`vw_sales_overview`** : Vue globale des ventes avec informations client, produit, région et paiement
- **`vw_sales_by_product`** : Agrégation des ventes par produit
- **`vw_orders_by_region`** : Analyse des commandes par région
- **`vw_payment_success_rate`** : Taux de réussite des paiements

## 📁 Structure du projet

```
Projet_data_warehouse_ecommerce/
├── data/                          # Données sources (CSV)
│   ├── customers_100.csv
│   ├── orders_200.csv
│   ├── payments_200.csv
│   ├── products_100.csv
│   └── regions_100.csv
├── requêtes_sql/                  # Scripts SQL pour création du DWH
│   ├── 01_creation_schema_et_tables_dimensions.sql
│   ├── 02_creation_table_tait.sql
│   ├── 03_vérification_chargement_tables.sql
│   ├── 04_creation_vues_pour_pbix.sql
│   └── 05_verifier_la_liaison_des_tables.sql
├── powerbi/                       # Fichiers Power BI
│   └── Dashborad_E_commerce.pbix
├── images/                        # Captures d'écran du processus
├── docs/                          # Documentation
├── reports/                       # Rapports générés
├── doc.py                         # Script Python pour génération PDF
└── README.md                      # Ce fichier
```

## 🛠️ Outils utilisées

- **Base de données** : Microsoft SQL Server
- **ETL** : Power Query (dans Power BI)
- **Visualisation** : Power BI Desktop
- **Langages** : SQL (SSMS), Python (FPDF pour documentation)
- **Modélisation** : Schéma en étoile (Star Schema)

## 🚀 Installation et utilisation

### Prérequis

- Microsoft SQL Server (2019 ou supérieur)
- SQL Server Management Studio (SSMS)
- Power BI Desktop
- Python 3.x (optionnel, pour génération PDF)

### Étapes d'installation

1. **Création du Data Warehouse**
   ```sql
   -- Exécuter les scripts dans l'ordre :
   -- 1. 01_creation_schema_et_tables_dimensions.sql
   -- 2. 02_creation_table_tait.sql
   ```
   
   ![Création du schéma et des tables de dimensions](images/1.%20CREATION%20DU%20SCHEMA%20ET%20DES%20TABLES%20DE%20DIMENSIONS.png)
   
   ![Création de la table de fait et vérification](images/2.%20CREATION%20DE%20LA%20TABLE%20DE%20FAIT%20ET%20VERIFICATION.png)

2. **Importation des données**
   - Importer les fichiers CSV depuis le dossier `data/` dans les tables correspondantes
   - Utiliser SQL Server Import/Export Wizard ou BULK INSERT

3. **Vérification**
   ```sql
   -- Exécuter :
   -- 3. 03_vérification_chargement_tables.sql
   -- 5. 04_verifier_la_liaison_des_tables.sql
   ```
   
   ![Vérification du chargement des données](images/3.%20VERIFICATION%20DU%20CHARGEMENT%20DES%20DONNEES.png)
   
   ![Vérifier que toutes les tables sont bien reliées](images/4.%20VERIFIER%20QUE%20TOUTES%20LES%20TABLES%20SONT%20BIEN%20RELIEES.png)

4. **Création des vues**
   ```sql
   -- Exécuter :
   -- 4. 05_creation_vues_pour_pbix.sql
   ```
   
   ![Créations des vues pour analyse Power BI](images/5.CREATIONS%20DES%20VUES%20POUR%20ANALYSE%20POWER%20BI.png)

5. **Connexion Power BI**
   - Ouvrir `powerbi/Dashborad_E_commerce.pbix`
   - Configurer la connexion à votre instance SQL Server
   - Rafraîchir les données

### Génération de la documentation PDF

```bash
python doc.py
```

## 💡 Compétences démontrées

### Modélisation de données
- ✅ Conception d'un schéma en étoile (Star Schema)
- ✅ Gestion des clés primaires et étrangères
- ✅ Normalisation et optimisation des tables

### SQL & Base de données
- ✅ Création de schémas et tables sous SQL Server
- ✅ Gestion des contraintes d'intégrité référentielle
- ✅ Création de vues SQL optimisées
- ✅ Requêtes complexes avec JOINs multiples

### Power BI & DAX
- ✅ Importation et transformation des données avec Power Query
- ✅ Création de mesures DAX avancées (CA, MTD, YTD, croissance, panier moyen)
- ✅ Visualisation et storytelling de données
- ✅ Design de dashboard interactif et professionnel

### Pipeline décisionnel
- ✅ Extraction, Transformation, Chargement (ETL)
- ✅ Architecture Data Warehouse
- ✅ Documentation technique

## 📊 Fonctionnalités du Dashboard Power BI

Le dashboard inclut des analyses sur :
- **Vue globale** : Aperçu des ventes et KPIs principaux
   
   ![Vue globale](powerbi/vue%20globale.png)
   
- **Analyse régionale** : Performance des ventes par région
   
   ![Analyse régionale](powerbi/analyse%20regionales.png)
   
- **Analyse produits** : Top produits et catégories
   
   ![Analyse produits](powerbi/analyse%20produits.png)
   
- **Succès des paiements** : Taux de réussite et méthodes de paiement
- **Calendrier** : Analyses temporelles (MTD, YTD)

## 👤 Auteur

**Cédric BOIMIN**

Étudiant en MBA Big Data & IA à MBA ESG Paris

---

*Ce projet fait partie de mon portfolio professionnel et démontre mes compétences en Data Engineering, Business Intelligence et Data Analytics.*

