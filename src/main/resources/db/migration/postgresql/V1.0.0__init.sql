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

create table ClientDetails (
  appId VARCHAR(255) PRIMARY KEY,
  resourceIds VARCHAR(255),
  appSecret VARCHAR(255),
  scope VARCHAR(255),
  grantTypes VARCHAR(255),
  redirectUrl VARCHAR(255),
  authorities VARCHAR(255),
  access_token_validity INTEGER,
  refresh_token_validity INTEGER,
  additionalInformation VARCHAR(4096),
  autoApproveScopes VARCHAR(255)
);

CREATE SEQUENCE hibernate_sequence
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

CREATE TABLE t_user (
    username character varying(255) PRIMARY KEY,
    password character varying(255),
    enabled int NOT NULL DEFAULT '1',
    email character varying(255),
    firstname character varying(255),
    lastname character varying(255)
);

CREATE TABLE t_role (
    rolename character varying(255) PRIMARY KEY
);

CREATE TABLE t_user_role (
    username character varying(255) REFERENCES t_user,
    rolename character varying(255) REFERENCES t_role,
    PRIMARY KEY (username, rolename)
);

INSERT INTO oauth_client_details (client_id, resource_ids, client_secret, scope, authorized_grant_types,
	web_server_redirect_uri, authorities, access_token_validity, refresh_token_validity, additional_information, autoapprove)
VALUES
	('web_app', null, 'web_app_secret', 'FOO', 'implicit,password,authorization_code,refresh_token', null, 'FOO_READ,FOO_WRITE', 36000, 36000, null, true);

INSERT INTO t_user (username, password) VALUES ('reader', 'reader'); 
INSERT INTO t_user (username, password) VALUES ('writer', 'writer');
INSERT INTO t_role (rolename) VALUES ('FOO_READ');
INSERT INTO t_role (rolename) VALUES ('FOO_WRITE');
INSERT INTO t_user_role (username, rolename) VALUES ('reader', 'FOO_READ');
INSERT INTO t_user_role (username, rolename) VALUES ('writer', 'FOO_READ');
INSERT INTO t_user_role (username, rolename) VALUES ('writer', 'FOO_WRITE');
