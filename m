Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C5A2459AFD
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805000; cv=none; b=QRmVX0foScoDWvikxObb9PV6WtpKJGBYQhIzt9q/UBM5O897kju+BoBppj3LCX2DvzAfEYH/2A7+Lno0ef+QWDeVC3fEcwVsAJFfgC81RBZDCSW3u52VGj2or/7Mh9Qws86nDIvL9cSkR5imNchraF9XftbBrvvxPUJVT3lOcS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805000; c=relaxed/simple;
	bh=f8VcdLI2KActax38ApHknkotSO1+Uu/cKdutTSRaDag=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MriWtMBGrHewEr7ADfPmottYRqRw5Yt5V35Ev8gD8J3vdLej8pomjKqdIaggPu11Uj6XeNEDB58XD8Mp4wS+KrI8zvWJPDhiDqcGoK4JyD8WGprry28LsNkjWLvAJjbLMqj3mp0jfrdATBFVZns3rALUgpZ/VYaB4j26OYtjaWE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=DzzRLMDl; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FDS1eiYN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzzRLMDl";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FDS1eiYN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qoqx3388143
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=k6RAvMhjxk+
	Mp8ZblEY6+nZiJl51oQ+wsSEQ7AZLveU=; b=DzzRLMDle7Ck9b6c2ZP7siODVHA
	LahkWL7ERUGX+ACoRyrdW1ytDY0wdN3bvb9+Cj9rOc+yaK2I+FfPGp+a6DQT8Jj5
	d5n+bILiFC9nzkuPXM9rofj05+CqIC+IiE/g07ipZ/HkllOl0rYiSulDFqaEVpKW
	kxIMT+EDltAb5hIFIK1TIQOa1y0CGp1I5Gy64NJOuxovDaS1bRuyCVCdrdhvdFmX
	siA+jmJREN+4pFpKdYDwZ3fU8c0MCHxZQTI0FbCE+H8pkYE9rcf2a024K1nm0jaR
	KPY7sW+qcSPpQUkz4Va+0g1m/Fi6b9rxI9JnRAbYbC7+sUPzrnlu24vWy4w==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fk275ks7c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:09:58 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c110a3b6aso7838981cf.1
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:09:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804997; x=1785409797; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k6RAvMhjxk+Mp8ZblEY6+nZiJl51oQ+wsSEQ7AZLveU=;
        b=FDS1eiYNXgp+0yMM/qk81kZ6rEf+Tkx4BdQJfe9zT4eZcFxCAKgU1iCbKyh/Klqbdx
         lXLzrWjV3sRygiYmvEdlGyQqhQAlA0NWS5fM1cTybDBurCx4ygziwRsPTy41D7nKQee+
         H7mrgC64DJIRjBapnnb8EGi8GDvuXUHEigG5EK2LGW2ZYPI98/V31pX680Vykwma/nLR
         pnVsj+oF4Y7YOKIyvmBYuKIQSaHRQAG1amjq61ocp+v9EUTA5u2LE6vxU0/iJt1TKF1j
         Er7alOaGrfIqIETtk2qgDvrkRI5o7wHp6UZJOEnBryQTu9UPzuIrEm3wnPWBMQk/5Wmk
         P5zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804997; x=1785409797;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k6RAvMhjxk+Mp8ZblEY6+nZiJl51oQ+wsSEQ7AZLveU=;
        b=VT0Cza3aqUtGp7LZYAGvPmTxElHjnhTaCn55t6xJ7e5HqnudCP71do7Tg1Mmh13+u+
         eCwRyJ+fRRIedaV/pNbHB2ML1fZ+/9qs8PJW+jdHgNtqSxmvoAdGP3nLzjBb2NkPOrlb
         Fhin3mH3aQ2cuKxdRsDBSzP7RD3lKGuPb787xKewNkQYOpM5KSC86YKkO/72K1yGfYOh
         WoFpRrMmZZeAVmFjXLfFcAFMO1jDd/62uhu1cuhESYdDvOhZrX4wV6ppNc8Jh6MwdDhR
         zJwYJp3xLbfb+S9QPUVlK691v+OnYgusi3fb0TvDnMLQsdCh980pV/P7NwMFhjpc0m1X
         SN+Q==
X-Forwarded-Encrypted: i=1; AHgh+RpMTpKNWZYJeY9SM7jXRPv1NE5em2OcCKDD8NUnIfxj9WMKvZ7njn5q0j4JL1KN1ARu/WXG3w5618uY+w==@vger.kernel.org
X-Gm-Message-State: AOJu0YyycJfm4emK+vibHosq1jQ/uSeV6AHEU9HXDiJoTjr9S5Xgp+M5
	eNvKsTzqiafRGpgyA159jJzIoM52IvRPJ4G65JurJHC+t3wFAmim23nes2zCCMjDjpmxXq6x6Dn
	UgtEyTeGQ+fo5EhvS5BR/tmo69M+qIC/hGLMj5Aa+SyGcg30UzlSDcNcWwig6f1kItA==
X-Gm-Gg: AR+sD11E2XR3ZrBfPNebRJr3UO+dpLQI1oz60qMz8XKdl3TLjMa488uDPxx1ANpdCgx
	fSq+X1u2IXhmnQH6YTjRfu5uhAyp6EJBrW/mw+SeyfJIRdcbz5f/CKBd9Yq9tmLSGtvL+gVozb1
	aPlKlig+5uTbO1h/Z0mxyeaRi/D0yy/R0E/WjtU1Sz0niEm24KfSMVEDtk5BUYzqxVWOXiN2zG5
	HY6zL/zthCOoQ4rvQ9fR873owx2ODi/0XV6NAtPDpOrlW2NjhPgsgloM7mCEwRfJ4MOMchFW6w6
	6oHSjAmONB1f5Ev9TAmk7ahXhUSSA/sHRHA/W9P/UzO3eK1fh8+Mx5BRTp+s/GDKE6juWtLtU0x
	7nSc/qqHAjHaKe1ntWGoYqJkb09DvsgdbggPfIEmBhNj8M/4DGHKilDG71uyEk4IT3SvHqVIu7e
	5BT8MA6R6G6439eSs=
X-Received: by 2002:ac8:5dc8:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-5283ddfc1b2mr22921371cf.4.1784804996428;
        Thu, 23 Jul 2026 04:09:56 -0700 (PDT)
X-Received: by 2002:ac8:5dc8:0:b0:51c:fc4:a144 with SMTP id d75a77b69052e-5283ddfc1b2mr22920991cf.4.1784804995892;
        Thu, 23 Jul 2026 04:09:55 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm214176466b.57.2026.07.23.04.09.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:09:54 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource table
Date: Thu, 23 Jul 2026 13:09:51 +0200
Message-ID: <20260723110952.55597-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
References: <20260723110952.55597-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=Q53iJY2a c=1 sm=1 tr=0 ts=6a61f686 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=MLDqIt2KGxyUX8khBBEA:9 a=dawVfQjAaf238kedN5IG:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX1bnezeRVjyM4
 R4iZkA1IP90dsoxx8ARsR61Wh00e2Is2yT5Vjydc3pDzWe6XjdikpBxLgJfMMHF+MQNgdIyd/05
 IdrvOhQ8PLZJcAODe8rXySHbILHi6Eg=
X-Proofpoint-GUID: GPg9GQW9tHFgnC4B6EJ41q2Csyqms9em
X-Proofpoint-ORIG-GUID: GPg9GQW9tHFgnC4B6EJ41q2Csyqms9em
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX7KCAfYUvf4jR
 5gPjgAzoUTwT5h4XPwgRrN5lDqMm2lJoXxolPBLfnp4UIhdJHYn2RJ0TptWsMf68razoU0OWU7P
 YnVwp5VgOerfntr8FdnntoB8IFrtAngYWu2KC55kSV9dLRqqQyVEqh5qUEdtFh4Lobur9JQNl84
 uTVK4hDHd7rZP9HIFN/aJDf7i5ZsqS1FDML7D18Ldi9mR6wRb1mzvxcCkyvOr8SbtXhCLwW9izD
 2g9TaRqKQ4NcvBQTgFwOHcPWAwxdatknU55g/BuE2u0kHjFQV1xazxeHJSiOvIcwoGPKtL7wn3I
 dR4YBGWREtHj7LIwlWTP7cv7kNV5KtkWPEBPThiK8OPCL8cnfYDTY62Q5xwWhvY0oN0zel+hu+g
 jyJkzQ6WUXkhUKryI7jc47KPPsFP7P2PY7ZhT7qz0ogSr4lioKbO/2+LHawwMEs//AaQN+G+3Lo
 kCzcCAsxcVHpFwCqe4g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 clxscore=1015 lowpriorityscore=0 phishscore=0 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
icc resource table and qcs8300_resources already uses the sa8775p resources
for most things.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 68491b16d647..0f68199adbf0 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4166,19 +4166,6 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
 	},
 };
 
-static const struct resources_icc icc_res_qcs8300[] = {
-	{
-		.name = "ahb",
-		.icc_bw_tbl.avg = 38400,
-		.icc_bw_tbl.peak = 76800,
-	},
-	{
-		.name = "hf_0",
-		.icc_bw_tbl.avg = 2097152,
-		.icc_bw_tbl.peak = 2097152,
-	},
-};
-
 static const struct resources_icc icc_res_sa8775p[] = {
 	{
 		.name = "ahb",
@@ -5578,12 +5565,12 @@ static const struct camss_resources qcs8300_resources = {
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
-	.icc_res = icc_res_qcs8300,
+	.icc_res = icc_res_sa8775p,
 	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
-	.icc_path_num = ARRAY_SIZE(icc_res_qcs8300),
+	.icc_path_num = ARRAY_SIZE(icc_res_sa8775p),
 };
 
 static const struct camss_resources sa8775p_resources = {
-- 
2.55.0

