# AWS ETL Work Process

1. Amazon S3
2. AWS Glue
3. Amazon Athena
4. Amazon S3

## 1. Amazon S3

1.1 Amazon S3 / Buckets - {{bucket-for-source}} 생성
1.2 Amazon S3 / Buckets - {{bucket-for-source-jobed-for-parquet}} 생성
1.3 Amazon S3 / Buckets - {{bucket-for-source-queried-by-athena}} 생성
1.4 Amazon S3 / Buckets - {{bucket-for-source}} - {{object}} 업로드

## 2. AWS Glue

2.1 AWS Glue / Data Catalog / Databases - {{database-for-source}} 생성
2.2 AWS Glue / Data Catalog / Crawlers - {{crawler-for-source}} 생성
2.3 AWS Glue / Data Catalog / Database / Tables - {{table-for-source}} Table 생성 확인
2.4 AWS Glue / Data Integration and ETL / AWS Glue Studio / Jobs - {{job-for-source}} 생성
2.5 AWS Glue / Data Catalog / Crawlers - {{crawler-for-source-by-job}} 생성
2.6 AWS Glue / Data Catalog / Database / Tables - {{table-for-source-by-job}} Table 생성 확인

## 3. Amazon Athena

3.1 Amazon Athena / Query editor / Settings - {{bucket-for-source-queried-by-athena}} 연결
3.2 Amazon Athena / Query editor / Editor -  쿼리 생성

## 4. Amazon S3

4.1 Amazon S3 / Buckets / {{bucket-for-source-queried-by-athena}} - {{object}} 생성 확인
