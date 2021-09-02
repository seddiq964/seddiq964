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