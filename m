Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2CA439F96
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738231; cv=none; b=Z4TVFGeFHwgp6lplktmKAUC9iTYP1HDfINAJ4A+FzKgaVZ0aA3xePN2u4qruJssThIL4R0cVdqUtPmiN0iclLXlEdf88889JQi8Zpf+62RH98YIelJ/ZWi/o5QT3/tNerUdmuG6ixk2hXNr0yeeX6gZmrT3zMF7Ez74utsco/TI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738231; c=relaxed/simple;
	bh=RJA/UEi5fCKfanbI26YpCiTHwb/5qHZjiE69M59ihlg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gsBO+nrp3mnBvXjiWUFWDIbFk4yrK9G8Hqa7lybt2dfnpOwtI/VSwzM4Bc2kGKAmmII2UNlLXVrjGG5pV3A7cNmxILQv/gFmmh5DnUw5yQP4Xkudkv6vzVslCfkxcbMdfj27UO4TmLrJPzgu1ChQd7hW/aJZ7UZHMLlS3PbT+/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HTYoyUwA; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=M1Qohkqz; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HTYoyUwA";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="M1Qohkqz"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXllL2317560
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=pxmeyPcW8Nk
	u6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=; b=HTYoyUwAShyCuvGO7gxbUfHqH/S
	Bp/v1oToSM/B927hTnDeYotast9Iykrto8ufGswo/81nqP0T36ohAKU1jn5TGHrT
	ACMOLkuLkv2sVZmimelqapRKdzGf/R5D2tFK8NDFn7llwBbM+IHlLoOxtxyOnDEo
	QWi0ekzGGm0VJhnMlDr8HX5FPVxPQ04LFn/CJEjYAFOsa8GU6XH/B6Xu7byie/2j
	4S1km6tKyrXjPBs6MyL6/73/jG5axDvDMVo5sB6FByo3TOSYiocIQAHrwKAd5ln2
	DOUynojY4fTPalGKpGHr7mBkclMqJhXFC03YoIbkfIjSC9Iuf4DgWeSOWwA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fjr83aphr-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:09 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c1a9764f0so264491581cf.1
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:37:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784738228; x=1785343028; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pxmeyPcW8Nku6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=;
        b=M1Qohkqzz9YvecLrXwVahzXrjR7rOekbgY1lsNlsL95v+3zgZjhhOhTJv/gMBPFqvM
         7S5WeCqFQxBMFv0pdGTrfvOiiEGSt61kg7UJN2Edoc72cwH/DeA7u7FySpXq8GCaqfac
         TptvR6Ajh7NxSiwqSlNowQ5hN8+PZVEnVnKRzJ4WXWZcJBlBhdDq3zsHo4eujFibJz7M
         89o+WbPWoGdFUeBOInEX4b0A3+IC1OEJp92oTFDT/HBeGApKqFFGX8XBvOMCwWHxdbg8
         +quwNTMvs8qQYq02QDnKT+wi1m5DJ8OyQqiUItUrE9C3JjRzua65l8yrBx/8FwZQ8u0A
         qBfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738228; x=1785343028;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pxmeyPcW8Nku6Z0fAEYSy8Kkx/4RuUXF2wcZRuxQKGw=;
        b=eKlIX3js9ngqq78x/vaBGWhoj5OrMeIjLzuHoc0/OL8a6cGahVcARids51d4PiVFi4
         0vmYfMpQPDf6baQ+B+STp/VYvsQxNOI6R1KQywfMRZTu7x7l2nEefdQ0paEVgX7wLWo1
         CDcO/7vEPxfpC7XJcdkEGFk3yPvurkKNgl9z6samiSiMadpEKkhxWsi6A29kkXcDtWNg
         OzPsYKUisfx5kMlcH3qyr7aqwvPZuNwT5IKmLkaxTJweUQBKux0C4emEgHChetMrUJm8
         LVfa4kPMglrLsQvSl1cPXly/DF87yQKHWNU/+2Yhys63Q++b3EpKvJgQItQzeH2F2xoD
         ZBoQ==
X-Forwarded-Encrypted: i=1; AHgh+Rp1fBF40RqK5eLZiCXOr4bgRU6hIBSIaqvDSiHZiNjrNLK1e4chLhLfHPr4vIclY5xRMa3TBKJ0V1fy6Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyStn6y+6TbrBhUU0CH5ZLbu6JDdzgAZAMAwo7qu0CVRh5Z2YDv
	Hr9OVnGBdTkW+mVd2QIIT44XchOiu5behczRggwrQO6sEI/UVJRr5lnd9/p6SWiUElM4pSS+Hxw
	hS1pr3BUxyerFTdiWbxR/98yfIHOW5Ni7mTmDm39cYxD6FMSJ3/DBfCCPZ9H3tZT59w==
X-Gm-Gg: AR+sD11ooKZAJ9urVC/R5pvdywhDTm5q5hOWgt22tTUs3JsD8bdulc2mOfkZK5ETwu0
	e2ul7BA4iGjLIQiLPcsHhqG4Ynlol2+aQkYuzATXaB0OpkNVtSEs875hamZfGqn6KKwlYgBWoz/
	nNbeBY9q7IWr4OGlgBEHWCAuH+jmhUqnBr/DCdgLLO98fcARXBw9+D/O6wUGGchc85aeA0FLyjZ
	0n95pX2xUtuh3LU6QVTubi/kHefkgywWX/2+3DDb1svDrNN7dE6T3HAlRigTzty4B8HZeticKFB
	2TQO1JEoQ94E3w5/zFD/NEDYhdILqJNp1nnjF3zo3Bla1w81br4BkSdZFxQ1NrusXBXkSucauXP
	KALHqSabkvKhriDLpguAhLZtGahjajgeegrerdn+NPxJ7BjGeM99Fm209MtUMui40ruvszFnuln
	sdEZPGZdPo7PSwwuo=
X-Received: by 2002:a05:622a:834d:b0:527:7112:a5bf with SMTP id d75a77b69052e-5277112a732mr48320551cf.71.1784738228236;
        Wed, 22 Jul 2026 09:37:08 -0700 (PDT)
X-Received: by 2002:a05:622a:834d:b0:527:7112:a5bf with SMTP id d75a77b69052e-5277112a732mr48318771cf.71.1784738225384;
        Wed, 22 Jul 2026 09:37:05 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm1301150a12.11.2026.07.22.09.37.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:37:02 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 2/3] media: qcom: camss: Drop icc_res_qcs8300 resource table
Date: Wed, 22 Jul 2026 18:36:57 +0200
Message-ID: <20260722163658.409872-2-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
References: <20260722163658.409872-1-johannes.goede@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: pcChLYc8WyD1HNZW_KShCgNSVM-C3V9c
X-Authority-Analysis: v=2.4 cv=VfrH+lp9 c=1 sm=1 tr=0 ts=6a60f1b5 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=4KIXZSIjKgV3iKP7xusA:9
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: pcChLYc8WyD1HNZW_KShCgNSVM-C3V9c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX3447m8yVOOvC
 uV1Hrc8Htsxim55Tuas7Jb8VStmw+yIihD+ig9SncN5JnLT7ytd2vpKmL6ScJGsn3jlsmwwh9kS
 F4Wp6+3cL3af4ZnDL5T/zqCyfAxPai6z8wHnw+NexN+EC31fXSkmsMby4kOqfV5tJYtRIl88Nxn
 0Wa0UCjZCHlz+4tnVWazzVtnnvzjFZH9aI6dOkIppoBvZijqjjw1Rt2G9NgqA8KXpTH0rTvkYdd
 frLfcsoJ3XT004QieSI7DNlb4Qln0/LdPjfyvlD6dg851jC5FlscjJ7JEu5mmzqsEdVedHGK7QH
 e0lED2Xc/y54Rmg/D1wro+iWJyndBOgWnGVDTz3hcQUX06mqBj+LKBSb4WTP4xFwhaUvEzd6+dA
 hDUUOkLJ4DeUJrgDzbuDYBCfCrB6qpmxK3ynphuTnP9wyb7vU550Pl2D2PNHUFvieveP1lZ8KTW
 vlMc+zGmqLIGC+w/b9g==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX2fhbJG6iaA1Y
 j5QAWOwuik0hcL5bVcDgFxRpK6xL5y6U7acDGAMWCemAgKJOUIj7vo44IlT3UL9ISVcabE2dtfB
 gZxCRoclRcexpRNUZpBcI2lzWDI77sw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220163

The icc_res_qcs8300 icc resource table is identical to the icc_res_sa8775p
icc resource table and qcs8300_resources already uses the sa8775p resources
for most things.

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 17 ++---------------
 1 file changed, 2 insertions(+), 15 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3efbf2fb4472..477358dd39fc 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -4161,19 +4161,6 @@ static const struct camss_subdev_resources vfe_res_8775p[] = {
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
@@ -5573,12 +5560,12 @@ static const struct camss_resources qcs8300_resources = {
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

