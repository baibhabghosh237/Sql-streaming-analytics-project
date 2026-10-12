CREATE TABLE users (
    user_id INT PRIMARY KEY,
    signup_date DATE NOT NULL,
    subscription_tier VARCHAR(20) NOT NULL
);

CREATE TABLE videos (
    video_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    category VARCHAR(50) NOT NULL,
    duration_minutes INT NOT NULL
);

CREATE TABLE watch_history (
    watch_id INT PRIMARY KEY,
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    watch_date DATE NOT NULL,
    watch_duration_minutes INT NOT NULL,
    completion_rate DECIMAL(5,2) NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id),
    FOREIGN KEY (video_id) REFERENCES videos(video_id)
);

INSERT INTO users VALUES
(1, '2026-01-01', 'Premium'),
(2, '2026-01-05', 'Free'),
(3, '2026-01-10', 'Premium');

INSERT INTO videos VALUES
(101, 'Intro to SQL', 'Education', 45),
(102, 'Sci-Fi Movie', 'Entertainment', 120),
(103, 'Tech Gadgets', 'Tech', 30);

INSERT INTO watch_history VALUES
(1, 1, 101, '2026-01-02', 45, 100.00), 
(2, 1, 102, '2026-01-02', 120, 90.00), 
(3, 1, 103, '2026-01-02', 30, 100.00), 
(4, 2, 101, '2026-01-06', 45, 50.00), 
(5, 3, 102, '2026-02-15', 120, 100.00);

select user_id,
sum(watch_duration_minutes) as Total_watch_time
from watch_history
group by user_id
order by Total_watch_time desc;


SELECT title, duration_minutes 
FROM videos 
WHERE category = 'Education';


SELECT category, COUNT(*) AS total_videos
FROM videos
GROUP BY category;
