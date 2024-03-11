
  
    

    create or replace table `dataengineering-np-r-17f2ad92`.`dbt_fivetran`.`test_pipeline_user_dbt`
      
    
    

    OPTIONS()
    as (
      


SELECT
    id,
    roles,
    subscription,
    created,
    defaultLocale,
    email,
    CONCAT(firstName, ' ', lastName) AS user
FROM
    Test_pipeline.user
LIMIT
    1000
    );
  