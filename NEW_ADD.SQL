ALTER TABLE BOX_CUR 
ADD (BOX_CUR_USE NUMBER(1) );

ALTER TABLE BOX_CUR 
ADD (STP_CUR NUMBER(1) );

ALTER TABLE BOX_CUR 
ADD (MAX_VAL_BAL NUMBER );

ALTER TABLE BOX_CUR 
ADD (MIN_VAL_BAL NUMBER );

ALTER TABLE BOX_CUR 
ADD (MAX_VAL_PRCS NUMBER );

ALTER TABLE BOX_CUR 
ADD (MIN_VAL_PRCS NUMBER );

CREATE VIEW BOX_CUR_V
AS SELECT
    box_cur.box_cur_use,
    box_cur.boxno,
    box_cur.curno,
    box.box_name,
    box.acc_no,
    curuncy.curname,
    curuncy.cursysmbol
FROM
    box
    INNER JOIN box_cur ON box.boxno = box_cur.boxno
    INNER JOIN curuncy ON box_cur.curno = curuncy.curno
where
    box_cur.box_cur_use=1;

ALTER TABLE BNK_CUR 
ADD (BOX_CUR_USE NUMBER(1) );

ALTER TABLE BNK_CUR 
ADD (STP_CUR NUMBER(1) );

ALTER TABLE BNK_CUR 
ADD (MAX_VAL_BAL NUMBER );

ALTER TABLE BNK_CUR 
ADD (MIN_VAL_BAL NUMBER );

ALTER TABLE BNK_CUR 
ADD (MAX_VAL_PRCS NUMBER );

ALTER TABLE BNK_CUR 
ADD (MIN_VAL_PRCS NUMBER );


CREATE VIEW BNK_CUR_V
AS SELECT
    BNK_CUR.BOX_CUR_use,
    BNK_CUR.BNK_NO,
    BNK_CUR.cur_no,
    BNK.BNK_name,
     BNK.acc_no,
    curuncy.curname,
    curuncy.cursysmbol
FROM
    BNK
    INNER JOIN BNK_CUR ON BNK_CUR.BNK_NO = BNK_CUR.BNK_NO
    INNER JOIN curuncy ON BNK_CUR.cur_no = curuncy.curno
    AND BNK_CUR.BOX_CUR_use=1;


CREATE TABLE SRF_REQUEST 
(
  SNDNO NUMBER NOT NULL 
, SDATE DATE 
, AMOUNT NUMBER 
, DESCRIP VARCHAR2(200 BYTE) 
, FLAG NUMBER 
, BOXNO NUMBER 
, TYPE NUMBER 
, WAIT NUMBER 
, BNK_NO NUMBER 
, AMOUNT_GL NUMBER 
, CR_VAL NUMBER 
, CUR_TYPE NUMBER 
, CURNO NUMBER 
, DURI NUMBER 
, CHEQ_NO VARCHAR2(50 BYTE) 
, CHEQ_DATE DATE 
, REF_NO VARCHAR2(50 BYTE) 
, CENTER_COST NUMBER 
, INPUT_REC VARCHAR2(50 BYTE) 
, INPUT_DATE VARCHAR2(50 BYTE) 
, LAST_UPD VARCHAR2(50 BYTE) 
, UPD_REC VARCHAR2(50 BYTE) 
, NUM_PRINT NUMBER 
, NUM_UPD NUMBER 
, PRINT_CNT NUMBER 
, RECEPT VARCHAR2(200 BYTE) 
, INCLUDE_CNT VARCHAR2(50 BYTE) 
, CHEQ_EST_DATE DATE 
, V_POST NUMBER(1, 0) DEFAULT 0 
, V_REVIEW NUMBER(1, 0) DEFAULT 0 
, TR_ID NUMBER 
, SHOW_ID NUMBER 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 131072 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

CREATE UNIQUE INDEX SRF_REQUEST_BRW_U2 ON SRF_REQUEST (SNDNO ASC) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
INITRANS 2 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOPARALLEL;

ALTER TABLE SRF_REQUEST
ADD CONSTRAINT SRF_REQUEST_BRW_U2 UNIQUE 
(
  SNDNO 
)
ENABLE;

CREATE TABLE SRF_REQUEST_D 
(
  SNDNO NUMBER NOT NULL 
, AMOUN_M NUMBER 
, DESCRIP VARCHAR2(200 BYTE) 
, CR_VAL NUMBER 
, FLAG NUMBER 
, NO NUMBER NOT NULL 
, AMOUNT_GL NUMBER 
, CUR_TYPE NUMBER 
, CURNO NUMBER 
, DURI NUMBER 
, AC_NAME VARCHAR2(50 BYTE) 
, WAIT NUMBER 
, CENTER_COST NUMBER 
, TR_ID NUMBER 
, ROW_ID NUMBER 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 196608 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE SRF_REQUEST_D
ADD CONSTRAINT SRF_REQUEST_D_FK1 FOREIGN KEY
(
  SNDNO 
)
REFERENCES SRF_REQUEST
(
  SNDNO 
)
ENABLE;

ALTER TABLE GL_VAR 
ADD (KAP_SEQ_TP NUMBER );

ALTER TABLE GL_VAR 
ADD (SRF_SEQ_TP NUMBER );

ALTER TABLE DETAIL2  
MODIFY (DESCRIP VARCHAR2(1000 BYTE) );
ALTER TABLE KAP  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );
ALTER TABLE KAP_D  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );
ALTER TABLE SRF  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );
ALTER TABLE SRF_D  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );

ALTER TABLE SRF_D  
MODIFY (AC_NAME VARCHAR2(200 BYTE) );
ALTER TABLE SRF_REQUEST  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );
ALTER TABLE SRF_REQUEST_D  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );
ALTER TABLE DAY_QID  
MODIFY (DESCRIPE VARCHAR2(800 BYTE) );
ALTER TABLE DAY_QID_D  
MODIFY (DESCRIP VARCHAR2(800 BYTE) );

CREATE TABLE BACK_UP 
(
  B_ID NUMBER 
, B_USER VARCHAR2(200) 
, B_DATE DATE 
, B_BRUNCH NUMBER 
, B_YEAR NUMBER 
, B_FILE_NAME VARCHAR2(200) 
, B_DATE_TIME VARCHAR2(100) 
);

CREATE TABLE DESCRIP_ENCODING 
(
  EN_ID NUMBER 
, EN_DESCRIP VARCHAR2(800 BYTE) 
, EN_TYPE NUMBER 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

-------11/10/2020
ALTER TABLE SRF 
ADD (ACC_NO NUMBER );
-------13/10
ALTER TABLE CENTER_COST  
MODIFY (INPUT_DATE VARCHAR2(50) );

ALTER TABLE CENTER_COST  
MODIFY (LAST_UPD VARCHAR2(50) );

ALTER TABLE ESHAR_D  
MODIFY (INPUT_DATE VARCHAR2(50) );

ALTER TABLE ESHAR_D  
MODIFY (LAST_UPD VARCHAR2(50) );

ALTER TABLE ESHAR_M  
MODIFY (INPUT_DATE VARCHAR2(50) );

ALTER TABLE ESHAR_M  
MODIFY (LAST_UPD VARCHAR2(50) );
--------14/10
ALTER TABLE KAP 
ADD (ACC_NO NUMBER );

ALTER TABLE KAP 
ADD (BRUNCH NUMBER );

ALTER TABLE KAP_D 
ADD (BRUNCH NUMBER );
ALTER TABLE KAP_D  
MODIFY (BRUNCH DEFAULT 1 );
---------15/10
ALTER TABLE DAY_QID_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE DAY_QID 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SRF 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SRF_D 
ADD (BRUNCH NUMBER DEFAULT 1 );

	CREATE TABLE SIG 
(
  S_ID NUMBER NOT NULL 
, DOC_TP NUMBER 
, WIND_ID NUMBER NOT NULL 
, DOC_TYPE NUMBER 
, S_NAME VARCHAR2(100 BYTE) 
, ENG_NAME VARCHAR2(100 BYTE) 
, SIG1 VARCHAR2(100 BYTE) 
, SIG2 VARCHAR2(100 BYTE) 
, SIG3 VARCHAR2(100 BYTE) 
, SIG4 VARCHAR2(100 BYTE) 
, SIG5 VARCHAR2(100 BYTE) 
, SIG6 VARCHAR2(100 BYTE) 
, CONSTRAINT SIG_PK PRIMARY KEY 
  (
    WIND_ID 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX SIG_PK1 ON SIG (WIND_ID ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;
-----18/10
ALTER TABLE SEL_INFOICE 
ADD (BRUNCH NUMBER );
ALTER TABLE SEL_INFOICE_R 
ADD (BRUNCH NUMBER );

ALTER TABLE SEL_INFOICE_tmp 
ADD (BRUNCH NUMBER );
ALTER TABLE SEL_INFOICE_Rtmp 
ADD (BRUNCH NUMBER );

ALTER TABLE DAY_QID MODIFY (AMOUNT NUMBER);
------20/10
CREATE VIEW DUP_CUR_V
AS SELECT 
    no,count(curno) v_count
FROM 
    genral2_cur
     group by 
     no
     having 
     count(curno)>3;
------------25/10
CREATE or replace VIEW DALIL_PRV_V
AS SELECT
    account_prv.no,
    account_prv.userno,
    account_prv.show,
    account_prv.curno,
    genral2.ename,
    genral2.acc_class,
    curuncy.cursysmbol
FROM
    account_prv,
    genral2,
    curuncy
WHERE
    account_prv.no = genral2.no
AND
    curuncy.curno = account_prv.curno
AND
    account_prv.show = 1
AND
    account_prv.curno IN (
        SELECT
            genral2_cur.curno
        FROM
            genral2_cur
        WHERE
            genral2_cur.no = account_prv.no
        AND
            genral2_cur.cur_use = 1
    )
ORDER BY 1 WITH READ ONLY;
-------------
CREATE OR REPLACE FORCE VIEW V_DALIL
AS SELECT
    genral2.no,
    genral2.ename,
    genral2.acc_class,
    genral2_cur.curno,
    curuncy.cursysmbol
FROM
    genral2
    INNER JOIN genral2_cur ON genral2_cur.no = genral2.no
    INNER JOIN curuncy ON curuncy.curno = genral2_cur.curno
WHERE
    genral2.type = 2 and 
    genral2_cur.CUR_USE=1
ORDER BY
    genral2.ord_id,
    1,
   4 WITH READ ONLY;

-----------26/10/2020
ALTER TABLE BUY_VAR 
ADD (REPEAT_ITEM NUMBER );


-----28/11/2020
CREATE OR REPLACE FORCE VIEW V$ACCOUNT_AGE
AS select "NO","CURNO","1","2","3","4","5","6","7","8","9","10","11","12" from 
(
select no,curno ,madeen ,daeen,EXTRACT(month from sdate) as tr_mon from detail2)
pivot
(
sum(nvl(madeen,0)-nvl(daeen,0))
for tr_mon in(1,2,3,4,5,6,7,8,9,10,11,12)
)
order by no;

----------
CREATE OR REPLACE FORCE VIEW BAL_TR_V
AS SELECT 
    DETAIL2.NO,
    DETAIL2.CURNO,
    0 s_f_loc,
    0 s_f_gl,
    SUM(detail2.madeen) S_MADEEN,
    SUM(detail2.daeen)S_DAEEN,
    SUM(detail2.madeen_gl)S_MADEEN_GL,
    SUM(detail2.daeen_gl)S_DAEEN_GL,
    SUM(NVL(detail2.madeen,0)-NVL(detail2.daeen,0)) BAL_LOC,
    SUM(NVL(detail2.madeen_gL,0)-NVL(detail2.daeen_gl,0))BAL_GL,
    2 AS V_TYPE
    FROM 
    DETAIL2
    GROUP BY DETAIL2.NO,
    DETAIL2.CURNO
    UNION ALL
    SELECT
    frist_acc.no NO,
    frist_acc.curno,
    SUM(nvl(frist_acc.frist_ac_m,0) -  nvl(frist_acc.frist_ac_d,0)) ,
   SUM(nvl(frist_acc.frist_m_gl,0) - nvl(frist_acc.frist_d_gl,0)),
   
     0    ,
     0,
     0,
     0,
    SUM(NVL(frist_acc.frist_ac_m,0)-NVL(frist_acc.frist_ac_d,0)) AS BAL_LOC,
    SUM(NVL(frist_acc.frist_m_gl,0)-NVL(frist_acc.frist_d_gl,0)) AS BAL_GL,1 AS V_TYPE
   
FROM
    frist_acc
    GROUP BY 
    frist_acc.no,
    frist_acc.curno;

------------------------------------------
CREATE OR REPLACE FORCE VIEW V$ACC_BALANCE
AS select 
NO ,
CURNO ,
SUM(S_F_LOC)      TOT_F_LOC,
SUM(S_F_GL)      TOT_F_GL,
SUM(S_MADEEN)     TOT_MADEEN    ,
SUM(S_DAEEN     )   TOT_DAEEN  ,
SUM(S_MADEEN_GL  )   TOT_M_GL ,
SUM(S_DAEEN_GL     ) TOT_D_GL ,
SUM(BAL_LOC      )   TOT_BAL_LOC ,
SUM(BAL_GL        )  TOT_BAL_GL
FROM 
BAL_TR_V 
GROUP BY 
NO, CURNO;
------------01/12/2020
CREATE OR REPLACE FORCE VIEW V$MED_COST
AS SELECT
    itemno,
     bino,
     count(*) v_count ,
    sum(buy_price*count)/sum(count) med_cost
    
FROM
    buy_infoice_r
    GROUP BY itemno,bino
    order by bino;
	-------------12/12/2020
	CREATE OR REPLACE FORCE VIEW BUY_PRICE_V
AS SELECT COUNT_DTL.ITEMNO,COUNT_DTL.TYPE,COUNT_DTL.DCO_NO,COUNT_DTL.NOW_PRICE,COUNT_DTL.DOC_NAME
    ,COUNT_DTL.SDATE,ROUND(COUNT_DTL.BUY_PRICE/COUNT_DTL.SIZE1,2) BUY_PRICE ,COUNT_DTL.CURNO,COUNT_DTL.CUR_VAL,COUNT_DTL.tr_id
FROM 
    
COUNT_DTL
WHERE TYPE IN(3,422)
ORDER BY SDATE DESC WITH READ ONLY;

-----------
CREATE OR REPLACE FORCE VIEW ITEM_LOV
AS SELECT 
    ITEMNO,ITNAME,round(COST_PRICE,2) cost_price,SEL_PRICE,GRONO 
FROM 
    ITEM_Q;
	
drop table "BUY_INV_OLD_YER" ;
	
	
	CREATE OR REPLACE  SYNONYM BUY_INV_OLD_YER  for  BUY_INFOICE_R;
	CREATE OR REPLACE  SYNONYM INV_OLD_YER  for BUY_INFOICE;
	---------------04/02/2021
CREATE OR REPLACE FORCE VIEW V$ITEM_B
AS SELECT ITEMNO,ITNAME,SEL_PRICE,ITEMNO V_ITEMNO  FROM ITEM_Q 
UNION ALL

SELECT
    item_barcode.it_bar,
    item_q.itname,
    item_q.sel_price,
    item_barcode.ITEMNO
FROM
    item_barcode
    INNER JOIN item_q ON item_q.itemno = item_barcode.itemno
    
    ORDER BY 1;

	-----11/03/2021
ALTER TABLE BRUNCH  
MODIFY (BRNAME VARCHAR2(100 BYTE) );

ALTER TABLE BRUNCH  
MODIFY (ADRESS VARCHAR2(100 BYTE) );

ALTER TABLE BRUNCH  
MODIFY (TEL VARCHAR2(50) );

ALTER TABLE BRUNCH  
MODIFY (FAX VARCHAR2(50) );

ALTER TABLE BRUNCH  
MODIFY (E_MIAL VARCHAR2(100 BYTE) );

ALTER TABLE BRUNCH  
MODIFY (MOBILE VARCHAR2(100) );

ALTER TABLE STORE 
ADD (BRUCH NUMBER );

ALTER TABLE DETAIL2 
ADD (BRUNCH NUMBER );
ALTER TABLE DETAIL2  
MODIFY (BRUNCH DEFAULT 1 );

ALTER TABLE SEL_INFOICE_RTMP 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE SEL_INFOICE_TMP 
ADD (BRUNCH NUMBER DEFAULT 1 );

CREATE OR REPLACE FORCE VIEW V_POST_BY_GROUP
AS SELECT
    sel_infoice.sel_no,
    sel_infoice.sdate,
    SUM(
            sel_infoice_r.count
        *
            sel_infoice_r.sel_price
    ) AS sel_total,
    SUM(
            sel_infoice_r.count
        *
            sel_infoice_r.cost_price
              *sel_infoice_r.size1
    ) AS cost_total,
    SUM(
            sel_infoice_r.bouns
        *
            sel_infoice_r.cost_price
    ) AS g_bouns,
    SUM(
            sel_infoice_r.count
        *
            (
                        sel_infoice_r.sel_price
                    *
                        nvl(sel_infoice_r.descount,0)
                /
                    100
            )
    ) AS g_desc,
    sel_infoice_r.grono,
    sel_infoice.descount,
    sel_infoice.curuncy,
    sel_infoice.boxno,
    sel_infoice.cheq_no,
    sel_infoice.bnk_no,
    sel_infoice.cosno,
    sel_infoice.costname,
    sel_infoice.descrip,
    sel_infoice.type,
    sel_infoice.cr_val,
    sel_infoice.cost_bouns,
    sel_infoice.cur_type,
    sel_infoice.center_cost,
    sel_infoice.price_level,
    sel_infoice.v_store,
    sel_infoice.st_cur_val,
    sel_infoice.v_id,
    sel_infoice.loc_id,
    sel_infoice.comm_cnt,
    sel_infoice.musl_no,
    sel_infoice.cheq_date,
    sel_infoice.acc_no,
    sel_infoice.total,
    sel_infoice.TR_ID,
    sel_infoice.BRUNCH
FROM
    sel_infoice,
    sel_infoice_r
WHERE
    sel_infoice_r.sel_no = sel_infoice.sel_no
GROUP BY
    sel_infoice.sel_no,
    sel_infoice.sdate,
    sel_infoice_r.grono,
    sel_infoice.descount,
    sel_infoice.curuncy,
    sel_infoice.boxno,
    sel_infoice.cheq_no,
    sel_infoice.bnk_no,
    sel_infoice.cosno,
    sel_infoice.costname,
    sel_infoice.descrip,
    sel_infoice.type,
    sel_infoice.cr_val,
    sel_infoice.cost_bouns,
    sel_infoice.cur_type,
    sel_infoice.center_cost,
    sel_infoice.price_level,
    sel_infoice.v_store,
    sel_infoice.st_cur_val,
    sel_infoice.v_id,
    sel_infoice.loc_id,
    sel_infoice.comm_cnt,
    sel_infoice.musl_no,
    sel_infoice.cheq_date,
    sel_infoice.acc_no,
    sel_infoice.total,
    sel_infoice.TR_ID,
    sel_infoice.BRUNCH;
----------------
CREATE OR REPLACE FORCE VIEW V_SEL_BY_STORE
AS SELECT
    sel_infoice.sel_no,
    sel_infoice.sdate,
    SUM(
            sel_infoice_r.count
        *
            sel_infoice_r.sel_price
    ) AS sel_total,
    SUM(
            sel_infoice_r.count
        *
            sel_infoice_r.cost_price*  sel_infoice_r.size1
    ) AS cost_total,
    SUM(
            sel_infoice_r.bouns
        *
            sel_infoice_r.cost_price
    ) AS g_bouns,
    SUM(
            sel_infoice_r.count
        *
            (
                        sel_infoice_r.sel_price
                    *
                        nvl(sel_infoice_r.descount,0)
                /
                    100
            )
    ) AS g_desc,
    sel_infoice_r.STONO,
    sel_infoice.descount,
    sel_infoice.curuncy,
    sel_infoice.boxno,
    sel_infoice.cheq_no,
    sel_infoice.bnk_no,
    sel_infoice.cosno,
    sel_infoice.costname,
    sel_infoice.descrip,
    sel_infoice.type,
    sel_infoice.cr_val,
    sel_infoice.cost_bouns,
    sel_infoice.cur_type,
    sel_infoice.center_cost,
    sel_infoice.price_level,
    sel_infoice.v_store,
    sel_infoice.st_cur_val,
    sel_infoice.v_id,
    sel_infoice.loc_id,
    sel_infoice.comm_cnt,
    sel_infoice.musl_no,
    sel_infoice.cheq_date,
    sel_infoice.acc_no,
    sel_infoice.total,
     sel_infoice.TR_ID,
      sel_infoice.BRUNCH
FROM
    sel_infoice,
    sel_infoice_r
WHERE
    sel_infoice_r.sel_no = sel_infoice.sel_no
GROUP BY
    sel_infoice.sel_no,
    sel_infoice.sdate,
    sel_infoice_r.stono,
    sel_infoice.descount,
    sel_infoice.curuncy,
    sel_infoice.boxno,
    sel_infoice.cheq_no,
    sel_infoice.bnk_no,
    sel_infoice.cosno,
    sel_infoice.costname,
    sel_infoice.descrip,
    sel_infoice.type,
    sel_infoice.cr_val,
    sel_infoice.cost_bouns,
    sel_infoice.cur_type,
    sel_infoice.center_cost,
    sel_infoice.price_level,
    sel_infoice.v_store,
    sel_infoice.st_cur_val,
    sel_infoice.v_id,
    sel_infoice.loc_id,
    sel_infoice.comm_cnt,
    sel_infoice.musl_no,
    sel_infoice.cheq_date,
    sel_infoice.acc_no,
    sel_infoice.total,
     sel_infoice.TR_ID,
      sel_infoice.BRUNCH;

------------
ALTER TABLE BUY_INFOICE 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE BUY_INFOICE_R 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE BUY_INFOICE_RET 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE BUY_INFOICE_RET_R 
ADD (BRUNCH NUMBER DEFAULT 1 );
-----------
CREATE OR REPLACE FORCE VIEW V_BUY_GROUP
AS SELECT
    buy_infoice.bino,
    buy_infoice_r.grono,
    SUM(
            buy_infoice_r.buy_price
        *
            buy_infoice_r.count
    ) AS g_total,
    SUM(
            buy_infoice_r.buy_price
        *
            buy_infoice_r.bouns
    ) AS g_bouns,
    SUM(
            buy_infoice_r.count
        *
            (
                        buy_infoice_r.buy_price
                    *
                        nvl(buy_infoice_r.des,0)
                /
                    100
            )
    ) AS g_desc,
       SUM(
            buy_infoice_r.count
        *
            (
                        buy_infoice_r.buy_price
                    *
                        nvl(buy_infoice_r.TAX1,0)
                /
                    100
            )
    ) AS g_TAX,
    SUM(BUY_INFOICE_R.DOZN_PRICE) AS G_ABBA,
    buy_infoice.bidate,
    buy_infoice.descount,
    buy_infoice.total,
    buy_infoice.descrip,
    buy_infoice.des,
    buy_infoice.final_total,
    buy_infoice.abaa,
    buy_infoice.cur_no,
    buy_infoice.boxno,
    buy_infoice.acc_no,
    buy_infoice.bnk_no,
    buy_infoice.cheq_no,
    buy_infoice.cheq_date,
    buy_infoice.cr_val,
    buy_infoice.cur_type,
    buy_infoice.acc_name,
    buy_infoice.cost_bouns,
    buy_infoice.center_cost,
    buy_infoice.abaa_acc,
    buy_infoice.v_store,
     buy_infoice.ST_CUR_VAL,
      buy_infoice.TYPE,
       buy_infoice.TR_ID,
        buy_infoice.BRUNCH
FROM
    buy_infoice
    INNER JOIN buy_infoice_r ON buy_infoice.bino = buy_infoice_r.bino
GROUP BY
    buy_infoice.bino,
    buy_infoice_r.grono,
    buy_infoice.bidate,
    buy_infoice.descount,
    buy_infoice.total,
    buy_infoice.descrip,
    buy_infoice.des,
    buy_infoice.final_total,
    buy_infoice.abaa,
    buy_infoice.cur_no,
    buy_infoice.boxno,
    buy_infoice.acc_no,
    buy_infoice.bnk_no,
    buy_infoice.cheq_no,
    buy_infoice.cheq_date,
    buy_infoice.cr_val,
    buy_infoice.cur_type,
    buy_infoice.acc_name,
    buy_infoice.cost_bouns,
    buy_infoice.center_cost,
    buy_infoice.abaa_acc,
    buy_infoice.v_store,
    buy_infoice.ST_CUR_VAL,
     buy_infoice.TYPE,
     buy_infoice.TR_ID,
     buy_infoice.BRUNCH;

-------------
CREATE OR REPLACE FORCE VIEW V_BUY_STORE
AS SELECT
    buy_infoice.bino,
    buy_infoice_r.stono,
    SUM(
            buy_infoice_r.buy_price
        *
            buy_infoice_r.count
    ) AS g_total,
    SUM(
            buy_infoice_r.buy_price
        *
            buy_infoice_r.bouns
    ) AS g_bouns,
    SUM(
            buy_infoice_r.count
        *
            (
                        buy_infoice_r.buy_price
                    *
                        nvl(buy_infoice_r.des,0)
                /
                    100
            )
    ) AS g_desc,
       SUM(
            buy_infoice_r.count
        *
            (
                        buy_infoice_r.buy_price
                    *
                        nvl(buy_infoice_r.TAX1,0)
                /
                    100
            )
    ) AS g_TAX,
     SUM(BUY_INFOICE_R.DOZN_PRICE) AS G_ABBA,
    buy_infoice.bidate,
    buy_infoice.descount,
    buy_infoice.total,
    buy_infoice.descrip,
    buy_infoice.des,
    buy_infoice.final_total,
    buy_infoice.abaa,
    buy_infoice.cur_no,
    buy_infoice.boxno,
    buy_infoice.acc_no,
    buy_infoice.bnk_no,
    buy_infoice.cheq_no,
    buy_infoice.cheq_date,
    buy_infoice.cr_val,
    buy_infoice.cur_type,
    buy_infoice.acc_name,
    buy_infoice.cost_bouns,
    buy_infoice.center_cost,
    buy_infoice.abaa_acc,
    buy_infoice.v_store,
    buy_infoice.ST_CUR_VAL,
     buy_infoice.TR_ID,
     buy_infoice.BRUNCH
FROM
    buy_infoice
    INNER JOIN buy_infoice_r ON buy_infoice.bino = buy_infoice_r.bino
GROUP BY
    buy_infoice.bino,
    buy_infoice_r.stono,
    buy_infoice.bidate,
    buy_infoice.descount,
    buy_infoice.total,
    buy_infoice.descrip,
    buy_infoice.des,
    buy_infoice.final_total,
    buy_infoice.abaa,
    buy_infoice.cur_no,
    buy_infoice.boxno,
    buy_infoice.acc_no,
    buy_infoice.bnk_no,
    buy_infoice.cheq_no,
    buy_infoice.cheq_date,
    buy_infoice.cr_val,
    buy_infoice.cur_type,
    buy_infoice.acc_name,
    buy_infoice.cost_bouns,
    buy_infoice.center_cost,
    buy_infoice.abaa_acc,
    buy_infoice.v_store,
     buy_infoice.ST_CUR_VAL,
      buy_infoice.TR_ID,
       buy_infoice.BRUNCH;

------------
CREATE OR REPLACE FORCE VIEW V_BUY_RET_GROUP
AS SELECT
    buy_infoice_ret.birno,
    buy_infoice_ret_r.grono,
    SUM(
            buy_infoice_ret_r.buy_price
        *
            buy_infoice_ret_r.count
    ) AS g_total,
    SUM(
            buy_infoice_ret_r.new_cost
        *
            buy_infoice_ret_r.bouns
    ) AS g_bouns,
    SUM(
            buy_infoice_ret_r.count
        *
            (
                        buy_infoice_ret_r.buy_price
                    *
                        nvl(buy_infoice_ret_r.des,0)
                /
                    100
            )
    ) AS g_desc,
    SUM( buy_infoice_ret_R.NEW_COST *  buy_infoice_ret_R.COUNT * buy_infoice_ret_R.SIZE1)
    AS REAL_COST,
    buy_infoice_ret.birdate,
    buy_infoice_ret.descount,
    buy_infoice_ret.total,
    buy_infoice_ret.descrip,
    buy_infoice_ret.supno,
    buy_infoice_ret.cheq_no,
    buy_infoice_ret.acc_no,
    buy_infoice_ret.bnk_no,
    buy_infoice_ret.boxno,
    buy_infoice_ret.cur_no,
    buy_infoice_ret.cur_type,
    buy_infoice_ret.cr_val,
    buy_infoice_ret.final_total,
    buy_infoice_ret.total_by_cost,
    buy_infoice_ret.cost_bouns,
    buy_infoice_ret.center_cost,
    buy_infoice_ret.v_store,
    buy_infoice_ret.acc_name,
     buy_infoice_ret.TYPE,
      buy_infoice_ret.ST_CUR_VAL,
       buy_infoice_ret.TR_ID,
        buy_infoice_ret.BRUNCH
FROM
    buy_infoice_ret_r
    INNER JOIN buy_infoice_ret ON buy_infoice_ret.birno = buy_infoice_ret_r.birno
GROUP BY
    buy_infoice_ret.birno,
    buy_infoice_ret_r.grono,
    buy_infoice_ret.birdate,
    buy_infoice_ret.descount,
    buy_infoice_ret.total,
    buy_infoice_ret.descrip,
    buy_infoice_ret.supno,
    buy_infoice_ret.cheq_no,
    buy_infoice_ret.acc_no,
    buy_infoice_ret.bnk_no,
    buy_infoice_ret.boxno,
    buy_infoice_ret.cur_no,
    buy_infoice_ret.cur_type,
    buy_infoice_ret.cr_val,
    buy_infoice_ret.final_total,
    buy_infoice_ret.total_by_cost,
    buy_infoice_ret.cost_bouns,
    buy_infoice_ret.center_cost,
    buy_infoice_ret.v_store,
    buy_infoice_ret.acc_name,
     buy_infoice_ret.TYPE,
      buy_infoice_ret.ST_CUR_VAL,
      buy_infoice_ret.TR_ID,
       buy_infoice_ret.BRUNCH;

-------------------
CREATE OR REPLACE FORCE VIEW V_BUY_RET_STORE
AS SELECT
    buy_infoice_ret.birno,
    buy_infoice_ret_r.stono,
    SUM(
            buy_infoice_ret_r.buy_price
        *
            buy_infoice_ret_r.count
    ) AS g_total,
    SUM(
            buy_infoice_ret_r.new_cost
        *
            buy_infoice_ret_r.bouns
    ) AS g_bouns,
    SUM(
            buy_infoice_ret_r.count
        *
            (
                        buy_infoice_ret_r.buy_price
                    *
                        nvl(buy_infoice_ret_r.des,0)
                /
                    100
            )
    ) AS g_desc,
    SUM( buy_infoice_ret_R.NEW_COST *  buy_infoice_ret_R.COUNT * buy_infoice_ret_R.SIZE1)
    AS REAL_COST,
    buy_infoice_ret.birdate,
    buy_infoice_ret.descount,
    buy_infoice_ret.total,
    buy_infoice_ret.descrip,
    buy_infoice_ret.supno,
    buy_infoice_ret.cheq_no,
    buy_infoice_ret.acc_no,
    buy_infoice_ret.bnk_no,
    buy_infoice_ret.boxno,
    buy_infoice_ret.cur_no,
    buy_infoice_ret.cur_type,
    buy_infoice_ret.cr_val,
    buy_infoice_ret.final_total,
    buy_infoice_ret.total_by_cost,
    buy_infoice_ret.cost_bouns,
    buy_infoice_ret.center_cost,
    buy_infoice_ret.v_store,
    buy_infoice_ret.acc_name,
     buy_infoice_reT.TYPE,
      buy_infoice_reT.ST_CUR_VAL,
       buy_infoice_reT.TR_ID,
       buy_infoice_reT.BRUNCH
FROM
    buy_infoice_ret_r
    INNER JOIN buy_infoice_ret ON buy_infoice_ret.birno = buy_infoice_ret_r.birno
GROUP BY
    buy_infoice_ret.birno,
    buy_infoice_ret_r.stono,
    buy_infoice_ret.birdate,
    buy_infoice_ret.descount,
    buy_infoice_ret.total,
    buy_infoice_ret.descrip,
    buy_infoice_ret.supno,
    buy_infoice_ret.cheq_no,
    buy_infoice_ret.acc_no,
    buy_infoice_ret.bnk_no,
    buy_infoice_ret.boxno,
    buy_infoice_ret.cur_no,
    buy_infoice_ret.cur_type,
    buy_infoice_ret.cr_val,
    buy_infoice_ret.final_total,
    buy_infoice_ret.total_by_cost,
    buy_infoice_ret.cost_bouns,
    buy_infoice_ret.center_cost,
    buy_infoice_ret.v_store,
    buy_infoice_ret.acc_name,
     buy_infoice_reT.TYPE,
     buy_infoice_reT.ST_CUR_VAL,
      buy_infoice_reT.TR_ID,
      buy_infoice_reT.BRUNCH;
--------------------------
CREATE OR REPLACE FORCE VIEW V_SEL_RET_GROUP
AS SELECT
    sel_infoice_ret.sirno,
    SUM(
            sel_infoice_ret_r.count
        *
            sel_infoice_ret_r.sel_price
    ) AS tot_sel,
    SUM(  sel_infoice_ret_r.count*COST_PRICE) AS TOT_COST ,
    SUM(  sel_infoice_ret_r.BOUNS * COST_PRICE) AS G_BOUNS ,
    SUM(sel_infoice_ret_r.count *
            (sel_infoice_ret_r.sel_price * nvl(sel_infoice_ret_r.des,0) /100
            )) as g_desc ,

    sel_infoice_ret.sirdate,
    sel_infoice_ret.total,
    sel_infoice_ret.type,
    sel_infoice_ret.descount,
    sel_infoice_ret.descrip,
    sel_infoice_ret.cosno,
    sel_infoice_ret.cosname,
    sel_infoice_ret.point,
    sel_infoice_ret.boxno,
    sel_infoice_ret.bnk_no,
    sel_infoice_ret.acc_no,
    sel_infoice_ret.cheq_no,
    sel_infoice_ret.cheq_date,
    sel_infoice_ret.total_cost,
    sel_infoice_ret_r.gro_no,
    sel_infoice_ret.final_total,
    sel_infoice_ret.cost_bouns,
    sel_infoice_ret.cur_type,
    sel_infoice_ret.v_store,
    sel_infoice_ret.center_cost,
    sel_infoice_ret.st_cur_val,
    sel_infoice_ret.curno,
     sel_infoice_ret.cR_VAL,
     sel_infoice_ret.TR_ID,
     sel_infoice_ret.BRUNCH
FROM
    sel_infoice_ret
    INNER JOIN sel_infoice_ret_r ON sel_infoice_ret.sirno = sel_infoice_ret_r.sirno
GROUP BY
    sel_infoice_ret.sirno,
    sel_infoice_ret.sirdate,
    sel_infoice_ret.total,
    sel_infoice_ret.type,
    sel_infoice_ret.descount,
    sel_infoice_ret.descrip,
    sel_infoice_ret.cosno,
    sel_infoice_ret.cosname,
    sel_infoice_ret.point,
    sel_infoice_ret.boxno,
    sel_infoice_ret.bnk_no,
    sel_infoice_ret.acc_no,
    sel_infoice_ret.cheq_no,
    sel_infoice_ret.cheq_date,
    sel_infoice_ret.total_cost,
    sel_infoice_ret_r.gro_no,
    sel_infoice_ret.final_total,
    sel_infoice_ret.cost_bouns,
    sel_infoice_ret.cur_type,
    sel_infoice_ret.v_store,
    sel_infoice_ret.center_cost,
    sel_infoice_ret.st_cur_val,
    sel_infoice_ret.curno,
     sel_infoice_ret.cR_VAL,
     sel_infoice_ret.TR_ID,
     sel_infoice_ret.BRUNCH;

----------------
ALTER TABLE SEL_INFOICE_RET_R 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE SEL_INFOICE_RET
ADD (BRUNCH NUMBER DEFAULT 1 );

CREATE OR REPLACE FORCE VIEW V_SEL_RET_STORE
AS SELECT
    sel_infoice_ret.sirno,
    SUM(
            sel_infoice_ret_r.count
        *
            sel_infoice_ret_r.sel_price
    ) AS tot_sel,
    SUM(  sel_infoice_ret_r.count*COST_PRICE) AS TOT_COST ,
    SUM(  sel_infoice_ret_r.BOUNS * COST_PRICE) AS G_BOUNS ,
    SUM(sel_infoice_ret_r.count *
            (sel_infoice_ret_r.sel_price * nvl(sel_infoice_ret_r.des,0) /100
            )) as g_desc ,

    sel_infoice_ret.sirdate,
    sel_infoice_ret.total,
    sel_infoice_ret.type,
    sel_infoice_ret.descount,
    sel_infoice_ret.descrip,
    sel_infoice_ret.cosno,
    sel_infoice_ret.cosname,
    sel_infoice_ret.point,
    sel_infoice_ret.boxno,
    sel_infoice_ret.bnk_no,
    sel_infoice_ret.acc_no,
    sel_infoice_ret.cheq_no,
    sel_infoice_ret.cheq_date,
    sel_infoice_ret.total_cost,
    sel_infoice_ret_r.stono,
    sel_infoice_ret.final_total,
    sel_infoice_ret.cost_bouns,
    sel_infoice_ret.cur_type,
    sel_infoice_ret.v_store,
    sel_infoice_ret.center_cost,
    sel_infoice_ret.st_cur_val,
    sel_infoice_ret.curno,
    sel_infoice_ret.cr_val,
    sel_infoice_ret.TR_ID,
    sel_infoice_ret.BRUNCH
FROM
    sel_infoice_ret
    INNER JOIN sel_infoice_ret_r ON sel_infoice_ret.sirno = sel_infoice_ret_r.sirno
GROUP BY
    sel_infoice_ret.sirno,
    sel_infoice_ret.sirdate,
    sel_infoice_ret.total,
    sel_infoice_ret.type,
    sel_infoice_ret.descount,
    sel_infoice_ret.descrip,
    sel_infoice_ret.cosno,
    sel_infoice_ret.cosname,
    sel_infoice_ret.point,
    sel_infoice_ret.boxno,
    sel_infoice_ret.bnk_no,
    sel_infoice_ret.acc_no,
    sel_infoice_ret.cheq_no,
    sel_infoice_ret.cheq_date,
    sel_infoice_ret.total_cost,
    sel_infoice_ret_r.stono,
    sel_infoice_ret.final_total,
    sel_infoice_ret.cost_bouns,
    sel_infoice_ret.cur_type,
    sel_infoice_ret.v_store,
    sel_infoice_ret.center_cost,
    sel_infoice_ret.st_cur_val,
    sel_infoice_ret.curno,
    sel_infoice_ret.cr_val,
    sel_infoice_ret.TR_ID,
    sel_infoice_ret.BRUNCH;

--------------

CREATE SEQUENCE EST_SEQ INCREMENT BY 1111 MAXVALUE 999999999999999999999999999 MINVALUE 1 CACHE 20;

ALTER TABLE SEL_RET_RTMP 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SEL_RET_TMP 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SETTLE_M 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SETTLE_DTL 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE BUY_ORDER 
ADD (BRUNCH NUMBER );

ALTER TABLE BUY_ORDER  
MODIFY (LAST_UPD VARCHAR2(50) );
ALTER TABLE BUY_ORDER_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE CENTER_COST 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE COST_INFO 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE COST_ORD 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE COST_ORD_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE COUNT_DTL 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE COUNT_DTLTMP 
ALTER TABLE COUNT_JRD 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ESHAR_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ESHAR_D_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ESHAR_M 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ESHAR_M_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE EST 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE FRIST_ACC 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE GENRAL2 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE JRD_M 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ORD_SRF 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE ORD_SRF_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE PRICE_SHOW 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE PRICE_SHOW_R 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE REC_IN 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE REC_OUT 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE REQ_IN_R 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE REQ_OUT_R 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SRF_REQUEST 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SRF_REQUEST_D 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE START_STORE 
ADD (BRUNCH NUMBER DEFAULT 1 );
ALTER TABLE SUP_INFO 
ADD (BRUNCH NUMBER DEFAULT 1 );

drop table "SUP_TERM" ;
drop table "TEL1"  ;
drop table "TEST" ;
drop table "DAY_TR" ;
drop table "DEL" ;
drop table "DEM" cascade constraints;
drop table "DEMO" cascade constraints;
-----------13/03/2021
CREATE OR REPLACE FORCE VIEW POS_RET_GROUP
AS SELECT
    SEL_RET_TMP.sirno,
    SUM(
            SEL_RET_RTMP.count
        *
            SEL_RET_RTMP.sel_price
    ) AS tot_sel,
    SUM(  SEL_RET_RTMP.count*COST_PRICE) AS TOT_COST ,
    SUM(  SEL_RET_RTMP.BOUNS * COST_PRICE) AS G_BOUNS ,
    SUM(SEL_RET_RTMP.count *
            (SEL_RET_RTMP.sel_price * nvl(SEL_RET_RTMP.des,0) /100
            )) as g_desc ,

    SEL_RET_TMP.sirdate,
    SEL_RET_TMP.total,
    SEL_RET_TMP.type,
    SEL_RET_TMP.descount,
    SEL_RET_TMP.descrip,
    SEL_RET_TMP.cosno,
    SEL_RET_TMP.cosname,
    SEL_RET_TMP.point,
    SEL_RET_TMP.boxno,
    SEL_RET_TMP.bnk_no,
    SEL_RET_TMP.acc_no,
    SEL_RET_TMP.cheq_no,
    SEL_RET_TMP.cheq_date,
    SEL_RET_TMP.total_cost,

    SEL_RET_RTMP.GRO_NO,

    SEL_RET_TMP.final_total,
    SEL_RET_TMP.cost_bouns,
    SEL_RET_TMP.cur_type,
    SEL_RET_TMP.v_store,
    SEL_RET_TMP.center_cost,
    SEL_RET_TMP.st_cur_val,
    SEL_RET_TMP.curno,
    SEL_RET_TMP.cr_val,
    SEL_RET_TMP.TR_ID,
     SEL_RET_TMP.BRUNCH
FROM
    SEL_RET_TMP
    INNER JOIN SEL_RET_RTMP ON SEL_RET_TMP.sirno = SEL_RET_RTMP.sirno
GROUP BY
    SEL_RET_TMP.sirno,
    SEL_RET_TMP.sirdate,
    SEL_RET_TMP.total,
    SEL_RET_TMP.type,
    SEL_RET_TMP.descount,
    SEL_RET_TMP.descrip,
    SEL_RET_TMP.cosno,
    SEL_RET_TMP.cosname,
    SEL_RET_TMP.point,
    SEL_RET_TMP.boxno,
    SEL_RET_TMP.bnk_no,
    SEL_RET_TMP.acc_no,
    SEL_RET_TMP.cheq_no,
    SEL_RET_TMP.cheq_date,
    SEL_RET_TMP.total_cost,
   SEL_RET_RTMP.GRO_NO,
    SEL_RET_TMP.final_total,
    SEL_RET_TMP.cost_bouns,
    SEL_RET_TMP.cur_type,
    SEL_RET_TMP.v_store,
    SEL_RET_TMP.center_cost,
    SEL_RET_TMP.st_cur_val,
    SEL_RET_TMP.curno,
    SEL_RET_TMP.cr_val,
    SEL_RET_TMP.TR_ID,
     SEL_RET_TMP.BRUNCH;

CREATE OR REPLACE FORCE VIEW POS_RET_STORE
AS SELECT
    SEL_RET_TMP.sirno,
    SUM(
            SEL_RET_RTMP.count
        *
            SEL_RET_RTMP.sel_price
    ) AS tot_sel,
    SUM(  SEL_RET_RTMP.count*COST_PRICE) AS TOT_COST ,
    SUM(  SEL_RET_RTMP.BOUNS * COST_PRICE) AS G_BOUNS ,
    SUM(SEL_RET_RTMP.count *
            (SEL_RET_RTMP.sel_price * nvl(SEL_RET_RTMP.des,0) /100
            )) as g_desc ,

    SEL_RET_TMP.sirdate,
    SEL_RET_TMP.total,
    SEL_RET_TMP.type,
    SEL_RET_TMP.descount,
    SEL_RET_TMP.descrip,
    SEL_RET_TMP.cosno,
    SEL_RET_TMP.cosname,
    SEL_RET_TMP.point,
    SEL_RET_TMP.boxno,
    SEL_RET_TMP.bnk_no,
    SEL_RET_TMP.acc_no,
    SEL_RET_TMP.cheq_no,
    SEL_RET_TMP.cheq_date,
    SEL_RET_TMP.total_cost,
    SEL_RET_RTMP.stono,
    SEL_RET_TMP.final_total,
    SEL_RET_TMP.cost_bouns,
    SEL_RET_TMP.cur_type,
    SEL_RET_TMP.v_store,
    SEL_RET_TMP.center_cost,
    SEL_RET_TMP.st_cur_val,
    SEL_RET_TMP.curno,
    SEL_RET_TMP.cr_val,
    SEL_RET_TMP.TR_ID,
    SEL_RET_TMP.BRUNCH
FROM
    SEL_RET_TMP
    INNER JOIN SEL_RET_RTMP ON SEL_RET_TMP.sirno = SEL_RET_RTMP.sirno
GROUP BY
    SEL_RET_TMP.sirno,
    SEL_RET_TMP.sirdate,
    SEL_RET_TMP.total,
    SEL_RET_TMP.type,
    SEL_RET_TMP.descount,
    SEL_RET_TMP.descrip,
    SEL_RET_TMP.cosno,
    SEL_RET_TMP.cosname,
    SEL_RET_TMP.point,
    SEL_RET_TMP.boxno,
    SEL_RET_TMP.bnk_no,
    SEL_RET_TMP.acc_no,
    SEL_RET_TMP.cheq_no,
    SEL_RET_TMP.cheq_date,
    SEL_RET_TMP.total_cost,
    SEL_RET_RTMP.stono,
    SEL_RET_TMP.final_total,
    SEL_RET_TMP.cost_bouns,
    SEL_RET_TMP.cur_type,
    SEL_RET_TMP.v_store,
    SEL_RET_TMP.center_cost,
    SEL_RET_TMP.st_cur_val,
    SEL_RET_TMP.curno,
    SEL_RET_TMP.cr_val,
    SEL_RET_TMP.TR_ID,
    SEL_RET_TMP.BRUNCH;

CREATE OR REPLACE FORCE VIEW V_REC_OUT_GROUP
AS SELECT
    req_out_r.grono,
    rec_out.ro_no,
    SUM(
            req_out_r.cost_price
        *
            req_out_r.count
    ) AS g_total,
    SUM( req_out_r.MED_COST *  req_out_r.COUNT) AS REAL_COST,
    rec_out.total,
    rec_out.brnno,
    rec_out.rdate,
    rec_out.acc_no,
    rec_out.req_type,
    rec_out.ref_no,
    rec_out.descrip,
    rec_out.cur_type,
    rec_out.cur_val,
    rec_out.center_cost,
    rec_out.v_store,
    rec_out.total_by_cost,
    rec_out.curno,
    rec_out.st_cur_val,
    rec_out.TR_ID,
     rec_out.BRUNCH
FROM
    req_out_r
    INNER JOIN rec_out ON rec_out.ro_no = req_out_r.ro_no
GROUP BY
    req_out_r.grono,
    rec_out.ro_no,
    rec_out.total,
    rec_out.brnno,
    rec_out.rdate,
    rec_out.acc_no,
    rec_out.req_type,
    rec_out.ref_no,
    rec_out.descrip,
    rec_out.cur_type,
    rec_out.cur_val,
    rec_out.center_cost,
    rec_out.v_store,
    rec_out.total_by_cost,
    rec_out.curno,
    rec_out.st_cur_val,
     rec_out.TR_ID,
     rec_out.BRUNCH;
--------
CREATE OR REPLACE FORCE VIEW V_REC_OUT_STORE
AS SELECT
    req_out_r.STONO,
    rec_out.ro_no,
    SUM(
            req_out_r.cost_price
        *
            req_out_r.count
    ) AS g_total,
     SUM( req_out_r.MED_COST *  req_out_r.COUNT) AS REAL_COST,
    rec_out.total,
    rec_out.brnno,
    rec_out.rdate,
    rec_out.acc_no,
    rec_out.req_type,
    rec_out.ref_no,
    rec_out.descrip,
    rec_out.cur_type,
    rec_out.cur_val,
    rec_out.center_cost,
    rec_out.v_store,
    rec_out.total_by_cost,
    rec_out.curno,
    rec_out.st_cur_val,
    rec_out.TR_ID,
     rec_out.BRUNCH
FROM
    req_out_r
    INNER JOIN rec_out ON rec_out.ro_no = req_out_r.ro_no
GROUP BY
    req_out_r.STONO,
    rec_out.ro_no,
    rec_out.total,
    rec_out.brnno,
    rec_out.rdate,
    rec_out.acc_no,
    rec_out.req_type,
    rec_out.ref_no,
    rec_out.descrip,
    rec_out.cur_type,
    rec_out.cur_val,
    rec_out.center_cost,
    rec_out.v_store,
    rec_out.total_by_cost,
    rec_out.curno,
    rec_out.st_cur_val,
    rec_out.TR_ID,
    Rec_out.BRUNCH;
---------
CREATE OR REPLACE FORCE VIEW V_REC_IN_STORE
AS SELECT
    req_in_r.stono,
    rec_in.ri_no,
    SUM(
            req_in_r.cost_price
        *
            req_in_r.count
    ) AS g_total,
    rec_in.total,
    rec_in.rdate,
    rec_in.acc_no,
    rec_in.ac_name,
    rec_in.req_type,
    rec_in.ref_no,
    rec_in.descrip,
    rec_in.car_no,
    rec_in.car_driver,
    rec_in.cur_val,
    rec_in.cur_type,
    rec_in.center_cost,
    rec_in.st_cur_val,
    rec_in.curno,
    rec_in.est_date,
    rec_in.include_cnt,
    rec_in.tr_id,
    rec_in.BRUNCH
FROM
    rec_in
    INNER JOIN req_in_r ON rec_in.ri_no = req_in_r.ri_no
GROUP BY
    req_in_r.stono,
    rec_in.ri_no,
    rec_in.total,
    rec_in.rdate,
    rec_in.acc_no,
    rec_in.ac_name,
    rec_in.req_type,
    rec_in.ref_no,
    rec_in.descrip,
    rec_in.car_no,
    rec_in.car_driver,
    rec_in.cur_val,
    rec_in.cur_type,
    rec_in.center_cost,
    rec_in.st_cur_val,
    rec_in.curno,
    rec_in.est_date,
    rec_in.include_cnt,
      rec_in.tr_id,
       rec_in.BRUNCH;

--------------
CREATE OR REPLACE FORCE VIEW V_REC_IN_GROUP
AS SELECT
    req_in_r.GRONO,
    rec_in.ri_no,
    SUM(
            req_in_r.cost_price
        *
            req_in_r.count
    ) AS g_total,
    rec_in.total,
    rec_in.rdate,
    rec_in.acc_no,
    rec_in.ac_name,
    rec_in.req_type,
    rec_in.ref_no,
    rec_in.descrip,
    rec_in.car_no,
    rec_in.car_driver,
    rec_in.cur_val,
    rec_in.cur_type,
    rec_in.center_cost,
    rec_in.st_cur_val,
    rec_in.curno,
    rec_in.est_date,
    rec_in.include_cnt,
    REC_IN.TR_ID,
    REC_IN.BRUNCH
FROM
    rec_in
    INNER JOIN req_in_r ON rec_in.ri_no = req_in_r.ri_no
GROUP BY
    req_in_r.grono,
    rec_in.ri_no,
    rec_in.total,
    rec_in.rdate,
    rec_in.acc_no,
    rec_in.ac_name,
    rec_in.req_type,
    rec_in.ref_no,
    rec_in.descrip,
    rec_in.car_no,
    rec_in.car_driver,
    rec_in.cur_val,
    rec_in.cur_type,
    rec_in.center_cost,
    rec_in.st_cur_val,
    rec_in.curno,
    rec_in.est_date,
    rec_in.include_cnt,
    REC_IN.TR_ID,
    REC_IN.BRUNCH;
----------------
CREATE OR REPLACE  SYNONYM SEL_INV_OLD_YER  for   SEL_INFOICE_R;
CREATE OR REPLACE  SYNONYM INV_OLD_YER  for   SEL_INFOICE;
ALTER TABLE TRANCE 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE TRANCE 
ADD (DESCRIPE VARCHAR2(500) );

ALTER TABLE TRANCE 
ADD (COUSES VARCHAR2(500) );

ALTER TABLE TRANCE 
ADD (ACC_NO NUMBER );

ALTER TABLE TRANCE 
ADD (ACC_NAME VARCHAR2(200) );

ALTER TABLE TRANCE 
ADD (TOTAL NUMBER );
ALTER TABLE TRANCE_R 
ADD (BRUNCH NUMBER DEFAULT 1 );

ALTER TABLE TRANCE_R 
ADD (CENTER_COST NUMBER );

ALTER TABLE TRANCE_R 
ADD (DESCRIPE VARCHAR2(500) );
ALTER TABLE TRANCE_R 
ADD (UN VARCHAR2(50) );
ALTER TABLE TRANCE_R 
ADD (TR_ID NUMBER );

ALTER TABLE TRANCE_R 
ADD (ROW_ID NUMBER );
ALTER TABLE STORE 
ADD (BORKER_ACC NUMBER );
ALTER TABLE TRANCE 
ADD (V_POST NUMBER DEFAULT 0 );
ALTER TABLE TRANCE_R 
ADD (V_POST NUMBER DEFAULT 0 );
ALTER TABLE TRANCE 
ADD (USED NUMBER(1) );
ALTER TABLE TRANCE_R 
ADD (USED NUMBER(1) );
ALTER TABLE TRANCE 
ADD (CENTER_COST NUMBER );
ALTER TABLE TRANCE_R 
ADD (GRONO NUMBER );
ALTER TABLE TRANCE 
ADD (TR_ID NUMBER );
ALTER TABLE TRANCE  
MODIFY (INPUT_DATE VARCHAR2(50) );

ALTER TABLE TRANCE  
MODIFY (LAST_UPD VARCHAR2(50) );
ALTER TABLE TRANCE_R 
ADD (V_CNT NUMBER );
CREATE OR REPLACE FORCE VIEW ALL_DOC_V
AS SELECT sel_no,sdate,final_total,acc_no,costname,1 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD  from sel_infoice where nvl(v_post,0)=0
  union all
 SELECT sirno,sirdate,final_total,acc_no,cosname,2 as v_type ,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from sel_infoice_ret where nvl(v_post,0)=0
 union all
 SELECT bino,bidate,final_total,acc_no,acc_name,3 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from buy_infoice where nvl(v_post,0)=0  AND NVL(WAIT,0)=0
 union all
 SELECT birno,birdate,final_total,acc_no,acc_name,4 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from buy_infoice_ret where nvl(v_post,0)=0
 union all
 SELECT ri_no,rdate,total,acc_no,ac_name,422 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from rec_in where nvl(v_post,0)=0
 union all
 SELECT ro_no,rdate,total,acc_no,ac_name,423 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from rec_out where nvl(v_post,0)=0
 union all
 SELECT SNDNO,Sdate,AMOUNT,BOXNO,descrip,7 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from KAP where nvl(v_post,0)=0
 union all
 SELECT SNDNO,Sdate,AMOUNT,BOXNO,descrip,8 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from SRF where nvl(v_post,0)=0 AND NVL(WAIT,0)=0
 union all
 SELECT QID_NO,Sdate,AMOUNT,QID,descripe,12 as v_type,INPUT_REC,INPUT_DATE,UPD_REC,LAST_UPD from DAY_QID where nvl(v_post,0)=0 WITH READ ONLY;
-------17*03/2021
CREATE TABLE TR_RECIVE 
(
  TR_NO NUMBER NOT NULL 
, TDATE DATE 
, TYPE NUMBER 
, NO_SEND NUMBER 
, NO_RECIVE NUMBER 
, FLAG NUMBER 
, INPUT_REC VARCHAR2(50 BYTE) 
, INPUT_DATE VARCHAR2(50 BYTE) 
, LAST_UPD VARCHAR2(50 BYTE) 
, UPD_REC VARCHAR2(50 BYTE) 
, SEQ_ID NUMBER 
, REF_NO VARCHAR2(200 BYTE) 
, BRUNCH NUMBER DEFAULT 1 
, DESCRIPE VARCHAR2(500 BYTE) 
, COUSES VARCHAR2(500 BYTE) 
, ACC_NO NUMBER 
, ACC_NAME VARCHAR2(200 BYTE) 
, TOTAL NUMBER 
, V_POST NUMBER DEFAULT 0 
, CENTER_COST NUMBER 
, TR_ID NUMBER 
, TR_RECIVE_NO NUMBER 
, CONSTRAINT TR_RECIVE_BRW_P1 PRIMARY KEY 
  (
    TR_NO 
  )
  USING INDEX 
  (
      CREATE UNIQUE INDEX TR_RECIVE_BRW_P1 ON TR_RECIVE (TR_NO ASC) 
      LOGGING 
      TABLESPACE SYSTEM 
      PCTFREE 10 
      INITRANS 2 
      STORAGE 
      ( 
        INITIAL 65536 
        MINEXTENTS 1 
        MAXEXTENTS UNLIMITED 
        FREELISTS 1 
        FREELIST GROUPS 1 
        BUFFER_POOL DEFAULT 
      ) 
      NOPARALLEL 
  )
  ENABLE 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;



CREATE TABLE TR_RECIVE_DTL 
(
  TR_NO NUMBER NOT NULL 
, ITEMNO VARCHAR2(50 BYTE) NOT NULL 
, COUNT NUMBER 
, SIZE1 NUMBER 
, COST_PRICE NUMBER 
, FLAG NUMBER 
, ITNAME VARCHAR2(100 BYTE) 
, EXP_DATE DATE 
, BATCH_NO VARCHAR2(50 BYTE) 
, S_N VARCHAR2(50 BYTE) 
, SEQ_ID NUMBER 
, F_STORE NUMBER 
, TO_STORE NUMBER 
, BRUNCH NUMBER DEFAULT 1 
, CENTER_COST NUMBER 
, DESCRIPE VARCHAR2(500 BYTE) 
, UN VARCHAR2(50 BYTE) 
, TR_ID NUMBER 
, ROW_ID NUMBER 
, V_POST NUMBER DEFAULT 0 
, GRONO NUMBER 
, V_CNT NUMBER 
) 
LOGGING 
TABLESPACE SYSTEM 
PCTFREE 10 
PCTUSED 40 
INITRANS 1 
STORAGE 
( 
  INITIAL 65536 
  MINEXTENTS 1 
  MAXEXTENTS UNLIMITED 
  FREELISTS 1 
  FREELIST GROUPS 1 
  BUFFER_POOL DEFAULT 
) 
NOCOMPRESS 
NOPARALLEL;

ALTER TABLE TR_RECIVE_DTL
ADD CONSTRAINT TR_RECIVE_DTL_BRW_F2 FOREIGN KEY
(
  TR_NO 
)
REFERENCES TRANCE
(
  TR_NO 
)
ENABLE;

ALTER TABLE TR_RECIVE_DTL
ADD CONSTRAINT TR_RECIVE_DTL_FK1 FOREIGN KEY
(
  ITEMNO 
)
REFERENCES ITEM_Q
(
  ITEMNO 
)
ENABLE;

ALTER TABLE KAP  
MODIFY (BRUNCH DEFAULT 1 );
ALTER TABLE SETTLE_M 
ADD (TR_ID NUMBER );

ALTER TABLE BRUNCH 
ADD (LOGO_AR VARCHAR2(200) );

ALTER TABLE BRUNCH 
ADD (LOGO_EN VARCHAR2(200) );

ALTER TABLE BRUNCH 
ADD (ADD_AR VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (ADD_EN VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (TEL_AR VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (TEL_EN VARCHAR2(500) );
ALTER TABLE BRUNCH 
ADD (LOGO_PIC BLOB );

CREATE TABLE LOGIN_TAB 
(
  LOG_ID NUMBER 
, YER NUMBER 
, UNIT_NO NUMBER 
, BR NUMBER NOT NULL 
, NOO NUMBER 
, US_NAME VARCHAR2(200) 
, PASSO VARCHAR2(50) 
, SAVE_DATA NUMBER 
);


----------29-06-2021
ALTER TABLE BROKER_ACC 
ADD (BRUNCH NUMBER );

ALTER TABLE BROKER_ACC 
ADD (BRUNCH_ACC NUMBER );

ALTER TABLE BRUNCH 
ADD (ADD_BR_AR VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (ADD_BR_ENG VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (TEL_2_AR VARCHAR2(200) );

ALTER TABLE BRUNCH 
ADD (TEL_2_ENG VARCHAR2(200) );

ALTER TABLE BRUNCH 
ADD (PO_BOX_AR VARCHAR2(500) );

ALTER TABLE BRUNCH 
ADD (PO_BOX_ENG VARCHAR2(500) );

