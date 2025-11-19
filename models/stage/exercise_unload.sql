{{ config(
    materialized='table',
    post_hook=[ post_hook_unload(this) ]
) }}

with stg_employees_cte as (
    select
        EMPLOYEE_ID as EMPLOYEE_ID,
        EMPLOYEE_ID as EMPLOYEE_KEY,
        EMPLOYEE_NAME as EMPLOYEE_NAME,
        EMPLOYEE_ADDRESS as EMPLOYEE_ADDRESS,
        EMPLOYEE_CITY as EMPLOYEE_CITY,
        EMPLOYEE_STATE as EMPLOYEE_STATE,
        EMPLOYEE_ZIP_CODE as EMPLOYEE_ZIP_CODE,
        EMPLOYEE_MOBILE as EMPLOYEE_MOBILE,
        EMPLOYEE_FIXED_LINE as EMPLOYEE_FIXED_LINE,
        EMPLOYEE_EMAIL as EMPLOYEE_EMAIL,
        EMPLOYEE_GENDER as EMPLOYEE_GENDER,
        EMPLOYEE_AGE as EMPLOYEE_AGE,
        AGE_GROUP as AGE_GROUP,
        POSITION_TYPE as POSITION_TYPE,
        DEALERSHIP_ID as DEALERSHIP_ID,
        DEALERSHIP_MANAGER as DEALERSHIP_MANAGER,
        EMPLOYEE_SALARY as EMPLOYEE_SALARY,
        EMPLOYEE_REGION as EMPLOYEE_REGION,
        HIRED_DATE_KEY as HIRED_DATE_KEY,
        INSERT_DK as INSERT_DK,
        current_date() as UPDATE_DK
    from {{ source('src3', 'stg_employees') }}
)

select *
from stg_employees_cte
