with emp as (
    select *
    from {{ source('src2','stg_employees') }}
    where employee_id != 99999
), changed as (
select
        ANALYTICS.DBT_INDU.seqpay.nextval as EMPLOYEE_KEY,
        -- 2. Employee ID
        d.employee_id as EMPLOYEE_ID,
        {{ jodo('d.employee_first_name', 'd.employee_last_name') }} as EMPLOYEE_NAME,

        d.employee_address as EMPLOYEE_ADDRESS,
        d.employee_city as EMPLOYEE_CITY,
        d.employee_state as EMPLOYEE_STATE,
        d.employee_zip_code as EMPLOYEE_ZIP_CODE,
        d.employee_mobile as EMPLOYEE_MOBILE,

        {{ phone('d.employee_fixedline') }} as EMPLOYEE_FIXED_LINE,
        d.employee_email as EMPLOYEE_EMAIL,
        {{ gender('d.employee_gender') }} as EMPLOYEE_GENDER,
        d.employee_age as EMPLOYEE_AGE,
        {{ age_group('d.employee_age') }} as AGE_GROUP,

        d.position_type as POSITION_TYPE,
        d.dealership_id as DEALERSHIP_ID,
        d.dealership_manager as DEALERSHIP_MANAGER,
        d.salary as EMPLOYEE_SALARY,
        d.region as EMPLOYEE_REGION,
        d.hire_date as HIRED_DATE_KEY,
        d.date_entered as INSERT_DK,
        current_date() as UPDATE_DK
    from emp 
    as d
)
select * from changed   