-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 29-04-2020 a las 00:07:54
-- Versión del servidor: 5.7.24
-- Versión de PHP: 7.2.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cms`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asociatte_sections`
--

CREATE TABLE `asociatte_sections` (
  `id` int(11) NOT NULL,
  `sections_id` int(11) NOT NULL,
  `biddings_id` int(11) DEFAULT NULL,
  `forms_id` int(11) DEFAULT NULL,
  `static_pages_id` int(11) DEFAULT NULL,
  `projects_id` int(11) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='para asociar las secciones a algun apartado y tambien dar un';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `biddings`
--

CREATE TABLE `biddings` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL,
  `published_in` date DEFAULT NULL,
  `finish_in` date DEFAULT NULL,
  `code` varchar(250) DEFAULT NULL,
  `description` text,
  `slug` varchar(500) DEFAULT NULL,
  `status_bidding` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Licitaciones';

--
-- Volcado de datos para la tabla `biddings`
--

INSERT INTO `biddings` (`id`, `site_id`, `title`, `create_at`, `published_in`, `finish_in`, `code`, `description`, `slug`, `status_bidding`) VALUES
(1, 1, 'dsadsadsa', '2020-04-02 13:17:15', '2020-04-07', '2020-04-30', 'dsadsadsadsadsadas', '<p>\r\n	dsdasdsa</p>\r\n', NULL, '1');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `company`
--

CREATE TABLE `company` (
  `id` int(11) NOT NULL,
  `company` varchar(250) DEFAULT NULL,
  `initials` varchar(50) DEFAULT NULL,
  `geolocation` varchar(200) DEFAULT NULL,
  `logo` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Empresa\r\n';

--
-- Volcado de datos para la tabla `company`
--

INSERT INTO `company` (`id`, `company`, `initials`, `geolocation`, `logo`) VALUES
(1, 'DOJO STUDIO', 'DSS', 'dojo estudio', '20a1c-11.png');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `config_servers`
--

CREATE TABLE `config_servers` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `server_types_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL,
  `ip` varchar(25) DEFAULT NULL,
  `port` int(11) DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  `use_for` varchar(150) DEFAULT NULL,
  `wait_time` decimal(18,6) DEFAULT NULL,
  `url` varchar(350) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Configuraciond e los servidores: de API, de correo, LDAP, et';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `files`
--

CREATE TABLE `files` (
  `id` int(11) NOT NULL,
  `types_files_id` int(11) NOT NULL,
  `static_pages_id` int(11) DEFAULT NULL,
  `projects_id` int(11) DEFAULT NULL,
  `biddings_id` int(11) DEFAULT NULL,
  `forms_id` int(11) DEFAULT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `original_name` varchar(1000) DEFAULT NULL,
  `path` varchar(1000) DEFAULT NULL,
  `size` int(11) DEFAULT NULL,
  `extension` varchar(10) DEFAULT NULL,
  `create_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='archivos: docs, images, excels, pdfs, etc\r\n';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `forms`
--

CREATE TABLE `forms` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `types_form_id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Formularios\r\n';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `form_elements`
--

CREATE TABLE `form_elements` (
  `id` int(11) NOT NULL,
  `forms_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `label_element` varchar(250) DEFAULT NULL,
  `required_input` tinyint(1) DEFAULT NULL,
  `format` varchar(50) DEFAULT NULL,
  `icon` varchar(250) DEFAULT NULL,
  `path` varchar(250) DEFAULT NULL,
  `full_name` varchar(250) DEFAULT NULL,
  `extension` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='elementos del formulario, elementos que el usuario creara';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `link_elements`
--

CREATE TABLE `link_elements` (
  `id` int(11) NOT NULL,
  `link_elements_id` int(11) DEFAULT NULL,
  `label_link` varchar(250) DEFAULT NULL,
  `icon_link` varchar(250) DEFAULT NULL,
  `url` varchar(250) DEFAULT NULL,
  `_target` char(1) DEFAULT NULL,
  `status` varchar(1) DEFAULT NULL,
  `order_link` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='elementos del menu o liks';

--
-- Volcado de datos para la tabla `link_elements`
--

INSERT INTO `link_elements` (`id`, `link_elements_id`, `label_link`, `icon_link`, `url`, `_target`, `status`, `order_link`) VALUES
(1, NULL, 'Inicio 3', NULL, 'noseque/index', '0', '1', 1),
(2, NULL, 'Inicio', NULL, '/', '0', '1', 0),
(3, NULL, 'Inicio 2', NULL, '/', '0', '1', 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu`
--

CREATE TABLE `menu` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `name` varchar(250) DEFAULT NULL,
  `get_icons` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='algun menu q se desee registrar\r\n';

--
-- Volcado de datos para la tabla `menu`
--

INSERT INTO `menu` (`id`, `site_id`, `name`, `get_icons`) VALUES
(3, 1, 'dsadsa', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `menu_element`
--

CREATE TABLE `menu_element` (
  `link_elements_id` int(11) NOT NULL,
  `menu_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `menu_element`
--

INSERT INTO `menu_element` (`link_elements_id`, `menu_id`) VALUES
(2, 3),
(3, 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `projects`
--

CREATE TABLE `projects` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `types_project_id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `target` varchar(250) DEFAULT NULL,
  `is_main` tinyint(1) DEFAULT NULL,
  `order_project` int(11) DEFAULT NULL,
  `_target` char(1) DEFAULT NULL,
  `slug` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Proyectos de la empresa o instritucion';

--
-- Volcado de datos para la tabla `projects`
--

INSERT INTO `projects` (`id`, `site_id`, `types_project_id`, `title`, `target`, `is_main`, `order_project`, `_target`, `slug`) VALUES
(1, 1, 1, 'Proyecto', 'dasdsadsadsa', 1, 1, '0', 'dsdasdas');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `response_template`
--

CREATE TABLE `response_template` (
  `id` int(11) NOT NULL,
  `types_form_id` int(11) DEFAULT NULL,
  `subject` varchar(450) DEFAULT NULL,
  `body` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `response_template`
--

INSERT INTO `response_template` (`id`, `types_form_id`, `subject`, `body`) VALUES
(1, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `sections`
--

CREATE TABLE `sections` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `sections_id` int(11) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `content` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `code` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Secciones: pueden ser primarias o secundarias, estas seran l';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `seo_elements`
--

CREATE TABLE `seo_elements` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `element` varchar(250) DEFAULT NULL,
  `value` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Elementos que ayudan a posicionamiento del sitio en buscador';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `server_types`
--

CREATE TABLE `server_types` (
  `id` int(11) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `ispublic` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `server_types`
--

INSERT INTO `server_types` (`id`, `type`, `status`, `ispublic`) VALUES
(1, 'dsadsa', '1', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `site`
--

CREATE TABLE `site` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `title` varchar(500) DEFAULT NULL,
  `subtitle` varchar(500) DEFAULT NULL,
  `type` char(5) DEFAULT NULL,
  `is_public` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='sitio web, comunidad, pagina de info, etc\r\n';

--
-- Volcado de datos para la tabla `site`
--

INSERT INTO `site` (`id`, `company_id`, `title`, `subtitle`, `type`, `is_public`) VALUES
(1, 1, 'DOJO Software Studio', 'lo hacemos realidad', 'WEB', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `static_pages`
--

CREATE TABLE `static_pages` (
  `id` int(11) NOT NULL,
  `site_id` int(11) NOT NULL,
  `title` varchar(250) DEFAULT NULL,
  `subtitle` varchar(400) DEFAULT NULL,
  `content` text,
  `status` char(1) DEFAULT NULL,
  `slug` varchar(400) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Paginas Estaticas';

--
-- Volcado de datos para la tabla `static_pages`
--

INSERT INTO `static_pages` (`id`, `site_id`, `title`, `subtitle`, `content`, `status`, `slug`) VALUES
(1, 1, 'Historia', 'HISTORIA DE DOJO', '<p>\r\n	Lorem ipsum dolor sit amet, consectetur adipiscing elit. Quisque sapien velit, aliquet eget commodo nec, auctor a sapien. Nam eu neque vulputate diam rhoncus faucibus. Curabitur quis varius libero. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aliquam placerat sem at mauris suscipit porta. Cras metus velit, elementum sed pellentesque a, pharetra eu eros. Etiam facilisis placerat euismod. Nam faucibus neque arcu, quis accumsan leo tincidunt varius. In vel diam enim. Sed id ultrices ligula. Maecenas at urna arcu. Sed quis nulla sapien. Nam felis mauris, tincidunt at convallis id, tempor molestie libero. Quisque viverra sollicitudin nisl sit amet hendrerit. Etiam sit amet arcu sem. Morbi eu nibh condimentum, interdum est quis, tempor nisi. Vivamus convallis erat in pharetra elementum. Phasellus metus neque, commodo vitae venenatis sed, pellentesque non purus. Pellentesque egestas convallis suscipit. Ut luctus, leo quis porta vulputate, purus purus pellentesque ex, id consequat mi nisl quis eros. Integer ornare libero quis risus fermentum consequat. Mauris pharetra odio sagittis, vulputate magna at, lobortis nulla. Proin efficitur, nisi vel finibus elementum, orci sem volutpat eros, eget ultrices velit mi sagittis massa. Vestibulum sagittis ullamcorper cursus. Ut turpis dolor, tempor ut tellus et, sodales ultricies elit. Ut pharetra tristique est ac dictum. Integer ac consectetur purus, vehicula efficitur urna. Donec ultrices accumsan ipsum vitae faucibus. Quisque malesuada ex nisi, a bibendum erat commodo in. Pellentesque suscipit varius gravida. Nam scelerisque est sit amet laoreet pharetra. Vivamus quis ligula sed lacus mattis mollis. Vivamus facilisis orci rutrum nulla porta dignissim. Fusce fermentum id nibh laoreet volutpat. Suspendisse venenatis, risus sed euismod finibus, risus arcu fringilla augue, nec vulputate felis nisl et enim. In ornare, massa a cursus cursus, nisl mi ornare mauris, nec porttitor risus erat ut odio. Integer malesuada hendrerit purus ullamcorper molestie. Fusce imperdiet orci vitae purus suscipit rutrum..</p>\r\n', '1', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_files`
--

CREATE TABLE `types_files` (
  `id` int(11) NOT NULL,
  `extension` varchar(250) DEFAULT NULL,
  `status` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tipos de archivos permitidos por el cms';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_form`
--

CREATE TABLE `types_form` (
  `id` int(11) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT NULL,
  `mail_list` text,
  `response` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Tipos de formulario: denuncia, informacion, trabaj con nosot';

--
-- Volcado de datos para la tabla `types_form`
--

INSERT INTO `types_form` (`id`, `type`, `status`, `mail_list`, `response`) VALUES
(1, 'dsadsa', 'd', '<p>\r\n	dsadas</p>\r\n', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `types_project`
--

CREATE TABLE `types_project` (
  `id` int(11) NOT NULL,
  `type` varchar(250) DEFAULT NULL,
  `status` char(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `types_project`
--

INSERT INTO `types_project` (`id`, `type`, `status`) VALUES
(1, 'dsadsads', '1'),
(2, 'Proyecto tipo 1', '1');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asociatte_sections`
--
ALTER TABLE `asociatte_sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bidding_section` (`biddings_id`),
  ADD KEY `fk_form_section` (`forms_id`),
  ADD KEY `fk_project_section` (`projects_id`),
  ADD KEY `fk_section_order` (`sections_id`),
  ADD KEY `fk_static_section` (`static_pages_id`);

--
-- Indices de la tabla `biddings`
--
ALTER TABLE `biddings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_site_bidding` (`site_id`);

--
-- Indices de la tabla `company`
--
ALTER TABLE `company`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `config_servers`
--
ALTER TABLE `config_servers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_servers` (`company_id`),
  ADD KEY `fk_server_type` (`server_types_id`);

--
-- Indices de la tabla `files`
--
ALTER TABLE `files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_bidding_files` (`biddings_id`),
  ADD KEY `fk_file_type` (`types_files_id`),
  ADD KEY `fk_form_files` (`forms_id`),
  ADD KEY `fk_project_files` (`projects_id`),
  ADD KEY `fk_relationship_25` (`sections_id`),
  ADD KEY `fk_static_files` (`static_pages_id`);

--
-- Indices de la tabla `forms`
--
ALTER TABLE `forms`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_form_types` (`types_form_id`),
  ADD KEY `fk_site_forms` (`site_id`);

--
-- Indices de la tabla `form_elements`
--
ALTER TABLE `form_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_form_elements` (`forms_id`);

--
-- Indices de la tabla `link_elements`
--
ALTER TABLE `link_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_menu_parent` (`link_elements_id`);

--
-- Indices de la tabla `menu`
--
ALTER TABLE `menu`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_site_menu` (`site_id`);

--
-- Indices de la tabla `menu_element`
--
ALTER TABLE `menu_element`
  ADD KEY `fk_link_in_menu` (`link_elements_id`),
  ADD KEY `fk_menu_gets` (`menu_id`);

--
-- Indices de la tabla `projects`
--
ALTER TABLE `projects`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_project_type` (`types_project_id`),
  ADD KEY `fk_site_project` (`site_id`);

--
-- Indices de la tabla `response_template`
--
ALTER TABLE `response_template`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_type_response` (`types_form_id`);

--
-- Indices de la tabla `sections`
--
ALTER TABLE `sections`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_parent` (`sections_id`),
  ADD KEY `fk_site_sections` (`site_id`);

--
-- Indices de la tabla `seo_elements`
--
ALTER TABLE `seo_elements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_site_seo` (`site_id`);

--
-- Indices de la tabla `server_types`
--
ALTER TABLE `server_types`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `site`
--
ALTER TABLE `site`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_company_site` (`company_id`);

--
-- Indices de la tabla `static_pages`
--
ALTER TABLE `static_pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_site_statics` (`site_id`);

--
-- Indices de la tabla `types_files`
--
ALTER TABLE `types_files`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `types_form`
--
ALTER TABLE `types_form`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `types_project`
--
ALTER TABLE `types_project`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asociatte_sections`
--
ALTER TABLE `asociatte_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `biddings`
--
ALTER TABLE `biddings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `company`
--
ALTER TABLE `company`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `config_servers`
--
ALTER TABLE `config_servers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `files`
--
ALTER TABLE `files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `forms`
--
ALTER TABLE `forms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `form_elements`
--
ALTER TABLE `form_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `link_elements`
--
ALTER TABLE `link_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `menu`
--
ALTER TABLE `menu`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `projects`
--
ALTER TABLE `projects`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `response_template`
--
ALTER TABLE `response_template`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `sections`
--
ALTER TABLE `sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `seo_elements`
--
ALTER TABLE `seo_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `server_types`
--
ALTER TABLE `server_types`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `site`
--
ALTER TABLE `site`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `static_pages`
--
ALTER TABLE `static_pages`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `types_files`
--
ALTER TABLE `types_files`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `types_form`
--
ALTER TABLE `types_form`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `types_project`
--
ALTER TABLE `types_project`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `asociatte_sections`
--
ALTER TABLE `asociatte_sections`
  ADD CONSTRAINT `fk_bidding_section` FOREIGN KEY (`biddings_id`) REFERENCES `biddings` (`id`),
  ADD CONSTRAINT `fk_form_section` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`),
  ADD CONSTRAINT `fk_project_section` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `fk_section_order` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `fk_static_section` FOREIGN KEY (`static_pages_id`) REFERENCES `static_pages` (`id`);

--
-- Filtros para la tabla `biddings`
--
ALTER TABLE `biddings`
  ADD CONSTRAINT `fk_site_bidding` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `config_servers`
--
ALTER TABLE `config_servers`
  ADD CONSTRAINT `fk_company_servers` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`),
  ADD CONSTRAINT `fk_server_type` FOREIGN KEY (`server_types_id`) REFERENCES `server_types` (`id`);

--
-- Filtros para la tabla `files`
--
ALTER TABLE `files`
  ADD CONSTRAINT `fk_bidding_files` FOREIGN KEY (`biddings_id`) REFERENCES `biddings` (`id`),
  ADD CONSTRAINT `fk_file_type` FOREIGN KEY (`types_files_id`) REFERENCES `types_files` (`id`),
  ADD CONSTRAINT `fk_form_files` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`),
  ADD CONSTRAINT `fk_project_files` FOREIGN KEY (`projects_id`) REFERENCES `projects` (`id`),
  ADD CONSTRAINT `fk_relationship_25` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `fk_static_files` FOREIGN KEY (`static_pages_id`) REFERENCES `static_pages` (`id`);

--
-- Filtros para la tabla `forms`
--
ALTER TABLE `forms`
  ADD CONSTRAINT `fk_form_types` FOREIGN KEY (`types_form_id`) REFERENCES `types_form` (`id`),
  ADD CONSTRAINT `fk_site_forms` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `form_elements`
--
ALTER TABLE `form_elements`
  ADD CONSTRAINT `fk_form_elements` FOREIGN KEY (`forms_id`) REFERENCES `forms` (`id`);

--
-- Filtros para la tabla `link_elements`
--
ALTER TABLE `link_elements`
  ADD CONSTRAINT `fk_menu_parent` FOREIGN KEY (`link_elements_id`) REFERENCES `link_elements` (`id`);

--
-- Filtros para la tabla `menu`
--
ALTER TABLE `menu`
  ADD CONSTRAINT `fk_site_menu` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `menu_element`
--
ALTER TABLE `menu_element`
  ADD CONSTRAINT `fk_link_in_menu` FOREIGN KEY (`link_elements_id`) REFERENCES `link_elements` (`id`),
  ADD CONSTRAINT `fk_menu_gets` FOREIGN KEY (`menu_id`) REFERENCES `menu` (`id`);

--
-- Filtros para la tabla `projects`
--
ALTER TABLE `projects`
  ADD CONSTRAINT `fk_project_type` FOREIGN KEY (`types_project_id`) REFERENCES `types_project` (`id`),
  ADD CONSTRAINT `fk_site_project` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `response_template`
--
ALTER TABLE `response_template`
  ADD CONSTRAINT `fk_type_response` FOREIGN KEY (`types_form_id`) REFERENCES `types_form` (`id`);

--
-- Filtros para la tabla `sections`
--
ALTER TABLE `sections`
  ADD CONSTRAINT `fk_parent` FOREIGN KEY (`sections_id`) REFERENCES `sections` (`id`),
  ADD CONSTRAINT `fk_site_sections` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `seo_elements`
--
ALTER TABLE `seo_elements`
  ADD CONSTRAINT `fk_site_seo` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);

--
-- Filtros para la tabla `site`
--
ALTER TABLE `site`
  ADD CONSTRAINT `fk_company_site` FOREIGN KEY (`company_id`) REFERENCES `company` (`id`);

--
-- Filtros para la tabla `static_pages`
--
ALTER TABLE `static_pages`
  ADD CONSTRAINT `fk_site_statics` FOREIGN KEY (`site_id`) REFERENCES `site` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
