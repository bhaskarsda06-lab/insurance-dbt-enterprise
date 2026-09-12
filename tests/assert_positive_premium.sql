select *
from {{ ref('dim_policy') }}
where premium < 0
