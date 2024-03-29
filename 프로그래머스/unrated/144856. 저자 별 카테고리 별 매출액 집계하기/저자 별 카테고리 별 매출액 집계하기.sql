SELECT
    T2.AUTHOR_ID,
    T1.AUTHOR_NAME,
    T2.CATEGORY,
    SUM(T2.TOTAL_SALES) AS TOTAL_SALES
FROM AUTHOR T1
INNER JOIN 
(
    SELECT 
        B.AUTHOR_ID,
        B.CATEGORY,
        (B.PRICE * S.SALES) AS TOTAL_SALES 
    FROM BOOK_SALES S
    INNER JOIN BOOK B
        ON B.BOOK_ID = S.BOOK_ID
    WHERE S.SALES_DATE LIKE '2022-01%'
) T2
    ON T1.AUTHOR_ID = T2.AUTHOR_ID
GROUP BY T2.AUTHOR_ID, T1.AUTHOR_NAME, T2.CATEGORY
ORDER BY T2.AUTHOR_ID, T2.CATEGORY DESC;