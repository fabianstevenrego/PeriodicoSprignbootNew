-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 21-12-2022 a las 21:06:10
-- Versión del servidor: 10.4.27-MariaDB
-- Versión de PHP: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `periodico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `id_categoria` int(11) NOT NULL,
  `nombre` varchar(52) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`id_categoria`, `nombre`) VALUES
(1, 'Tecnología'),
(2, 'Deportes'),
(3, 'Economía'),
(4, 'Política'),
(5, 'ufps'),
(6, 'Investigación');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_employeelist`
--

CREATE TABLE `categoria_employeelist` (
  `categoria_id_categoria` int(11) NOT NULL,
  `employeelist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_list`
--

CREATE TABLE `categoria_list` (
  `categoria_id_categoria` int(11) NOT NULL,
  `list_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria_noticialist`
--

CREATE TABLE `categoria_noticialist` (
  `categoria_id_categoria` int(11) NOT NULL,
  `noticialist_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `comentario`
--

CREATE TABLE `comentario` (
  `id_comentario` int(11) NOT NULL,
  `id_usuario_comentario` int(11) NOT NULL,
  `id_noticia` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `mensaje` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `comentario`
--

INSERT INTO `comentario` (`id_comentario`, `id_usuario_comentario`, `id_noticia`, `fecha`, `mensaje`) VALUES
(1, 2, 1, '2022-12-02 04:38:29', 'Jaja xd'),
(2, 5, 5, '2022-12-06 19:56:27', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(3, 2, 19, '2022-12-08 19:56:57', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'),
(4, 4, 19, '2022-12-08 19:57:17', 'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.'),
(5, 5, 19, '2022-12-02 19:57:42', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
(6, 1, 21, '2022-12-08 20:20:49', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
(7, 4, 21, '2022-12-08 20:21:04', 'Neque porro quisquam est qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit'),
(8, 1, 21, '2022-12-08 20:21:26', 'No te merecen bicho');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `noticia`
--

CREATE TABLE `noticia` (
  `id` int(11) NOT NULL,
  `titulo` varchar(100) NOT NULL,
  `contenido` text NOT NULL,
  `id_usuario` bigint(11) NOT NULL,
  `estado` varchar(50) DEFAULT NULL,
  `url_imagen` text NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `id_categoria` int(11) DEFAULT NULL,
  `categoria_id_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Volcado de datos para la tabla `noticia`
--

INSERT INTO `noticia` (`id`, `titulo`, `contenido`, `id_usuario`, `estado`, `url_imagen`, `fecha`, `id_categoria`, `categoria_id_categoria`) VALUES
(1, 'Fue a la panaderia por pan y le dieron pan pan', 'No aguantó dos tiros en la frente', 1, 'aprobado', 'https://www.cocinatis.com/media/photologue/photos/cache/CTIS0314-Como-hacer-pan-casero-principal_desktop_horizontal_full_width.jpg', '2022-12-21 15:51:02', 4, 0),
(2, 'Messi falla penal xd', 'Que gei mejor el bicho siuuu!!', 2, 'pendiente', 'https://vanguardia.com.mx/binrepository/1152x1380/0c366/1152d648/down-right/11604/SOQE/cr7_14_VG3388694_MG2033958.jpg', '2022-12-21 15:51:19', 2, 0),
(3, 'argentina se corona campeon del mundo ', 'lorem ipsum de toda la vida', 3, 'aprobado', 'https://ihdemu.com/images/blog/que-es-lorem-ipsum.jpg', '2022-12-21 15:51:46', 2, 0),
(4, 'UFPS da inicio a la IX Semana Internacional de Ciencia, Tecnología e Innovación', 'La IX Semana Internacional de Ciencia, Tecnología e Innovación que se desarrolla del 29 noviembre al 2 de diciembre de 2022, tiene como propósito la presentación de los avances en investigación y extensión de la Universidad Francisco de Paula Santander Cúcuta y seccional Ocaña, a través de los Grupos y Semilleros de investigación, además del intercambio de experiencias con investigadores del ámbito nacional e internacional.\r\n\r\nEn esta oportunidad acompañan la actividad ponentes de países como: Estados Unidos, México, Costa Rica, Perú, Chile, España, Reino Unido, Venezuela y Colombia, quienes a través de ponencias virtuales y presenciales exhiben sus trabajos investigativos. Una novedad de la IX versión será el desarrollo del 1er Encuentro de Proyectos de Extensión e Innovación Social.\r\n\r\n“Es un orgullo para nuestra Universidad presidir eventos investigativos de esta importancia, teniendo en cuenta que es el primero que se realiza con la institución acreditada en alta calidad. Igualmente, resulta vital exaltar los trabajos de estudiantes y docentes del área investigativa. Con estos eventos y el trabajo investigativo de todos los miembros de la Comunidad Universitaria seguiremos avanzando para estar varios puestos más arriba en el ranking que en estos momentos nos califica entre las 10 mejores universidades del país en investigación”, afirmó, Sandra Ortega Sierra, rectora UFPS.\r\n\r\nDurante los cuatro días se presentarán 509 ponencias, 255 de Grupos de Investigación y 254 de Semilleros, asimismo se tendrá la participación de 1.392 investigadores, además, se expondrán resultados de investigación desde las seis áreas de conocimiento que lidera la institución: Ingeniería, Ciencias Básicas, Ciencias Agrarias y del Ambiente, Ciencias de la Salud, Educación, Artes y Humanidades, y Ciencias Empresariales.\r\n\r\n“Este es un espacio que busca presentar las experiencias exitosas de investigación y extensión que se desarrollan en la Universidad, y también para conocer el trabajo de los observatorios desde cada una de sus líneas temáticas, compartiendo sus estrategias y experiencias de trabajo en pro con la comunidad y sus necesidades urbano – rurales”, aseveró, Sergio Iván Quintero, vicerrector de investigación y extensión.\r\n\r\nPara mayor información sobre este evento podrá ingresar al siguiente enlace: https://seincienciatecnologia.ufpso.edu.co/', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/ccd006daa650ac7caae630e150ed0f5c.jpg', '2022-12-21 15:50:45', 5, 0),
(5, 'Consultorio Jurídico UFPS firma convenio con la Fiscalía General', 'La Universidad Francisco de Paula Santander firmó convenio de cooperación interinstitucional con la Fiscalía General de la Nación, con el fin de facultar el Consultorio Jurídico UFPS en la implementación y funcionamiento de la Justicia Restaurativa en procesos penales y materializar el programa de Mediación Penal.\r\n\r\nPara ello, la Fiscalía llevará a cabo capacitaciones en mecanismos alternativos de solución de conflictos - MASC y Justicia Restaurativa, a los estudiantes adscritos al Consultorio Jurídico que a su vez actuarán como mediadores penales.\r\n\r\n“La alianza que se logró permite que nuestros estudiantes de últimos semestres adquieran nuevas competencias y desarrollen prácticas sobre Justicia Restaurativa, asimismo, para que se puedan adelantar estrategias en donde la sociedad reconozca la posibilidad de que algunos conflictos penales sean tramitados por esta vía alterna”, explicó Yulianath Balaguera Rodríguez, directora del Consultorio Jurídico.\r\n\r\nEn cuanto a los supervisores del convenio, por parte de la Fiscalía General de la Nación se encuentra designado la Dr. Jesús Antonio Ardila León, Director Seccional y por parte de la Universidad fungirá como supervisora la Dra. Yulianath Balaguera Rodríguez, Directora del Consultorio UFPS.\r\n\r\nEsta iniciativa funcionará como plan piloto en la región y permitirá al Consultorio Jurídico operar como el primero en prestar su servicio en mediaciones penales, también iniciará la remisión por parte de la Fiscalía General de la Nación sobre conflictos que se tramiten por el proceso abreviado en el área penal.', 3, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/c29d97279f8f2cf0f88935089bb1b560.jpg', '2022-12-21 15:52:06', 5, 0),
(6, 'Fronteras vivas y comunicación digital: ejes centrales de Ápira 2022', 'Con una agenda temática que contó con la participación de ponentes nacionales e internacionales, el programa de Comunicación Social de la Universidad Francisco de Paula Santander realizó el II Congreso Ápira, bajo el eje central de “fronteras vivas”.\r\n\r\nEl evento académico sirvió como espacio de conocimiento, historia y transformación de la comunicación. Asimismo, para hacer un análisis del contexto actual fronterizo, viendo la reapertura de la frontera con Venezuela, como una nueva oportunidad para la región.   \r\n\r\n“Cúcuta es una ciudad que acoge todo este flujo migratorio y nos ha llevado a tener interacciones culturales, sociales y académicas, permitiendo reinventarnos y que nos veamos de una manera distinta en el contexto de frontera. Entonces desde la comunicación, analizamos todos estos fenómenos socioculturales comunicativos y cómo han permitido que a nivel social y cultural nos encontremos migrantes venezolanos, colombianos y terminemos siendo una sola frontera”, explicó Margarita Rosa Peñaloza Durán, Coordinadora del programa de Comunicación Social.\r\n\r\nAsimismo, agregó que el Congreso tuvo conferencias centrales magistrales donde se abordaron temas como la comunicación con los jóvenes, comunicación transmedia, la comunicación en el campo digital y experiencias de cubrimientos periodísticos en zona de frontera. Adicional a esto, los estudiantes disfrutaron de talleres de doblaje de voz y comunicación transmedia. Los graduados del programa también tuvieron su espacio con el encuentro de egresados, donde conocieron los avances y logros que ha tenido el Programa durante sus quince años de fundación.\r\n\r\nEntre tanto, Jaime Silva, director de señal memoria y ponente de Ápira, dijo que señal memoria, es el archivo audiovisual más importante que tiene Colombia y uno de los más relevantes de América Latina. “Contamos con todo el archivo de los medios de comunicación públicos desde 1940 hasta la actualidad, reposan en nuestras bóvedas más de quinientos mil documentos audiovisuales y sonoros que son la historia viva de Colombia, la memoria todos los colombianos.\r\n\r\nComo actividad de cierre del Congreso y una de las más importantes, los estudiantes de los diferentes semestres del programa realizaron una presentación de sus diferentes proyectos de aula a toda la comunidad universitaria.', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/b1515c1cfc4f61ce61ed5e98bcc996d1.jpg', '2022-12-21 15:52:27', 4, 0),
(7, 'UFPS presentó 28 proyectos investigativos en el XXV Encuentro Nacional de Semilleros RedCOLSI', '18 semilleros de investigación de las seis Facultades de la Universidad Francisco de Paula Santander, participaron del XXV Encuentro Nacional y XIX Encuentro Internacional de Semilleros, organizado por la Red Colombiana, RedCOLSI, y llevado a cabo en la ciudad de Medellín.\r\n\r\nAndrea Cacique, coordinadora de Grupos y Semilleros de Investigación, manifestó que de la UFPS se presentaron 28 proyectos y un total de 30 estudiantes quienes acompañaron este evento que tuvo como propósito socializar los avances en investigación, innovación y desarrollo tecnológico de las diferentes temáticas de RedCOLSI.\r\n\r\nLos proyectos participantes, y que son liderados por estudiantes de semilleros de investigación institucional, fueron aquellos que obtuvieron un puntaje igual o superior a 90 puntos en los pasados encuentros departamentales realizados en los nodos de Norte de Santander.\r\n\r\n“Estos encuentros facilitan la creación de escenarios académicos para reconocer el valor y la trascendencia de la investigación formativa ejecutada por los semilleros de investigación y por las instituciones nacionales e internacionales participantes”, afirmó Andrea Cacique.\r\n\r\nJamer Castellanos Fuentes, estudiante UFPS, manifestó que esta experiencia enriquece su proceso académico porque permite mostrar el conocimiento mediante los procesos de investigación, “lo considero como una muy buena oportunidad que nos da la universidad para transmitir todo el proceso investigativo que desarrollamos”.\r\n\r\nFinalmente, la Coordinadora de Grupos y Semilleros de Investigación institucional, expresó que esta participación refleja el interés que tiene la UFPS por incentivar la ruta de formación en investigación con el propósito de fortalecer en los estudiantes las competencias investigativas brindando así mayores oportunidades en el contexto nacional e internacional.', 1, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/cb7741084c3f11955bc8bc6d79e6a7dd.jpg', '2022-12-21 15:52:43', 5, 0),
(8, 'UFPS da inicio a la primera cohorte de la Especialización en Logística y Negocios Internacionales', 'Con el seminario Teoría y Entornos en los Negocios Internacionales orientado por la Dra. Gladys Mireya Valero, decana de la escuela de economía, administración y negocios de la Universidad Pontificia Bolivariana seccional Bucaramanga, se dio inicio en la Universidad Francisco de Paula Santander a la primera cohorte de la Especialización en Logística y Negocios Internacionales.\r\n\r\nEste nuevo posgrado adscrito a la Facultad de Ciencias Empresariales tiene como objetivo brindar competencias a empresarios, comerciantes y profesionales de la región, en áreas del conocimiento que permitan la innovación y el desarrollo de habilidades para la generación de competitividad y visibilizar el mercado nortesantandereano.\r\n\r\nCesar Augusto Panizo Cardona, director de la especialización, resaltó que este programa académico es el resultado de un arduo trabajo entre un equipo de docentes quienes desarrollaron una malla curricular interdisciplinar, pensada para brindar un escenario académico acorde a las necesidades del Departamento.\r\n\r\n“Con los docentes Liliana Marcela Bastos Osorio, directora del programa de Comercio Internacional, Nelson Emilio García Torres, jefe de la Oficina de Relaciones Interinstitucionales e Internacionales –ORII y Johana Mogrovejo Andrade, directora del Departamento de Estudios Internacionales y de Frontera diseñamos una oferta académica acorde a las nuevas dinámicas de los mercados internacionales para brindar a nuestros graduados y comunidad en general, escenarios académicos que permitan la actualización del conocimiento” explicó Panizo Cardona\r\n\r\nDentro de su campo de estudio, este nuevo posgrado estará orientado hacia la formación e investigación en el área de Servicio al Cliente, como eje estratégico para el fortalecimiento de la cadena logística del sector productivo a nivel local, nacional e internacional.\r\n\r\nAdemás, su marco metodológico estará orientado hacia el aprendizaje basado en casos de estudio, visitas de campo a empresas, movilidad académica virtual con profesionales y empresarios a nivel nacional e internacional, así como actividades de investigación que profundizarán el estudio de esta especialización.\r\n\r\n“La UFPS a través del programa de Comercio Internacional y hoy de la Especialización en Logística y Negocios Internacional participamos de la Alianza Logística Regional, un escenario de participación gremial que nos permite como academia no solo dar nuestros aportes al sector productivo, también ser un escenario de práctica profesional para nuestros estudiantes de pregrado y posgrado”, concluyo el docente.   ', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/5d1c3f854f3ec6d61742ee2901b3bfc2.jpg', '2022-12-21 15:52:59', 5, 0),
(9, 'Inicio de inscripciones y venta de pin para programas de pregrado primer semestre de 2023', 'Desde el 19 de octubre y hasta el 18 de noviembre se llevará a cabo la venta de PIN para la inscripción de aspirantes a programas de modalidad presencial en la Universidad Francisco de Paula Santander, primer semestre de 2023.\r\n\r\n28 programas académicos distribuidos en 6 facultades: Ingeniería, Ciencias Agrarias y del Medio Ambiente, Ciencias Empresariales, Educación, Artes y Humanidades, Ciencias de la Salud y Ciencias Básicas (https://ww2.ufps.edu.co/universidad/perfiles/aspirantes/952) es la actual oferta institucional a la cual podrán acceder los bachilleres de la región y el país quienes cumplan con los requisitos de admisión.\r\n\r\n \r\n\r\nRequisitos\r\n\r\nDentro de los requisitos que deberán tener en cuenta los aspirantes para iniciar con su proceso de compra de PIN están:\r\n\r\nHaber presentado las Pruebas Saber 11 en los últimos cinco años.\r\nDiploma de bachiller, si a la fecha no cuenta con este deberá descargar el formato de compromiso que se encuentra en el portal de inscripciones.\r\n \r\n\r\nGeneración de PIN\r\n\r\nPara acceder al Pin de inscripción, el aspirante deberá ingresar al enlace http://inscripciones.ufps.edu.co y registrar sus datos creando una cuenta que le permitirá tener un Usuario y Contraseña. Este registro lo debe realizar dentro de la fecha establecida en el calendario académico (del 19 de octubre al 18 de noviembre), con fecha límite de cargue de documentos hasta el 30 de noviembre.\r\n\r\nUna vez realizado el registro, deberá descargar el recibo para su respectivo pago, el cual tiene un costo de $ 90.000, y esperar de 24 a 48 horas para que se habilite la plataforma y pueda continuar con el cargue de los documentos.    \r\n\r\n \r\n\r\nPolítica de Gratuidad\r\n\r\nLos aspirantes que desean ser parte de este programa del gobierno nacional, deberán presentar los siguientes documentos: certificado de estratificación socioeconómica expedido por la alcaldía municipal que corresponda y el Sisbén.\r\n\r\n \r\n\r\nOferta Académica\r\n\r\nFACULTAD DE INGENIERÍA: Ingeniería Civil, Ingeniería de Sistemas (acreditada) Ingeniería Electrónica (acreditada), Ingeniería Electromecánica, Ingeniería Industrial, Ingeniería de Minas, Ingeniería Mecánica, además de las Tecnologías en Obras Civiles y en Procesos Industriales.\r\n\r\nFACULTAD DE CIENCIAS EMPRESARIALES: Administración de Empresas, Contaduría Pública, Comercio Internacional.\r\n\r\nFACULTAD DE CIENCIAS AGRARIAS Y DEL AMBIENTE: Ingeniería Agroindustrial, Ingeniería Agronómica (acreditada), Ingeniería Ambiental (acreditada), Ingeniería Biotecnológica (acreditada), Zootecnia.\r\n\r\nFACULTAD DE EDUCACIÓN, ARTES Y HUMANIDADES: Comunicación Social (acreditada), Trabajo Social, Derecho, Arquitectura, Licenciatura en Matemáticas (acreditada), Licenciatura en Educación Infantil, Licenciatura en Ciencias Naturales y Educación Ambiental.\r\n\r\nFACULTAD DE CIENCIAS DE LA SALUD: Enfermería (acreditada), Seguridad y Salud en el Trabajo.\r\n\r\nFACULTAD DE CIENCIAS BÁSICAS: Química Industrial.\r\n\r\n \r\n\r\nPara mayor claridad en el proceso de inscripción, los aspirantes UFPS pueden dirigirse al siguiente enlace: https://bit.ly/2vqZh1b donde encontrarán un video instructivo del paso a paso para el proceso de compra de PIN.    ', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/7e203a98c38f9ec9ea645ef60d847c64.jpg', '2022-12-21 15:53:27', 5, 0),
(11, 'UFPS recibió a 109 colegios del área metropolitana de Cúcuta en la feria, “Buscando Carrera”', 'La Universidad Francisco de Paula Santander recibió en sus instalaciones a más de 7000 bachilleres de diferentes Instituciones de Educación Media de la región, quienes participaron de la feria “Buscando Carrera”, una estrategia que tuvo como objetivo dar a conocer toda la oferta académica institucional.\r\n\r\nDurante la actividad que se realizó en el coliseo cubierto de la UFPS, los programas académicos adscritos a las Facultades de Ingeniería, Educación, Artes y Humanidades, Ciencias Empresariales, Ciencias de la Salud, Ciencias Agrarias y del Ambiente y Ciencias Básicas presentaron a través de stands los diferentes procesos tanto académicos, como investigativos que se desarrollan durante el proceso formativo en la universidad, así como,   la malla curricular, los perfiles ocupacionales y profesionales, la misión y visión de cada uno de ello.  \r\n\r\nLuis Eduardo Trujillo Toscano, vicerrector de bienestar universitario, resaltó que este evento es una oportunidad para brindar orientación vocacional a los estudiantes de bachillerato que están próximos a terminar sus estudios de educación media, sobre su proyecto de vida y las oportunidades que les puede ofrecer estudiar una carrera profesional en una universidad con acreditación de alta calidad.\r\n\r\n“La UFPS se ha consolidado a lo largo de sus 60 años de vida institucional como el patrimonio educativo de los nortesantandereanos, por eso hemos dispuesto este tipo de escenarios pedagógicos para que los bachilleres de la región conozcan de primera mano, lo que esta institución acreditada en alta calidad tiene para ofertar a su futuro profesional”\r\n\r\nDestacó además, que la jornada contó con la participación de algunas de la instituciones de educación superior de la región que conforman la Alianza Sies Más, como la Universidad Simón Bolívar, la Universidad Libre, la Universidad de Santander – UDES, la Universidad Minuto de Dios, la Universidad Antonio Nariño y la Fundación de estudios Superiores de Comfanorte – FESC.  \r\n\r\nFinalmente, agradeció el trabajo articulado de los Decanos y Directores de los Programas por contribuir en la realización de la actividad, y felicitó a los directivos y docentes de los 109 colegios que se hicieron presentes en este encuentro académico.      ', 3, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/d92118b2a88967cdcad30ca5dd17ba8b.jpg', '2022-12-08 19:31:28', NULL, 0),
(12, 'Programa de Química Industrial recibe renovación de registro calificado', 'A través de la resolución N° 015546 del 4 de agosto de 2022, el Ministerio de Educación Nacional – MEN - otorgó la renovación de registro calificado al programa de Química Industrial, adscrito a la Facultad de Ciencias Básicas de la Universidad Francisco de Paula Santander, por el máximo período de tiempo, siete años.\r\n\r\nDe acuerdo con el concepto emitido por la Sala de Evaluación de la Comisión Nacional Intersectorial de Aseguramiento de la Calidad de la Educación Superior –CONACES–, el Programa cumplió con las condiciones de calidad que solicita el MEN para el proceso de renovación de registro calificado, dando luz verde a un nuevo periodo de fortalecimiento en materia de ciencia, investigación y proyección social.\r\n\r\nJuan Felipe López Giraldo, director del Programa, manifestó que este logro es el resultado del trabajo articulado entre docentes, estudiantes y administrativos, quienes han hecho de Química Industrial un referente para el campo académico e investigativo.\r\n\r\n“Este es el primer proceso de renovación que recibimos y nos llena de satisfacción saber que en los 6 años de servicio académico que lleva el programa de Química Industrial, hemos consolidado una oferta educativa de calidad que promueve la innovación, la investigación y la mejora curricular para la formación de profesionales cualificados al servicio de la región y el país”, destacó López Giraldo.\r\n\r\nComo aspectos positivos que fueron insumos de alto valor para la renovación del registro calificado, el Ministerio de Educación Nacional resaltó los siguientes:\r\n\r\nLa particularidad del programa de Química Industrial, al ser unos de los tres que se ofertan en todo el país.\r\nSu pertinencia e impacto en el sector productivo a nivel regional y nacional.\r\nLa productividad investigativa, la calidad de los investigadores además de los grupos y semilleros de investigación.\r\nEl cumplimiento del marco normativo del decreto 1330 que define las pautas a seguir respecto a los resultados de aprendizaje.\r\nPor su parte, el rector Jorge Sánchez Molina extendió un saludo de felicitación a estudiantes, docentes, graduados, a la Vicerrectoría Académica, al director del Programa y a los integrantes del Comité Curricular, por este logro que representa la consolidación de la UFPS como una academia de calidad.\r\n\r\n“Hemos iniciado un semestre con muy gratas noticias en materia de certificación académica, la Acreditación Institucional en Alta Calidad de nuestra querida UFPS y la renovación del registro calificado del programa de Química Industrial, logros que representan la calidad, compromiso y dedicación de toda la comunidad académica por consolidar este proyecto educativo llamado Universidad Francisco de Paula Santander”, concluyó Sánchez Molina.  ', 3, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/a343736174a0d94f6eca3f40d1ce43bf.jpg', '2022-12-08 19:32:05', NULL, 0),
(13, 'XII Ventana Internacional 2021 - Relaciones Diplomáticas de Colombia y Apertura Comercial Global', 'Con el uso de las tecnologías de la información y comunicación – TIC, se cumplió la decimosegunda versión del foro Ventana Internacional 2021, que contó con la participación de docentes invitados de Turquía, Perú, Chile y Colombia, el foro se llevó a cabo los días 11 y 12 de noviembre de 2021 y la temática fue las Relaciones Diplomáticas de Colombia y Apertura Comercial Global.\r\n\r\n“Durante 12 años consecutivos venimos realizando este evento, que proyecta internacionalmente el programa de Comercio Internacional y el Departamento de estudios Internacionales. La idea es que esos conocimientos, temáticas, experiencias que son de afuera, sean escuchadas por nuestros estudiantes y docentes y así aprender nuevas cosas que sirvan para enriquecer el proceso de estudio”, comentó Johanna Milena Mogrovejo Andrade, quien es directora del Departamento de Estudios Internacionales y de Frontera de la UFPS. \r\n\r\nEl evento fue dirigido para estudiantes y docentes del programa de Comercio Internacional, sin embargo, Liliana Marcela Bastos Osorio, directora del programa, resaltó la participación de estudiantes extranjeros. “Contamos con la participación de estudiantes de México, de Turquía, que fueron invitados por los docentes que participaron de sus respectivos países, aprovechando la ventaja de las herramientas digitales que nos han permitido tener la participación de personas del exterior, ampliando un poco el espacio de conocimiento”.\r\n\r\nConferencistas\r\n\r\nDr. Humberto Banda, profesor investigador de la Universidad Autónoma de Queretano – México.\r\nJaime Zúñiga Raigoza, Msc. en Mercadeo Global – Medellín, Colombia.\r\nSezer Askoy, Candidato a Doctorado, Communication Expert – Turquía.\r\nRodrigo Boluarte Chávez, Consejero de la Embajada del Perú en Colombia -  Bogotá.\r\nCarlos Muñoz, Trade Manager ProChile - Bogotá, Colombia.\r\nJan Willem Van Bokhoven, Director Ejecutivo Holland House Colombia, Cámara de    Comercio Holandesa – Colombo-holandés.\r\nEstos docentes y conferencistas aportaron desde su experiencia todo el conocimiento en términos de apertura comercial en cada país y en relación con Colombia. También a nivel nacional se mostró cómo ha sido el proceso y generación de estrategias.\r\n\r\nCabe resaltar que, en esta versión del foro una de las presentaciones se realizó un segundo idioma, “fue la del docente de Turquía, fue en inglés y contamos con una traducción simultánea de un docente para los asistentes.  Esto de alguna manera es la puerta para que nuestros estudiantes empiecen a escuchar en otros idiomas este tipo de presentaciones y entiendan que existe la necesidad de aprender una segunda lengua, de la preparación continua, lo cual les gustó mucho, ya que es la primera vez que tenemos un invitado hablándonos en otro idioma y fue muy interesante ver a los estudiantes responder e interesarse en este tipo de interacciones”, enfatizó Mogrovejo.\r\n\r\nLos futuros profesionales en comercio internacional aprendieron sobre las relaciones políticas y diplomáticas, en el caso de Turquía, y como a través de la televisión, de productos audiovisuales, como las novelas, muestran una imagen de su país, de su cultura y así logran entrar comercialmente, siendo esto muy interesante, el uso de este tipo de estrategias también para atraer turismo y negocios.\r\n\r\nJohanna Mogrovejo, subrayó que “estos eventos fortalecen y apoyan todos los procesos de calidad de los programas, son un aporte fundamental para mejorar, reflexionar sobre nuestros contenidos curriculares y para incluir nuevas temáticas. La idea es continuar trabajando en pro del programa, del departamento de estudios, de la facultad y de la universidad”.', 1, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/fd58b0d185366778296b0613a66a57c9.jpg', '2022-12-04 19:43:28', NULL, 0),
(14, 'UFPS y Gobernación de Norte de Santander realizaron feria de servicios para población en condición d', 'La Universidad Francisco de Paula Santander a través del Consultorio Jurídico adscrito al programa de Derecho y en articulación con la Alta Consejería para la Población con Discapacidad de la Gobernación de Norte de Santander, llevaron a cabo una jornada de atención de servicios institucionales para personas en condición de discapacidad.\r\n\r\nDurante la actividad, se ofrecieron servicios de asesoría jurídica, acompañamiento psicológico por parte del ICBF, atención del Sísben, oferta académica del Sena y servicios de la Secretaría TIC departamental. Igualmente, la Alcaldía de Cúcuta por medio de la Secretaría de Salud y el Instituto Municipal para la Recreación y el Deporte realizó una serie de actividades lúdico-recreativas para todos los asistentes.\r\n\r\nJesús Augusto Romero Montoya, alto consejero para la población con discapacidad de Norte de Santander, manifestó que es muy importante esta alianza entre Gobernación y UFPS, donde la universidad sea ese punto importante que se necesita no solo en la formación de nuevos profesionales sino también en la atención de la sociedad.\r\n\r\n“Hacemos un llamado a las empresas público/privadas para vincular a personas con discapacidad a su planta de trabajadores, cada día debemos ser más incluyentes, esta población merece tener espacios propicios para su desarrollo, y desde la Gobernación y la academia le apostamos a esto”, añadió Romero Montoya.\r\n\r\nPor su parte, Luis Eduardo Trujillo Toscano vicerrector de bienestar universitario UFPS, expresó que, en el marco de la política de educación inclusiva, la UFPS viene trabajando y aunando esfuerzos para desarrollar nuevas estrategias y proyectos en beneficio de esta población.\r\n\r\n“Esta es una acción más que venimos desarrollando desde la Vicerrectoría de Bienestar Universitario y el Consultorio Jurídico, con el firme propósito de acercar a las entidades y al sector productivo tanto publico como privado a la población en condición de discapacidad”, afirmó Trujillo Toscano.', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/4d4c0c1bf696f832b237fe77557ed87d.jpg', '2022-12-01 19:43:28', NULL, 0),
(15, 'XII Ventana Internacional 2021 - Relaciones Diplomáticas de Colombia y Apertura Comercial Global', 'Con el uso de las tecnologías de la información y comunicación – TIC, se cumplió la decimosegunda versión del foro Ventana Internacional 2021, que contó con la participación de docentes invitados de Turquía, Perú, Chile y Colombia, el foro se llevó a cabo los días 11 y 12 de noviembre de 2021 y la temática fue las Relaciones Diplomáticas de Colombia y Apertura Comercial Global.\r\n\r\n“Durante 12 años consecutivos venimos realizando este evento, que proyecta internacionalmente el programa de Comercio Internacional y el Departamento de estudios Internacionales. La idea es que esos conocimientos, temáticas, experiencias que son de afuera, sean escuchadas por nuestros estudiantes y docentes y así aprender nuevas cosas que sirvan para enriquecer el proceso de estudio”, comentó Johanna Milena Mogrovejo Andrade, quien es directora del Departamento de Estudios Internacionales y de Frontera de la UFPS. \r\n\r\nEl evento fue dirigido para estudiantes y docentes del programa de Comercio Internacional, sin embargo, Liliana Marcela Bastos Osorio, directora del programa, resaltó la participación de estudiantes extranjeros. “Contamos con la participación de estudiantes de México, de Turquía, que fueron invitados por los docentes que participaron de sus respectivos países, aprovechando la ventaja de las herramientas digitales que nos han permitido tener la participación de personas del exterior, ampliando un poco el espacio de conocimiento”.\r\n\r\nConferencistas\r\n\r\nDr. Humberto Banda, profesor investigador de la Universidad Autónoma de Queretano – México.\r\nJaime Zúñiga Raigoza, Msc. en Mercadeo Global – Medellín, Colombia.\r\nSezer Askoy, Candidato a Doctorado, Communication Expert – Turquía.\r\nRodrigo Boluarte Chávez, Consejero de la Embajada del Perú en Colombia -  Bogotá.\r\nCarlos Muñoz, Trade Manager ProChile - Bogotá, Colombia.\r\nJan Willem Van Bokhoven, Director Ejecutivo Holland House Colombia, Cámara de    Comercio Holandesa – Colombo-holandés.\r\nEstos docentes y conferencistas aportaron desde su experiencia todo el conocimiento en términos de apertura comercial en cada país y en relación con Colombia. También a nivel nacional se mostró cómo ha sido el proceso y generación de estrategias.\r\n\r\nCabe resaltar que, en esta versión del foro una de las presentaciones se realizó un segundo idioma, “fue la del docente de Turquía, fue en inglés y contamos con una traducción simultánea de un docente para los asistentes.  Esto de alguna manera es la puerta para que nuestros estudiantes empiecen a escuchar en otros idiomas este tipo de presentaciones y entiendan que existe la necesidad de aprender una segunda lengua, de la preparación continua, lo cual les gustó mucho, ya que es la primera vez que tenemos un invitado hablándonos en otro idioma y fue muy interesante ver a los estudiantes responder e interesarse en este tipo de interacciones”, enfatizó Mogrovejo.\r\n\r\nLos futuros profesionales en comercio internacional aprendieron sobre las relaciones políticas y diplomáticas, en el caso de Turquía, y como a través de la televisión, de productos audiovisuales, como las novelas, muestran una imagen de su país, de su cultura y así logran entrar comercialmente, siendo esto muy interesante, el uso de este tipo de estrategias también para atraer turismo y negocios.\r\n\r\nJohanna Mogrovejo, subrayó que “estos eventos fortalecen y apoyan todos los procesos de calidad de los programas, son un aporte fundamental para mejorar, reflexionar sobre nuestros contenidos curriculares y para incluir nuevas temáticas. La idea es continuar trabajando en pro del programa, del departamento de estudios, de la facultad y de la universidad”.', 1, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/fd58b0d185366778296b0613a66a57c9.jpg', '2022-12-04 19:43:28', NULL, 0),
(17, 'Ministerio de Educación Nacional otorga renovación de registro calificado por siete años al programa', 'A través de la resolución número 021555 del 12 de noviembre de 2021 y por el máximo período de tiempo, siete años, el Ministerio de Educación Nacional otorgó la renovación del registro calificado al programa de Tecnología en Procesos Industriales, adscrito a la Facultad de Ingeniería de la Universidad Francisco de Paula Santander.\r\n\r\nDe acuerdo con la resolución, el Programa cumplió con las condiciones de calidad que solicita el MEN para el proceso de renovación de registro calificado, como son la disponibilidad de laboratorios para el desarrollo de prácticas académicas, la proyección social, el uso de herramientas tecnológicas durante la contingencia y demás aspectos curriculares.\r\n\r\nPedro Garzón Agudelo, coordinador del Programa, destacó que este logro se debe a un proceso de autoevaluación muy riguroso que permitió elaborar un documento maestro muy bien estructurado, respondiendo a cada uno de los aspectos del Decreto 1330; sumado a la labor y el liderazgo de estudiantes, docentes, graduados, directivas y empresarios de la región.\r\n\r\n“La renovación del registro calificado por parte del MEN, es el resultado del compromiso adquirido por la comunidad académica del Programa y su sentido de pertenencia con la Institución en la apropiación de cada proceso de mejoramiento continuo que nos llevaron a buen puerto”, resaltó el docente.\r\n\r\nReiteró, que el Programa seguirá trabajando en el fortalecimiento de sus procesos de docencia, investigación y extensión, teniendo en cuenta las exigencias del contexto y la implementación de los Resultados de Aprendizaje para consolidar la cultura de calidad y mejoramiento continuo hacia la Acreditación.\r\n\r\nPor su parte, el rector Héctor Miguel Parra López felicitó a los estudiantes, docentes, graduados, a la Vicerrectoría Académica, al coordinador del Programa y a los integrantes del Comité Curricular, por este logro que representa un fundamento más en los objetivos institucionales de acreditación y un indicador de calidad en la formación académica de los futuros profesionales de la región.\r\n\r\n“De esta manera la UFPS sigue consolidando toda su oferta académica hacia la excelencia, permitiendo su proyección a nivel regional y nacional, como institución de educación superior con altos estándares de calidad en sus componentes de docencia, investigación y proyección social”, concluyó Parra López.  ', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/aed552e75a5f6a42fa3425f2b896fea3.jpg', '2022-12-08 19:49:52', NULL, 0),
(19, 'Docentes UFPS presentan libro sobre arquitectura, geometría y arte de la Catedral San José de Cúcuta', 'Yannette Díaz Umaña, directora del Departamento de Arquitectura, Diseño y Urbanismo; Mawency Vergel Ortega, directora del Departamento de Matemáticas y Estadística y Julio Alfredo Delgado Rojas, Magister en Educación Matemáticas de la Universidad Francisco de Paula Santander, presentaron a la institución y comunidad en general, el libro: “Entre las torres de San José. Aproximaciones al arte, arquitectura y geometría de la catedral.”\r\n\r\nEl material bibliográfico que se desarrolló a partir del proyecto ARQUIMATSO, es una apuesta interdisciplinar en la que las matemáticas, estadística y la geometría participan de forma visible para mejorar las habilidades en la comprensión y valoración del patrimonio y el conocimiento de la historia arquitectónica y desarrollo urbano de la ciudad.\r\n\r\nYannette Díaz Umaña, coautora del libro, explicó que el documento es el resultado de un extenso trabajo de investigación que nació en el año 2016 y que tomó como antecedente el proyecto desarrollado por el docente Julio Alfredo Delgado Rojas durante su proceso de formación como maestrante en Educación Matemáticas de nuestra casa de estudios.  \r\n\r\n“A partir de este estudio en el que hubo un encuentro de disciplinas afines y que estuvo bajo la dirección del rector y docente de la UFPS, Héctor Miguel Parra López, se pudo generar un aporte de investigación que sin duda acentúan la importancia del análisis académico para el reconocimiento de los espacios urbanos que consolidan la historia de nuestra ciudad y que son patrimonio de los nortesantandereanos”, destacó la docente.\r\n\r\nAsimismo, resaltó que la construcción del libro se basó en la propuesta de integración curricular bajo la metodología STEAM (Ciencia, Tecnología, Ingeniería, Artes y Matemática), para contribuir desde el reconocimiento de la arquitectura, el estudio de la matemática aplicada, la geometría y estadística al del desarrollo estratégico de la región.\r\n\r\nEntre tanto, Julio Alfredo Delgado Rojas, Mgs. En Educación Matemáticas y coautor del libro, manifestó que este material investigativo permitirá establecer contribuciones puntuales para la comprensión e intervención de la arquitectura y en consecuencia generar un aporte a la difusión y protección del entorno patrimonial arquitectónico, artístico y urbano de la región.\r\n\r\n“Con este trabajo, en el que se contó con la participación de excelentes investigadoras como las docentes Mawency Vergel Ortega y Yannette Díaz Umaña, se logró trascender en el conocimiento científico a partir de los hallazgos en la interpretación de la arquitectura a través del saber matemático, analítico y abstracto, para generar identidad y sentido de pertenencia por las obras de interés cultural como la Catedral de Cúcuta”, puntualizó el docente.', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/79fad638fe3c1347fec290ec37d858ff.jpg', '2022-11-18 19:49:56', NULL, 0),
(20, 'El profesor Héctor Miguel Parra López tomó posesión como rector UFPS 2021 -2025', 'Cumplida la sesión del 25 de junio, el Consejo Superior Universitario, como máximo órgano de dirección y control de la Universidad Francisco de Paula Santander, designó al ingeniero Héctor Miguel Parra López en el cargo de rector UFPS para el periodo 2021-2025.\r\n\r\nEl gobernador (e) Johan Eduardo Ordoñez Ortiz, llevó a cabo la posesión de acuerdo con la verificación de la información suministrada por el Consejo Electoral Universitario sobre los resultados de la consulta democrática realizada los días 4 y 5 de junio de manera virtual, en todas las sedes UFPS, con la participación de docentes, estudiantes y administrativos.\r\n\r\nEn sus primeras palabras, el rector Parra López agradeció el respaldo de los consejeros por la designación y por haber tenido en cuenta su liderazgo y compromiso con la Universidad Francisco de Paula Santander. “Invito a todos los estamentos universitarios para que articulemos esfuerzos en favor de nuestra querida UFPS y ratifico mi compromiso de trabajar con cada estudiante, docente y administrativo en búsqueda de una Universidad acreditada y sólida en sus quehaceres misionales de docencia, investigación y extensión”, puntualizó.\r\n\r\nHoja de vida\r\n\r\nEl profesor Héctor Miguel Parra López es Ingeniero de Sistemas egresado de la Universidad Industrial de Santander y Magister en Administración Educativa de la Universidad Rafael Urdaneta de Venezuela.\r\n\r\nSe ha desempeñado por más de 33 años como docente universitario y, durante su trayectoria y experiencia en el ámbito de la educación superior, ha asumido diferentes cargos administrativos y directivos, sobresaliendo por su liderazgo y capacidad de gestión.\r\n\r\nAsí mismo, sobresalen diversos reconocimientos entre los que se destacan la condecoración “José Eusebio Caro” otorgada por la Gobernación del Departamento en el 2002, en el grado extraordinario en “Reconocimiento a sus destacados méritos profesionales y sus valiosos servicios a la educación de Norte de Santander” y el reconocimiento por parte de la Presidencia de la República en el 2007 por su labor en favor de la educación.\r\n\r\nAl finalizar la sesión, el Consejo Superior Universitario agradeció la gestión adelantada por el ingeniero Jhan Piero Rojas Suárez durante los meses que permaneció en el cargo.', 2, 'aprobado', 'https://ww2.ufps.edu.co/public/imagenes/noticia/6e35990369610c20960dcc9faffddd89.jpg', '2022-09-12 19:54:15', NULL, 0),
(21, '\'Cristiano Ronaldo amenazó con irse de Portugal\': la noticia que estremece Qatar', 'Cristiano Ronaldo, en su quinto Mundial, entre su destino futuro aún por concretar de forma definitiva después de forzar su salida del Manchester United con unas declaraciones antes del Mundial, su gesto a Fernando Santos al final de la derrota por 2-1 contra Corea del Sur y la noticia publicada este jueves por \'Récord\' de que amenazó con abandonar el torneo cuando conoció su suplencia ante Suiza, negada por la Federación Portuguesa de Fútbol, lo domina un estado de turbulencia, a dos días de enfrentarse a Marruecos en los cuartos de final, con la duda de si recuperará o no la titularidad.\r\n\r\nNo hay pausa en el debate que pone al astro luso, al futbolista con más partidos (195) y más goles (118) con la selección, en el centro de todo en Portugal, desde el principio hasta ahora, desde que su equipo aterrizó en Catar, entre cómo influirían todas sus declaraciones sobre el Manchester United, en la relación con sus compañeros como Bruno Fernandes (incluso, entonces, Cristiano compareció de forma sorpresiva ante la prensa); cómo es su liderazgo en el conjunto luso, cómo se tomó que no le dieran el gol ante Uruguay, su reacción con el entrenador tras el 2-1 ante Corea del Sur, su relevo al banquillo en unos octavos de final del Mundial... Y, ahora, su reacción a una suplencia inesperada.\r\n\r\n\"Una noticia publicada el jueves dice que Cristiano Ronaldo amenazó con abandonar el equipo nacional durante una conversación con Fernando Santos, seleccionador nacional. La FPF (Federación Portuguesa de Fútbol) aclara que en ningún momento el capitán de la selección, Cristiano Ronaldo, amenazó con abandonar la selección durante la concentración en Catar\", salió el paso el organismo en su web oficial, cuando asoman los cuartos de final.\r\n\r\nEl comunicado surgió después de la información publicada por \'Récord\', que afirmó que Cristiano Ronaldo \"amenazó con irse\" de la concentración del Mundial 2022 en \"una acalorada conversación con Fernando Santos\", el seleccionador nacional, aunque luego el capitán \"se calmó, reflexionó y cambió de opinión\".\r\n\r\nTambién asegura que el \"grupo\" se quedó \"al margen\" de tal situación, según refleja el diario.\r\n\r\nLa defensa de la FPF fue más allá en sus cinco párrafos publicados a mediodía desde su concentración de Al Shahaniya, al oeste de Doha.\r\n\r\n\"Cristiano Ronaldo construye cada día una trayectoria única al servicio de la selección y del país que tiene que ser respetada y que da fe del incuestionable compromiso con la selección. De hecho, el grado de entrega del jugador más veces internacional con Portugal fue demostrado de nuevo, si es necesario hacerlo, en la victoria frente a Suiza en los octavos de final del Mundial 2022\", remarcó la nota, horas antes de que el equipo se entrene con la vista en Marruecos.', 4, 'aprobado', 'https://www.eltiempo.com/files/article_content_new/uploads/2022/12/07/6390ab5d18d73.jpeg', '2022-12-06 20:14:52', NULL, 0),
(22, 'Inglaterra recibe excelente noticia antes de enfrentar a Francia en Qatar\r\n', 'Después de viajar a Inglaterra para apoyar a su familia luego de un robo en su mansión al sur de Londres, el delantero inglés Raheem Sterling se reincorporará el viernes a la selección en Qatar, un día antes de los cuartos de final contra Francia, anunció este jueves la Federación Inglesa de Fútbol (FA).\r\n\r\nLas informaciones de la prensa inglesa afirmaban que la familia del atacante del Chelsea estaba presente cuando hombres armados entraron por la fuerza en su residencia situada en Surrey.\r\n\r\nPero la policía local precisó en un comunicado que el robo se constató cuando se fueron los ladrones y que nadie fue amenazado.\r\n\r\nFutbolista con más partidos como internacional de los 26 ingleses convocados, con 81 partidos (20 goles, 27 asistencias), Sterling quizás entre en la convocatoria, pero es poco probable que juegue después de cuatro días sin entrenarse con el grupo dirigido por Gareth Southgate. \r\n\r\n\r\nAFP', 5, 'aprobado', 'https://www.eltiempo.com/files/article_main/uploads/2022/12/06/638f89f336fca.jpeg', '2022-12-02 20:16:08', NULL, 0),
(23, 'Luis Enrique deja de ser el técnico de España  tras eliminación del Mundial', 'La Federación Española (RFEF) anunció este jueves el cese del seleccionador español\r\nLuis Enrique Martínez, tras la eliminación en octavos de final del Mundial de Qatar frente a Marruecos, y su sustitución por Luis de la Fuente.\r\n\r\nEl organismo considera que \"debe arrancar un nuevo proyecto para la Selección Española de Fútbol, con el objetivo de continuar con el crecimiento alcanzado en los últimos años gracias al trabajo realizado por Luis Enrique\", señaló la federación en un comunicado, agradeciendo al técnico su trabajo.\r\n', 5, 'aprobado', 'https://www.eltiempo.com/files/article_main/uploads/2022/12/08/6391da1e01dd1.jpeg', '2022-12-04 20:23:40', NULL, 0),
(24, 'Gustavo Petro y María Fernanda Cabal chocan por crisis política en Perú', 'En medio de la crisis política que está viviendo Perú tras la detención del hasta este miércoles presidente de este país, Pedro Castillo, el presidente de Colombia, Gustavo Petro, aseguró que en la ultraderecha latinoamericana está desatada la ansiedad de golpes. \r\n\r\nEl comentario del jefe de Estado lo hizo a propósito de un trino de la senadora uribista María Fernanda Cabal, quien afirmó que \"los ejércitos con vocación son anticomunistas. Una realidad con la que no cuentan los comunistas\".', 4, 'aprobado', 'Frente a esto, el presidente de los colombianos le respondió a través de la misma red social que \"esta desatada la ansiedad de golpes en nuestra ultraderecha latinoamericana\".\r\n\r\nY agregó que \"les importa un bledo la voluntad popular. Los ejércitos no tienen porque ser ni fascistas ni comunistas, los ejércitos son de la Nación\".', '2022-12-07 20:48:42', NULL, 0),
(25, 'Uribe: \'Prefieren instalar la dictadura neocomunista que proteger la democracia\'', 'El expresidente Álvaro Uribe publicó en la mañana de este jueves en su cuenta de Twitter una reflexión sobre la crisis política que vive el Perú, a propósito de la detención del hasta el miércoles presidente Pedro Castillo, quien intentó disolver el Congreso de ese país.\r\n\r\nSegún Uribe, lo que ocurrió en ese país nos debe poner a reflexionar y \"si tenemos que corregir, debemos corregir\".\r\n \r\n\"En el Perú ha quedado claro que los gobiernos neocomunistas prefieren instalar la dictadura neocomunista que proteger la democracia. Utilizan la democracia para hacerse elegir y la destruyen para quedarse en el poder. Pero todos tenemos que cuidar la democracia, tanto quienes ejercen el gobierno como quienes estamos en la oposición\", aseguró el expresidente. ', 4, 'aprobado', 'https://www.eltiempo.com/files/article_main/files/crop/uploads/2022/09/29/6335db66170b1.r_1670520914543.0-25-3000-1527.jpeg', '2022-12-06 20:50:00', NULL, 0),
(32, 'prueba', 'hola', 1, 'activo', 'http', '2022-12-16 13:50:32', NULL, 0),
(34, 'esto es una prueba', 'prueba good', 1, 'activo', 'https', '2022-12-21 03:40:19', NULL, 0),
(35, 'ronaldo anota denuevo evo', '<p>cr7 forever love suuuuuu</p>\n', 1, 'espera', '', '2022-12-21 05:58:36', 2, 0),
(36, 'prueba', 'prueba', 1, 'dawdwa', 'awdaw', '2022-12-21 04:21:02', NULL, 0),
(37, 'noches', 'buenas', 1, '1', '11', '2022-12-21 05:41:56', 1, 0),
(38, 'partido', '<p>ganadfor</p>\n', 1, 'espera', 'futbol', '2022-12-21 05:57:39', NULL, 0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `rol`
--

CREATE TABLE `rol` (
  `id` bigint(20) NOT NULL,
  `nombre` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `rol`
--

INSERT INTO `rol` (`id`, `nombre`) VALUES
(1, 'Administrador'),
(3, 'Usuario'),
(4, 'Administrador'),
(5, 'ROLE_USER'),
(7, 'ROLE_USER'),
(8, 'ROLE_USER'),
(9, 'ROLE_USER'),
(10, 'ROLE_USER'),
(11, 'ROLE_USER'),
(12, 'ROLE_USER'),
(13, 'ROLE_USER'),
(15, 'ROLE_USER'),
(16, 'ROLE_USER'),
(17, 'ROLE_USER'),
(18, 'ROLE_USER'),
(19, 'ROLE_USER');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` bigint(20) NOT NULL,
  `apellido` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `apellido`, `email`, `nombre`, `password`) VALUES
(1, 'reyes', 'fabianreyes12929@gmail.com', 'fabian ', NULL),
(3, 'restrepo', 'angelrestrepo@ufps.edu.co', 'angel', '$2a$10$m0.t5DIm93CjwP3EgSVjSeA4IWr3vN8W09cal5BF7ijJq0QG0IBea'),
(4, 'maricoLoQueSea', 'jesusandreyalco@ufps.edu.co', 'jesus', '$2a$10$5cZN9lGhoWiAGFtBDoNTRulolf7K2Xr3BKq4/a0JgIfMVS43wtUuq'),
(6, 'quintero', 'jhony@gmail.com', 'jhony', '$2a$10$GJSIVrQIjcDxam.blMnWb.Q0c.CE3WhIvCgkMQ.o248twALyX6qj.'),
(17, 'reyes', 'fabianreyes1292929@gmail.com', 'fabian', '$2a$10$f0SfdDGv5C4j5pVkkcdW.ebxEFZBILY.3cnXhoGVLhZPWmWv4tz5m'),
(19, 'reyes', 'roberto12929@gmail.com', 'roberto', '$2a$10$aZ0JA1.R1zqAU.LbPx78L.On2BYCXknjBgIzz5v7DjWirkyQ7cduS'),
(20, 'duran', 'karenduran@gmail.com', 'karen', '$2a$10$y8pCvNSZravi2n4V79bgueC.ELpCkTl8ZDR/FMCJBK4A8qYKjPurO'),
(21, 'reyes', 'cristianReyes@gmail.com', 'cristian', '$2a$10$g9NbcNADwzWwaFAFVIv5TuxB9TvhJL/wok7f8bSfICiwkbnT28SXC'),
(23, 'Reyes', 'RobertoReyes33@gmail.com', 'Roberto Carlos ', '$2a$10$1pLIPoi1I50e0qaM0e4/yuvUBGEwi9TybaITa8OQa/LkFITwZDpGG'),
(24, 'duran', 'natalia@gmail.com', 'natalia', '$2a$10$irz5ObT53i17/TReu0rkhuQyodCMvfNOzB62hhX6kyhMiFDwCvRPS'),
(25, 'trigos', 'diegotrigos@gmail.com', 'diego emanuel', NULL),
(27, 'reyes', 'fabianreyesgonzalez@gmail.com', 'fabian', '$2a$10$63Pv1QO8jJH7LRxVFqFxMuL5ZyxwWJeMQzK48Lrm7wTMMWTg6P3fC');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios_roles`
--

CREATE TABLE `usuarios_roles` (
  `usuario_id` bigint(20) NOT NULL,
  `rol_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_spanish_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`id_categoria`);

--
-- Indices de la tabla `categoria_employeelist`
--
ALTER TABLE `categoria_employeelist`
  ADD UNIQUE KEY `UK_4xs78k7w531o2ps77rocv6hc5` (`employeelist_id`),
  ADD KEY `FKrctiwhts0tdxdsv9j64xgxvvu` (`categoria_id_categoria`);

--
-- Indices de la tabla `categoria_list`
--
ALTER TABLE `categoria_list`
  ADD UNIQUE KEY `UK_3whdgww31ona84mufcqjq5j0c` (`list_id`),
  ADD KEY `FK5acwsu1mq72lahwfsjw4cy96h` (`categoria_id_categoria`);

--
-- Indices de la tabla `categoria_noticialist`
--
ALTER TABLE `categoria_noticialist`
  ADD UNIQUE KEY `UK_q15wyis94k3mlu4mtb31texcg` (`noticialist_id`),
  ADD KEY `FKcv2yt61oa0ts5auqoqy6wpkpk` (`categoria_id_categoria`);

--
-- Indices de la tabla `comentario`
--
ALTER TABLE `comentario`
  ADD PRIMARY KEY (`id_comentario`),
  ADD KEY `id_usuario` (`id_usuario_comentario`),
  ADD KEY `id_noticia` (`id_noticia`);

--
-- Indices de la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_usuario` (`id_usuario`),
  ADD KEY `FK4a8p8torct38fwpyx7dhvcntn` (`id_categoria`);

--
-- Indices de la tabla `rol`
--
ALTER TABLE `rol`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK5171l57faosmj8myawaucatdw` (`email`);

--
-- Indices de la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD KEY `FK6yxg1lhuv5nievqea7rvn6afm` (`rol_id`),
  ADD KEY `FKebiaxjbamgu326glxo1fbysuh` (`usuario_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `id_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `comentario`
--
ALTER TABLE `comentario`
  MODIFY `id_comentario` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `noticia`
--
ALTER TABLE `noticia`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT de la tabla `rol`
--
ALTER TABLE `rol`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `categoria_employeelist`
--
ALTER TABLE `categoria_employeelist`
  ADD CONSTRAINT `FK8fsa8e27qyofhj3u2xiq8i04j` FOREIGN KEY (`employeelist_id`) REFERENCES `noticia` (`id`),
  ADD CONSTRAINT `FKrctiwhts0tdxdsv9j64xgxvvu` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `categoria_list`
--
ALTER TABLE `categoria_list`
  ADD CONSTRAINT `FK5acwsu1mq72lahwfsjw4cy96h` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `FKd4rl5tfqxqcuclevxbwpaog1l` FOREIGN KEY (`list_id`) REFERENCES `noticia` (`id`);

--
-- Filtros para la tabla `categoria_noticialist`
--
ALTER TABLE `categoria_noticialist`
  ADD CONSTRAINT `FKcv2yt61oa0ts5auqoqy6wpkpk` FOREIGN KEY (`categoria_id_categoria`) REFERENCES `categoria` (`id_categoria`),
  ADD CONSTRAINT `FKr0u0cd9ire74k6v35q2uiauf8` FOREIGN KEY (`noticialist_id`) REFERENCES `noticia` (`id`);

--
-- Filtros para la tabla `noticia`
--
ALTER TABLE `noticia`
  ADD CONSTRAINT `FK4a8p8torct38fwpyx7dhvcntn` FOREIGN KEY (`id_categoria`) REFERENCES `categoria` (`id_categoria`);

--
-- Filtros para la tabla `usuarios_roles`
--
ALTER TABLE `usuarios_roles`
  ADD CONSTRAINT `FK6yxg1lhuv5nievqea7rvn6afm` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`),
  ADD CONSTRAINT `FKebiaxjbamgu326glxo1fbysuh` FOREIGN KEY (`usuario_id`) REFERENCES `usuario` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
