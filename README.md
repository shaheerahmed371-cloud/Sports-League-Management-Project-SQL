# 🏆 Sports League Management System (SQL)
### Database Design & Management Project - CUST

A robust relational database designed to manage university-level sports leagues, tournaments, and multi-sport events. This system tracks everything from high-level event scheduling to granular details like player positions and officiating roles.

## 📊 Database Schema Overview
The database consists of **12 interconnected tables** designed to ensure data integrity and minimize redundancy through proper normalization.

### Core Entities:
* **Event & SubEvent:** Manages high-level events (e.g., Annual Sports Week) and their specific matches or rounds (e.g., Basketball Semifinal).
* **Teams & Players:** Tracks team registration by department (CS, EE, BBA, etc.) and individual player profiles including their field positions.
* **Sports & Rules:** Stores various sports (Cricket, Football, Badminton) alongside their specific match rules and qualification criteria.
* **Logistics (Location & Schedule):** Manages venue capacity and precise timing for every sub-event.
* **Officials:** Tracks referees, umpires, and event managers assigned to specific matches.

## 🛠️ Key Technical Features
* **Relational Integrity:** Implements `FOREIGN KEY` constraints with `ON DELETE CASCADE` and `ON UPDATE CASCADE` to ensure consistency across the board.
* **Complex Mapping:** Uses associative tables like `player_subevent` and `official_subevent` to handle many-to-many relationships.
* **Data Types:** Optimized use of `DATE`, `TIME`, and `VARCHAR` for efficient storage.
* **Auto-Incrementing IDs:** Primary keys are set to auto-increment for seamless data entry.

## 📂 Table Breakdown
| Table | Description |
| :--- | :--- |
| `event` | Stores event name, type, duration, and current status. |
| `team` | Lists competing teams and their academic departments. |
| `player` | Detailed player list linked to specific teams. |
| `subevent` | The "heart" of the DB, linking sports, events, locations, and results. |
| `location` | Venue details including spectator capacity. |
| `sport_rules` | Specific rules and descriptions for each sport type. |

## 🚀 How to Use
1.  **Import:** Open PHPMyAdmin or any SQL client.
2.  **Create DB:** Create a new database named `sports_db`.
3.  **Execute:** Import the `sports_db.sql` file to generate the schema and sample data.

---
**Author:** Shaheer  
**Department:** Computer Science, CUST  
**Tools Used:** MySQL, PHPMyAdmin Designer View
