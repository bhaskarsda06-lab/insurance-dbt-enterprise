select policy_id
from {{ ref('dim_policy') }}
group by policy_id
having count(*) > 1
