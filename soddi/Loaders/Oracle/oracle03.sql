CREATE INDEX DUMMY.votes_vote_id_post_id 
	ON DUMMY.votes (vote_id, post_id);

CREATE INDEX DUMMY.votes_vote_type_id
	ON DUMMY.votes (vote_type_id);

CREATE INDEX DUMMY.users_display_name 
	ON DUMMY.users (display_name);

-- CREATE UNIQUE INDEX DUMMY.posts_accepted_answer
-- 	ON DUMMY.posts (id, accepted_answer_id);

CREATE UNIQUE INDEX DUMMY.posts_owner
	ON DUMMY.posts(post_id, owner_user_id);

-- CREATE UNIQUE INDEX DUMMY.posts_parent
-- 	ON DUMMY.posts(id, parent_id);

CREATE INDEX DUMMY.posts_id_post_type_id
	ON DUMMY.posts(post_id, post_type_id);

CREATE INDEX DUMMY.posts_post_type_id
	ON DUMMY.posts(post_type_id);

CREATE INDEX DUMMY.comments_id_post_id
	ON DUMMY.comments(comment_id, post_id);

CREATE INDEX DUMMY.comments_id_user_id
	ON DUMMY.comments(comment_id, user_id);

CREATE INDEX DUMMY.badges_id_user_id 
	ON DUMMY.badges(badge_id, user_id);

COMMIT;

