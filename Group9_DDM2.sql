CREATE TABLE Block(
   BlockID VARCHAR(50),
   BlockName VARCHAR(50),
   Start_date DATE,
   End_date DATE,
   PRIMARY KEY(BlockID));
  
CREATE TABLE Instructors(
   InstructorID VARCHAR(50),
   InstructorName VARCHAR(50),
   Nationality VARCHAR(50),
   University_Company VARCHAR(50),
   Area_of_Specialization VARCHAR(60),
   Email VARCHAR(50),
   SEX VARCHAR(1) NOT NULL,
   PRIMARY KEY(InstructorID)
);

CREATE TABLE Courses(
   CourseID VARCHAR(50),
   CourseName VARCHAR(50),
   Mode_of_Delivery VARCHAR(50),
   Course_type VARCHAR(50),
   BlockID VARCHAR(50) NOT NULL,
   InstructorID VARCHAR(50) NOT NULL,
   PRIMARY KEY(CourseID),
   FOREIGN KEY(BlockID) REFERENCES Block(BlockID),
   FOREIGN KEY(InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE EssayProjects(
   ProjectID VARCHAR(50),
   ProjectName VARCHAR(200) NOT NULL,
   ProjectType VARCHAR(20) NOT NULL,
   InstructorID VARCHAR(50) NOT NULL,
   PRIMARY KEY(ProjectID),
   UNIQUE(ProjectName),
   FOREIGN KEY(InstructorID) REFERENCES Instructors(InstructorID)
);

CREATE TABLE Students(
   StudentID VARCHAR(50),
   StudentName VARCHAR(50),
   Nationality VARCHAR(50),
   Background VARCHAR(50),
   Sex VARCHAR(50),
   Email VARCHAR(50) NOT NULL,
   ProjectID VARCHAR(50) NOT NULL,
   PRIMARY KEY(StudentID),
   UNIQUE(ProjectID),
   UNIQUE(Email),
   FOREIGN KEY(ProjectID) REFERENCES EssayProjects(ProjectID)
);

   
CREATE TABLE Tutorials(
   TutorialID INT,
   tutorialdate date,
   CourseID VARCHAR(50) NOT NULL,
   Start_time time,
   End_time time,
   PRIMARY KEY(TutorialID),
   FOREIGN KEY(CourseID) REFERENCES courses(CourseID)
);

--drop table tutorials;
--drop table tutoring;

CREATE TABLE Tutors(
   TutorID VARCHAR(50),
   TutorName VARCHAR(50),
   Nationality VARCHAR(50),
   Area_of_specialization VARCHAR(50),
   Email VARCHAR(50) NOT NULL,
   SEX VARCHAR(1) NOT NULL,
   PRIMARY KEY(TutorID),
   UNIQUE(Email)
);


CREATE TABLE ClassPresentations(
   PresentationID VARCHAR(50),
   Topic VARCHAR(50),
   CourseID VARCHAR(50),
   StudentID VARCHAR(50) NOT NULL,
   PRIMARY KEY(PresentationID),
   FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
   FOREIGN KEY(CourseID) REFERENCES Students(courses)
);

CREATE TABLE CatchUP(
   CatchupResult VARCHAR(50),
   CourseID VARCHAR(50) NOT NULL,
   StudentID VARCHAR(50) NOT NULL,
   PRIMARY KEY(CourseID,StudentID),
   FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
   FOREIGN KEY(StudentID) REFERENCES Students(StudentID)
);


CREATE TABLE Quiz(
   QuizID VARCHAR(50),
   Q_date DATE,
   Start_time TIME,
   End_time TIME,
   CourseID VARCHAR(50) NOT NULL,
   PRIMARY KEY(QuizID),
   FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Assignment(
   assignID VARCHAR(50),
   DueDate VARCHAR(50),
   CourseID VARCHAR(50) NOT NULL,
   PRIMARY KEY(assignID),
   FOREIGN KEY(CourseID) REFERENCES Courses(CourseID)
);

CREATE TABLE Quiz_Marks(
   StudentID VARCHAR(50) NOT NULL,
   QuizID VARCHAR(50) NOT NULL,
   Marks DECIMAL(15,2),
   PRIMARY KEY(StudentID,QuizID),
   FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
   FOREIGN KEY(QuizID) REFERENCES Quiz(QuizID)
);

CREATE TABLE Assign_Marks(
   Marks VARCHAR(50),
   StudentID VARCHAR(50) NOT NULL,
   assignID VARCHAR(50) NOT NULL,
   PRIMARY KEY(AssignID, StudentID),
   FOREIGN KEY(StudentID) REFERENCES Students(StudentID),
   FOREIGN KEY(assignID) REFERENCES Assignment(assignID)
);

CREATE TABLE Tutoring(
   TutorialID INT,
   CourseID VARCHAR(50),
   TutorID VARCHAR(50),
   PRIMARY KEY(TutorialID, CourseID, TutorID),
   FOREIGN KEY(TutorialID) REFERENCES Tutorials(TutorialID),
   FOREIGN KEY(CourseID) REFERENCES Courses(CourseID),
   FOREIGN KEY(TutorID) REFERENCES Tutors(TutorID)
);



INSERT INTO block (blockid, blockname, start_date, end_date)
VALUES 
    ('2022SP1', 'Block 1', '2022-08-29', '2022-09-16'),
    ('2022SP2', 'Block 2', '2022-09-19', '2022-10-07'),
    ('2022SP3', 'Block 3', '2022-10-10', '2022-10-28'),
    ('2022RP1', 'Block 1', '2022-11-07', '2022-11-25'),
    ('2022RP2', 'Block 2', '2022-11-28', '2022-12-16'),
    ('2022RP3', 'Block 3', '2023-01-02', '2023-01-20'),
    ('2022RP4', 'Block 4', '2023-01-23', '2023-02-10'),
    ('2022RP5', 'Block 5', '2023-02-20', '2023-03-10'),
    ('2022RP6', 'Block 6', '2023-03-13', '2023-03-31'),
    ('2022ESP', 'Essay', '2023-04-03', '2023-06-14');
   
   
INSERT INTO instructors (instructorid, instructorname, nationality, university_company, area_of_specialization, email, sex)
VALUES
('AIMS2022T1', 'Prudence', 'Benin', 'AIMS Rwanda', 'Mathematics', 'prudence@aims.ac.rw', 'M'),
('AIMS2022T2', 'Assinovi', 'Togo', 'AIMS Rwanda', 'Computer Science', 'assionvi@aims.ac.rw', 'M'),
('AIMS2022T3', 'Kai', 'United Kingdom', 'AIMS Rwanda', 'Mathematics', 'Kai@aims.ac.rw', 'M'),
('AIMS2022T4', 'Assinovi', 'Togo', 'AIMS Rwanda', 'Computer Science', 'Assinovi@aims.ac.rw', 'M'),
('AIMS2022T5', 'Pawel', 'United States', 'Michigan State University', 'Physics', 'Pawel@aims.ac.rw', 'M'),
('AIMS2022T6', 'Blaise', 'Cameroon', 'AIMS Rwanda', 'Mathematics', 'Blaise@aims.ac.rw', 'M'),
('AIMS2022T7', 'Evans', 'France', 'Universite Bretage Sud', 'Statistics', 'Evans@aims.ac.rw', 'M'),
('AIMS2022T8', 'Frank', 'DRC', 'University of Lumumbashi', 'Mathematics', 'Frank@aims.ac.rw', 'M'),
('AIMS2022T9', 'Tovondrainy', 'Madagascar', 'University of Antannarivo', 'Cryptography', 'Tovondrainy@aims.ac.rw', 'M'),
('AIMS2022T10', 'Camille', 'Belgium', 'University of Lyon', 'Physics', 'Camille@aims.ac.rw', 'M'),
('AIMS2022T11', 'Jodi', 'United States', 'Boise State University', 'Mathematics', 'Jodi@aims.ac.rw', 'F'),
('AIMS2022T12', 'Zoe', 'United Kingdom', 'Kings College London', 'Mathematics', 'Zoe@aims.ac.rw', 'F'),
('AIMS2022T13', 'Wolfgang', 'Germany', 'None', 'Quantum computing', 'Wolfgang@aims.ac.rw', 'M'),
('AIMS2022T14', 'Vian', 'United Kingdom', 'University of Edernburg', 'Statistics', 'Vian@aims.ac.rw', 'M'),
('AIMS2022T15', 'Ernest', 'United States', 'Rochester institute of Technology', 'Statistics', 'Ernest@aims.ac.rw', 'M'),
('AIMS2022T16', 'Dustan', 'Malawi', 'World Bank Group', 'Computer Science', 'Dustan@aims.ac.rw', 'M'),
('AIMS2022T17', 'Abebe', 'Ethopia', 'AIMS Rwanda', 'Mathematics', 'Abebe@aims.ac.rw', 'M'),
('AIMS2022T18', 'James', 'United Kingdom', 'University of Southampton', 'Finance', 'James@aims.ac.rw', 'M'),
('AIMS2022T19', 'Federic', 'Belgium', 'Universite Catholique Louvain', 'Neuroscience', 'Federic@aims.ac.rw',	'M'),
('AIMS2022T20', 'Hippolyte', 'Cameroon', 'University of Yaounder 1', 'Computer Science', 'Hippolyte@aims.ac.rw', 'M'),
('AIMS2022T21', 'Aklilu', 'United States', 'Michigan State University', 'Statistics', 'Aklilu@aims.ac.rw', 'M'),
('AIMS2022T22', 'Jan', 'Poland', 'AIMS Rwanda', 'Mathematics', 'Jan@aims.ac.rw', 'M'),
('AIMS2022T23', 'Corina', 'United Kingdom', 'University of Liverpool', 'Actuarial Science', 'Corina@aims.ac.rw', 'F'),
('AIMS2022T24', 'Andreas', 'Finland', 'Lappeenranta University of Technology', 'Mathematics', 'Andreas@aims.ac.rw', 'M'),
('AIMS2022T25', 'Cloude', 'France', 'Mines Paris Tech', 'Computer Science', 'Cloude@aims.ac.rw', 'M');




INSERT INTO  courses (courseid, coursename, mode_of_delivery, course_type, blockid, instructorid) 
VALUES ('MPS', 'Mathematical Problem Solving', 'Both', 'Mixed', '2022SP1', 'AIMS2022T1'),
       ('ICL', 'Introduction Computing with Latex', 'Physical', 'Theoretical', '2022SP1', 'AIMS2022T2'),
       ('PP', 'Python programming', 'Both', 'Theoretical', '2022SP2', 'AIMS2022T4'),
       ('PPS', 'Physical problem solving', 'Physical', 'Theoretical', '2022SP2', 'AIMS2022T5'),
       ('ISP', 'Introduction to Statistics and Probability', 'Physical', 'Mixed', '2022SP2', 'AIMS2022T6'),
       ('ODE', 'Ordinary Differebtial Equation', 'Physical', 'Theoretical', '2022SP3', 'AIMS2022T7'),
       ('NLA', 'Numerical Linear Algebra', 'Physical', 'Mixed', '2022RP1', 'AIMS2022T8'),
       ('AC', 'Algebra and Cryptography', 'Physical', 'Theoretical', '2022RP1', 'AIMS2022T9'),
       ('CM', 'Classical Mechanics', 'Physical', 'Mixed', '2022RP1', 'AIMS2022T10'),
       ('DA', 'Data Assimilation', 'Online', 'Mixed', '2022RP2', 'AIMS2022T11'),
       ('PDE', 'Partial Differential Equations', 'Both', 'Practical', '2022RP2', 'AIMS2022T12'),
       ('SR', 'Statistical Regression', 'Online', 'Practical', '2022RP2', 'AIMS2022T13'),
       ('QC', 'Quantum Computing', 'Physical', 'Theoretical', '2022RP3', 'AIMS2022T14'),
       ('SML', 'Statistical Machine Learning', 'Both', 'Mixed', '2022RP3', 'AIMS2022T15'),
       ('BDP', 'Big Data', 'Physical', 'Theoretical', '2022RP3', 'AIMS2022T16'),
       ('DDO', 'Data Driven Optimization', 'Physical', 'Practical', '2022RP4', 'AIMS2022T17'),
       ('IFM', 'Financial Mathematics', 'Physical', 'Theoretical', '2022RP4', 'AIMS2022T18'),
       ('MMN', 'Mathematical Models of Neuroscience', 'Physical', 'Practical', '2022RP4', 'AIMS2022T19'),
       ('DDM', 'Database Management', 'Online', 'Practical', '2022RP5', 'AIMS2022T20'),
       ('PM', 'Probability models', 'Physical', 'Theoretical', '2022RP5', 'AIMS2022T21'),
       ('INN', 'Neural Networks', 'Physical', 'Practical', '2022RP5', 'AIMS2022T22'),
       ('AM', 'Actuarial Maths', 'Physical', 'Theoretical', '2022RP6', 'AIMS2022T23'),
       ('NA', 'Numerical Analysis', 'Both', 'Practical', '2022RP6', 'AIMS2022T24'),
       ('HPC', 'High Performance Computing', 'Physical', 'Theoretical',	'2022RP6', 'AIMS2022T25');

--
-- Data for Name: essayprojects; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO essayprojects (projectid, projecttype, instructorid, projectname) VALUES
('2023P2', 'Data science', 'AIMS2022T2', 'Deep learning audio signal processing for smart hearing-aid devices'),
('2023P3', 'Not Data science', 'AIMS2022T3', 'General relativity and its applications'),
('2023P4', 'Data science', 'AIMS2022T4', 'Benefits of inclusive insurance'),
('2023P5', 'Data science', 'AIMS2022T5', 'Economic benefits of eliminating child labor'),
('2023P6', 'Data science', 'AIMS2022T6', 'Deep Learning on the Edge for Biometric Image Processing using Raspberry with a USB Camera');

INSERT INTO essayprojects (projectid, projecttype, instructorid, projectname) values
('2023P7', 'Data science', 'AIMS2022T2', 'Audio signal processing'),
('2023P8', 'Not Data science', 'AIMS2022T3', 'General relativity and inflation'),
('2023P9', 'Data science', 'AIMS2022T4', 'Benefits of inclusive behavior'),
('2023P10', 'Data science', 'AIMS2022T5', 'Economic dangers of eliminating child labor'),
('2023P11', 'Data science', 'AIMS2022T6', 'Image Processing using Raspberry with a USB Camera');

INSERT INTO essayprojects (projectid, projecttype, instructorid, projectname) values
('2023P13', 'Data science', 'AIMS2022T2', 'Audio signal processing on animals');


INSERT INTO quiz (quizid, q_date, start_time, end_time, courseid) 
VALUES
    ('QMPS1', '2022-02-12', '08:00:00', '09:00:00', 'MPS'),
    ('QMPS2', '2022-03-12', '08:00:00', '09:00:00', 'MPS'),
    ('QSML1', '2022-04-12', '08:00:00', '09:00:00', 'SML'),
    ('QSR3', '2022-05-12', '08:00:00', '09:00:00', 'SR'),
    ('QICL1', '2022-06-12', '08:00:00', '09:00:00', 'ICL');
INSERT INTO students (studentid, studentname, nationality, background, sex, email,projectid)
VALUES 
('AIMS2022ST01', 'Nana Adjei OWUSU', 'Ghana', 'Comp Sc', 'M', 'adjei.nana@aims.ac.rw','2023P13'),
('AIMS2022ST02', 'Aime BAREMA', 'Rwanda', 'Maths', 'M', 'aime.barema@aims.ac.rw','2023P2'),
('AIMS2022ST03', 'Alexis DJODJIMADJI', 'Tchad', 'Comp Sc', 'F', 'alexis.djodjimadji@aims.ac.rw','2023P3'),
('AIMS2022ST04', 'Ancille UWIMANA', 'Rwanda', 'Maths', 'F', 'ancille.uwimana@aims.ac.rw','2023P4'),
('AIMS2022ST05', 'Anita Esi ESHUN', 'Ghana', 'Physics', 'F', 'anita.esieshun@aims.ac.rw','2023P5'),
('AIMS2022ST06', 'Azza Izzeldien Awad OSMAN', 'Sudan', 'Maths', 'F', 'azza.osman@aims.ac.rw','2023P6'),
('AIMS2022ST07', 'Benjamin Peter OGWANG', 'Uganda', 'Maths', 'F', 'benjamin.ogwang@aims.ac.rw','2023P7'),
('AIMS2022ST08', 'Betrida A. MUGANDA', 'Tanzania', 'Physics', 'F', 'betrida.muganda@aims.ac.rw','2023P8'),
('AIMS2022ST09', 'Chantelle AMOAKO-ATTA', 'Ghana', 'Physics', 'M', 'chantelle.amoako-atta@aims.ac.rw','2023P9'),
('AIMS2022ST10', 'Claudette NYINAWUMUNTU', 'Rwanda', 'Comp Sc', 'F', 'claudette.nyinawumuntu@aims.ac.rw','2023P11');

--
-- Data for Name: quiz_marks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO quiz_marks (quizid, studentid, marks) VALUES
    ('QMPS1', 'AIMS2022ST01', 9.00),
    ('QMPS1', 'AIMS2022ST02', 6.00),
    ('QSML1', 'AIMS2022ST03', 7.00),
    ('QSR3', 'AIMS2022ST04', 9.00),
    ('QICL1', 'AIMS2022ST05', 10.00);



--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO tutors (tutorid, tutorname, nationality, area_of_specialization, email, sex)
VALUES
    ('AIMS2022TU1', 'Armeline', 'DRC', 'Computer Science', 'armeline.dembo@aims.ac.rw', 'F'),
    ('AIMS2022TU2', 'Joseph', 'Tanzania', 'Mathematics', 'joseph.ndenda@aims.ac.rw', 'M'),
    ('AIMS2022TU3', 'Winny', 'Uganda', 'Statistics', 'winnie.nakiyingi@aims.ac.rw', 'F'),
    ('AIMS2022TU4', 'Eunice', 'Benin', 'Physics', 'eunice.gandote@aims.ac.rw', 'F'),
    ('AIMS2022TU5', 'Leila', 'Morocco', 'Cryptograph', 'leila.zahhafi@aims.ac.rw', 'F'),
    ('AIMS2022TU6', 'Stefania', 'Italy', 'Mathematics', 'stefania.lisai@aims.ac.rw', 'F'),
    ('AIMS2022TU7', 'Aline', 'Rwanda', 'Computer Science', 'aline.uwimbabazi@aims.ac.rw', 'F'),
    ('AIMS2022TU8', 'Justin', 'Rwanda', 'Statistics', 'justin.ushize@aims.ac.rw', 'M');
   
INSERT INTO tutorials (tutorialid, tutorialdate, courseid, start_time, end_time)
VALUES
  (12,'2021-09-01', 'MPS', '08:00:00', '09:00:00' ),
  (13,'2023-09-01', 'ICL', '08:00:00', '09:00:00'),
  (14,'2024-04-01', 'AM', '08:00:00', '09:00:00'),
  (15, '2024-11-01','ODE', '08:00:00', '09:00:00'),
  (16,  '2025-06-01','NLA', '07:00:00', '10:00:00'),
  (17, '2023-06-02','SML',  '08:00:00', '11:00:00'),
  (18, '2024-01-02', 'DA','09:00:00', '12:00:00'),
  (19, '2024-08-02','CM', '10:00:00', '13:00:00'),
  (20,  '2025-03-02','PDE', '11:00:00', '14:00:00'),
  (21,'2023-05-03', 'SR', '12:00:00', '15:00:00');

INSERT INTO tutoring (tutorialid, courseid, tutorid)
VALUES 
  (12, 'MPS', 'AIMS2022TU1'),
  (13, 'ICL', 'AIMS2022TU2'),
  (14, 'AM', 'AIMS2022TU3'),
  (15, 'ODE', 'AIMS2022TU4'),
  (16, 'NLA', 'AIMS2022TU5');
 
 insert into assignment (assignid,duedate ,courseid) values
 ('ASSDDO01','2023-01-01','DDO'),
 ('ASSDDO02','2023-01-01','DDO'),
 ('ASSODE01','2022-09-09','ODE');

insert into assign_marks(marks,assignid, studentid) values
(20,'ASSDDO01','AIMS2022ST01'),
 (24,'ASSDDO02','AIMS2022ST09'),
 (27,'ASSODE01','AIMS2022ST05');

 
--Sql 
--1 select all courses in block1 of skills phase
 
SELECT *
FROM Courses
WHERE blockid = '2022SP1';

-- 2
SELECT studentname, marks FROM Students as s, assign_marks as a
WHERE s.studentid = a.studentid and  a.assignid = 'ASSDDO01';
   
-- 3 return marks student named AIMS2022ST05
select marks, studentname
FROM assign_Marks as a, Students as s
WHERE a.studentid = s.studentid and a.studentid ='AIMS2022ST05';

-- 4 select a name and area of specialization of a tutor who tutored ODE
 SELECT TutorName,Area_of_specialization
 FROM Tutors as tt, tutoring as t
 WHERE t.Courseid= 'ODE' and t.tutorid = tt.tutorid ;

-- 5
select * from courses c;

--6 all students taking ODE
SELECT StudentName
FROM Students as s, assign_marks as am, courses c 
WHERE s.Studentid = am.studentid and c.courseid ='ODE';


--7 list of students who scored over 80 persent in a couse(i.e QMPS1)
SELECT students.studentname 
FROM students JOIN quiz_marks ON students.studentid  = quiz_marks.studentid
WHERE quiz_marks.quizid = 'QMPS1' AND quiz_marks.marks > 80;

--8
SELECT blockid, COUNT(*) as num_courses 
FROM courses GROUP BY blockid;

---9
SELECT DISTINCT instructorname
FROM courses as c, instructors i 
WHERE c.blockid = '2022SP2' and c.instructorid = i.instructorid ;


-- 10
SELECT instructorid , COUNT(*) as num_courses 
FROM courses GROUP BY instructorid ;

---11 Delete an instructor called Hove
DELETE FROM instructors  WHERE instructorname ='Hove';






