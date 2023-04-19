--
-- PostgreSQL database dump
--

-- Dumped from database version 14.4
-- Dumped by pg_dump version 14.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: uuid-ossp; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS "uuid-ossp" WITH SCHEMA public;


--
-- Name: EXTENSION "uuid-ossp"; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION "uuid-ossp" IS 'generate universally unique identifiers (UUIDs)';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: hero; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hero (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    city character varying(50),
    picture text NOT NULL
);


ALTER TABLE public.hero OWNER TO postgres;

--
-- Name: rating; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.rating (
    id uuid DEFAULT public.uuid_generate_v4() NOT NULL,
    rater character varying(50) NOT NULL,
    score integer NOT NULL,
    hero_id uuid NOT NULL,
    CONSTRAINT ratings_score_check CHECK (((score > 0) AND (score < 6)))
);


ALTER TABLE public.rating OWNER TO postgres;

--
-- Data for Name: hero; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.hero (id, name, age, city, picture) VALUES ('274298b2-2cbf-4283-87e7-6192a35ac639', 'Batman', 26, 'Gotham', 'https://static1.cbrimages.com/wordpress/wp-content/uploads/2019/10/Batman-Golden-Age-Featured-Image-Cropped.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('58d32625-b412-4632-bc23-326ee0fe28f3', 'The Hulk', 30, 'New York', 'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/05/Hulk-1800-x-900-.png?q=50&fit=contain&w=1140&h=&dpr=1.5');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('f3633c52-d144-451c-9794-4e9d696d2e37', 'Spiderman', 20, 'New York', 'https://img2.rtve.es/i/?w=1600&i=1442912677842.jpg');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02', 'Superman', 26, 'Metropolis', 'https://149455152.v2.pressablecdn.com/wp-content/uploads/2023/02/Superman-Space-Age-3-1.jpg');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('efa7cf0b-5824-4f5e-aa41-589df82ec053', 'Ironman', 35, 'San Diego', 'https://aiptcomics.com/ezoimgfmt/i0.wp.com/aiptcomics.com/wp-content/uploads/2022/12/INVIM2022001_BAGLEY_SECOND-PRINT-COVER-1.jpg?w=1230&ssl=1&ezimgfmt=ngcb2/notWebP');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('e389e29a-36cf-40fd-bd3b-8db57dcfea04', 'Wonder woman', 5000, 'Paradise Island ', 'https://149455152.v2.pressablecdn.com/wp-content/uploads/2020/01/WONDER-WOMAN-Cv7501.jpg');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('03ae3a05-2451-474b-bab7-dabf51cf5406', 'The flash', 23, 'Central City', 'https://static1.cbrimages.com/wordpress/wp-content/uploads/2020/03/Flash-Running-Down-Building.jpg?q=50&fit=contain&w=1140&h=&dpr=1.5');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('50e8755b-33dc-4f89-8d73-6748a31c8abf', 'Charles Xavier', 97, 'New York', 'https://static1.srcdn.com/wordpress/wp-content/uploads/2022/11/age-of-apocalypse-charles-xavier.png?q=50&fit=contain&w=1140&h=&dpr=1.5');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('0ed9d5ea-72ec-4cde-987c-ed0261d84842', 'Wolverine', 200, 'Alberta', 'https://www.fayerwayer.com/resizer/Khft4HPwSZsHfQCGd4lT_ZXcClA=/800x0/filters:format(jpg):quality(70)/cloudfront-us-east-1.images.arcpublishing.com/metroworldnews/FNOHDGI3YZG4HAPGTYX4LPMZWY.jpg');
INSERT INTO public.hero (id, name, age, city, picture) VALUES ('fdb54e96-8a00-4fab-8a71-12d57007e1be', 'John Constantine', 52, 'Liverpool', 'https://cdn.shopify.com/s/files/1/0083/8343/0727/articles/hellblazer-its-time-we-got-a-new-john-constantine-film-750153.jpg?v=1661789460&width=1100');


--
-- Data for Name: rating; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bc8b15f0-04f4-4621-a215-66ae479a646d', 'Joseph', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f3830c93-e69a-4ee6-88bc-c6ec4002f59a', 'Jeremy', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('58b640f1-a5d5-4832-aaec-4cf855c70c9d', 'Gertrude', 3, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b26b405a-5a15-464e-8f91-b0cbe6bf547c', 'Don', 1, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('dc8cd0a5-eee1-4840-ba52-05bf5e43005d', 'Robert', 3, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('0c5fded0-beac-4a99-b482-3b6b8b0d41e0', 'Sherri', 3, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('64aeccbc-3c3d-4aaa-b664-7ef9b636f147', 'Mary', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('27717bb5-d1f9-4f31-925a-312eba30d364', 'Sandra', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('844889ab-c2da-4864-8d70-2139e540ba0c', 'Laura', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('eebd030b-366b-4a30-9ec7-21e411f84cfd', 'Daisy', 1, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b753ef89-60bc-448d-b90c-317451b43204', 'Donna', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d70b02d2-5403-4014-ab1d-0729f52149e4', 'Joshua', 3, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('05b39a02-dd16-4787-86f1-801c7daab4a2', 'William', 2, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5c2e4ed2-79ca-4beb-8cd4-248173a5f10e', 'Lynna', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('43097c8b-f21d-4120-bc62-f335241c3fff', 'Shirley', 3, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('608aae03-7b8c-4c34-b48f-00bf5247e61d', 'Juana', 1, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7d04468e-6022-4220-ae1b-67fdb3f603ea', 'Patricia', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('64725753-dcbb-44a7-9d08-48605bb7bbc0', 'Tanisha', 4, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('52f3ee08-22fc-4156-aa88-b110895bd600', 'Anthony', 3, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bfcad7b2-2d35-4ee6-9ee3-0fb8283b088b', 'Kathleen', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ab66c6a6-d5cc-4824-9417-337ffbfbc393', 'Edna', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('34617dc2-e83c-4566-b965-2c8c90f1acab', 'Cecil', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d560a934-7163-484f-87c2-5e4be49f4cca', 'Judith', 5, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ed556e5e-4063-47fe-b292-688023beec2b', 'John', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('8565e671-9184-4e2a-8344-d9b5648f6ceb', 'John', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e3aad054-ba49-4992-b2ec-9cb40e82c0de', 'James', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('07714ed3-5d66-42d4-b6ac-e13a38b16b46', 'Marvin', 3, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('50f138ec-9078-451c-8302-e23438b15468', 'Elise', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('45ce4cad-b642-4b84-8d76-aefe4403e47e', 'Michael', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ebd06161-c8d0-4a00-b3fb-79bb51fabc57', 'Edward', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('399faa28-7a12-45f1-96d3-1b43e89fbc8f', 'Kenneth', 3, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('0ffbb7c3-e273-445e-a742-0ab77d75486f', 'Carmela', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('296d77eb-3be9-4a3a-9925-cc87d0980bf2', 'Kathryn', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ab310c6e-d249-440e-bda1-7d0974e07e33', 'Susan', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c4b8ccfb-a2a2-49d2-bf15-5a11dd3ebf4d', 'Boris', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1123d3da-1017-49f4-b911-ccec83ae043a', 'Glen', 3, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e8ee9c60-4594-4077-bdda-886d78573424', 'Matthew', 5, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('360ba7f7-1ef4-4cfb-baa6-043a8323b621', 'James', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('96711816-a64d-4faf-8d36-59897ca8f3ac', 'Robin', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f3e4998a-ad51-40f5-902e-8e5ff2deec8c', 'John', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('534e47f7-0972-42ac-af22-1cf255673204', 'Craig', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('0775ef8f-a670-4cd2-ac24-815e2e2a6478', 'Jacqualine', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3bc27359-80f9-4613-ab9e-fb8f33cbd341', 'Susan', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a7979242-bf72-4144-b9ea-a5080925d139', 'Daniel', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bbc652a7-9329-4906-9bf6-75f26c8e93fc', 'Ronald', 2, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('fd269d7c-ff3d-4e08-b648-14ed6fb12daf', 'Judith', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('903cf944-3907-4a25-845a-c23ec7ebfe39', 'Alison', 5, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('9d6adcac-2f13-4dd2-9aa2-c1cdd68f3034', 'Donald', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('51d328aa-9032-43e4-9720-9257d827a9e5', 'Lorraine', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('81049b30-74b7-4523-adb5-236f1337c965', 'Elwood', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('9e7fe5fd-3f2f-44a3-92b7-c08e9320af99', 'Christina', 3, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('6a9b343b-c68a-418a-af90-4f7bd3303182', 'Michael', 2, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e3b90ecb-7bb3-47cf-950b-e5a202f66806', 'Paula', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('81a12af2-cb34-48fd-ac8e-0f55f42b62c9', 'Carolyn', 2, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ae29d606-7a84-468e-8233-ba789c930770', 'Irene', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('fa60897d-20fd-4554-9847-f5cbd03cc116', 'Bryant', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d24c6bf7-c7f3-4d3e-ba07-fbb3a4ac8fd3', 'Camille', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('92ce408f-9b15-406f-ad4f-3efb05ea917e', 'Christopher', 5, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5e3cf903-f971-452a-abbb-a98192f42fb4', 'Warren', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('8a1aa45d-6f2d-416e-986d-9962e5584fcb', 'Nicholas', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e60cad05-b97b-4b1b-a48e-5eeff9fdad8e', 'Mary', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('54f99116-c4ce-4315-b269-247d4883fc48', 'Brian', 5, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('be65110e-25a6-4bf5-8ea1-7d72814c901a', 'Twyla', 3, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('65847ef0-f2b6-4d8a-a7d7-e69f7161d909', 'James', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('cda913db-527a-4b36-8798-0327bb8c3d22', 'George', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3b878386-c0b3-455d-ab66-56a3203cf9fa', 'James', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('79d9fff2-9824-4b49-a243-cdb679562ed2', 'Linda', 3, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3128d358-1a8b-4bad-8943-0680a08e30ff', 'Monte', 4, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('efda8fab-6afd-4e94-8d60-66b9b29b073e', 'Kathy', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('92e263b5-a209-4215-ae9e-c1c1948b4408', 'John', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a9e856d6-e9d3-4efa-a425-5a1b45107550', 'Jeffrey', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3187d1bc-8952-45cf-8a94-e13a4763f899', 'Mark', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('70e80ad8-a1e9-4157-a03b-9bdb218b5dd4', 'Minnie', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f5db408e-8342-4c59-aec4-bb52411da6f2', 'Sylvester', 5, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d033fdd5-601c-446b-8acb-02f4173b27ce', 'Misty', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bba7275b-159b-4b7a-8f7c-678c7991752f', 'Angela', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('9839387e-d71d-4ea5-876a-3ffe7e93f445', 'David', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bce00679-882b-4844-adcf-c4193585156d', 'Rachel', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('4a0a1e09-57b5-410e-b608-11ec08947470', 'Allen', 3, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('87645a3d-8b25-4d3e-bdb0-709196d9818e', 'Robert', 3, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('944ff53d-3c0b-4d22-b6c6-5bdc80f0488a', 'Nancy', 2, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('91e0d389-b9a1-4e65-b1b2-410c990d2741', 'John', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('26da3838-6162-4584-823c-85436d2d09e3', 'Diana', 5, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a079f6f4-d00b-4eb7-af36-d6a09b3ff79e', 'Daniel', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a7b96f41-5f95-42de-92f0-0a1a2b8ccce7', 'William', 5, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('4d72971c-baca-4bd9-bc1a-497f174d2184', 'Christian', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('6922b234-8311-4cdb-b1f8-7c1bfb9ee767', 'Sheldon', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('577173c3-1cad-4ee0-89af-b1a0823823bf', 'Joseph', 3, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('2b51d367-ac25-40bd-b92e-b30c9b94e551', 'Juana', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7e335133-9cbc-48c4-a659-c4ae435fc8bd', 'John', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('87080058-bb56-4919-a2d1-ba5696f9a03a', 'Bridgette', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d758e6ae-23bd-4acd-a33e-cf75eae4bdba', 'Gary', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ce497de5-4d09-4eaa-9c7b-8794bc4e99b4', 'Sandra', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a044b900-d97c-430b-9556-5ae5bfbbc018', 'Linda', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('75d872f5-0b47-4549-b027-2777d3e7c994', 'Marilyn', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('69116164-7a94-4d48-9a4b-376c66477e89', 'Amber', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5f9c7a62-02c7-42bb-9473-7985306905fe', 'Richard', 5, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('0e3f4c9f-61cd-4e66-bdfd-37abb8049d3a', 'Mary', 3, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('dc2fce74-71ce-42a5-9a03-4b2f8b68781f', 'Marge', 2, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e96c3658-7643-4ab8-a4d3-8891d1d2157c', 'Robert', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3f90c4ba-00b2-4473-a0ce-23d383988f3b', 'Annie', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('68128438-2ee5-4cb5-9ebe-306ddbcd1956', 'Lamar', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('35ea01f1-8ab5-44a6-9b2a-10e98cdca9f9', 'Thomas', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('785687bb-672f-437f-bbfa-ebc4680bb042', 'Lloyd', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('be95d83d-9f2b-4897-b90e-294297bfa384', 'Thomas', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bd4374ec-43b0-4b04-8490-135391b8481c', 'Irene', 2, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f644c18f-4635-4f01-96ba-de1a66ab6626', 'Jennifer', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e265b513-41c3-4f39-b81c-88ebbfe905d0', 'Ed', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('2967481a-fef6-4b9c-abcc-317e1822cfd9', 'Michael', 3, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bbbc72a8-7acd-42c1-9ec8-aad42881615b', 'Mark', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('05a2407c-5ddf-44a7-8cb5-6a5579fa8809', 'Maria', 5, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('20247199-fa98-47ad-9a4e-e86c436dbf4c', 'Debbie', 3, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d75c6088-e80b-4b71-93fc-58f539e7edae', 'John', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('185b127a-95ff-4b51-a10f-13499929515e', 'Charles', 3, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1b49d87b-3241-42c9-9166-17bba2be9fcb', 'Krystal', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('939692bd-a9cf-4162-aab1-06be47ca3c02', 'Elsa', 3, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c8c29740-24d6-4a7d-a41e-877ec47021dc', 'Len', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f47aea60-6301-4086-adb7-9c023a18e7b4', 'Nathan', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('9298b1ad-eb98-4d89-a2ef-4aadb3ffb6b5', 'Glenda', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('478d3dd3-7372-4416-a063-cf54665614a2', 'Mathew', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('10a76689-5eb0-45a7-83e2-e5510780913c', 'Ronald', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c20172b8-1ca5-4800-a3b0-df359ceb1545', 'Edna', 2, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7b562f63-5ded-47e1-b15d-5db5dba6cb6a', 'Shirley', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('28f11672-f763-442e-8091-1f6a5cb45ff1', 'Dexter', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bcf4b540-99ec-4db4-8764-548ff33b7f75', 'Mary', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('2016aa0d-5db5-4bee-8cc9-a7db5afedd09', 'Estelle', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bd8f7d4f-12ad-433a-a433-e25a85334ac8', 'Lowell', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('cdf79c86-71f6-4dd6-b993-0613b24afe86', 'Mary', 3, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e3cef8fa-1d93-439b-a916-525ecc872ba3', 'Myrtle', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c44feb63-e7b6-443f-a0fa-76d718d40bb1', 'Erma', 1, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('2a8cd92b-0e62-41e2-b565-0760fc38a3e3', 'Barbara', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d6a45757-ae86-4071-ba03-fafe58bc14c9', 'Marc', 2, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('2e9514ff-65e2-4a87-859b-f80f84aa91a6', 'Herbert', 5, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ec03dc3f-47cc-4883-9c25-10d15bf4aa29', 'Jesus', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('60be7a6b-6fc6-4de4-af93-56bfad3f3062', 'Myron', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b36bc1d5-92cc-411f-9da3-36d2d0380bee', 'Michael', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7a9571c0-5a37-4e34-a747-36eb3ce0c4fe', 'Kenneth', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c8e57aee-edae-4456-a9e7-38dce471a571', 'Marco', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b37fa20c-28bf-49eb-9fe9-c5294445123e', 'David', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('061c3a6a-aba1-4459-8f24-aeca21fe41d4', 'Charlotte', 4, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('421eee38-78ae-430e-9b48-39314582e9bb', 'Dean', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7cf2c120-8940-4f43-b73b-b2c9ca2e1b9e', 'Anthony', 4, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('34a33e34-edd6-4e50-8e86-4fcce73dd334', 'Isiah', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('0f877ed8-440c-4fe3-9cad-6bcb68e5109d', 'Ethel', 2, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('58117369-1e35-4c9b-8d22-e1ba8dcdf1c4', 'Chad', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('cb9a1b72-b32f-42fd-aed7-02a26fde0adc', 'Ronald', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('00ed3c0f-e1c7-4c82-ab54-4fd6b3a9c6ba', 'Edward', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('e6d52af6-bd85-487a-98e1-43169e0c709d', 'Adam', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('12f71fb1-d8ff-4b6e-b7ac-317471d7c0f2', 'Larry', 3, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('bbac5d86-7e25-4171-8981-f589bcba5a22', 'Roger', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('115e9d82-93c7-4ddc-ac14-e144320d4ebb', 'Virgil', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('44e51034-5c5b-4e4a-9eb7-0a52781d43e2', 'Vicki', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f2b5fff7-4684-4741-a29b-ae748f566e02', 'Josie', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1c2b3307-e0c8-4330-b5ff-0b33c42a3f28', 'Willis', 3, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3699fae3-8f87-4e5d-a45e-be4adfc88273', 'Joseph', 3, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('fdb2b1e3-43e6-4fc8-94fb-28561e91e1a4', 'Richard', 4, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3f34de3a-0f1c-4c19-8f1e-04c1999e4ad4', 'Jerome', 5, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('187592f6-292e-4971-9ffa-f15093086d86', 'Olga', 5, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d74588b2-b190-452d-9432-f20cf32ec4de', 'John', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1866073b-802d-4a87-8741-886eeeebd2c4', 'Teresa', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b1be8d9e-cf22-4ed8-ad99-f179e8abe301', 'Katherine', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f99f3f7f-f8a8-4d56-81f4-16338785a36f', 'Dorene', 3, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3dc708a5-b6e5-4ab4-b179-ee7eeadaa27a', 'Brett', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5dc275e1-0c71-404a-9d61-c17e97c99697', 'Dick', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f48ab9c6-0bde-4728-847e-5c676d9e1480', 'Krista', 4, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c1afd225-c43d-45ab-b1f1-01e00bc9dd15', 'Holly', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('fbf8120b-fade-4e9f-8888-aef5bf24461e', 'Kara', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1937e2e9-61a9-4479-9a80-727e6ac715db', 'Rhonda', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f2b82461-fe97-4372-abae-cc98f19aa461', 'Mario', 2, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('aaa579d3-4638-4159-9afe-c9bf10905ae6', 'Ellen', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5adaf3ee-cda8-48c5-bf38-b67484d48171', 'Clarence', 4, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d7d0dfd9-c555-4c7a-9722-af1f29626f99', 'Craig', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a2a734d6-a10e-4c1c-9bae-bd4b76e6e0a0', 'Anthony', 5, '03ae3a05-2451-474b-bab7-dabf51cf5406');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('1b0e19d3-e40f-4e85-9a8c-764480d12283', 'Kathie', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('76c09d42-bdcf-4a47-beaa-bc3f4d6480e5', 'Stanley', 3, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('309d6624-b35b-462b-b182-270cf834742b', 'John', 4, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a32a836d-b743-4315-ac20-1afe0e0f84a3', 'Joan', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('744f4402-0f7e-474e-84c3-c87f1be01f10', 'Jettie', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('a8f62bdf-ead8-4616-93a9-e9aec08a5ac8', 'Delores', 5, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('74f83c1b-8ce2-42dc-8661-5d331579646d', 'Roy', 4, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7623bdeb-0cb7-435c-a208-0cca67cc9501', 'Virgil', 2, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('ed7efe69-562d-4b72-9b9f-848206734020', 'Sarah', 4, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('053deb0c-3085-43a5-b203-c2deda49dbe6', 'Luis', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('171f5535-c6f7-4ad4-9cc5-40577950f578', 'Mark', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('4e641fb5-4a7b-48f6-bfc2-99f2ab849411', 'Sherri', 4, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c0f4bbd9-f293-4d80-bdbf-90319fd77734', 'Candice', 5, 'f3633c52-d144-451c-9794-4e9d696d2e37');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('aa18eb10-1edd-42ff-a6e3-c76e4e87f28b', 'Teresa', 5, '58d32625-b412-4632-bc23-326ee0fe28f3');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('5494cf1f-c6b8-4a06-a1b6-b3263c934ca6', 'Monica', 5, '7ad50d77-e4b1-432f-b2cf-1d74bc5a5e02');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d0e4b31b-6f61-401a-93e3-aff28d744166', 'Thomas', 1, 'efa7cf0b-5824-4f5e-aa41-589df82ec053');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c83e417e-aa79-4b70-8b81-8a50939f56d1', 'Daniel', 3, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('3fe506ab-ce20-42c7-92cf-eb37c0722398', 'William', 5, '50e8755b-33dc-4f89-8d73-6748a31c8abf');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('b527fedb-e44d-4830-a177-4d1dfcd1a850', 'Johnnie', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7910a9bd-c98c-439c-9bed-e71119842c9b', 'Donald', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7aba9e90-2bd8-4454-b197-39946a8b39c5', 'Carolyn', 4, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('d4daa74d-25f3-4eac-855c-3735c2aa8e26', 'Ella', 5, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('7d2bcfc4-3e10-4d71-abf2-9696f8ebd1b7', 'Christopher', 5, '274298b2-2cbf-4283-87e7-6192a35ac639');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('f0efb3c8-ddca-4c8f-8bcf-820c231ad842', 'William', 4, 'fdb54e96-8a00-4fab-8a71-12d57007e1be');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('c9010de9-6c4d-4941-bcee-dfc0ca15b49a', 'Daniel', 4, 'e389e29a-36cf-40fd-bd3b-8db57dcfea04');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('dab091cd-54ba-470c-ba01-b1c642a5dfa3', 'Edna', 2, '0ed9d5ea-72ec-4cde-987c-ed0261d84842');
INSERT INTO public.rating (id, rater, score, hero_id) VALUES ('8ad84273-a253-4f6f-aa5b-d10ef1faec32', 'Evan', 5, '58d32625-b412-4632-bc23-326ee0fe28f3');


--
-- Name: hero hero_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT hero_pkey PRIMARY KEY (id);


--
-- Name: hero name_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hero
    ADD CONSTRAINT name_unique UNIQUE (name);


--
-- Name: rating ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (id);


--
-- Name: rating ratings_hero_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.rating
    ADD CONSTRAINT ratings_hero_id_fkey FOREIGN KEY (hero_id) REFERENCES public.hero(id);


--
-- PostgreSQL database dump complete
--

