{{ config(materialized="incremental",unique_key="payment_id",incremental_strategy="merge") }}
select * from {{ ref("stg_payment") }}