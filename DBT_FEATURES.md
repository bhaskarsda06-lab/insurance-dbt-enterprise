# dbt Enterprise Learning Demo

This project is intentionally designed as a single learning/demo project covering major dbt features.

## Covered features
1. Project configuration: dbt_project.yml
2. Profiles: Databricks profiles.yml.example
3. Sources and source freshness
4. Seeds
5. Staging models
6. Intermediate ephemeral model
7. ref() dependencies and DAG
8. Views, tables and incremental models
9. Incremental merge with unique_key
10. is_incremental()
11. on_schema_change
12. Macros and custom schema generation
13. dbt_utils package
14. Generic/schema tests
15. Singular SQL tests
16. Model contracts
17. Model/documentation YAML
18. Exposures
19. Analyses
20. Snapshots using timestamp strategy
21. SCD-style history through snapshots
22. dbt deps
23. dbt parse
24. dbt debug
25. dbt build
26. dbt source freshness
27. dbt docs generate
28. GitHub Actions CI
29. GitHub Actions deployment
30. Environment-specific configuration
31. Artifact upload
32. Databricks adapter

## Important
The snapshot is fully configured with `strategy`, `unique_key`, and `updated_at`. This fixes the parse error:

Snapshots must be configured with a 'strategy' and 'unique_key'.

## Typical commands

```bash
dbt deps
dbt parse
dbt debug
dbt seed
dbt run
dbt test
dbt build
dbt snapshot
dbt source freshness
dbt docs generate
dbt docs serve
```

For CI/CD, prefer `dbt build` because it builds selected resources and runs associated tests in dependency order.
