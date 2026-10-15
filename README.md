# Java-Based Online Quiz Platform

> **Summary:** An interactive, multi-role online assessment platform for Java programming, offering timed quizzes, question navigators, instant score calculation, detailed performance reports, and peer-to-instructor messaging.

---

## 📌 Project Overview
The **Java-Based Online Quiz Platform** provides a structured learning and evaluation ecosystem for Java programming. The platform features three distinct user roles:

1. **Admin:** Manages user accounts, approves/rejects quiz submissions, manages system settings, monitors performance reports via graphical charts, and broadcasts system alerts.
2. **Quiz Creator:** Authors timed Java quizzes, reviews student submissions, provides personalized instructor feedback, responds to participant queries, and monitors quiz metrics.
3. **Participant:** Takes timed Java quizzes with a live countdown timer and question navigator, reviews question-by-question performance reports, sets quiz reminders, interacts with instructors, and competes on the leaderboard.

---

## 🛠️ Technology Stack
- **Backend:** Java 17+, Spring Boot 3.2.5 (Spring MVC, Spring Data JPA, Spring Security, Validation)
- **Database:** H2 Database (In-Memory, zero external database setup required, auto-seeded with sample data)
- **Frontend / Templating:** Thymeleaf, Bootstrap 5.3, Bootstrap Icons, Chart.js, HTML5 & CSS3
- **Build Tool:** Apache Maven / Maven Wrapper

---

## 🔑 Pre-Configured Demo Credentials
When the application starts, it automatically seeds realistic Java programming quizzes and user accounts for all three roles:

| Role | Email | Password | Access & Capabilities |
| :--- | :--- | :--- | :--- |
| **Admin** | `admin@quizplatform.com` | `admin123` | Full system control, user CRUD, quiz approvals, system settings, analytics & alerts |
| **Quiz Creator** | `creator@quizplatform.com` | `creator123` | Author Java quizzes, grade submissions, instructor feedback, participant messaging |
| **Quiz Creator** | `james@quizplatform.com` | `james123` | Secondary creator account |
| **Participant** | `participant@quizplatform.com` | `student123` | Take timed quizzes, view performance reports, schedule reminders, leaderboard |
| **Participant** | `alice@student.com` | `student123` | Active student with high scores on the leaderboard |
| **Participant** | `bob@student.com` | `student123` | Active student |
| **Participant** | `carol@student.com` | `student123` | Active student |

---

## 🚀 How to Run the Application

### Prerequisites:
- Java JDK 17 or higher installed on your system.

### Steps:
1. Open PowerShell or Command Prompt.
2. Navigate to the project root directory:
   ```powershell
   cd C:\Users\varsh\.gemini\antigravity\scratch\online-quiz-platform
   ```
3. Run the application using the Maven command:
   ```powershell
   mvn spring-boot:run
   ```
   *(or use the included wrapper: `.\mvnw.cmd spring-boot:run`)*

4. Open your web browser and navigate to:
   ```
   http://localhost:8080/
   ```

5. **H2 Database Console (Optional):**
   - URL: `http://localhost:8080/h2-console`
   - JDBC URL: `jdbc:h2:mem:quizdb`
   - User Name: `sa`
   - Password: `password`

---

## 📋 Comprehensive Feature Breakdown

### 1. Admin Features & Dashboard
- **User Management:**
  - View all user accounts in an interactive table with role badges and active statuses.
  - Create new users (Name, Email, Password, Role).
  - Update user accounts, modify roles, or toggle active/disabled states.
  - Delete user accounts with safety confirmations.
- **Quiz Content Management:**
  - Table of all submitted quizzes and approval statuses (`PENDING_APPROVAL`, `APPROVED`, `REJECTED`, `DRAFT`).
  - Inspect quiz content, review questions, options, correct answers, and explanations.
  - Approve quiz (publishes it immediately to participants).
  - Reject quiz with feedback notes explaining required revisions to the creator.
- **System Settings:**
  - Manage global platform configurations (Platform Name, Default Quiz Duration, Passing Percentage, Allow Public Registration, Maintenance Mode, Support Email).
- **Performance Reports:**
  - Interactive **Chart.js** graphical analytics: Pass vs. Fail ratios, quiz content distribution, and leaderboard standings.
- **System Alerts:**
  - Broadcast system-wide alerts and maintenance notices categorized by severity (`INFO`, `WARNING`, `CRITICAL`).
  - Toggle alert broadcasting or delete old notifications.

### 2. Quiz Creator Features & Dashboard
- **Quiz Creation:**
  - Intuitive form to specify title, category, description, duration in minutes, and passing percentage.
  - Dynamic JavaScript question builder: add/remove multiple-choice questions with 4 options, correct answer selection, points, and explanations.
  - Submits quizzes into `PENDING_APPROVAL` status for Admin review.
- **Review Quiz Results & Grading:**
  - Table of all participant submissions across authored quizzes.
  - Inspect individual question responses (selected vs. correct option).
  - Enter custom instructor feedback and personalized mentoring notes.
- **Participant Interactions:**
  - Dedicated panel to view student inquiries and doubts regarding quizzes.
  - Send direct replies and explanations back to students.
- **Quiz History:**
  - Complete history log of all authored quizzes, categorized by approval status with resubmit options for rejected quizzes.
- **Performance Overview:**
  - Metrics on student attempts, pass rate percentage, average accuracy, and question count charts.

### 3. Participant Features & Dashboard
- **Take Timed Quizzes:**
  - Browse approved Java quizzes by topic (Core Java, OOP, Collections, Multithreading, Streams & Lambdas).
  - Live JavaScript countdown timer with auto-submission upon expiry.
  - Interactive question navigator palette showing answered vs. unanswered questions.
  - Instant scorecard with pass/fail status, accuracy percentage, and time taken.
- **Review Performance Reports:**
  - Question-by-question breakdown with green/red answer comparison.
  - Detailed instructional explanations explaining why each option is correct or incorrect.
  - Direct access to instructor feedback.
- **Quiz Participation History:**
  - Log of all historical attempts, scores, timestamps, and links to full reports.
- **Interact with Quiz Creators:**
  - Message creation interface to submit questions/doubts directly to instructors.
  - Notification and thread log when instructor replies are delivered.
- **Quiz Reminders:**
  - Set study reminders with date/time, quiz selection, and preparation notes.
  - Mark completed or delete reminders.
- **Leaderboard:**
  - Real-time ranking of participants based on total score and accuracy.
  - Prominent personal standing card displaying current rank and standing.

---

## 📂 Project Directory Structure
```
online-quiz-platform/
├── pom.xml
├── mvnw.cmd
├── README.md
└── src/
    ├── main/
    │   ├── java/com/quizplatform/
    │   │   ├── QuizPlatformApplication.java
    │   │   ├── config/
    │   │   │   ├── SecurityConfig.java
    │   │   │   └── DataInitializer.java
    │   │   ├── controller/
    │   │   │   ├── AuthController.java
    │   │   │   ├── HomeController.java
    │   │   │   ├── AdminController.java
    │   │   │   ├── QuizCreatorController.java
    │   │   │   └── ParticipantController.java
    │   │   ├── model/
    │   │   │   ├── Role.java
    │   │   │   ├── QuizStatus.java
    │   │   │   ├── User.java
    │   │   │   ├── Quiz.java
    │   │   │   ├── Question.java
    │   │   │   ├── QuizAttempt.java
    │   │   │   ├── AttemptAnswer.java
    │   │   │   ├── InteractionMessage.java
    │   │   │   ├── QuizReminder.java
    │   │   │   ├── SystemSetting.java
    │   │   │   └── SystemAlert.java
    │   │   ├── repository/
    │   │   │   ├── UserRepository.java
    │   │   │   ├── QuizRepository.java
    │   │   │   ├── QuestionRepository.java
    │   │   │   ├── QuizAttemptRepository.java
    │   │   │   ├── AttemptAnswerRepository.java
    │   │   │   ├── InteractionMessageRepository.java
    │   │   │   ├── QuizReminderRepository.java
    │   │   │   ├── SystemSettingRepository.java
    │   │   │   └── SystemAlertRepository.java
    │   │   └── service/
    │   │       ├── CustomUserDetailsService.java
    │   │       ├── UserService.java
    │   │       ├── QuizService.java
    │   │       ├── QuizAttemptService.java
    │   │       ├── InteractionService.java
    │   │       ├── ReminderService.java
    │   │       ├── SystemSettingService.java
    │   │       └── SystemAlertService.java
    │   └── resources/
    │       ├── application.properties
    │       ├── static/css/custom.css
    │       └── templates/
    │           ├── fragments/layout.html
    │           ├── home.html
    │           ├── about.html
    │           ├── auth/
    │           │   ├── login.html
    │           │   └── register.html
    │           ├── admin/
    │           │   ├── dashboard.html
    │           │   ├── users.html
    │           │   ├── quizzes.html
    │           │   ├── quiz-detail.html
    │           │   ├── settings.html
    │           │   ├── reports.html
    │           │   └── alerts.html
    │           ├── creator/
    │           │   ├── dashboard.html
    │           │   ├── quiz-create.html
    │           │   ├── quiz-history.html
    │           │   ├── quiz-results.html
    │           │   ├── attempt-review.html
    │           │   ├── interactions.html
    │           │   └── performance.html
    │           └── participant/
    │               ├── dashboard.html
    │               ├── quiz-list.html
    │               ├── quiz-take.html
    │               ├── quiz-result.html
    │               ├── performance-report.html
    │               ├── history.html
    │               ├── reminders.html
    │               ├── interactions.html
    │               └── leaderboard.html
    └── test/
        └── java/com/quizplatform/
            └── QuizPlatformApplicationTests.java
```

---

## 📄 License & Attribution
&copy; 2024 GUVI Geek Network Pvt. Ltd. All rights reserved. No part of this document may be reproduced or distributed without prior written permission.
