CREATE TABLE Users(
Login CHAR(20) NOT NULL,
Password CHAR(20) NOT NULL,
LastConnexion Date NOT NULL,
PRIMARY KEY(Login));


CREATE TABLE Parent(
ID_parent CHAR(20) NOT NULL,
Login CHAR(20) NOT NULL,
Name CHAR(20) NOT NULL,
Firstname CHAR(20) NOT NULL,
Telephone CHAR(20) NOT NULL,
Address CHAR(50) NOT NULL,
PRIMARY KEY(ID_parent, Login),
FOREIGN KEY(Login) REFERENCES Users(Login));

CREATE TABLE Period(
ID_Period CHAR(20) NOT NULL,
StartDay Date NOT NULL ,
EndDay Date NOT NULL,
PRIMARY KEY(ID_Period));

CREATE TABLE Bill(
ID_Bill CHAR(20) NOT NULL PRIMARY KEY,
BillNumber INT NOT NULL,
IssuingDate Date NOT NULL,
TotalPrice INT NOT NULL,
Login CHAR(20) NOT NULL REFERENCES Users(Login),
ID_Period CHAR(20) NOT NULL REFERENCES Period(ID_Period));

CREATE TABLE Activity(
ID_Activity CHAR(20) NOT NULL PRIMARY KEY,
Name CHAR(20) NOT NULL,
Price INT NOT NULL);

CREATE TABLE Groups(
ID_Group CHAR(20) NOT NULL UNIQUE,
ID_Activity CHAR(20) NOT NULL REFERENCES Activity(ID_Activity),
DaysOfTheWeek CHAR(20) NOT NULL,
StartTime Date NOT NULL,
EndTime Date NOT NULL,
Enrollement CHAR(20) NOT NULL,
PRIMARY KEY(ID_Group, ID_Activity)
);

CREATE TABLE PeriodActivity(
ID_Period CHAR(20) NOT NULL REFERENCES Period(ID_Period),
ID_Activity CHAR(20) NOT NULL REFERENCES Activity(ID_Activity),
PRIMARY KEY(ID_Period, ID_Activity)
);
CREATE TABLE Coordinator(
ID_Coordinator CHAR(20) NOT NULL PRIMARY KEY,
Name CHAR(20) NOT NULL,
Firstname Char(20) NOT NULL
);
CREATE TABLE CoordinatorGroups(
ID_Coordinator CHAR(20) NOT NULL REFERENCES Coordinator(ID_Coordinator),
ID_Group CHAR(20) NOT NULL REFERENCES Groups(ID_Group),
ID_Activity CHAR(20) NOT NULL REFERENCES Activity(ID_Activity),
PRIMARY KEY(ID_Coordinator, ID_Group, ID_Activity)
);
CREATE TABLE Nursery(
ID_Nursery CHAR(20) NOT NULL PRIMARY KEY,
StartTime CHAR(20) NOT NULL,
EndTime CHAR(20) NOT NULL ,
Price INT NOT NULL
);
CREATE TABLE CoordinatorNursery(
ID_Coordinator INT NOT NULL,
ID_Nursery CHAR(20) NOT NULL REFERENCES Nursery(ID_Nursery),
row1 CHAR(20) NOT NULL,
PRIMARY KEY(ID_Coordinator, ID_Nursery)
);
CREATE TABLE Diet(
ID_Diet CHAR(20) NOT NULL Primary key,
Descriptif CHAR(50) NOT NULL
);
CREATE TABLE Levels(
Name CHAR(20) NOT NULL Primary Key
);
CREATE TABLE Child(
ID_Child CHAR(20) NOT NULL UNIQUE,
Login CHAR(20) NOT NULL,
Name CHAR(20) NOT NULL,
Firstname CHAR(20) NOT NULL,
BirthDate DATE NOT NULL,
Gender CHAR(20),
Diet CHAR(20) NOT NULL REFERENCES Diet(ID_Diet),
Levels CHAR(20) NOT NULL REFERENCES Levels(Name),
PRIMARY KEY(ID_Child, login),
FOREIGN KEY (Login) REFERENCES Users(Login)
);

CREATE TABLE Booking(
ID_Booking CHAR(20) NOT NULL PRIMARY KEY,
CafeteriaDays CHAR(50) NOT NULL,
ID_Child CHAR(20) NOT NULL REFERENCES Child(ID_Child),
Login CHAR(20) NOT NULL REFERENCES Users(Login),
Diet CHAR(20) NOT NULL REFERENCES Diet(ID_Diet)
);

CREATE TABLE GroupsChoices(
ID_Booking CHAR(20) NOT NULL REFERENCES booking(ID_Booking),
ID_Activity CHAR(20) NOT NULL REFERENCES Activity(ID_Activity),
ID_Group CHAR(20) NOT NULL REFERENCES Groups(ID_Group),
PRIMARY KEY (ID_Booking, ID_Activity, ID_Group)
);
CREATE TABLE CoordinatorChoice(
ID_Booking CHAR(20) NOT NULL REFERENCES Booking(ID_Booking),
ID_Nursery CHAR(20) NOT NULL REFERENCES Nursery(ID_Nursery),
PRIMARY KEY (ID_Booking, ID_Nursery)
);
CREATE TABLE CoordinatorNursery(
ID_Coordinator CHAR(20) NOT NULL REFERENCES Coordinator(ID_Coordinator),
ID_Nursery CHAR(20) NOT NULL REFERENCES Nursery(ID_Nursery),
Row1 CHAR(20),
PRIMARY KEY (ID_Coordinator, ID_Nursery)
);



INSERT INTO Users VALUES('Users1', 'azer', TO_DATE('2018/03/01', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users2', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users3', 'azer', TO_DATE('2018/03/01', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users4', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users5', 'azer', TO_DATE('2018/03/03', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users6', 'azer', TO_DATE('2018/03/17', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users7', 'azer', TO_DATE('2018/03/16', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users8', 'azer', TO_DATE('2018/03/15', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users9', 'azer', TO_DATE('2018/03/22', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users10', 'azer', TO_DATE('2018/03/23', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users11', 'azer', TO_DATE('2018/03/24', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users12', 'azer', TO_DATE('2018/03/09', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users13', 'azer', TO_DATE('2018/03/09', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users14', 'azer', TO_DATE('2018/03/08', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users15', 'azer', TO_DATE('2018/03/06', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users16', 'azer', TO_DATE('2018/03/07', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users17', 'azer', TO_DATE('2018/03/08', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users18', 'azer', TO_DATE('2018/03/06', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users19', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users20', 'azer', TO_DATE('2018/03/04', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users21', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users22', 'azer', TO_DATE('2018/03/03', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users23', 'azer', TO_DATE('2018/03/02', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users24', 'azer', TO_DATE('2018/03/05', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users25', 'azer', TO_DATE('2018/03/29', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users26', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users27', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users28', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users29', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users30', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users31', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users32', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users33', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users34', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users35', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users36', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users37', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users38', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));
INSERT INTO Users VALUES('Users39', 'azer', TO_DATE('2018/03/19', 'yyyy/mm/dd'));


INSERT INTO Parent VALUES('1','Users1','dupont', 'karen1', '0601234567', '1 rue de la porte' );
INSERT INTO Parent VALUES('2','Users2','dupont', 'karen2', '0601534567', '2 rue de la porte' );
INSERT INTO Parent VALUES('3','Users3','dupont', 'karen3', '0621234577', '3 rue de la porte' );
INSERT INTO Parent VALUES('4','Users4','dupont', 'karen4', '0601254567', '4 rue de la porte' );
INSERT INTO Parent VALUES('5','Users5','dupont', 'karen5', '0601234567', '5 rue de la porte' );
INSERT INTO Parent VALUES('6','Users6','dupont', 'karen6', '0601234567', '6 rue de la porte' );
INSERT INTO Parent VALUES('7','Users7','dupont', 'karen7', '0601234567', '7 rue de la porte' );
INSERT INTO Parent VALUES('8','Users8','dupont', 'karen8', '0601234567', '8 rue de la porte' );
INSERT INTO Parent VALUES('9','Users9','dupont', 'karen9', '0605234567', '9 rue de la porte' );
INSERT INTO Parent VALUES('10','Users10','dupont', 'karen10', '0661234567', '10 rue de la porte' );
INSERT INTO Parent VALUES('11','Users11','dupont', 'karen11', '0601236567', '11 rue de la porte' );
INSERT INTO Parent VALUES('12','Users12','dupont', 'karen12', '0604234567', '12 rue de la porte' );

INSERT INTO Diet VALUES('1', 'mange de tout');
INSERT INTO Diet VALUES('2', 'sans porc');
INSERT INTO Diet VALUES('3', 'vegetarien');


INSERT INTO Levels VALUES('debutant');
INSERT INTO Levels VALUES('initié');

INSERT INTO Child VALUES('1', 'Users13', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('2', 'Users14', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('3', 'Users15', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('4', 'Users16', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('5', 'Users17', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('6', 'Users18', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('7', 'Users19', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('8', 'Users20', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('9', 'Users21', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('10', 'Users22', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('11', 'Users23', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('12', 'Users24', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('13', 'Users25', 'kevin', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'male', '1', 'debutant');
INSERT INTO Child VALUES('14', 'Users26', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('15', 'Users27', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('16', 'Users28', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('17', 'Users29', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('18', 'Users30', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('19', 'Users31', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('20', 'Users32', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('21', 'Users33', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('22', 'Users34', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('23', 'Users35', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('24', 'Users36', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('25', 'Users37', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('26', 'Users38', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');
INSERT INTO Child VALUES('27', 'Users39', 'lucie', 'dupont', TO_DATE('2010/03/09', 'yyyy/mm/dd'), 'female', '1', 'debutant');

INSERT INTO Nursery VALUES('1', 'lundi 7h', 'lundi 8h', 50);
INSERT INTO Nursery VALUES('2', 'mardi 7h', 'mardi 8h', 50);
INSERT INTO Nursery VALUES('3', 'jeudi 7h', 'jeudi 8h', 50);
INSERT INTO Nursery VALUES('4', 'vendredi 7h', 'vendredi 8h', 50);
INSERT INTO Nursery VALUES('5', 'lundi 15h45', 'lundi 16h30', 50);
INSERT INTO Nursery VALUES('6', 'lundi 16h30', 'lundi 17h15', 50);
INSERT INTO Nursery VALUES('7', 'lundi 17h15', 'lundi 18h30', 50);
INSERT INTO Nursery VALUES('8', 'mardi 15h45', 'mardi 16h30', 50);
INSERT INTO Nursery VALUES('9', 'mardi 16h30', 'mardi 17h15', 50);
INSERT INTO Nursery VALUES('10', 'mardi 17h15', 'mardi 18h30', 50);
INSERT INTO Nursery VALUES('11', 'jeudi 15h45', 'jeudi 16h30', 50);
INSERT INTO Nursery VALUES('12', 'jeudi 16h30', 'jeudi 17h15', 50);
INSERT INTO Nursery VALUES('13', 'jeudi 17h15', 'jeudi 18h30', 50);
INSERT INTO Nursery VALUES('14', 'vendredi 15h45', 'vendredi 16h30', 50);
INSERT INTO Nursery VALUES('15', 'vendredi 16h30', 'vendredi 17h15', 50);
INSERT INTO Nursery VALUES('16', 'vendredi 17h15', 'vendredi 18h30', 50);



INSERT INTO Period VALUES('1', TO_DATE('2017/09/04', 'yyyy/mm/dd'), TO_DATE('2017/12/22', 'yyyy/mm/dd'));


INSERT INTO Activity VALUES('1', 'Gym', 50);
INSERT INTO Activity VALUES('2', 'handball', 50);
INSERT INTO Activity VALUES('3', 'basketball', 50);
INSERT INTO Activity VALUES('4', 'atelier creatif', 50);
INSERT INTO Activity VALUES('5', 'poterie', 50);
INSERT INTO Activity VALUES('6', 'relaxation', 50);


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
