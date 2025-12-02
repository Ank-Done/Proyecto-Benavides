/*M!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19-11.7.2-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: fbenavides
-- ------------------------------------------------------
-- Server version	12.0.2-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*M!100616 SET @OLD_NOTE_VERBOSITY=@@NOTE_VERBOSITY, NOTE_VERBOSITY=0 */;

--
-- Table structure for table `alergias_catalogo`
--

DROP TABLE IF EXISTS `alergias_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `alergias_catalogo` (
  `IdAlergia` int(11) NOT NULL AUTO_INCREMENT,
  `NombreAlergia` varchar(120) NOT NULL,
  PRIMARY KEY (`IdAlergia`),
  UNIQUE KEY `NombreAlergia` (`NombreAlergia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alergias_catalogo`
--

LOCK TABLES `alergias_catalogo` WRITE;
/*!40000 ALTER TABLE `alergias_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `alergias_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `antecedentes_familiares_catalogo`
--

DROP TABLE IF EXISTS `antecedentes_familiares_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `antecedentes_familiares_catalogo` (
  `IdAntecedente` int(11) NOT NULL AUTO_INCREMENT,
  `Descripcion` varchar(200) NOT NULL,
  PRIMARY KEY (`IdAntecedente`),
  UNIQUE KEY `Descripcion` (`Descripcion`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `antecedentes_familiares_catalogo`
--

LOCK TABLES `antecedentes_familiares_catalogo` WRITE;
/*!40000 ALTER TABLE `antecedentes_familiares_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `antecedentes_familiares_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `anuncios`
--

DROP TABLE IF EXISTS `anuncios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `anuncios` (
  `IdAnuncio` int(11) NOT NULL AUTO_INCREMENT,
  `CURPmedico` varchar(18) NOT NULL,
  `CURPpaciente` varchar(18) NOT NULL,
  `FechaAnuncio` timestamp NULL DEFAULT current_timestamp(),
  `Titulo` varchar(120) NOT NULL,
  `Contenido` text NOT NULL,
  `Prioridad` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`IdAnuncio`),
  KEY `CURPmedico` (`CURPmedico`),
  KEY `CURPpaciente` (`CURPpaciente`),
  KEY `idx_anuncios_prioridad` (`Prioridad`),
  KEY `idx_anuncios_fecha` (`FechaAnuncio`),
  CONSTRAINT `anuncios_ibfk_1` FOREIGN KEY (`CURPmedico`) REFERENCES `medicos` (`CURPmedico`),
  CONSTRAINT `anuncios_ibfk_2` FOREIGN KEY (`CURPpaciente`) REFERENCES `pacientes` (`CURPpaciente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `anuncios`
--

LOCK TABLES `anuncios` WRITE;
/*!40000 ALTER TABLE `anuncios` DISABLE KEYS */;
/*!40000 ALTER TABLE `anuncios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cirugias_catalogo`
--

DROP TABLE IF EXISTS `cirugias_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `cirugias_catalogo` (
  `IdCirugia` int(11) NOT NULL AUTO_INCREMENT,
  `NombreCirugia` varchar(120) NOT NULL,
  PRIMARY KEY (`IdCirugia`),
  UNIQUE KEY `NombreCirugia` (`NombreCirugia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cirugias_catalogo`
--

LOCK TABLES `cirugias_catalogo` WRITE;
/*!40000 ALTER TABLE `cirugias_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `cirugias_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `consultas`
--

DROP TABLE IF EXISTS `consultas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `consultas` (
  `IdConsulta` int(11) NOT NULL AUTO_INCREMENT,
  `CURPpaciente` varchar(18) NOT NULL,
  `CURPmedico` varchar(18) NOT NULL,
  `FechaConsulta` date NOT NULL,
  `HoraConsulta` time DEFAULT NULL,
  `MotivoConsulta` varchar(250) DEFAULT NULL,
  `Diagnostico` text DEFAULT NULL,
  `EstudiosSolicitados` text DEFAULT NULL,
  `ObservacionesAdicionales` text DEFAULT NULL,
  `SeguimientoRevisionFutura` text DEFAULT NULL,
  `FechaProxima` date DEFAULT NULL,
  PRIMARY KEY (`IdConsulta`),
  KEY `idx_consultas_paciente` (`CURPpaciente`),
  KEY `idx_consultas_medico` (`CURPmedico`),
  KEY `idx_consultas_fecha` (`FechaConsulta`),
  CONSTRAINT `consultas_ibfk_1` FOREIGN KEY (`CURPpaciente`) REFERENCES `pacientes` (`CURPpaciente`),
  CONSTRAINT `consultas_ibfk_2` FOREIGN KEY (`CURPmedico`) REFERENCES `medicos` (`CURPmedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `consultas`
--

LOCK TABLES `consultas` WRITE;
/*!40000 ALTER TABLE `consultas` DISABLE KEYS */;
/*!40000 ALTER TABLE `consultas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `enfermedades_catalogo`
--

DROP TABLE IF EXISTS `enfermedades_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `enfermedades_catalogo` (
  `IdEnfermedad` int(11) NOT NULL AUTO_INCREMENT,
  `NombreEnfermedad` varchar(120) NOT NULL,
  PRIMARY KEY (`IdEnfermedad`),
  UNIQUE KEY `NombreEnfermedad` (`NombreEnfermedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `enfermedades_catalogo`
--

LOCK TABLES `enfermedades_catalogo` WRITE;
/*!40000 ALTER TABLE `enfermedades_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `enfermedades_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_alergias`
--

DROP TABLE IF EXISTS `historial_alergias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_alergias` (
  `IdHistorial` int(11) NOT NULL,
  `IdAlergia` int(11) NOT NULL,
  `Gravedad` varchar(30) DEFAULT NULL,
  `Reaccion` text DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`,`IdAlergia`),
  KEY `IdAlergia` (`IdAlergia`),
  CONSTRAINT `historial_alergias_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_alergias_ibfk_2` FOREIGN KEY (`IdAlergia`) REFERENCES `alergias_catalogo` (`IdAlergia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_alergias`
--

LOCK TABLES `historial_alergias` WRITE;
/*!40000 ALTER TABLE `historial_alergias` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_alergias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_antecedentes_familiares`
--

DROP TABLE IF EXISTS `historial_antecedentes_familiares`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_antecedentes_familiares` (
  `IdHistorial` int(11) NOT NULL,
  `IdAntecedente` int(11) NOT NULL,
  `Parentezco` varchar(60) DEFAULT NULL,
  `Notas` text DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`,`IdAntecedente`),
  KEY `IdAntecedente` (`IdAntecedente`),
  CONSTRAINT `historial_antecedentes_familiares_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_antecedentes_familiares_ibfk_2` FOREIGN KEY (`IdAntecedente`) REFERENCES `antecedentes_familiares_catalogo` (`IdAntecedente`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_antecedentes_familiares`
--

LOCK TABLES `historial_antecedentes_familiares` WRITE;
/*!40000 ALTER TABLE `historial_antecedentes_familiares` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_antecedentes_familiares` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_cirugias`
--

DROP TABLE IF EXISTS `historial_cirugias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_cirugias` (
  `IdHistorial` int(11) NOT NULL,
  `IdCirugia` int(11) NOT NULL,
  `FechaCirugia` date DEFAULT NULL,
  `Notas` text DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`,`IdCirugia`),
  KEY `IdCirugia` (`IdCirugia`),
  CONSTRAINT `historial_cirugias_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_cirugias_ibfk_2` FOREIGN KEY (`IdCirugia`) REFERENCES `cirugias_catalogo` (`IdCirugia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_cirugias`
--

LOCK TABLES `historial_cirugias` WRITE;
/*!40000 ALTER TABLE `historial_cirugias` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_cirugias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_clinico`
--

DROP TABLE IF EXISTS `historial_clinico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_clinico` (
  `IdHistorial` int(11) NOT NULL AUTO_INCREMENT,
  `CURPpaciente` varchar(18) NOT NULL,
  `FechaRegistro` date DEFAULT curdate(),
  `Observaciones` text DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`),
  KEY `idx_historial_paciente` (`CURPpaciente`),
  KEY `idx_historial_fecha` (`FechaRegistro`),
  CONSTRAINT `historial_clinico_ibfk_1` FOREIGN KEY (`CURPpaciente`) REFERENCES `pacientes` (`CURPpaciente`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_clinico`
--

LOCK TABLES `historial_clinico` WRITE;
/*!40000 ALTER TABLE `historial_clinico` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_clinico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_enfermedades`
--

DROP TABLE IF EXISTS `historial_enfermedades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_enfermedades` (
  `IdHistorial` int(11) NOT NULL,
  `IdEnfermedad` int(11) NOT NULL,
  `Detalle` text DEFAULT NULL,
  `EnTratamiento` tinyint(1) DEFAULT 0,
  PRIMARY KEY (`IdHistorial`,`IdEnfermedad`),
  KEY `IdEnfermedad` (`IdEnfermedad`),
  CONSTRAINT `historial_enfermedades_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_enfermedades_ibfk_2` FOREIGN KEY (`IdEnfermedad`) REFERENCES `enfermedades_catalogo` (`IdEnfermedad`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_enfermedades`
--

LOCK TABLES `historial_enfermedades` WRITE;
/*!40000 ALTER TABLE `historial_enfermedades` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_enfermedades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_medicamentos_actuales`
--

DROP TABLE IF EXISTS `historial_medicamentos_actuales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_medicamentos_actuales` (
  `IdHistorial` int(11) NOT NULL,
  `IdMedHist` int(11) NOT NULL,
  `Dosis` varchar(60) DEFAULT NULL,
  `Frecuencia` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`,`IdMedHist`),
  KEY `IdMedHist` (`IdMedHist`),
  CONSTRAINT `historial_medicamentos_actuales_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_medicamentos_actuales_ibfk_2` FOREIGN KEY (`IdMedHist`) REFERENCES `medicamentos_catalogo_hist` (`IdMedHist`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_medicamentos_actuales`
--

LOCK TABLES `historial_medicamentos_actuales` WRITE;
/*!40000 ALTER TABLE `historial_medicamentos_actuales` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_medicamentos_actuales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `historial_vacunas`
--

DROP TABLE IF EXISTS `historial_vacunas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `historial_vacunas` (
  `IdHistorial` int(11) NOT NULL,
  `IdVacuna` int(11) NOT NULL,
  `FechaAplicacion` date DEFAULT NULL,
  `Lote` varchar(60) DEFAULT NULL,
  `Observaciones` text DEFAULT NULL,
  PRIMARY KEY (`IdHistorial`,`IdVacuna`),
  KEY `IdVacuna` (`IdVacuna`),
  CONSTRAINT `historial_vacunas_ibfk_1` FOREIGN KEY (`IdHistorial`) REFERENCES `historial_clinico` (`IdHistorial`) ON DELETE CASCADE,
  CONSTRAINT `historial_vacunas_ibfk_2` FOREIGN KEY (`IdVacuna`) REFERENCES `vacunas_catalogo` (`IdVacuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `historial_vacunas`
--

LOCK TABLES `historial_vacunas` WRITE;
/*!40000 ALTER TABLE `historial_vacunas` DISABLE KEYS */;
/*!40000 ALTER TABLE `historial_vacunas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marcas`
--

DROP TABLE IF EXISTS `marcas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `marcas` (
  `IdMarca` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMarca` varchar(120) NOT NULL,
  `PaisOrigen` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`IdMarca`),
  UNIQUE KEY `NombreMarca` (`NombreMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marcas`
--

LOCK TABLES `marcas` WRITE;
/*!40000 ALTER TABLE `marcas` DISABLE KEYS */;
/*!40000 ALTER TABLE `marcas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos`
--

DROP TABLE IF EXISTS `medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos` (
  `IdMedicamento` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` varchar(150) NOT NULL,
  `IdMarca` int(11) DEFAULT NULL,
  `Presentacion` varchar(120) DEFAULT NULL,
  `Concentracion` varchar(60) DEFAULT NULL,
  `FormaFarmaceutica` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`IdMedicamento`),
  UNIQUE KEY `NombreMedicamento` (`NombreMedicamento`,`IdMarca`,`Presentacion`,`Concentracion`),
  KEY `IdMarca` (`IdMarca`),
  KEY `idx_meds_nombre` (`NombreMedicamento`),
  CONSTRAINT `medicamentos_ibfk_1` FOREIGN KEY (`IdMarca`) REFERENCES `marcas` (`IdMarca`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos`
--

LOCK TABLES `medicamentos` WRITE;
/*!40000 ALTER TABLE `medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicamentos_catalogo_hist`
--

DROP TABLE IF EXISTS `medicamentos_catalogo_hist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicamentos_catalogo_hist` (
  `IdMedHist` int(11) NOT NULL AUTO_INCREMENT,
  `NombreMedicamento` varchar(150) NOT NULL,
  PRIMARY KEY (`IdMedHist`),
  UNIQUE KEY `NombreMedicamento` (`NombreMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicamentos_catalogo_hist`
--

LOCK TABLES `medicamentos_catalogo_hist` WRITE;
/*!40000 ALTER TABLE `medicamentos_catalogo_hist` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicamentos_catalogo_hist` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medicos`
--

DROP TABLE IF EXISTS `medicos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `medicos` (
  `CURPmedico` varchar(18) NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Nombre1` varchar(60) NOT NULL,
  `Nombre2` varchar(60) DEFAULT NULL,
  `Apellido1` varchar(60) NOT NULL,
  `Apellido2` varchar(60) DEFAULT NULL,
  `Especialidad` varchar(120) NOT NULL,
  `CedulaProfesional` varchar(30) DEFAULT NULL,
  `Calle` varchar(120) DEFAULT NULL,
  `NumeroExterior` varchar(20) DEFAULT NULL,
  `NumeroInterior` varchar(20) DEFAULT NULL,
  `Colonia_Barrio` varchar(120) DEFAULT NULL,
  `Ciudad` varchar(120) DEFAULT NULL,
  `Estado_Provincia` varchar(120) DEFAULT NULL,
  `CodigoPostal` varchar(20) DEFAULT NULL,
  `Pais` varchar(80) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`CURPmedico`),
  UNIQUE KEY `IdUsuario` (`IdUsuario`),
  KEY `idx_medicos_nombres` (`Apellido1`,`Apellido2`,`Nombre1`,`Nombre2`),
  CONSTRAINT `medicos_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medicos`
--

LOCK TABLES `medicos` WRITE;
/*!40000 ALTER TABLE `medicos` DISABLE KEYS */;
/*!40000 ALTER TABLE `medicos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pacientes`
--

DROP TABLE IF EXISTS `pacientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `pacientes` (
  `CURPpaciente` varchar(18) NOT NULL,
  `IdUsuario` int(11) DEFAULT NULL,
  `Nombre1` varchar(60) NOT NULL,
  `Nombre2` varchar(60) DEFAULT NULL,
  `Apellido1` varchar(60) NOT NULL,
  `Apellido2` varchar(60) DEFAULT NULL,
  `FechaNacimiento` date NOT NULL,
  `Sexo` enum('M','F','X') NOT NULL,
  `Calle` varchar(120) DEFAULT NULL,
  `NumeroExterior` varchar(20) DEFAULT NULL,
  `NumeroInterior` varchar(20) DEFAULT NULL,
  `Colonia_Barrio` varchar(120) DEFAULT NULL,
  `Ciudad` varchar(120) DEFAULT NULL,
  `Estado_Provincia` varchar(120) DEFAULT NULL,
  `CodigoPostal` varchar(20) DEFAULT NULL,
  `Pais` varchar(80) DEFAULT NULL,
  `Telefono` varchar(20) DEFAULT NULL,
  `Correo` varchar(120) DEFAULT NULL,
  `ContactoEmergencia` varchar(150) DEFAULT NULL,
  `TipoSangre` enum('A+','A-','B+','B-','AB+','AB-','O+','O-') DEFAULT NULL,
  PRIMARY KEY (`CURPpaciente`),
  UNIQUE KEY `IdUsuario` (`IdUsuario`),
  KEY `idx_pacientes_nombres` (`Apellido1`,`Apellido2`,`Nombre1`,`Nombre2`),
  CONSTRAINT `pacientes_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pacientes`
--

LOCK TABLES `pacientes` WRITE;
/*!40000 ALTER TABLE `pacientes` DISABLE KEYS */;
/*!40000 ALTER TABLE `pacientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `receta_medicamentos`
--

DROP TABLE IF EXISTS `receta_medicamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `receta_medicamentos` (
  `IdReceta` int(11) NOT NULL,
  `IdMedicamento` int(11) NOT NULL,
  `Dosis` varchar(60) NOT NULL,
  `Frecuencia` varchar(60) NOT NULL,
  `Duracion` varchar(60) DEFAULT NULL,
  `ViaAdministracion` varchar(60) DEFAULT NULL,
  `Notas` text DEFAULT NULL,
  PRIMARY KEY (`IdReceta`,`IdMedicamento`),
  KEY `IdMedicamento` (`IdMedicamento`),
  CONSTRAINT `receta_medicamentos_ibfk_1` FOREIGN KEY (`IdReceta`) REFERENCES `recetas` (`IdReceta`) ON DELETE CASCADE,
  CONSTRAINT `receta_medicamentos_ibfk_2` FOREIGN KEY (`IdMedicamento`) REFERENCES `medicamentos` (`IdMedicamento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `receta_medicamentos`
--

LOCK TABLES `receta_medicamentos` WRITE;
/*!40000 ALTER TABLE `receta_medicamentos` DISABLE KEYS */;
/*!40000 ALTER TABLE `receta_medicamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recetas`
--

DROP TABLE IF EXISTS `recetas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `recetas` (
  `IdReceta` int(11) NOT NULL AUTO_INCREMENT,
  `IdConsulta` int(11) NOT NULL,
  `CURPpaciente` varchar(18) NOT NULL,
  `CURPmedico` varchar(18) NOT NULL,
  `FechaReceta` date NOT NULL,
  `IndicacionesGenerales` text DEFAULT NULL,
  PRIMARY KEY (`IdReceta`),
  KEY `IdConsulta` (`IdConsulta`),
  KEY `CURPpaciente` (`CURPpaciente`),
  KEY `CURPmedico` (`CURPmedico`),
  KEY `idx_recetas_fecha` (`FechaReceta`),
  CONSTRAINT `recetas_ibfk_1` FOREIGN KEY (`IdConsulta`) REFERENCES `consultas` (`IdConsulta`) ON DELETE CASCADE,
  CONSTRAINT `recetas_ibfk_2` FOREIGN KEY (`CURPpaciente`) REFERENCES `pacientes` (`CURPpaciente`),
  CONSTRAINT `recetas_ibfk_3` FOREIGN KEY (`CURPmedico`) REFERENCES `medicos` (`CURPmedico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recetas`
--

LOCK TABLES `recetas` WRITE;
/*!40000 ALTER TABLE `recetas` DISABLE KEYS */;
/*!40000 ALTER TABLE `recetas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `roles`
--

DROP TABLE IF EXISTS `roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `roles` (
  `IdRol` int(11) NOT NULL AUTO_INCREMENT,
  `NombreRol` varchar(50) NOT NULL,
  PRIMARY KEY (`IdRol`),
  UNIQUE KEY `NombreRol` (`NombreRol`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `roles`
--

LOCK TABLES `roles` WRITE;
/*!40000 ALTER TABLE `roles` DISABLE KEYS */;
INSERT INTO `roles` VALUES
(3,'Administrador'),
(2,'Medico'),
(1,'Paciente');
/*!40000 ALTER TABLE `roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_roles`
--

DROP TABLE IF EXISTS `usuario_roles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario_roles` (
  `IdUsuario` int(11) NOT NULL,
  `IdRol` int(11) NOT NULL,
  PRIMARY KEY (`IdUsuario`,`IdRol`),
  KEY `IdRol` (`IdRol`),
  CONSTRAINT `usuario_roles_ibfk_1` FOREIGN KEY (`IdUsuario`) REFERENCES `usuarios` (`IdUsuario`) ON DELETE CASCADE,
  CONSTRAINT `usuario_roles_ibfk_2` FOREIGN KEY (`IdRol`) REFERENCES `roles` (`IdRol`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_roles`
--

LOCK TABLES `usuario_roles` WRITE;
/*!40000 ALTER TABLE `usuario_roles` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_roles` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `IdUsuario` int(11) NOT NULL AUTO_INCREMENT,
  `Username` varchar(50) NOT NULL,
  `PasswordHash` varchar(255) NOT NULL,
  `Correo` varchar(120) DEFAULT NULL,
  `Activo` tinyint(1) DEFAULT 1,
  `FechaCreacion` timestamp NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`IdUsuario`),
  UNIQUE KEY `Username` (`Username`),
  UNIQUE KEY `Correo` (`Correo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vacunas_catalogo`
--

DROP TABLE IF EXISTS `vacunas_catalogo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8mb4 */;
CREATE TABLE `vacunas_catalogo` (
  `IdVacuna` int(11) NOT NULL AUTO_INCREMENT,
  `NombreVacuna` varchar(120) NOT NULL,
  PRIMARY KEY (`IdVacuna`),
  UNIQUE KEY `NombreVacuna` (`NombreVacuna`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vacunas_catalogo`
--

LOCK TABLES `vacunas_catalogo` WRITE;
/*!40000 ALTER TABLE `vacunas_catalogo` DISABLE KEYS */;
/*!40000 ALTER TABLE `vacunas_catalogo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'fbenavides'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*M!100616 SET NOTE_VERBOSITY=@OLD_NOTE_VERBOSITY */;

-- Dump completed on 2025-10-28 18:44:41
