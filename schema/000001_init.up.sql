CREATE TABLE IF NOT EXISTS users
(
    id serial PRIMARY KEY,
    name varchar(255) not null,
    username varchar(255) not null,
    password varchar(255) not null
    );

CREATE TABLE IF NOT EXISTS todo_lists
(
    id serial not null unique,
    title varchar(255) not null,
    description varchar(255)
    );

CREATE TABLE IF NOT EXISTS users_lists
(
    id serial not null unique,
    user_id int references users (id) on delete cascade not null,
    list_id int references todo_lists (id) on delete cascade not null
    );

CREATE TABLE IF NOT EXISTS todo_items
(
    id serial not null unique,
    title varchar(255) not null,
    description varchar(255),
    done boolean not null default false
    );

CREATE TABLE IF NOT EXISTS lists_items
(
    id serial not null unique,
    item_id int references todo_items (id) on delete cascade not null,
    list_id int references todo_lists (id) on delete cascade not null
    );


CREATE TABLE refresh_tokens(
    id serial not null unique,
    user_id int references users(id) on delete cascade not null,
    refresh_token varchar(255) not null unique,
    expires_at timestamp not null

    );
