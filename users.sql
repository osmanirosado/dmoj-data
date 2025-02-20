-- Sample query
select username, email, date_joined
from auth_user
order by date_joined desc;

-- Users joined in the last day
SELECT username, email, date_joined
FROM auth_user
WHERE date_joined >= DATE_SUB(CURDATE(), INTERVAL 1 DAY)
ORDER BY date_joined DESC;
