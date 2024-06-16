#define _CRT_SECURE_NO_WARNINGS
#include <stdio.h>
#include "mysql.h"
#include <cstring>

#pragma comment(lib, "libmysql.lib")

const char* host = "localhost";
const char* user = "root";
const char* pw = "mysql";
const char* db = "project";

void execute_query(MYSQL* connection, const char* query) {
    int state = mysql_query(connection, query);
    if (state == 0) {
        MYSQL_RES* sql_result = mysql_store_result(connection);
        if (sql_result) {
            int num_fields = mysql_num_fields(sql_result);
            MYSQL_ROW sql_row;
            MYSQL_FIELD* fields = mysql_fetch_fields(sql_result);

            for (int i = 0; i < num_fields; i++) {
                printf("%-30s ", fields[i].name);
            }
            printf("\n");

            while ((sql_row = mysql_fetch_row(sql_result)) != NULL) {
                for (int i = 0; i < num_fields; i++) {
                    printf("%-30s ", sql_row[i] ? sql_row[i] : "NULL");
                }
                printf("\n");
            }
            mysql_free_result(sql_result);
        }
    } else {
        printf("Query execution failed: %s\n", mysql_error(connection));
    }
}

void execute_file_queries(MYSQL* connection, const char* filename) {
    FILE* fp = fopen(filename, "r");
    if (fp == NULL) {
        printf("File open error: %s\n", filename);
        return;
    }
    char query[1024];
    while (fgets(query, sizeof(query), fp)) {
        execute_query(connection, query);
    }
    fclose(fp);
}

int main(void) {
    MYSQL* connection = NULL;
    MYSQL conn;

    if (mysql_init(&conn) == NULL) {
        printf("mysql_init() error!");
        return 1;
    }

    connection = mysql_real_connect(&conn, host, user, pw, NULL, 3306, (const char*)NULL, 0);
    if (connection == NULL) {
        printf("%d ERROR : %s\n", mysql_errno(&conn), mysql_error(&conn));
        return 1;
    } else {
        printf("Connection Succeeded\n\n");

        execute_file_queries(connection, "20211547_CRUD_1.txt");

        if (mysql_select_db(&conn, db)) {
            printf("%d ERROR : %s\n", mysql_errno(&conn), mysql_error(&conn));
            return 1;
        }

        while (1) {
            printf("\n\n------- SELECT QUERY TYPES -------\n\n");
            printf("1. TYPE 1\n");
            printf("2. TYPE 2\n");
            printf("3. TYPE 3\n");
            printf("4. TYPE 4\n");
            printf("5. TYPE 5\n");
            printf("6. TYPE 6\n");
            printf("7. TYPE 7\n");
            printf("0. QUIT\n");
            printf("\n----------------------------------\n");

            int command = 0;
            printf("> Please select a query type : ");
            scanf("%d", &command);

            if (command == 0) break;

            char query[1000] = {0};

            switch (command) {
                case 1: {
                    int subtype = 0;
                    printf("\n\n------- Subtypes in TYPE 1 -------\n\n");
                    printf("1. TYPE 1-1\n");
                    printf("0. BACK\n");
                    printf("\n----------------------------------\n");

                    printf("> Please select a subtype : ");
                    scanf("%d", &subtype);

                    if (subtype == 0) break;

                    if (subtype == 1) {
                        sprintf(query, "SELECT address FROM property WHERE district = 'Mapo' AND price BETWEEN 1000000000 AND 1500000000 AND status = 'For Sale';");
                    } else {
                        printf("Invalid subtype.\n");
                        break;
                    }

                    execute_query(connection, query);
                    break;
                }
                case 2: {
                    int subtype = 0;
                    printf("\n\n------- Subtypes in TYPE 2 -------\n\n");
                    printf("1. TYPE 2-1\n");
                    printf("0. BACK\n");
                    printf("\n----------------------------------\n");

                    printf("> Please select a subtype : ");
                    scanf("%d", &subtype);

                    if (subtype == 0) break;

                    if (subtype == 1) {
                        sprintf(query, "SELECT address FROM property WHERE school_district = 8 AND number_of_bedrooms >= 4 AND number_of_bathrooms >= 2 AND status = 'For Sale';");
                    } else {
                        printf("Invalid subtype.\n");
                        break;
                    }

                    execute_query(connection, query);
                    break;
                }
                case 3: {
                    int subtype = 0;
                    printf("\n\n------- Subtypes in TYPE 3 -------\n\n");
                    printf("1. TYPE 3-1\n");
                    printf("2. TYPE 3-2\n");
                    printf("0. BACK\n");
                    printf("\n----------------------------------\n");

                    printf("> Please select a subtype : ");
                    scanf("%d", &subtype);

                    if (subtype == 0) break;

                    if (subtype == 1) {
                        printf("> Please enter the number of top agents: ");
                        int k;
                        scanf("%d", &k);
                        sprintf(query, "SELECT a.name FROM agent a JOIN transaction t ON a.agent_ID = t.selling_agent_ID WHERE YEAR(t.transaction_date) = 2023 GROUP BY a.agent_ID ORDER BY SUM(t.transaction_price) DESC LIMIT %d;", k);
                    } else if (subtype == 2) {
                        sprintf(query, "SELECT a.name FROM agent a JOIN transaction t ON a.agent_ID = t.selling_agent_ID WHERE YEAR(t.transaction_date) = 2021 GROUP BY a.agent_ID ORDER BY SUM(t.transaction_price) ASC LIMIT (SELECT COUNT(*) FROM agent) / 10;");
                    } else {
                        printf("Invalid subtype.\n");
                        break;
                    }

                    execute_query(connection, query);
                    break;
                }
                case 4: {
                    int subtype = 0;
                    printf("\n\n------- Subtypes in TYPE 4 -------\n\n");
                    printf("1. TYPE 4-1\n");
                    printf("2. TYPE 4-2\n");
                    printf("0. BACK\n");
                    printf("\n----------------------------------\n");

                    printf("> Please select a subtype : ");
                    scanf("%d", &subtype);

                    if (subtype == 0) break;

                    if (subtype == 1) {
                        sprintf(query, "SELECT a.name, AVG(t.transaction_price) AS avg_price, AVG(DATEDIFF(t.transaction_date, p.listing_date)) AS avg_days FROM agent a JOIN transaction t ON a.agent_ID = t.selling_agent_ID JOIN property p ON t.property_ID = p.property_ID WHERE YEAR(t.transaction_date) = 2022 GROUP BY a.name;");
                    } else if (subtype == 2) {
                        sprintf(query, "SELECT a.name, MAX(t.transaction_price) AS max_price FROM agent a JOIN transaction t ON a.agent_ID = t.selling_agent_ID WHERE YEAR(t.transaction_date) = 2023 GROUP BY a.name;");
                    } else {
                        printf("Invalid subtype.\n");
                        break;
                    }

                    execute_query(connection, query);
                    break;
                }
                case 5:
                    sprintf(query, "SELECT image_URL FROM image i JOIN property p ON i.property_ID = p.property_ID WHERE p.house_type_ID IN (1, 2, 3, 4) ORDER BY p.price DESC LIMIT 4;");
                    execute_query(connection, query);
                    break;
                case 6:
                    sprintf(query, "INSERT INTO transaction (selling_agent_ID, buying_agent_ID, transaction_type_ID, property_ID, buyer_ID, transaction_date, transaction_price) VALUES (1, 2, 1, 1, 1, '2023-08-01', 1500000000);");
                    execute_query(connection, query);
                    break;
                case 7:
                    sprintf(query, "INSERT INTO agent (name, contact_info) VALUES ('New Agent', '010-1234-5678');");
                    execute_query(connection, query);
                    break;
                default:
                    printf("Invalid command.\n");
            }
        }

        execute_file_queries(connection, "20211547_CRUD_2.txt");

        printf("Bye\n");
        mysql_close(connection);
    }

    return 0;
}
