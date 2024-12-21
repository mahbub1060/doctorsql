CREATE DATABASE medical_management;

USE medical_management;

-- Departments: (DepartmentID, Name, and Location.)
CREATE TABLE departments(
    department_id INT PRIMARY KEY,
    name VARCHAR(50),
    location VARCHAR(50)
);

INSERT INTO departments
(department_id,name,location)
VALUES
(101, 'Medicine', 'DMC'),
(102, 'Dermatology', 'Bangabandhu Sheikh Mujib Medical University'),
(103, 'Neurology', 'National Institute of Traumatology and Orthopedic'),
(104, 'Dermatology', 'Shishu Hospital, Dhaka'),
(105, 'Cardiology', 'Chittagong Medical College Hospital'),
(106, 'Medicine', 'Sir Salimullah Medical College Hospital'),
(107, 'Neurology', 'National Institute of Neurosciences'),
(108, 'Cardiology', 'National Institute of Cancer Research'),
(109, 'Dermatology', 'Shaheed Suhrawardy Medical College Hospital'),
(110, 'Medicine', 'Pabna Mental Hospital');


-- Doctors: (DoctorID, Name, Specialization, Phone,DepartmentID(FK))
CREATE TABLE doctors(
    doctor_id INT PRIMARY KEY,
    name VARCHAR(50),
    specialization VARCHAR(30),
    phone VARCHAR(15),
    dept_id INT,
    Foreign Key (dept_id) REFERENCES departments(department_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO doctors
(doctor_id,name,specialization,phone,dept_id)
VALUES
(201, 'Dr. Rahim Uddin', 'Cardiology', '01912345678', 101),
(202, 'Dr. Sultana Begum', 'Dermatology', '01923456789', 102),
(203, 'Dr. Akhtar Hossain', 'Neurology', '01934567890', 103),
(204, 'Dr. Nilufa Jahan', 'Dermatology', '01945678901', 104),
(205, 'Dr. Abdul Karim', 'Cardiology', '01956789012', 105),
(206, 'Dr. Nabila Khan', 'Gynecology', '01967890123', 106),
(207, 'Dr. Masum Billah', 'Neurology', '01978901234', 107),
(208, 'Dr. Shahidul Islam', 'Cardiology', '01989012345', 108),
(209, 'Dr. Ayesha Sultana', 'Dermatology', '01990123456', 109),
(210, 'Dr. Zafar Iqbal', 'Psychiatry', '01901234567', 110);


-- Patients: (PatientID, Name, Age, Gender, Phone.)
CREATE Table patients(
    patients_id INT PRIMARY KEY,
    name VARCHAR(50),
    age VARCHAR(3),
    gender VARCHAR(10),
    phone VARCHAR(20)
);

INSERT INTO patients
(patients_id,name,age,gender,phone)
VALUES
(301, 'John Doe', 45, 'Male', '01811223344'),
(302, 'Jane Smith', 30, 'Female', '01822334455'),
(303, 'Mohammad Ali', 60, 'Male', '01833445566'),
(304, 'Sara Khan', 25, 'Female', '01844556677'),
(305, 'Rasel Ahmed', 50, 'Male', '01855667788'),
(306, 'Tania Begum', 35, 'Female', '01866778899'),
(307, 'Khaled Hossain', 40, 'Male', '01877889900'),
(308, 'Mina Sultana', 28, 'Female', '01888990011'),
(309, 'Shamsul Haque', 55, 'Male', '01899001122'),
(310, 'Fariha Islam', 32, 'Female', '01801122334');


-- Appointments (AppointmentID, Date, Time, Status,DoctorID(FK),PatientID(FK))
CREATE TABLE appointments(
    appointment_id INT PRIMARY KEY,
    date DATE,
    time TIME,
    status VARCHAR(20),
    doc_id INT,
    pat_id INT,
    Foreign Key (doc_id) REFERENCES doctors(doctor_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
    Foreign Key (pat_id) REFERENCES patients(patients_id)
    ON DELETE CASCADE
    ON UPDATE CASCADE
);

INSERT INTO appointments
(appointment_id,date,time,status,doc_id,pat_id)
VALUES
(401, '2024-12-21', '10:00', 'Scheduled', 201, 301),
(402, '2024-12-21', '11:00', 'Completed', 202, 302),
(403, '2024-12-21', '12:00', 'Scheduled', 203, 303),
(404, '2024-12-21', '14:00', 'Completed', 204, 304),
(405, '2024-12-22', '09:00', 'Scheduled', 205, 305),
(406, '2024-12-22', '10:30', 'Completed', 206, 306),
(407, '2024-12-22', '11:30', 'Scheduled', 207, 307),
(408, '2024-12-22', '13:00', 'Completed', 208, 308),
(409, '2024-12-23', '09:30', 'Scheduled', 209, 309),
(410, '2024-12-23', '11:00', 'Completed', 210, 310);
