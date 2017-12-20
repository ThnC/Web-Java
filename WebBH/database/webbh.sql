/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50720
 Source Host           : localhost:3306
 Source Schema         : webbh

 Target Server Type    : MySQL
 Target Server Version : 50720
 File Encoding         : 65001

 Date: 20/12/2017 15:32:01
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for bill
-- ----------------------------
DROP TABLE IF EXISTS `bill`;
CREATE TABLE `bill`  (
  `bill_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NOT NULL,
  `userID` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `address` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `payment` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `date_buy` varchar(50) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `bill_status` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`bill_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill
-- ----------------------------
INSERT INTO `bill` VALUES ('1513737361708', '1512806454968', 'zcvxzdv', 'Bank transfer', NULL, 0);
INSERT INTO `bill` VALUES ('1513737684454', '1512806454968', 'adasdas', 'Payment upon delivery', 'Wed Dec 20 09:41:24 ICT 2017', 0);
INSERT INTO `bill` VALUES ('1513755966662', '1512806454968', 'dasd', 'Payment upon delivery', 'Wed Dec 20 14:46:06 ICT 2017', 0);

-- ----------------------------
-- Table structure for bill_details
-- ----------------------------
DROP TABLE IF EXISTS `bill_details`;
CREATE TABLE `bill_details`  (
  `bill_details_id` int(11) NOT NULL AUTO_INCREMENT,
  `bill_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_id` varchar(20) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_quantity` int(11) NULL DEFAULT NULL,
  `product_price` double NULL DEFAULT NULL,
  PRIMARY KEY (`bill_details_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of bill_details
-- ----------------------------
INSERT INTO `bill_details` VALUES (4, '1513737267220', '1', 1, 150);
INSERT INTO `bill_details` VALUES (5, '1513737361708', '1', 1, 150);
INSERT INTO `bill_details` VALUES (6, '1513737684454', '1', 1, 150);
INSERT INTO `bill_details` VALUES (7, '1513755966662', '1', 1, 150);

-- ----------------------------
-- Table structure for category
-- ----------------------------
DROP TABLE IF EXISTS `category`;
CREATE TABLE `category`  (
  `category_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `category_cha` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  PRIMARY KEY (`category_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of category
-- ----------------------------
INSERT INTO `category` VALUES (1, 'Nike', '');
INSERT INTO `category` VALUES (2, 'Tops & T-Shirts...', '1');
INSERT INTO `category` VALUES (3, 'Shoes', '1');
INSERT INTO `category` VALUES (4, 'Pants & Tights...', '1');
INSERT INTO `category` VALUES (5, 'Adidas', '');
INSERT INTO `category` VALUES (6, 'Tee & T-Shirts...', '5');
INSERT INTO `category` VALUES (7, 'Shoes', '5');
INSERT INTO `category` VALUES (8, 'Pants & Tights...', '5');
INSERT INTO `category` VALUES (11, 'sd', '1');

-- ----------------------------
-- Table structure for product
-- ----------------------------
DROP TABLE IF EXISTS `product`;
CREATE TABLE `product`  (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `category_id` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_image` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_quantity` int(11) NULL DEFAULT NULL,
  `product_description` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `product_price` double NULL DEFAULT NULL,
  PRIMARY KEY (`product_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 43 CHARACTER SET = utf8 COLLATE = utf8_vietnamese_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of product
-- ----------------------------
INSERT INTO `product` VALUES (1, '2', 'Cleveland Cavaliers Nike Therma Flex', 'CLEVELAND_CAVALIERS_NIKE_THERMA_FLEX_SHOWTIME.jpg', 12, 'Men\'s NBA Hoodie', 150);
INSERT INTO `product` VALUES (2, '2', 'NIKE SPORTSWEAR FLEECE', 'NIKE SPORTSWEAR FLEECE.jpg', 231, 'Men\'s Pullover Hoodie', 45);
INSERT INTO `product` VALUES (3, '2', 'NIKELAB ACG ALPINE', 'NIKELAB_ACG_ALPINE_4.jpg', 17, 'Men\'s Jacket', 600);
INSERT INTO `product` VALUES (4, '2', 'NIKELAB ESSENTIALS SHERPA FLEECE', 'NIKELAB_ESSENTIALS_SHERPA_FLEECE.jpg', 32, 'Men\'s Hoodie', 200);
INSERT INTO `product` VALUES (5, '2', 'NIKE SB FLEX COACHES', 'NIKE_SB_FLEX_COACHES.jpg', 43, 'Men\'s Jacket', 150);
INSERT INTO `product` VALUES (6, '2', 'NIKE SPORTSWEAR TECH AEROLOFT', 'NIKE_SPORTSWEAR_TECH_AEROLOFT_3-IN-1_praka.jpg', 21, 'Women\'s Parka', 385);
INSERT INTO `product` VALUES (7, '3', 'NIKE REVOLUTION 3', 'NIKE_REVOLUTION_3.jpg', 43, 'Men\'s Running Shoe (Extra-Wide)', 60);
INSERT INTO `product` VALUES (8, '3', 'NIKE AIR FOAMPOSITE PRO', 'Nike_Air_Foamposite_Pro_Men_s_Shoe.jpg', 65, 'Men\'s Shoe', 230);
INSERT INTO `product` VALUES (9, '3', 'NIKELAB VEIL GYAKUSOU', 'NIKELAB_VEIL_GYAKUSOU.jpg', 783, 'Unisex Running Shoe', 200);
INSERT INTO `product` VALUES (10, '3', 'NIKE AIR MAX PLUS NS GPX', 'NIKE AIR MAX PLUS NS GPX.jpg', 322, 'Men\'s Shoe', 175);
INSERT INTO `product` VALUES (11, '3', 'AIR JORDAN XXXII LOW', 'AIR JORDAN XXXII LOW.jpg', 452, 'Big Kids\' Basketball Shoe', 120);
INSERT INTO `product` VALUES (12, '4', 'NIKE AEROSWIFT HYBRID 2-IN-1', 'NIKE_AEROSWIFT_HYBRID_2-IN-1.jpg', 112, 'Men\'s Running Shorts', 125);
INSERT INTO `product` VALUES (13, '4', 'NIKELAB ACG', 'NIKELAB_ACG.jpg', 511, 'Women\'s Tights', 180);
INSERT INTO `product` VALUES (14, '4', 'NIKE SPORTSWEAR TECH FLEECE', 'NIKE_SPORTSWEAR_TECH_FLEECE.jpg', 771, 'Men\'s Pants', 120);
INSERT INTO `product` VALUES (15, '4', 'JORDAN FLIGHT TEAM', 'JORDAN_FLIGHT_TEAM.jpg', 981, 'Men\'s Basketball Pants', 80);
INSERT INTO `product` VALUES (16, '6', 'BIG TREFOIL TEE', 'BIG TREFOIL TEE.jpg', 345, 'WOMEN\'S ORIGINALS', 40);
INSERT INTO `product` VALUES (17, '6', 'TREFOIL TEE', 'TREFOIL TEE.jpg', 544, 'MEN\'S ORIGINALS', 30);
INSERT INTO `product` VALUES (18, '6', 'TECHFIT CLIMAWARM TOP', 'TECHFIT CLIMAWARM TOP.jpg', 33, 'MEN\'S TRAINING', 55);
INSERT INTO `product` VALUES (19, '6', 'ANICHKOV TEE', 'ANICHKOV TEE.jpg', 65, 'MEN\'S ORIGINALS', 31);
INSERT INTO `product` VALUES (20, '6', 'WINTER TEE', 'WINTER TEE.jpg', 763, 'MEN\'S ORIGINALS', 28);
INSERT INTO `product` VALUES (21, '6', 'DAY ONE BASE LAYER TEE', 'DAY ONE BASE LAYER TEE.jpg', 875, 'MEN\'S OUTDOOR', 130);
INSERT INTO `product` VALUES (22, '7', 'ULTRABOOST ALL TERRAIN SHOES', 'ULTRABOOST ALL TERRAIN SHOES.jpg', 421, 'MEN\'S RUNNING', 220);
INSERT INTO `product` VALUES (23, '7', 'WHITE MOUNTAINEERING NMD_R2 SHOES', 'WHITE MOUNTAINEERING NMD_R2 SHOES.jpg', 547, 'MEN\'S ORIGINALS', 225);
INSERT INTO `product` VALUES (24, '8', 'ADIDAS Z.N.E. PRIMEKNIT PANTS', 'ADIDAS Z.N.E. PRIMEKNIT PANTS.jpg', 435, 'MEN\'S ATHLETICS', 150);
INSERT INTO `product` VALUES (25, '8', 'WHITE MOUNTAINEERING TRACK PANTS', 'WHITE MOUNTAINEERING TRACK PANTS.jpg', 778, 'MEN\'S ORIGINALS', 180);
INSERT INTO `product` VALUES (26, '8', 'WINGS + HORNS WOOL TRACK PANTS', 'WINGS + HORNS WOOL TRACK PANTS.jpg', 886, 'MEN\'S ORIGINALS', 250);
INSERT INTO `product` VALUES (27, '8', 'SPEEDBREAKER HYPE SPEED-PRINT SHORTS', 'SPEEDBREAKER HYPE SPEED-PRINT SHORTS.jpg', 438, 'MEN\'S TRAINING', 35);
INSERT INTO `product` VALUES (28, '8', 'TIRO 17 TRAINING PANTS', 'TIRO 17 TRAINING PANTSx.jpg', 569, 'MEN\'S SOCCER', 45);
INSERT INTO `product` VALUES (29, '8', 'TIRO 17 TRAINING PANTS', 'TIRO 17 TRAINING PANTS.jpg', 346, 'MEN\'S SOCCER', 45);
INSERT INTO `product` VALUES (42, '2', 'qwd', 'TREFOIL TEE.jpg', 123, '645yerger', 123);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `userID` bigint(20) NOT NULL AUTO_INCREMENT,
  `userName` varchar(255) CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT NULL,
  `userEmail` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `userPass` varchar(255) CHARACTER SET utf8 COLLATE utf8_vietnamese_ci NULL DEFAULT NULL,
  `userRole` int(1) NULL DEFAULT NULL,
  PRIMARY KEY (`userID`) USING BTREE
) ENGINE = MyISAM AUTO_INCREMENT = 1513755727285 CHARACTER SET = utf8 COLLATE = utf8_unicode_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1512806454968, 'admin', 'admin@gmail.com', 'c4ca4238a0b923820dcc509a6f75849b', 1);
INSERT INTO `users` VALUES (1513755727284, 'qdd', 'qwd@mail.com', 'ad57484016654da87125db86f4227ea3', 1);

SET FOREIGN_KEY_CHECKS = 1;
