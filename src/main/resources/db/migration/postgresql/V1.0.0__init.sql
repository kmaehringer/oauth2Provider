create table oauth_client_details (
  client_id VARCHAR(256) PRIMARY KEY,
  resource_ids VARCHAR(256),
  client_secret VARCHAR(256),
  scope VARCHAR(256),
  authorized_grant_types VARCHAR(256),
  web_server_redirect_uri VARCHAR(256),
  authorities VARCHAR(256),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additional_information VARCHAR(4096),
  autoapprove VARCHAR(256)
);

create table oauth_client_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256)
);

create table oauth_access_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication_id VARCHAR(256) PRIMARY KEY,
  user_name VARCHAR(256),
  client_id VARCHAR(256),
  authentication BYTEA,
  refresh_token VARCHAR(256)
);

create table oauth_refresh_token (
  token_id VARCHAR(256),
  token BYTEA,
  authentication BYTEA
);

create table oauth_code (
  code VARCHAR(256),
  authentication BYTEA
);

create table oauth_approvals (
	userId VARCHAR(256),
	clientId VARCHAR(256),
	scope VARCHAR(256),
	status VARCHAR(10),
	expiresAt TIMESTAMP,
	lastModifiedAt TIMESTAMP
);

CREATE TABLE t_user (
    username character varying(255) PRIMARY KEY,
    password character varying(255),
    enabled int NOT NULL DEFAULT '1',
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255),
    roles character varying(255)
);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types,
	web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
	('web_app', null, null, 'FOO', 'implicit,password,authorization_code,refresh_token', null, 'FOO_READ,FOO_WRITE', 36000, 36000, null, true);

INSERT INTO t_user (username, password, roles) VALUES ('reader', 'reader', 'FOO_READ'); 
INSERT INTO t_user (username, password, roles) VALUES ('writer', 'writer', 'FOO_READ,FOO_WRITE'); 
