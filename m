Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164852;
	b=zBZYiMeZUv14z6/Evbr1rrvUIBWR+2L5uoXGyO8VS8lIONUr6jzLBKaQYke8mHPmn39h
	 HUQ1/gmMMEUAFedQAcMk5ZetvhMu9M/wxm011m04BQynVAQ2UwN8JwHmzgwRBJmKp4Kjh
	 BGZ46x9wMSa5JVgGC2u8QwrgUuRsAgwMtilrAFbhkb1BZLR0f9+ThnG2isx51n02pcgC+
	 33GcoOrO79vVgI5yugTgZ+XTVi4oxgXgmAYplA4Y5A53nSmBD5vsWXIz31PV40NfMG7od
	 icPuRTzzl7qGke91WgXJ/dLjeXlCR/k/a/dfg+W9s1DVMNBXBRfSJUuCOR0c7ybhrgg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164852;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
	b=kMzRjSDxxiDBrXuwOAzCJzueQN4cfjtBB0H/oTNhdNfIuWx3eeadKkQlWeAFriYDj4Ll
	 s13LMCB/8W9s3rBcVsP5oqfgtB02S+GHn+J1d13vVjSpO7YmTPeSDBy1uasZwPmvsdJ2a
	 aqvP43Nz1ycNaBQvRqZ+CIWiGE9XWyID5wNf2RnOqtKqfqGiv6y5OtqcW9Yxk5Eak12Y6
	 yEAZsgdkVdVsBJ13l39EdewqLoyXKUFKIdwcMxvN11ib/XoX09fYlAFHbEr5eITzBCjGY
	 ZWGFbGRoqLZ2+w4crfvCybswB0SvnBYq7hDrVhfXhmWy4fDJOc/KcfS5B8mzrKgTnAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHvogaIH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX2e78Ro;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18D0A606A31D
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:20:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 18D0A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OHvogaIH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RX2e78Ro
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4PQ3x655214
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:20:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2
	WejFiR7c=; b=OHvogaIH/L1RHMTOXYkphNDO0/nomLFtdBvhAuuSP16rRlLciQn
	1HHWZ3D8nXTlnw29YwkO9P66HCRJ1AH/DaE2KSs4Bw2RKLhL1EEZkmh64nOaIkuD
	IcM27NFGQQuT0VtNEzjQR5m2rRVOme4d45zIVerHeMu6RhlTpjCbg7qsR+jbl3lK
	oWJg9QrsUjMrPTRTC8IVTXjZmIpi/KIcKFJT8Lwy6c9vUGOIRRnCaOR6p4TbsBbT
	ZTObuv4ZMukoGI73GbQTgcILXV+AzGlPHHlfnlIBht8iM4nPvle+tV1/vA0M92Wo
	klqoCTc2xEueCkMkLv83fxbc4bvoe8OF4iw==
Received: from mail-oo1-f69.google.com (mail-oo1-f69.google.com [209.85.161.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7gngc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:20:50 +0000 (GMT)
Received: by mail-oo1-f69.google.com with SMTP id 006d021491bc7-7044b48537dso802901eaf.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 22:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793164850; x=1793769650; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
        b=RX2e78RoFowbfF1A3+QEei7Q1TjT1psU2IoCAkT/juyVkbtn2SKuZe2cKu9/xuE09R
         JkzWmG41NAfzHf1z40H6oJ+JU6g7RDRkjE70jWLFeWWd6lirH+HSIHVBCPgY08oN2PP3
         hbOeVnNIJ1XodhQLa7rXI/ymCt+KJ0dXZMOBxqed7jMSo2vN74JYj3YhGSCtDak6Jiwi
         F+Z/+V6OsX4NxgSHjw1BNbp4XS7qhyetkfkbWGbFWnBHr+R4wt+ThKaS1qQ1JVBCSENi
         Thly+m4eXmLPCFYsk7C3cE9ENVReC0o90xJL+oSDinkWf6RSNUj6jn35tjujrsIOlaqB
         CYSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164850; x=1793769650;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/0frRwCS3FVZ6tSdiAeOlvTfG6xRS/ohcF2WejFiR7c=;
        b=YVf2mzIZ3ALRxy1WOOqanszYopSAWpmm+b6WY5YqVCbRYhJmwj4FnupDpxfGR4zPEb
         miTiT9K4Bj+Bon3VElSQO85oZzMKPiH0UzvEPeihnaNIjKCMzqQUAnj2lGloG+TVbakE
         ph4yXCKdwog0H1iC38DiOGmCHvMfqsjpmmtSqrMNuE+iecTIIL8DZWj76u/JNk7mGkBE
         jfZyZVl2VjZIUmllX0F1HZjaL1ZZZOdT9LGisB0qSFUE+Adj96fuh7LAszpFyOzxTkbF
         SYORqJAV7BSPGpayIMNXUO7ZQUQ7QWRkVHRU994+RSmJR9emaxNoNotXRrGvunmBophU
         VkxA==
X-Forwarded-Encrypted: i=1; AKwUvByaj0Q8kn+qZJsg49+KYZ3yPlSP9qqFJDZ7gCqGcZQrBSYeCTd3f2oO76tz43PeVfpNP/SGMNxD5N3wgA==@vger.kernel.org
X-Gm-Message-State: AFq9FYKnKofPpgIr+qwt6wcI1fRVQ1T9P11JrgQ6cbCOTErGhL+YQMXw
	+usPmGUBLe+kJzUunCVzt00fovCLCVsYCPrqOUeQuN+9WZAzQbD1niNmqcJAgPPytyVxbBoMSx0
	+mZbO2P0KgiSJ8C35TmiL3I7llZJIA5WXvpzb0/jaU8q9h5HUN1HSkQBrgbzMX0M43w==
X-Gm-Gg: AYBFou3EVI7wVCvh2U72trdCDIdiDt6J9oNvCcXG+c62su4qJOM+p4U+cGDt/TgqDmh
	e1xZaEvVJMJ3Juect8sxVQbknntaCda1CRujP2eIWOAg3yzzHhBASuLq94pkdrQf+OaLzgjK5El
	t57XfZydA7AKe618stbBv7ej/W2Du0wP1out/JsQIVCU1IcUN3x7yZw69iSJXv7WBd5RxP2CrIx
	yqtwEP0etObP1HZQw+q+FAMpZBN24MzZDIuUOalk1JaCTIEts1v1zq4nrEkMIqxK1uCVwgqPIgQ
	gqEBqxvBxxqmM2iKHg8YjaCI8Rj4jjkc36pyRFAGf8UCRyvXb3UuiAWGhiuzZncmCaL9pvR6mr9
	OmZKzyYusB2ZVCRjZrrZ9JM3exB5BfekRLQRBZ9oh2SQkx/r2Oc/1yQhGJEKtkqp11eJXNVbJdU
	g4WU+57GjV7Y5q5Fz++zcEYk618Ng=
X-Received: by 2002:a05:6820:1508:b0:6c9:80d9:5f5 with SMTP id 006d021491bc7-713f1c562c1mr725679eaf.54.1793164850198;
        Tue, 27 Oct 2026 22:20:50 -0700 (PDT)
X-Received: by 2002:a05:6820:1508:b0:6c9:80d9:5f5 with SMTP id 006d021491bc7-713f1c562c1mr725665eaf.54.1793164849713;
        Tue, 27 Oct 2026 22:20:49 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142bb765a3sm653720eaf.4.2026.10.27.22.20.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:20:49 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom-mipi-csi2: Add support for single power-domain SoCs
Date: Tue, 27 Oct 2026 22:20:47 -0700
Message-Id: <20261028052047.2738893-1-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX06zDop9xeZUv
 nf3Izzd52/W7KcxicKAbw83xVlhDg60q72qCGhi/BUR+NdpGjC2x96CvIuDoa5vVTDqh494PDDv
 ohMWgduuQxWpCfzzFNzLtXVfGxgJxOY=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae18632 cx=c_pps
 a=lVi5GcDxkcJcfCmEjVJoaw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=rBiNkAWo9uy_4UTK5NWh:22
X-Proofpoint-GUID: zzvCqG1hG7FeNSxjlM64DYstUS3ALt8Z
X-Proofpoint-ORIG-GUID: zzvCqG1hG7FeNSxjlM64DYstUS3ALt8Z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMSBTYWx0ZWRfX/CUl5l3ksogt
 5NOtcTOtlqRRlh1dxkq2cH6pO5n6iq/nTus6o2KFJH1TFfYcB78hfKCVJwa2lQiYjwqvdVdKmb6
 cfrmJTR/PdJL17bP9ZOEwJy07O5iAsn0aINR0PojIkZMuwofnDNA3nUF/ipovxuxnAqjXVSXMdg
 Sk1NO8+oG5L8aDQZXDQrvUvjj2BuU91/IQom7/32nWPRQ5CnAZihvzWOuBq19aRFhiM6z/KXMD0
 axgAFuQ1T1jC/iRxjwj4xOFOPhAnB0kePkifyfs7sTUL1bTp/NQypbIRLD+j02BUZrVsXZoTx9w
 p81aEuwlA40ozfrOY0S/kQqUBoiFHfu32UcRjrEWNbss8NBwwnfc9rlGDepFcVC7nkcg5Ml60MH
 IyFO2rfit/mAs1zTthf3Gzfb+UvMh7o0cF+NV842c8jkIIbmPxxZ7c9QMOTR/QmFMt7uwCsoBdD
 0O97XsHXsNxi/mvigYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280021

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  1. qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  2. qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
  failed with error -17

x1e80100 is unaffected: it lists three power-domains, so the generic
code does not auto-attach any of them (auto-attach only applies to
single-power-domain devices); the driver's explicit attach is the
only one that runs.

For the single power-domain case, call dev_pm_domain_attach() instead
of devm_pm_domain_attach_list(): it returns early when dev->pm_domain
is already set, so csi2phy->pd_list is left NULL rather than built up
by hand. The three call sites that walk pd_list for genpd
performance-state scaling now guard against a NULL pd_list, which is
harmless since scaling is unused (scaled = false) on every SoC that has
a single "top" domain.

Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..ac25e1e5f1c3 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -43,7 +43,7 @@ phy_qcom_mipi_csi2_set_clock_rates(struct mipi_csi2phy_device *csi2phy,
 	}
 
 	pstate = 0;
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		unsigned int perf;
 
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
@@ -174,7 +174,7 @@ static int phy_qcom_mipi_csi2_power_on(struct phy *phy)
 unset_rate:
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -204,7 +204,7 @@ static int phy_qcom_mipi_csi2_power_off(struct phy *phy)
 
 	dev_pm_opp_set_rate(csi2phy->dev, 0);
 
-	for (i = 0; i < csi2phy->pd_list->num_pds; i++) {
+	for (i = 0; csi2phy->pd_list && i < csi2phy->pd_list->num_pds; i++) {
 		if (!csi2phy->soc_cfg->genpds[i].scaled)
 			continue;
 
@@ -233,6 +233,10 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	const char **pd_names;
 	int i;
 
+	/* Single power-domain devices are already attached by the bus core. */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
+
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
 				GFP_KERNEL);
@@ -369,11 +373,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 		return ret;
 
 	ret = phy_qcom_mipi_csi2_attach_pm_domains(csi2phy);
-	if (ret < 0 || csi2phy->pd_list == NULL) {
-		if (ret == 0)
-			ret = -ENODEV;
+	if (ret < 0)
 		return dev_err_probe(dev, ret, "Failed to attach power-domain list\n");
-	}
 
 	ret = devm_pm_runtime_enable(dev);
 	if (ret < 0)
-- 
2.34.1

