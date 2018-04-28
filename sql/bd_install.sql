CREATE TABLE Users(
Login VARCHAR(50) NOT NULL,
Password VARCHAR(50) NOT NULL,
LastConnexion Date NOT NULL,
PRIMARY KEY(Login));


CREATE TABLE InfoParent(
ID_parent VARCHAR(50) NOT NULL,
Login VARCHAR(50) NOT NULL,
Name VARCHAR(50) NOT NULL,
Firstname VARCHAR(50) NOT NULL,
Telephone VARCHAR(50) NOT NULL,
Address VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_parent, Login),
FOREIGN KEY(Login) REFERENCES Users(Login));

CREATE TABLE PeriodYear(
ID_Period VARCHAR(50) NOT NULL,
StartDay Date NOT NULL ,
EndDay Date NOT NULL,
PRIMARY KEY(ID_Period));

CREATE TABLE Activity(
ID_Activity VARCHAR(50) NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Price INT NOT NULL);

CREATE TABLE GroupActivity(
ID_Group VARCHAR(50) NOT NULL,
ID_Activity VARCHAR(50) NOT NULL REFERENCES Activity(ID_Activity),
DaysOfTheWeek VARCHAR(50) NOT NULL,
StartTime VARCHAR(50) NOT NULL,
EndTime VARCHAR(50) NOT NULL,
Enrollment INTEGER NOT NULL,
PRIMARY KEY(ID_Group, ID_Activity),
CHECK(Enrollment>=0)
);

CREATE TABLE PeriodActivity(
ID_Period VARCHAR(50) NOT NULL REFERENCES PeriodYear(ID_Period),
ID_Activity VARCHAR(50) NOT NULL REFERENCES Activity(ID_Activity),
PRIMARY KEY(ID_Period, ID_Activity)
);
CREATE TABLE Coordinator(
ID_Coordinator VARCHAR(50) NOT NULL PRIMARY KEY,
Name VARCHAR(50) NOT NULL,
Firstname VARCHAR(50) NOT NULL
);
CREATE TABLE CoordinatorGroup(
ID_Coordinator VARCHAR(50) NOT NULL REFERENCES Coordinator(ID_Coordinator),
ID_Group VARCHAR(50) NOT NULL,
ID_Activity VARCHAR(50) NOT NULL,
PRIMARY KEY(ID_Coordinator, ID_Group, ID_Activity),
FOREIGN KEY (ID_Group, ID_Activity) REFERENCES GroupActivity(ID_Group, ID_Activity)
);
CREATE TABLE Nursery(
ID_Nursery VARCHAR(50) NOT NULL PRIMARY KEY,
StartTime VARCHAR(50) NOT NULL,
EndTime VARCHAR(50) NOT NULL ,
Price INTEGER NOT NULL,
CHECK(Price>=0)
);
CREATE TABLE CoordinatorNursery(
ID_Coordinator VARCHAR(50) NOT NULL REFERENCES Coordinator(ID_Coordinator),
ID_Nursery VARCHAR(50) NOT NULL REFERENCES Nursery(ID_Nursery),
PRIMARY KEY(ID_Coordinator, ID_Nursery)
);
CREATE TABLE Diet(
ID_Diet VARCHAR(50) NOT NULL Primary key,
Descriptif VARCHAR(50) NOT NULL
);
CREATE TABLE ClassLevel(
LevelName VARCHAR(50) NOT NULL Primary Key
);
CREATE TABLE Child(
ID_Child VARCHAR(50) NOT NULL,
Login VARCHAR(50) NOT NULL REFERENCES Users(Login),
Name VARCHAR(50) NOT NULL,
Firstname VARCHAR(50) NOT NULL,
BirthDate DATE NOT NULL,
Gender VARCHAR(50),
Diet VARCHAR(50) NOT NULL REFERENCES Diet(ID_Diet),
ClassLevel VARCHAR(50) NOT NULL REFERENCES ClassLevel(LevelName),
PRIMARY KEY(ID_Child, Login)
);

CREATE TABLE Booking(
ID_Booking VARCHAR(50) NOT NULL PRIMARY KEY,
CafeteriaDays INTEGER NOT NULL,
ID_Child VARCHAR(50) NOT NULL,
Login VARCHAR(50) NOT NULL,
Diet VARCHAR(50) NOT NULL REFERENCES Diet(ID_Diet),
FOREIGN KEY (ID_Child, Login) REFERENCES Child(ID_Child, Login),
CHECK(CafeteriaDays>=0)
);

CREATE TABLE Bill(
ID_Bill VARCHAR(50) NOT NULL PRIMARY KEY,
BillNumber INTEGER NOT NULL,
IssuingDate Date NOT NULL,
TotalPrice INTEGER NOT NULL,
Login VARCHAR(50) NOT NULL REFERENCES Users(Login),
ID_Period VARCHAR(50) NOT NULL REFERENCES PeriodYear(ID_Period),
ID_Booking VARCHAR(50) NOT NULL REFERENCES Booking(ID_Booking),
CHECK(TotalPrice>=0)
);

CREATE TABLE GroupChoices(
ID_Booking VARCHAR(50) NOT NULL REFERENCES booking(ID_Booking),
ID_Activity VARCHAR(50) NOT NULL,
ID_Group VARCHAR(50) NOT NULL,
PRIMARY KEY (ID_Booking, ID_Activity, ID_Group),
FOREIGN KEY (ID_Group, ID_Activity) REFERENCES GroupActivity(ID_Group, ID_Activity)
);
CREATE TABLE NurseryChoices(
ID_Booking VARCHAR(50) NOT NULL REFERENCES Booking(ID_Booking),
ID_Nursery VARCHAR(50) NOT NULL REFERENCES Nursery(ID_Nursery),
PRIMARY KEY (ID_Booking, ID_Nursery)
);

CREATE TABLE GroupLevels(
ID_Activity VARCHAR(50) NOT NULL,
ID_Group VARCHAR(50) NOT NULL,
ClassLevel VARCHAR(50) NOT NULL REFERENCES ClassLevel(LevelName),
PRIMARY KEY (ID_Activity, ID_Group, ClassLevel),
FOREIGN KEY (ID_Group, ID_Activity) REFERENCES GroupActivity(ID_Group, ID_Activity)
);

CREATE TABLE CoordinatorCafeteria(
ID_Coordinator1 VARCHAR(50) NOT NULL REFERENCES Coordinator(ID_Coordinator),
ID_Coordinator2 VARCHAR(50) NOT NULL REFERENCES Coordinator(ID_Coordinator)
);



INSERT INTO Users VALUES('User1', 'azer', TO_DATE('2018/03/17', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User2', 'azer', TO_DATE('2018/03/16', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User3', 'azer', TO_DATE('2018/03/15', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User4', 'azer', TO_DATE('2018/03/22', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User5', 'azer', TO_DATE('2018/03/23', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('admin', 'admin', TO_DATE('2018/03/23', 'yyyy/mm/dd'));


INSERT INTO InfoParent VALUES('1','User1','Dupont', 'Dominique', '0601234567', '1 rue de la porte' );
INSERT INTO InfoParent VALUES('1','User2','Martin', 'Michel', '0601534567', '2 rue de la porte' );
INSERT INTO InfoParent VALUES('1','User3','Dubois', 'Herve', '0601534567', '3 rue de la porte' );
INSERT INTO InfoParent VALUES('1','User4','Leroy', 'Rémi', '0601534567', '4 rue de la porte' );
INSERT INTO InfoParent VALUES('1','User5','Girard', 'Françoise', '0601534567', '5 rue de la porte' );

INSERT INTO Diet VALUES('1', 'Sans restriction');
INSERT INTO Diet VALUES('2', 'Sans porc');
INSERT INTO Diet VALUES('3', 'Vegetarien');
INSERT INTO Diet VALUES('4', 'Sans gluten');
INSERT INTO Diet VALUES('5', 'Sans sel');
INSERT INTO Diet VALUES('6', 'Sans sucre');

INSERT INTO ClassLevel VALUES('PS');
INSERT INTO ClassLevel VALUES('MS');
INSERT INTO ClassLevel VALUES('GS');
INSERT INTO ClassLevel VALUES('CP');
INSERT INTO ClassLevel VALUES('CE1');
INSERT INTO ClassLevel VALUES('CE2');
INSERT INTO ClassLevel VALUES('CM1');
INSERT INTO ClassLevel VALUES('CM2');

INSERT INTO Child VALUES('1', 'User1', 'Dupont', 'Kevin', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'M', '1', 'CP');
INSERT INTO Child VALUES('2', 'User1', 'Dupont', 'Jean', TO_DATE('2009/03/09', 'yyyy/mm/dd'), 'M', '6', 'CE1');
INSERT INTO Child VALUES('1', 'User2', 'Martin', 'Lola', TO_DATE('2007/03/09', 'yyyy/mm/dd'), 'F', '3', 'CM1');
INSERT INTO Child VALUES('1', 'User3', 'Dubois', 'Mathilde', TO_DATE('2014/03/09', 'yyyy/mm/dd'), 'F', '4', 'MS');
INSERT INTO Child VALUES('2', 'User3', 'Dubois', 'Thomas', TO_DATE('2015/03/09', 'yyyy/mm/dd'), 'M', '2', 'PS');
INSERT INTO Child VALUES('3', 'User3', 'Dubois', 'Matthieu', TO_DATE('2009/04/09', 'yyyy/mm/dd'), 'M', '3', 'CE2');

INSERT INTO Nursery VALUES('nursery0', '7h00', '8h30', 50);
INSERT INTO Nursery VALUES('nursery1', '15h45', '16h30', 50);
INSERT INTO Nursery VALUES('nursery2', '16h30', '17h15', 50);
INSERT INTO Nursery VALUES('nursery3', '17h15', '18h30', 50);

INSERT INTO PeriodYear VALUES('1', TO_DATE('2018/01/02', 'yyyy/mm/dd'), TO_DATE('2018/06/01', 'yyyy/mm/dd'));
INSERT INTO PeriodYear VALUES('2', TO_DATE('2018/06/02', 'yyyy/mm/dd'), TO_DATE('2018/09/01', 'yyyy/mm/dd'));

INSERT INTO Activity VALUES('1', 'Gym', 60);
INSERT INTO Activity VALUES('2', 'Handball', 55);
INSERT INTO Activity VALUES('3', 'Basketball', 43);
INSERT INTO Activity VALUES('4', 'Atelier creatif', 25);
INSERT INTO Activity VALUES('5', 'Poterie', 68);
INSERT INTO Activity VALUES('6', 'Relaxation', 5);
INSERT INTO Activity VALUES('7', 'Boxe', 20);

INSERT INTO GroupActivity VALUES ('1', '1', 'Lundi', '17:30', '18:30', 2);
INSERT INTO GroupActivity VALUES ('2', '1', 'Mardi', '16:30', '17:30', 5);
INSERT INTO GroupActivity VALUES ('1', '2', 'Jeudi', '17:30', '18:30', 0);
INSERT INTO GroupActivity VALUES ('2', '2', 'Vendredi', '15:30', '16:30', 15);
INSERT INTO GroupActivity VALUES ('1', '3', 'Lundi', '17:30', '18:30', 15);
INSERT INTO GroupActivity VALUES ('1', '4', 'Mercredi', '16:30', '17:30', 15);
INSERT INTO GroupActivity VALUES ('1', '5', 'Mardi', '15:30', '16:30', 15);
INSERT INTO GroupActivity VALUES ('2', '5', 'Vendredi', '16:30', '17:30', 15);
INSERT INTO GroupActivity VALUES ('1', '6', 'Jeudi', '17:30', '18:30', 15);
INSERT INTO GroupActivity VALUES ('2', '6', 'Vendredi', '15:30', '16:30', 15);

INSERT INTO GroupLevels VALUES ('1','1','CP');
INSERT INTO GroupLevels VALUES ('1','1','CE1');
INSERT INTO GroupLevels VALUES ('1','2','GS');
INSERT INTO GroupLevels VALUES ('1','2','CP');
INSERT INTO GroupLevels VALUES ('2','1','PS');
INSERT INTO GroupLevels VALUES ('2','1','MS');
INSERT INTO GroupLevels VALUES ('2','2','CM1');
INSERT INTO GroupLevels VALUES ('2','2','CM2');
INSERT INTO GroupLevels VALUES ('3','1','CE2');
INSERT INTO GroupLevels VALUES ('3','1','CM1');
INSERT INTO GroupLevels VALUES ('4','1','CE1');
INSERT INTO GroupLevels VALUES ('4','1','CE2');
INSERT INTO GroupLevels VALUES ('5','1','CP');
INSERT INTO GroupLevels VALUES ('5','1','CE1');
INSERT INTO GroupLevels VALUES ('5','2','MS');
INSERT INTO GroupLevels VALUES ('5','2','GS');
INSERT INTO GroupLevels VALUES ('6','1','CE1');
INSERT INTO GroupLevels VALUES ('6','1','CE2');
INSERT INTO GroupLevels VALUES ('6','2','CM1');
INSERT INTO GroupLevels VALUES ('6','2','CM2');

INSERT INTO PeriodActivity VALUES('1', '1');
INSERT INTO PeriodActivity VALUES('1', '2');
INSERT INTO PeriodActivity VALUES('1', '3');
INSERT INTO PeriodActivity VALUES('1', '4');
INSERT INTO PeriodActivity VALUES('1', '5');
INSERT INTO PeriodActivity VALUES('1', '6');
INSERT INTO PeriodActivity VALUES('2', '7');

INSERT INTO Coordinator VALUES('1', 'Jean', 'Martin');
INSERT INTO Coordinator VALUES('2', 'Luc', 'Dutronc');
INSERT INTO Coordinator VALUES('3', 'Myriam', 'Galois');
INSERT INTO Coordinator VALUES('4', 'François', 'Picard');
INSERT INTO Coordinator VALUES('5', 'Benoit', 'Lecomte');
INSERT INTO Coordinator VALUES('6', 'Laura', 'Durand');

INSERT INTO CoordinatorNursery VALUES('1', 'nursery0');
INSERT INTO CoordinatorNursery VALUES('2', 'nursery0');
INSERT INTO CoordinatorNursery VALUES('2', 'nursery1');
INSERT INTO CoordinatorNursery VALUES('3', 'nursery1');
INSERT INTO CoordinatorNursery VALUES('2', 'nursery2');
INSERT INTO CoordinatorNursery VALUES('3', 'nursery2');
INSERT INTO CoordinatorNursery VALUES('2', 'nursery3');
INSERT INTO CoordinatorNursery VALUES('3', 'nursery3');

INSERT INTO CoordinatorCafeteria VALUES('4','5');

INSERT INTO CoordinatorGroup VALUES('1','1','1');
INSERT INTO CoordinatorGroup VALUES('2','2','1');
INSERT INTO CoordinatorGroup VALUES('3','1','2');
INSERT INTO CoordinatorGroup VALUES('4','2','2');
INSERT INTO CoordinatorGroup VALUES('5','1','3');
INSERT INTO CoordinatorGroup VALUES('6','1','4');
INSERT INTO CoordinatorGroup VALUES('1','1','5');
INSERT INTO CoordinatorGroup VALUES('2','2','5');
INSERT INTO CoordinatorGroup VALUES('3','1','6');
INSERT INTO CoordinatorGroup VALUES('4','2','6');
