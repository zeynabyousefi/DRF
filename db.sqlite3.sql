BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product_category" (
	"id"	integer NOT NULL,
	"is_sub"	bool NOT NULL,
	"name"	varchar(200) NOT NULL,
	"slug"	varchar(200) NOT NULL UNIQUE,
	"sub_category_id"	bigint,
	FOREIGN KEY("sub_category_id") REFERENCES "product_category"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "product_product_category" (
	"id"	integer NOT NULL,
	"product_id"	bigint NOT NULL,
	"category_id"	bigint NOT NULL,
	FOREIGN KEY("product_id") REFERENCES "product_product"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("category_id") REFERENCES "product_category"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "product_product" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"slug"	varchar(200) NOT NULL UNIQUE,
	"image"	varchar(100),
	"description"	text,
	"price"	integer NOT NULL,
	"available"	bool NOT NULL,
	"created"	datetime NOT NULL,
	"updated"	datetime NOT NULL,
	"number_of_product"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "authtoken_token" (
	"key"	varchar(40) NOT NULL,
	"created"	datetime NOT NULL,
	"user_id"	integer NOT NULL UNIQUE,
	PRIMARY KEY("key"),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2022-03-06 15:48:18.551130'),
 (2,'auth','0001_initial','2022-03-06 15:48:18.571101'),
 (3,'admin','0001_initial','2022-03-06 15:48:18.585420'),
 (4,'admin','0002_logentry_remove_auto_add','2022-03-06 15:48:18.595215'),
 (5,'admin','0003_logentry_add_action_flag_choices','2022-03-06 15:48:18.608748'),
 (6,'contenttypes','0002_remove_content_type_name','2022-03-06 15:48:18.631646'),
 (7,'auth','0002_alter_permission_name_max_length','2022-03-06 15:48:18.644602'),
 (8,'auth','0003_alter_user_email_max_length','2022-03-06 15:48:18.654551'),
 (9,'auth','0004_alter_user_username_opts','2022-03-06 15:48:18.665635'),
 (10,'auth','0005_alter_user_last_login_null','2022-03-06 15:48:18.675695'),
 (11,'auth','0006_require_contenttypes_0002','2022-03-06 15:48:18.678507'),
 (12,'auth','0007_alter_validators_add_error_messages','2022-03-06 15:48:18.687582'),
 (13,'auth','0008_alter_user_username_max_length','2022-03-06 15:48:18.701568'),
 (14,'auth','0009_alter_user_last_name_max_length','2022-03-06 15:48:18.712551'),
 (15,'auth','0010_alter_group_name_max_length','2022-03-06 15:48:18.725598'),
 (16,'auth','0011_update_proxy_permissions','2022-03-06 15:48:18.733861'),
 (17,'auth','0012_alter_user_first_name_max_length','2022-03-06 15:48:18.749726'),
 (18,'product','0001_initial','2022-03-06 15:48:18.760820'),
 (19,'sessions','0001_initial','2022-03-06 15:48:18.768641'),
 (20,'product','0002_alter_product_description_alter_product_image','2022-03-08 07:44:12.542139'),
 (21,'product','0003_product_number_of_product','2022-03-08 08:18:39.344237'),
 (22,'authtoken','0001_initial','2022-03-08 15:44:46.557173'),
 (23,'authtoken','0002_auto_20160226_1747','2022-03-08 15:44:46.577379'),
 (24,'authtoken','0003_tokenproxy','2022-03-08 15:44:46.580485');
INSERT INTO "django_admin_log" ("id","action_time","object_id","object_repr","change_message","content_type_id","user_id","action_flag") VALUES (1,'2022-03-08 07:40:55.906558','1','laptop','[{"added": {}}]',7,1,1),
 (2,'2022-03-08 07:41:10.531248','2','mobile','[{"added": {}}]',7,1,1),
 (3,'2022-03-08 07:41:48.587524','3','asus','[{"added": {}}]',7,1,1),
 (4,'2022-03-08 07:42:05.622229','4','apple','[{"added": {}}]',7,1,1),
 (5,'2022-03-08 07:44:21.307116','1','13promax','[{"added": {}}]',8,1,1),
 (6,'2022-03-08 07:45:00.678774','2','vivobook','[{"added": {}}]',8,1,1),
 (7,'2022-03-08 08:20:16.802898','1','13promax','[{"changed": {"fields": ["Number of product"]}}]',8,1,2),
 (8,'2022-03-08 08:20:21.959103','2','vivobook','[{"changed": {"fields": ["Number of product"]}}]',8,1,2),
 (9,'2022-03-08 12:53:40.247562','5','lenovo','[{"added": {}}]',7,1,1),
 (10,'2022-03-08 12:54:24.331974','3','15inch','[{"added": {}}]',8,1,1);
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'product','category'),
 (8,'product','product'),
 (9,'authtoken','token'),
 (10,'authtoken','tokenproxy');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_category','Can add category'),
 (26,7,'change_category','Can change category'),
 (27,7,'delete_category','Can delete category'),
 (28,7,'view_category','Can view category'),
 (29,8,'add_product','Can add product'),
 (30,8,'change_product','Can change product'),
 (31,8,'delete_product','Can delete product'),
 (32,8,'view_product','Can view product'),
 (33,9,'add_token','Can add Token'),
 (34,9,'change_token','Can change Token'),
 (35,9,'delete_token','Can delete Token'),
 (36,9,'view_token','Can view Token'),
 (37,10,'add_tokenproxy','Can add token'),
 (38,10,'change_tokenproxy','Can change token'),
 (39,10,'delete_tokenproxy','Can delete token'),
 (40,10,'view_tokenproxy','Can view token');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$320000$MfYpZBaN70CiwODj0egWpV$LASKQxNMC7/2lfyglPYuKIoa83vWyHVIwqiElBkOQ98=','2022-03-08 16:06:31.591584',1,'1234','','',1,1,'2022-03-08 06:17:06.414594','');
INSERT INTO "product_category" ("id","is_sub","name","slug","sub_category_id") VALUES (1,0,'laptop','laptop',NULL),
 (2,0,'mobile','mobile',NULL),
 (3,1,'asus','asus',1),
 (4,1,'apple','apple',2),
 (5,1,'lenovo','lenovo',1);
INSERT INTO "product_product_category" ("id","product_id","category_id") VALUES (1,1,2),
 (2,1,4),
 (3,2,1),
 (4,2,3),
 (5,3,1),
 (6,3,5);
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('6w8q0almhgr02el602rcztc7fhx7hps9','.eJxVjEEOwiAQRe_C2hAoCINL9z0DmWGmUjVtUtqV8e7apAvd_vfef6mM21rz1mTJI6uLsur0uxGWh0w74DtOt1mXeVqXkfSu6IM23c8sz-vh_h1UbPVbOyJ_Rh4KJeuBgjgRTwxkOkyWrQEXg_gUIwcZXGcBnYcukZEC4It6fwD67TgK:1nRcM3:RVT5lLHkcw13C2m7yFlApedGMxbUGgLZ6leVXSZK0qg','2022-03-22 16:06:31.594236');
INSERT INTO "product_product" ("id","name","slug","image","description","price","available","created","updated","number_of_product") VALUES (1,'13promax','13promax','','',1400000,1,'2022-03-08 07:44:21.304947','2022-03-08 08:20:16.801663',17),
 (2,'vivobook','vivobook','','',50000000000,1,'2022-03-08 07:45:00.677117','2022-03-08 08:20:21.957995',5),
 (3,'15inch','lenovo15','','',235346565,1,'2022-03-08 12:54:24.330479','2022-03-08 12:54:24.330499',23);
INSERT INTO "authtoken_token" ("key","created","user_id") VALUES ('48c255666fefffeba0287f2116dedac924b1012a','2022-03-08 16:07:50.334108',1);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "product_category_sub_category_id_46b8c487" ON "product_category" (
	"sub_category_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "product_product_category_product_id_category_id_5e811dc1_uniq" ON "product_product_category" (
	"product_id",
	"category_id"
);
CREATE INDEX IF NOT EXISTS "product_product_category_product_id_dd5b89f7" ON "product_product_category" (
	"product_id"
);
CREATE INDEX IF NOT EXISTS "product_product_category_category_id_c14e57fb" ON "product_product_category" (
	"category_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
COMMIT;
