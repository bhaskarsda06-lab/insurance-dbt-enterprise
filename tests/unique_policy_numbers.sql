select policy_number
from {{ ref('dim_policy') }}
group by policy_number
having count(*) > 1
