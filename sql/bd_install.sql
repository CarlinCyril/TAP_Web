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

/*
INSERT INTO Users VALUES('User1', 'azer', TO_DATE('2018/03/01', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User2', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User3', 'azer', TO_DATE('2018/03/01', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User4', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User5', 'azer', TO_DATE('2018/03/03', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User6', 'azer', TO_DATE('2018/03/17', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User7', 'azer', TO_DATE('2018/03/16', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User8', 'azer', TO_DATE('2018/03/15', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User9', 'azer', TO_DATE('2018/03/22', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User10', 'azer', TO_DATE('2018/03/23', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User11', 'azer', TO_DATE('2018/03/24', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User12', 'azer', TO_DATE('2018/03/09', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User13', 'azer', TO_DATE('2018/03/09', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User14', 'azer', TO_DATE('2018/03/08', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User15', 'azer', TO_DATE('2018/03/06', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User16', 'azer', TO_DATE('2018/03/07', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User17', 'azer', TO_DATE('2018/03/08', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User18', 'azer', TO_DATE('2018/03/06', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User19', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User20', 'azer', TO_DATE('2018/03/04', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User21', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User22', 'azer', TO_DATE('2018/03/03', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User23', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User24', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User25', 'azer', TO_DATE('2018/03/29', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User26', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User27', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User28', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User29', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User30', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User31', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User32', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User33', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User34', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User35', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User36', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User37', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User38', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('User39', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));


INSERT INTO InfoParent VALUES('1','User1','dupont', 'karen1', '0601234567', '1 rue de la porte' );
INSERT INTO InfoParent VALUES('1','User2','dupont', 'karen2', '0601534567', '2 rue de la porte' );
INSERT INTO InfoParent VALUES('3','User3','dupont', 'karen3', '0621234577', '3 rue de la porte' );
INSERT INTO InfoParent VALUES('4','User4','dupont', 'karen4', '0601254567', '4 rue de la porte' );
INSERT INTO InfoParent VALUES('5','User5','dupont', 'karen5', '0601234567', '5 rue de la porte' );
INSERT INTO InfoParent VALUES('6','User6','dupont', 'karen6', '0601234567', '6 rue de la porte' );
INSERT INTO InfoParent VALUES('7','User7','dupont', 'karen7', '0601234567', '7 rue de la porte' );
INSERT INTO InfoParent VALUES('8','User8','dupont', 'karen8', '0601234567', '8 rue de la porte' );
INSERT INTO InfoParent VALUES('9','User9','dupont', 'karen9', '0605234567', '9 rue de la porte' );
INSERT INTO InfoParent VALUES('10','User10','dupont', 'karen10', '0661234567', '10 rue de la porte' );
INSERT INTO InfoParent VALUES('11','User11','dupont', 'karen11', '0601236567', '11 rue de la porte' );
INSERT INTO InfoParent VALUES('12','User12','dupont', 'karen12', '0604234567', '12 rue de la porte' );

INSERT INTO Diet VALUES('1', 'mange de tout');
INSERT INTO Diet VALUES('2', 'sans porc');
INSERT INTO Diet VALUES('3', 'vegetarien');


INSERT INTO ClassLevel VALUES('CP');
INSERT INTO ClassLevel VALUES('CE1');

INSERT INTO Child VALUES('1', 'User1', 'dupont', 'kevin', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'CP');
INSERT INTO Child VALUES('2', 'User1', 'dupont', 'jean', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'CE1');
INSERT INTO Child VALUES('3', 'User15', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('4', 'User16', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('5', 'User17', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('6', 'User18', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('7', 'User19', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('8', 'User20', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('9', 'User21', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('10', 'User22', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('11', 'User23', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('12', 'User24', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('13', 'User25', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('14', 'User26', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('15', 'User27', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('16', 'User28', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('17', 'User29', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('18', 'User30', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('19', 'User31', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('20', 'User32', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('21', 'User33', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('22', 'User34', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('23', 'User35', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('24', 'User36', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('25', 'User37', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('26', 'User38', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('27', 'User39', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');

INSERT INTO Nursery VALUES('nursery0', '7h00', '8h30', 50);
INSERT INTO Nursery VALUES('nursery1', '15h45', '16h30', 50);
INSERT INTO Nursery VALUES('nursery2', '16h30', '17h15', 50);
INSERT INTO Nursery VALUES('nursery3', '17h15', '18h30', 50);



INSERT INTO PeriodYear VALUES('1', TO_DATE('2017/09/04', 'yyyy/mm/dd'), TO_DATE('2017/12/22', 'yyyy/mm/dd'));


INSERT INTO Activity VALUES('1', 'Gym', 50);
INSERT INTO Activity VALUES('2', 'handball', 50);
INSERT INTO Activity VALUES('3', 'basketball', 50);
INSERT INTO Activity VALUES('4', 'atelier creatif', 50);
INSERT INTO Activity VALUES('5', 'poterie', 50);
INSERT INTO Activity VALUES('6', 'relaxation', 50);

INSERT INTO GroupActivity VALUES ('1', '1', 'Lundi', '17:30', '18:30', 15);
INSERT INTO GroupActivity VALUES ('2', '1', 'Mardi', '16:30', '17:30', 15);

INSERT INTO GroupLevels VALUES ('1','1','CP');
INSERT INTO GroupLevels VALUES ('1','1','CE1');

INSERT INTO PeriodActivity VALUES('1', '1');
INSERT INTO PeriodActivity VALUES('1', '2');
INSERT INTO PeriodActivity VALUES('1', '3');
INSERT INTO PeriodActivity VALUES('1', '4');
INSERT INTO PeriodActivity VALUES('1', '5');
INSERT INTO PeriodActivity VALUES('1', '6');

INSERT INTO Coordinator VALUES('1', 'jean', 'martin');
INSERT INTO Coordinator VALUES('2', 'jean', 'martin');
INSERT INTO Coordinator VALUES('3', 'jean', 'martin');
INSERT INTO Coordinator VALUES('4', 'jean', 'martin');
INSERT INTO Coordinator VALUES('5', 'jean', 'martin');



INSERT INTO CoordinatorNursery VALUES('1', '1', '');
INSERT INTO CoordinatorNursery VALUES('2', '2', '');
INSERT INTO CoordinatorNursery  VALUES('3', '3', '');
INSERT INTO CoordinatorNursery  VALUES('4','4', '');
INSERT INTO CoordinatorNursery  VALUES('5','5', '');
INSERT INTO CoordinatorNursery  VALUES('1','6', '');
INSERT INTO CoordinatorNursery  VALUES('2','7', '');
INSERT INTO CoordinatorNursery  VALUES('3','8', '');
INSERT INTO CoordinatorNursery  VALUES('4','9', '');
INSERT INTO CoordinatorNursery  VALUES('5','10', '');
INSERT INTO CoordinatorNursery  VALUES('1','11', '');
INSERT INTO CoordinatorNursery  VALUES('2','12', '');
INSERT INTO CoordinatorNursery  VALUES('3','13', '');
INSERT INTO CoordinatorNursery  VALUES('4','14', '');
INSERT INTO CoordinatorNursery  VALUES('5','15', '');
INSERT INTO CoordinatorNursery  VALUES('1','16', '');
