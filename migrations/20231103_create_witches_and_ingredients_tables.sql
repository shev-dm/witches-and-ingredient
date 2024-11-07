-- +goose Up
CREATE TABLE witches (
                         id BIGINT PRIMARY KEY,
                         name VARCHAR,
                         hash VARCHAR
);

CREATE TABLE ingredients (
                             id BIGINT PRIMARY KEY,
                             name VARCHAR
);

CREATE TABLE recipes (
                         id BIGINT PRIMARY KEY,
                         name VARCHAR,
                         quantity BIGINT,
                         brew_time_seconds BIGINT
);

CREATE TABLE recipes_to_ingredients (
                                        recipe_id BIGINT REFERENCES recipes(id) ON DELETE CASCADE,
                                        ingredient_id BIGINT REFERENCES ingredients(id) ON DELETE CASCADE,
                                        PRIMARY KEY (recipe_id, ingredient_id)
);

CREATE TABLE brews (
                       id BIGINT PRIMARY KEY,
                       witch_id BIGINT REFERENCES witches(id) ON DELETE SET NULL,
                       recipe_id BIGINT REFERENCES recipes(id) ON DELETE SET NULL,
                       status BIGINT,
                       created_at DATE,
                       updated_at DATE
);

-- +goose Down
DROP TABLE IF EXISTS brews;

DROP TABLE IF EXISTS recipes_to_ingredients;

DROP TABLE IF EXISTS recipes;

DROP TABLE IF EXISTS ingredients;

DROP TABLE IF EXISTS witches;
