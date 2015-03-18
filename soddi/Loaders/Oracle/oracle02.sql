
CREATE TABLE DUMMY.link_types (
	id NUMBER NOT NULL GENERATED AS IDENTITY,
	type NVARCHAR2(40) NOT NULL,
	CONSTRAINT link_types_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.vote_types (
	id NUMBER NOT NULL GENERATED AS IDENTITY,
	name NVARCHAR2(40) NOT NULL,
	CONSTRAINT vote_types_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.post_types (
	id NUMBER NOT NULL GENERATED AS IDENTITY,
	type NVARCHAR2(40) NOT NULL,
	CONSTRAINT post_types_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.post_tags (
	post_id NUMBER NOT NULL,
	tag NVARCHAR2(50) NOT NULL,
	CONSTRAINT pk_post_tags PRIMARY KEY (post_id, tag)
);

INSERT DUMMY.vote_types (Id, Name) VALUES(1,  'AcceptedByOriginator');
INSERT DUMMY.vote_types (Id, Name) VALUES(2,  'UpMod');
INSERT DUMMY.vote_types (Id, Name) VALUES(3,  'DownMod');
INSERT DUMMY.vote_types (Id, Name) VALUES(4,  'Offensive');
INSERT DUMMY.vote_types (Id, Name) VALUES(5,  'Favorite');
INSERT DUMMY.vote_types (Id, Name) VALUES(6,  'Close');
INSERT DUMMY.vote_types (Id, Name) VALUES(7,  'Reopen');
INSERT DUMMY.vote_types (Id, Name) VALUES(8,  'BountyStart');
INSERT DUMMY.vote_types (Id, Name) VALUES(9,  'BountyClose');
INSERT DUMMY.vote_types (Id, Name) VALUES(10, 'Deletion');
INSERT DUMMY.vote_types (Id, Name) VALUES(11, 'Undeletion');
INSERT DUMMY.vote_types (Id, Name) VALUES(12, 'Spam');
INSERT DUMMY.vote_types (Id, Name) VALUES(13, 'InformModerator');

INSERT DUMMY.post_types] (id, type) VALUES(1, 'Question') ;
INSERT DUMMY.post_types] (id, type) VALUES(2, 'Answer') ;

INSERT DUMMY.link_types] (id, type) VALUES(1, 'Linked') ;
INSERT DUMMY.link_types] (id, type) VALUES(3, 'Duplicate') ;

/* TODO: Full Text Indexes */

CREATE TABLE DUMMY.votes (
	id NUMBER NOT NULL GENERATED AS IDENTITY,
	post_id NUMBER NOT NULL,
	user_id NUMBER NULL,
	bount_amount NUMBER NULL,
	vote_type_id NUMBER NOT NULL,
	created_at TIMESTAMP NOT NULL,
	CONSTRAINT votes_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.users (
	id NUMBER NOT NULL,
	age NUMBER NULL,
	created_at TIMESTAMP NOT NULL,
	display_name NVARCHAR2(40) NOT NULL,
	down_votes NUMBER NOT NULL,
	email_hash NVARCHAR2(40),
	last_access_date TIMESTAMP NOT NULL,
	location NVARCHAR2(100) NULL,
	reputation NUMBER NOT NULL,
	up_votes NUMBER NOT NULL,
	views NUMBER NOT NULL,
	website_url NVARCHAR2(255) NULL,
	account_id NUMBER NULL,
	about_me NCLOB NULL,
	CONSTRAINT users_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.posts (
	id NUMBER NOT NULL,
	accepted_answer_id NUMBER NULL,
	answer_count NUMBER NULL,
	closed_date TIMESTAMP NULL,
	comment_count NUMBER NULL,
	community_owned_date TIMESTAMP NULL,
	created_at TIMESTAMP NOT NULL,
	favorite_count NUMBER NULL,
	last_activity_date TIMESTAMP NOT NULL,
	last_edit_date TIMESTAMP NULL,
	last_editor_display_name NVARCHAR2(40) NULL,
	last_editor_user_id NUMBER NULL,
	owner_user_id NUMBER NULL,
	parent_id NUMBER NULL,
	post_type_id NUMBER NOT NULL,
	score NUMBER NOT NULL,
	tags NVARCHAR2(150) NULL,
	title NVARCHAR2(250) NULL,
	view_count NUMBER NOT NULL,
	body NCLOB NOT NULL,
	CONSTRAINT posts_pk PRIMARY KEY (id),
	/* TODO: Should these be indexes? */
	CONSTRAINT posts_accepted_uq UNIQUE (id, accepted_answer_id),
	CONSTRAINT posts_parent UNIQUE(id, parent_id)
);

CREATE TABLE DUMMY.comments (
	id NUMBER NOT NULL
	created_at TIMESTAMP NOT NULL,
	post_id NUMBER NOT NULL,
	score NUMBER NULL
	user_id NULL
	text NVARCHAR2(700) NOT NULL,
	CONSTRAINT comments_pk PRIMARY KEY (id)
);

CREATE TABLE DUMMY.badges (
	id NUMBER NOT NULL,
	name NVARCHAR2(40) NOT NULL,
	user_id NUMBER NOT NULL,
	date TIMESTAMP NOT NULL,
	CONSTRAINT badges_pk PRIMARY KEY (id)
);

CREATE TABLE post_links (
	id NOT NULL,
	created_at TIMESTAMP NOT NULL,
	post_id NUMBER NOT NULL,
	related_post_id NUMBER NOT NULL,
	link_type_id NUMBER NOT NULL,
	CONSTRAINT post_links_pk PRIMARY KEY (id)
);

/* TODO: Add foreign keys */