


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