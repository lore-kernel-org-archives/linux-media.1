Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E18845A2B1
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805002; cv=none; b=PJhUVYoT95WVnjyxqszOfiBmMs7GYWWGm8mkE8bV8yH3m2IN2XPey+vc+cZ4KVyn8qKDeJvRvJKJ/Bvboust3s0X/dGFxB1EvlkSWGshePal6hZvsvMlvSRZSOBIhr+UC3tyBR7XTS5tCVfiDaERYzhwi3qcHjw5abxYTfaZ8U4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805002; c=relaxed/simple;
	bh=1wND9DuavkNBuhUpF/XBOklS8CyoeTzkKtHCifbRz4k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sOs3y8AqEwc+OPhzFCaQSoPVSvcnRCRllTDyNFo7FcG1cKT9FuuWjxC1S3gSkzl4NLe97K+ZDXmUHw+3vIvRUlWmzFum26aJU1H5odWlDSTSCCw+LLNuvgtM9iwn8OQYLBhH3b8/qZAG/641cYzl1CUri/FnvM6FGF8kxP2fZrQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=afrOSGpj; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NkcfRHrC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="afrOSGpj";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NkcfRHrC"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66N8qZjA3045016
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OdCyyXdiqbE
	UUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=; b=afrOSGpjhcfxU4VaiZzdjBgFKON
	9yGV4rr/sRc8EV0grFoL2FmPrHXctM2lWqac3QnmmrRuHvX5LuB9OngvRYNqOzw9
	3Aohfj3qXBp5SrknqP04fdD9FmduSlupaEkwJoT6VEEiZrBmdvvnDLm/aux0N9bn
	d6P7C0PuafWsuk4BIo8hBcoXC3v1aCtyCcsNZAoKpZbcMXHrFsGr4DShNIBno/ot
	Az8ammI9bZHSw6Ma72FGVlsyWrOBty1s6Pod1vUFrpmRA31VeKuVNHb/lmgIxew4
	TN+rl5+cGi243aXbBPRuOFCjFvyykPYT7SavkJEBPkPOtjM7JTOA41NGAFA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fkeuq8s8v-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 11:10:00 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c21c01cf3so8483391cf.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 04:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784804999; x=1785409799; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OdCyyXdiqbEUUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=;
        b=NkcfRHrCoHlJMSqOlfwOWjnxvVICXHu61VwXb5QOiaBkGQsqvqzlvnH2p4/sqkNf85
         djiCUqEVmrViwAtGO6/f3Vv1tfP2JqyjajOVyoJfjW1lX4yINQod8mvKOPC+uehEGO5A
         g+wmQ4p/lnQkQvRpYvt51Vbljcy/68Bd222nrxNwN695YcnUFgt+dAliYSoCJBYqXW7P
         /toxyAJBgIMwlxYKgs4wuxL3z0F9A5tLZlUKAutvtpqVRgP0TIGKvOH9hVNEweyyfRK2
         HTg3bciXO8LAMh/Vwrc43QjNHVj4Ku6BzTb32tkMuDTht1rUvQFMptgPz4i10F8iDF+Z
         S9Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784804999; x=1785409799;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OdCyyXdiqbEUUjsmTf4UxNPG1HSVtA1jGd/TwpCd+dU=;
        b=nL2bjFecwIPxlrzxZW2HKY+MZiQHmt+7BC7QCp2/Aff3tS8bxEagEuAISX35mG+Di5
         SObrXrGwxTAgigaIwjbapoWImXeIhIYCN/JXImdYybwsG1TFODXD/TJWCFHY/5U1F7W/
         eQW+X1+WDQH1VI3sx8lfYLvb3D/MvqXt9tS/PmepN609EqiQpWY84Z8aWk1a922Z6Jhp
         DeYHbKid3/V2yCsOJe2Y0BHTg5K319pKkA0umJxdQiouGqao6bvcqxA31M5iFWOy9rPO
         gz7eIeUUP4K6uvIGBaUeWbLIT9LKziV6iD+ruK+RPWy+plJOO+IrsQYAPwEBqwbQkupg
         3NIw==
X-Forwarded-Encrypted: i=1; AHgh+Rpr35xJseIMP97qszN2VAs6Eq4esSUjXMS2BRWhXbGHBihx2+fdgtA6qmEfTINecOclf9kyJBTHo5GpDA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwfrdF9FMmxTglUaZQiU4xh8sKqSCQGWM3Ia075tEdNWwHmlHZh
	t0+6YZIGeGiZdhu3iOhwYXb3wni5zOX2jpuEPGtSSvgn3FhocFECbWxCYhGhlPTvy9dyDXsph18
	IM4SL5k2lwneZp9RNpOb2eZUwFUJRDWCyngz7VYllqfMpXk9XLvEqGjkuMFQI0LRI0g==
X-Gm-Gg: AR+sD1295b4P319J69ySM8E+/ae1OL83jUD7aRV9fGg9SLGvp9c/Gxy+Z5KueJzGCdG
	kdJwmIvx5/uFd7gKmk5dBMrYeZi1tZJAHPlHwGH4xf7n5ewquoiPPCHwHm9y7YtjuQUE44qG4VH
	eZU9QtNOlMeKaTDvjRtZA1Xr83hRhPFvJg0jUbn4hUxX/d0mO4q9jkEArTYMnixlvsWXVlwh425
	VIZssu9Su9gkEKNVlNnt8lYjB8dVWh34lo8Tfte7s1qlNtMIlKyI4zjdGg9HcSgc934LtBky1lW
	6/DlXowmm6710fhlU5DbI1GPmxVElfbaWQGhOLuwL/VZx32Wrr9icexT53pW1eopV45czsNhlJT
	2gMiQqkvYDj0XicJwclBfsAxTa6Z8QvrTtJWBTZX8/12ItqFWSsINUrXKwywXmEDh1EyvCaZ2lO
	WtUArPH05K28igSrk=
X-Received: by 2002:a05:622a:112:b0:51c:7b12:1213 with SMTP id d75a77b69052e-5283e029606mr22299061cf.81.1784804998971;
        Thu, 23 Jul 2026 04:09:58 -0700 (PDT)
X-Received: by 2002:a05:622a:112:b0:51c:7b12:1213 with SMTP id d75a77b69052e-5283e029606mr22298181cf.81.1784804997423;
        Thu, 23 Jul 2026 04:09:57 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1c32f11af2sm214176466b.57.2026.07.23.04.09.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 04:09:56 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: [PATCH v2 3/3] media: qcom: camss: Drop csiphy_res_8300 phy resource table
Date: Thu, 23 Jul 2026 13:09:52 +0200
Message-ID: <20260723110952.55597-3-johannes.goede@oss.qualcomm.com>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfX5sI5YcrKXRrh
 AmDKM1n0byf52WIHlXmbswL/A8eHyZwDsUJcgxQ3K9J6/mACUzQGwbFK82Tengr5hGVnRt7+a+D
 hMZYXzOtTovvA206PTPgCVpcwfl/o6s=
X-Proofpoint-ORIG-GUID: Hy0Dm-H_AkAH-zceFwN-8aqOSCt92xrv
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIzMDEwOSBTYWx0ZWRfXxrXGsZBrz0CI
 QcWpr3Mga93dxD8KDkPSlq+M6tYnxzwu3b/lamGXO487p7sebZ+mHGUgVpkE/46mW+gJuDpXhpW
 tOZ7RCpfzSbKuncedfR1t/DK9uws74cgrC+p3mBQ4HLCguiwfQG+0SHrbIsMw2sfqr4X3pqEZFg
 fOGZvpzXk9hnAmvvkhUAdYy62didHFMQYFAm7G1IAdJPfe9fQvKPmKqQ5Mo08HpvGFIur7JEnMU
 I4bg/uwz1UOp7ezxadKQzouqE9QmgKCC/Y5p/RNvcB4Us6sYeL7bc3gRBbR70748LPuQila9RT4
 y5kCAHgD1seAMI38u6uiEtFcHSrLpCjDe9tFhGUFkOv+zYrFjG0rn2+pKdJGFxSWbpuIdC/4+dB
 4jakOkxTRHT63Bhz6M/JBo0iFMzt0nV+UFb3tY82PwdoD6SCl2BZsfoXi1aNqjMf/IxAg3dWK6X
 vbVEBEtGjzk5ktbkyDQ==
X-Authority-Analysis: v=2.4 cv=cPDQdFeN c=1 sm=1 tr=0 ts=6a61f688 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=SmqKm4ufXN4HyjwWdg0A:9 a=a_PwQJl-kcHnX1M80qC6:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Hy0Dm-H_AkAH-zceFwN-8aqOSCt92xrv
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-23_03,2026-07-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607230109

The qcs8300 phys are identical to the sa8775p's phys drop the duplicate
info and use csiphy_res_8775p[] for the qcs8300_resources.

The only difference is that the qcs8300 has 3 phys vs 4 phys for
the sa8775p, so explicitly set csiphy_num to 3 rather then using
ARRAY_SIZE().

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Signed-off-by: Hans de Goede <johannes.goede@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 70 +----------------------
 1 file changed, 2 insertions(+), 68 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 0f68199adbf0..6dc102bba904 100644
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
@@ -5560,13 +5494,13 @@ static const struct camss_resources qcm2290_resources = {
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

