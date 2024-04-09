INSERT INTO users(username, password, fullname, email, delivery)
SELECT 'admin', '{noop}apw', 'adminFull', 'admin@gmail.com', 'adminStreet'
    WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'admin');

INSERT INTO user_roles(username, role)
SELECT 'admin', 'ROLE_ADMIN'
    WHERE NOT EXISTS (SELECT 1 FROM user_roles WHERE username = 'admin' AND role = 'ROLE_ADMIN');

INSERT INTO users(username, password, fullname, email, delivery)
SELECT 'adminUser', '{noop}aupw', 'adminUserFull', 'adminUser@gmail.com', 'adminUserStreet'
    WHERE NOT EXISTS (SELECT 1 FROM users WHERE username = 'adminUser');

INSERT INTO user_roles(username, role)
SELECT 'adminUser', 'ROLE_USER'
    WHERE NOT EXISTS (SELECT 1 FROM user_roles WHERE username = 'adminUser' AND role = 'ROLE_USER');

INSERT INTO user_roles(username, role)
SELECT 'adminUser', 'ROLE_ADMIN'
    WHERE NOT EXISTS (SELECT 1 FROM user_roles WHERE username = 'adminUser' AND role = 'ROLE_ADMIN');

