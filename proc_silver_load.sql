Select
project_id,
COALESCE(category, 'Unknown') category,
COALESCE(contractor, 'Unknown') contractor,
starting_date,
plan_end_date,
actual_end_date,
FROM bronze.construction
