/******************************************************************************
 * Copyright (c) 2005 Actuate Corporation.
 * All rights reserved. This file and the accompanying materials
 * are made available under the terms of the Eclipse Public License v1.0
 * which accompanies this distribution, and is available at
 * http://www.eclipse.org/legal/epl-v10.html
 *
 * Contributors:
 *  Actuate Corporation  - initial implementation
 *
 * Classic Models Inc. sample database developed as part of the
 * Eclipse BIRT Project. For more information, see http:\\www.eclipse.org\birt
 *
 *******************************************************************************/

/* Loads the Classic Models tables using the MySQL LOAD command */

/* Preparing the load files for importing. Input file requirements:
     - Column order in the file must be the same as the columns in the table
     - Columns are Comma delimited
     - Text is quoted (")
     - NULL columns must be ,NULL,  ( ,, is not acceptable)
     - Dates must be in Y/M/D format

   Input files expected in the datafiles direcory, parallel to this script.
*/


/* First make sure all the tables are empty */

USE `review database`;


DELETE FROM review;
DELETE FROM game;
DELETE FROM user;
DELETE FROM author;
DELETE FROM developer;
DELETE FROM errorReport;







# Load records into the tables. There should be no warnings.


LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/Developer.csv' INTO TABLE developer
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/Game.csv' INTO TABLE game
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/Author.csv' INTO TABLE author
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/User.csv' INTO TABLE user
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/Review.csv' INTO TABLE review
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;

LOAD DATA LOCAL INFILE 'C:/Users/Max Novak/Desktop/COM 303 - Final/datafiles/ErrorReport.csv' INTO TABLE errorReport
          FIELDS TERMINATED BY ',' ENCLOSED BY '"' LINES TERMINATED BY '\r\n';

SHOW WARNINGS LIMIT 10;