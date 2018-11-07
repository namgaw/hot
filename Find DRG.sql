select 
clr.mpi_id AS "DRG code",
drg.drg_name   AS "DRG description",
idt.id_type_name AS "Grouper"

from
CLARITY_DRG@clrprod drg
JOIN
CLARITY_DRG_MPI_ID@clrprod clr
ON
drg.drg_id = clr.drg_ID
JOIN
IDENTITY_ID_TYPE@clrprod idt
ON
idt.id_type = clr.mpi_id_type

where
clr.MPI_ID_TYPE  IN
(163)
AND
clr.MPI_ID IN
(190,
191,
195,
291,
292,
293,
355,
368,
379,
389,
392,
842
)
order by mpi_id asc

select * from drg_reimbursement@clrprod where drg_id = 4597;

select * from CLARITY_DRG_MPI_ID@clrprod where drg_id = 4597;

select * from identity_id_type@clrprod where id_ini_c = 80

select * from CLARITY_DRG@clrprod where drg_id = 4597

select * from HSP_ACCOUNT@clrprod where hsp_account_id=1401054753;

select * from HSP_ACCT_MULT_DRGS@clrprod where hsp_account_id=1401054753;

/* Linking HSP_ACCT_MULT_DRGS to DRG tables in SQL: */
from HSP_ACCT_MULT_DRGS hamd
left outer join CLARITY_DRG_MPI_ID cdmi
on hamd.DRG_ID = cdmi.DRG_ID
and hamd.DRG_ID_TYPE_ID = cdmi.MPI_ID_TYPE
left outer join CLARITY_DRG cd
on hamd.DRG_ID = cd.DRG_ID;

/* Linking HSP_ACCOUNT to DRG tables in SQL: */
from HSP_ACCOUNT ha
left outer join CLARITY_DRG_MPI_ID cdmi
on ha.FINAL_DRG_ID = cdmi.DRG_ID
and ha.BILL_DRG_IDTYPE_ID = cdmi.MPI_ID_TYPE
left outer join CLARITY_DRG cd
on ha.FINAL_DRG_ID = cd.DRG_ID;

select * from zc_soi_rom@clrprod;