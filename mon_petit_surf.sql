-- CREATION DE LA BASE DE DONNEE
CREATE DATABASE IF NOT EXISTS mon_petit_surf CHARACTER SET UTF8 COLLATE utf8_general_ci;

USE mon_petit_surf;

CREATE TABLE users(
    id INT NOT NULL AUTO_INCREMENT,
    username VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    street VARCHAR(255),
    zip_code INT,
    city VARCHAR(255),
    status VARCHAR(255) NOT NULL DEFAULT 'user',
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE spots(
    id INT NOT NULL AUTO_INCREMENT,
    spot_name VARCHAR(255) NOT NULL,
    latitude DECIMAL(4,2) NOT NULL,
    longitude DECIMAL(5,2) NOT NULL,
    department VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- CREATE TABLE spot_grades(
--     id INT NOT NULL AUTO_INCREMENT,
--     showers BOOLEAN NOT NULL,
--     trash_cans BOOLEAN NOT NULL,
--     parking_spots BOOLEAN NOT NULL,
--     parking_spots_availibility BOOLEAN NOT NULL,
--     catering_area BOOLEAN NOT NULL,
--     spot_id INT NOT NULL,
--     PRIMARY KEY(id),
--     CONSTRAINT fk_spot_grades_spots FOREIGN KEY(spot_id) REFERENCES spots(id)
-- ) ENGINE = INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE utilities(
    id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    PRIMARY KEY(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE users_register_spots(
    user_id INT NOT NULL,
    spot_id INT NOT NULL,
    created_at DATETIME NOT NULL,
    -- Quand est ce que l'utilisateur à modifié ses favoris
    updated_at DATETIME,
    PRIMARY KEY(user_id, spot_id),
    CONSTRAINT fk_users_register_spots_user FOREIGN KEY(user_id) REFERENCES users(id),
    CONSTRAINT fk_users_register_spots_spot FOREIGN KEY(spot_id) REFERENCES spots(id)
) ENGINE = INNODB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


-- SPOTS
INSERT INTO spots (spot_name, latitude, longitude, department) VALUES
("Lacanau-Océan", 45.00, -1.19, "Gironde"),
("Saint-Jean-de-Luz", 43.39, -1.66, "Pyrénées-Atlantique"),
("Hendaye", 43.36, -1.77, "Pyrénées-Atlantique"),
("Bidart", 43.44, -1.59, "Pyrénées-Atlantique"),
("Biarritz", 43.48, -1.56, "Pyrénées-Atlantique"),
("Capbreton", 43.64, -1.43, "Landes"),
("Seignosse", 43.69, -1.37, "Landes"),
("Vieux-Boucau-les-Bains", 43.79, -1.4, "Landes"),
("Messanges", 43.82, -1.38, "Landes"),
("Moliets-et-Maa", 43.85, -1.36, "Landes"),
("Contis Sud", 44.08, -1.31, "Landes"),
("Mimizan Plage", 44.21, -1.29, "Landes"),
("Cap de l'Homy", 44.04, -1.34, "Landes"),
("Saint-Girons Plage", 43.95, -1.36, "Landes"),
("Biscarosse Plage", 44.45, -1.25, "Landes"),
("Cap Ferret", 44.62, -1.25, "Gironde"),
("Carcans Plage", 45.08, -1.19, "Gironde"),
("Hourtin Plage", 45.22, -1.17, "Gironde"),
("Montalivet-les-Bains", 45.38, -1.15, "Gironde"),
("Le Gurp", 45.43, -1.15, "Gironde"),
("L'Amélie", 45.48, -1.15, "Gironde"),
("Soulac-sur-Mer", 45.51, -1.13, "Gironde"),
("Le Verdon-sur-Mer", 45.55, -1.06, "Gironde"),
("Pontaillac", 45.63, -1.05, "Charente-Maritime"),
("Saint-Trojan-les-Bains", 45.84, -1.21, "Charente-Maritime"),
("Le Grand Village", 45.71, -1.23, "Charente-Maritime"),
("Les Huttes", 45.53, -1.11, "Charente-Maritime"),
("Chassiron", 46.04, -1.40, "Charente-Maritime"),
("Grignon", 46.21, -1.53, "Charente-Maritime"),
("Les Conches", 46.39, -1.47, "Vendée"),
("Jard-sur-Mer", 46.42, -1.58, "Vendée"),
("La tranche-sur-Mer", 46.34, -1.44, "Vendée"),
("Les Sables-d'Olonne", 46.5, -1.78, "Vendée"),
("L'Aubraie", 46.52, -1.81, "Vendée"),
("Brem-sur-Mer", 46.6, -1.83, "Vendée"),
("Bretignolles-sur-Mer", 46.63, -1.86, "Vendée"),
("Saint-Gilles-Croix-de-Vie", 46.7, -1.95, "Vendée"),
("Saint-Jean-de-Monts", 46.79, -2.06, "Vendée"),
("La Baule-Escoublac", 47.29, -2.36, "Loire-Atlantique"),
("Quiberon", 47.48, -3.12, "Morbihan"),
("Etel", 47.66, -3.2, "Morbihan"),
("Toulhars", 47.71, -3.38, "Morbihan"),
("Le Fort-Bloqué", 47.74, -3.5, "Morbihan"),
("Guidel-Plage", 47.77, -3.52, "Morbihan"),
("Lesconil", 47.8, -4.22, "Finistère"),
("Saint-Nic", 48.2, -4.28, "Finistère"),
("Penmarch", 47.81, -4.34, "Finistère"),
("Audierne", 48.02, -4.54, "Finistère"),
("Primelin", 48.03, -4.61, "Finistère"),
("Douarnenez", 48.1, -4.33, "Finistère"),
("Cap de la Chèvre", 48.16, -4.56, "Finistère"),
("La Palue", 48.21, -4.54, "Finistère"),
("Kerloch", 48.05, -4.7, "Finistère"),
("Porsmilin", 48.36, -4.68, "Finistère"),
("Le Conquet", 48.36, -4.77, "Finistère"),
("Lampaul-Plouarzel", 48.45, -4.76, "Finistère"),
("Kerlouan", 48.65, -4.37, "Finistère"),
("Dossen", 48.7, -4.05, "Finistère"),
("Locquirec", 48.69, -3.65, "Finistère"),
("Trestraou", 48.82, -3.47, "Côtes-d'Armor");
