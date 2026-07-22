Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D79E4749FB
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784738234; cv=none; b=JGloFNMb9JazFGJRiG5+jJdUu9lqbbxODpYoJMqCFxwwMEAkMIm1buhY/EZuuIMdLiqHoyMipfxmFAwjcOvIrP+Egbrojs2HAJ5BylGj5Ev4lPrxU2EDqvEhvhYNgqbG1FQqMlq2Fnj7Ck6r9QNZ7d1oBKbxyAua6YTzfExSjk8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784738234; c=relaxed/simple;
	bh=S5PhMsC6yS7z1bINKvuzVMHA53qCHkHxeuG5dKaL380=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UxYRiSWgDlW5INpI7vTMU9XAC+j18snXiPutxL6y9tWB39FsfsUqCeGZ0YzK1+tSHtRnu1BebqRIWF3BtEd3o2N6QdkAZhYPRyar+ra63dJ6nvIDmIIdv3RO4N5yP2JN8YcZ1AbtHoPGnEXvNFMXMk1LkBOF5MNsFuAUil3A07M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pi7lYqZN; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZDk1SV84; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pi7lYqZN";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZDk1SV84"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66MFXwaL931464
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=IhQcrp6tnTy
	WYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=; b=pi7lYqZNz0sNvRk2VKj0zcONF/b
	55ZWPCKY4s6OnZ4ZBBzO+9lHaYDGWg2Sd+YhnaUY7yqgk3dkptbCuqLDuAlieG/g
	2lD0ZSPzJRJcCHV4mNGy6ssR+e/C7ZgFv+d+VgOB+ik3JKPpq3ZCBneQ9YsfLblg
	ZCbHES443wI1VUoXsZbBq7+4eebSDYb0+lFAye1d+f49HZzfqOz5wxy9NLcKYCXP
	q6Mn+i4+F6lRZx1wyF1Jt3yxUlADZQ/iNy/vBeJUzLhz4E1P1utXr1DMa7RtIPZm
	BMcbXxko/hEy5ixq/Su5wKFMT0iwXtBk9XZuuxWJ4kQfJv1rgK+mZE6iW0Q==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fju229x16-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 16:37:12 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c01ff996dso105960321cf.2
        for <linux-media@vger.kernel.org>; Wed, 22 Jul 2026 09:37:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784738232; x=1785343032; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IhQcrp6tnTyWYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=;
        b=ZDk1SV84+40di80m6eBIG6mbfQqiqmNtBr1GRphoaXJaKRgi3aT7xyM/X7lcSItqay
         bmyog/a1ugHrVtS7npbjE/UOTtMBD5Wu6tG4VwdgT6dcU9u7mRtaB4/toNRUYjbFRaxf
         C+VAo8qKvc+Mcq6DcWTJW+uuAXGqXm1MIg3uwycvTT0jfJmkAKHVmW4zoM6iglWvB+/+
         geyJvJoMSi8m0F6DWnZs1F+aHqrrmisdxNivjAVCAOZrMJHmjASdzfqyhNTBBdBfNaWC
         VhyMV57DxVfMoRkzCoNgfC1BrPSYwWyFh5uSRAR2D0NXZyyRlt6YkA0ES2hGq2u6c81y
         2H0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784738232; x=1785343032;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=IhQcrp6tnTyWYmWCp82cuq0ptzWFXZKnDGXpYxg08zA=;
        b=qATzdG6EJHkNOSIvKtW/s4KQHINIqcIbBcbdAd5TmdoFTr8jZBLcn8XSYS1cAr9GUf
         CIKHXBixvRg0C6hGB9p/hTiEi6irTsfnftpX9gANh5QmfDhLCGwoGhapiH497hjmJT/9
         c0jeT6cRv822R5blPey5FmpiufppMnkmxc28CTMvXmluMgKKHtHxOlx0cc1Q4+HMyO3L
         zzXzoQ4fdJ9ayldGixkZ8+o7ni49dBEMvHio0khl6huv7fxezuHXVWEreQ2XNNsa4HL5
         ltSYGAUHCgHc7OJTBvfKQcIWWG1qbREBqHIJVmBzMcLNMFaRvoFfOi4RgUqNfWTVVead
         HL0A==
X-Forwarded-Encrypted: i=1; AHgh+RrK8Icdgdxp1b27PPV2IBf/bRs223iG9s6s/DsDqr8xjhOqYq6zHYSvy50dVvFqRidUY44AnJ0pEeQWYw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3IputMrJqPtC8Q9oRjzKs0fJgeFM4O9WgrydJfLM+sOW4oVbn
	vLiWg/H3glz8m2V3JHAnJ9Dz7tesR/nzRuWsP6SsITtlgsAIS8c7/px/B3br+qTyVX4K2RuLcZu
	rK9yDwHXzIT5wxGUmnwPonsAYfjsqtyms/0X8VKN3nBRIIL3QNF8mV5ARRkbLFBAfG9xKKueiKA
	==
X-Gm-Gg: AR+sD11p4b4eMqFvheFoWIcab33/QL4R5+FVVFUKIkDgEdLBeyNlK3BvWvORun4ekDo
	lIXIb83/Gqz2RHs43Y8V+YuJU/YTuHOpEU+/hvAR2sgYv+5iBsJ2kvfxFRShWr6Vt3mDLj2jxNk
	pbeWItaYYJljAIRw2vkl+o4qpFrYjSNXzB/69XZgGouLL0AqCxSre4qse6pI/u/hv/PwsUNmYyT
	Cy7TLmug9KnWpPGn5KhPBnBI+nNweRsfpNZ7anfCTTWdnn9b1Fdxex3ddh0QEqOmnGKBD9KdoxD
	QJevy8+OaKfxGIn1eI7ZJcGrOvFDgUdFT3ODj3riYQjJbe1V5PouDaD8QUN9Vjsb+hRo9naq/C+
	ZpOJxGuBZ73VnsV/1hdYtHPsRnCjq1zdB0xmCHEl3f8USmQu7JkYBa9+YSPuz22Pjiln008QYCT
	moXzD0pO1SqiM2NRE=
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr210226841cf.35.1784738231599;
        Wed, 22 Jul 2026 09:37:11 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51b:fe7a:4eb8 with SMTP id d75a77b69052e-5213cdca291mr210226581cf.35.1784738231081;
        Wed, 22 Jul 2026 09:37:11 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-69f34b9b064sm1301150a12.11.2026.07.22.09.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 09:37:08 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
Date: Wed, 22 Jul 2026 18:36:58 +0200
Message-ID: <20260722163658.409872-3-johannes.goede@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=X4Bi7mTe c=1 sm=1 tr=0 ts=6a60f1b8 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8 a=OSU0MNRdqBj5gpyExlMA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: F_CGwHrQ5rUOQS1_dytjoIegn7_Hw4Xq
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfXxC7wqDzH5yxw
 93Qk4nAtLccF2HdbZ1k1L/B7KF7TsKnqmjU3pkpUh29CSDjkBzVQ94sNMBqoj6NVA5UafU6oR/L
 p9SPaU9fqYMVTTmejYr+2ky5WQHz0v4=
X-Proofpoint-ORIG-GUID: F_CGwHrQ5rUOQS1_dytjoIegn7_Hw4Xq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDE2MyBTYWx0ZWRfX4X4zNywmSaeT
 n/MLUZTrj9ceqjiBpIDaj8BwYJHJi53okNvxsAbRxTxjVNJqYkBs/lTcdX2dJn7uXm7jAiKZKLz
 RQRsNcperEslHX86k/Bd17JMeCn9Lw+M+YPLFIeqIGhWtHTBQn1j9VeCQWluRxLFMuIr7TtQoej
 kAmqxxJFSk3sSkL6y0LzKn3dX3O6kAO52WIokCAcWGia1h6mLa+wTJpefma0ohTW1zmzHr1oLmh
 uVJ9vxSGL4WZ5Rv62PMyKBAXSTVs6v4K5bWVoWJvw8Ly9/SOomLzcQREmy8PjRr0wIu7eqy/DXI
 RyTwzJVQBavG2otMDeGtiw9jl96+X9uuul25VQLEEXAcb82oRYCV07yY9b0+85nn4KVAakpUn2/
 wU44YA7nUBXybiRkDR4T3bUYl3veHbPDa8evuG+8DkSUZ2vNw+ZKHv7MlsAIS1MxKGeJmQ4GMS5
 DjBehl2YUkdaZ+IE+5Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_04,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 phishscore=0 malwarescore=0
 clxscore=1015 priorityscore=1501 spamscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607220163

The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
info and use csiphy_res_8775p[] for the qcs8300_resources.

The only difference is that the qcs8300 has 3 phys vs 4 phys for
the sa8775p, so explicitly set csiphy_num to 3 rather then using
ARRAY_SIZE().

Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
 1 file changed, 2 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 477358dd39fc..eba14a6ae7d4 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -3657,72 +3657,6 @@ static const struct resources_icc icc_res_sm8650[] = {
 	},
 };
 
-static const struct camss_subdev_resources csiphy_res_8300[] = {
-	/* CSIPHY0 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy0", "csiphy0_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy0" },
-		.interrupt = { "csiphy0" },
-		.csiphy = {
-			.id = 0,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY1 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy1", "csiphy1_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy1" },
-		.interrupt = { "csiphy1" },
-		.csiphy = {
-			.id = 1,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-	/* CSIPHY2 */
-	{
-		.regulators = {
-			{ .supply = "vdda-phy", .init_load_uA = 15900 },
-			{ .supply = "vdda-pll", .init_load_uA = 8900 }
-		},
-
-		.clock = { "csiphy_rx", "csiphy2", "csiphy2_timer" },
-		.clock_rate = {
-			{ 400000000 },
-			{ 0 },
-			{ 400000000 },
-		},
-		.reg = { "csiphy2" },
-		.interrupt = { "csiphy2" },
-		.csiphy = {
-			.id = 2,
-			.hw_ops = &csiphy_ops_3ph_1_0,
-			.formats = &csiphy_formats_sdm845,
-		}
-	},
-};
-
 static const struct camss_subdev_resources csiphy_res_8775p[] = {
 	/* CSIPHY0 */
 	{
@@ -5555,13 +5489,13 @@ static const struct camss_resources qcm2290_resources = {
 static const struct camss_resources qcs8300_resources = {
 	.version = CAMSS_8300,
 	.pd_name = "top",
-	.csiphy_res = csiphy_res_8300,
+	.csiphy_res = csiphy_res_8775p,
 	.tpg_res = tpg_res_8775p,
 	.csid_res = csid_res_8775p,
 	.csid_wrapper_res = &csid_wrapper_res_sm8550,
 	.vfe_res = vfe_res_8775p,
 	.icc_res = icc_res_sa8775p,
-	.csiphy_num = ARRAY_SIZE(csiphy_res_8300),
+	.csiphy_num = 3, /* qcs8300 only has 3 phys vs 4 phys for the sa8775p */
 	.tpg_num = ARRAY_SIZE(tpg_res_8775p),
 	.csid_num = ARRAY_SIZE(csid_res_8775p),
 	.vfe_num = ARRAY_SIZE(vfe_res_8775p),
-- 
2.55.0

