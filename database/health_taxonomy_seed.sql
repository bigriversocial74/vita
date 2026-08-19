-- Supplement Discovery App
-- Health Goal -> Concern -> Ingredient taxonomy seed
-- MySQL 8.x

CREATE TABLE IF NOT EXISTS health_goals (
  id VARCHAR(10) PRIMARY KEY,
  name VARCHAR(120) NOT NULL,
  slug VARCHAR(140) NOT NULL UNIQUE,
  description TEXT,
  icon VARCHAR(20),
  sort_order INT NOT NULL DEFAULT 0,
  active TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS health_concerns (
  id VARCHAR(12) PRIMARY KEY,
  health_goal_id VARCHAR(10) NOT NULL,
  name VARCHAR(160) NOT NULL,
  slug VARCHAR(180) NOT NULL UNIQUE,
  description TEXT,
  sort_order INT NOT NULL DEFAULT 0,
  active TINYINT(1) NOT NULL DEFAULT 1,
  CONSTRAINT fk_concern_goal FOREIGN KEY (health_goal_id) REFERENCES health_goals(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS ingredients (
  id VARCHAR(12) PRIMARY KEY,
  name VARCHAR(160) NOT NULL,
  slug VARCHAR(180) NOT NULL UNIQUE,
  ingredient_type ENUM('vitamin','mineral','amino_acid','fatty_acid','herbal','probiotic','prebiotic','enzyme','protein','other') NOT NULL DEFAULT 'other',
  description TEXT,
  active TINYINT(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS goal_ingredients (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  health_goal_id VARCHAR(10) NOT NULL,
  ingredient_id VARCHAR(12) NOT NULL,
  relevance ENUM('primary','secondary','emerging') NOT NULL DEFAULT 'secondary',
  evidence_level ENUM('A','B','C','D','NA') NOT NULL DEFAULT 'NA',
  sort_order INT NOT NULL DEFAULT 0,
  UNIQUE KEY uq_goal_ingredient (health_goal_id, ingredient_id),
  CONSTRAINT fk_gi_goal FOREIGN KEY (health_goal_id) REFERENCES health_goals(id),
  CONSTRAINT fk_gi_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

CREATE TABLE IF NOT EXISTS concern_ingredients (
  id BIGINT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  concern_id VARCHAR(12) NOT NULL,
  ingredient_id VARCHAR(12) NOT NULL,
  relevance ENUM('primary','secondary','emerging') NOT NULL DEFAULT 'secondary',
  evidence_level ENUM('A','B','C','D','NA') NOT NULL DEFAULT 'NA',
  sort_order INT NOT NULL DEFAULT 0,
  UNIQUE KEY uq_concern_ingredient (concern_id, ingredient_id),
  CONSTRAINT fk_ci_concern FOREIGN KEY (concern_id) REFERENCES health_concerns(id),
  CONSTRAINT fk_ci_ingredient FOREIGN KEY (ingredient_id) REFERENCES ingredients(id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Seed data source: health_taxonomy_seed.sql from project planning session.
-- The full seed dataset remains unchanged from the analyzed source and should be
-- expanded in subsequent PRs with product, evidence, diet/activity, provider,
-- Academy, recommendation, and safety mappings.

-- Safety / product-positioning note:
-- The taxonomy is for discovery and organization. It should not be used by itself
-- to diagnose disease, recommend treatment, establish individual dosing, or claim
-- that a supplement treats or prevents a medical condition.
