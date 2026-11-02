Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793655581;
	b=K80SUAHJHQ4wYVSJhtbB8GuX11xJGTBTjmuH4iPQwDTLdRFcPMxMZtPbDGkjtWBsoPJd
	 JgDG28YzyOzGCadTHryzrptR2+49JDG+g8naF4uE6rJNzVDoY5K9NiZEnX0r1KI4eO1N3
	 nQDnX+6AQIL976/J5eujmls12L0zY4uCx1sW+8xnaTNVAdGCkwjCs34HRFU7enzQ8TLpi
	 9aCkW+ipm577NXRYBn8MybFYQXQpeNWkG6A+N+lFQUtMbHTJuE4oSEyuMEwDP7MGtTuvl
	 4UhZa3s56XuKNRSDyFFGrTAYbAnxYk2TNBsBmRSyujaCxBZXwhIph2wnGgu9gLpI5yw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793655581;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=PHBqgIS2a1m9GORwkqpCGvAXjRtw2HSeDsQnUYOO8L0=;
	b=s+XW1OpYGUonp0CLZO9ImR/OZ3StJbWP7qmk/1ZBO3XG106dGSd51BHKJ4xK1wLUX9Gn
	 0dIEjfxKTMQJCl+R6rTlTlABSvrMwg/22yKb/NKa/ABcwkEPk4clQK1k4enVpFmmliYgn
	 1yNyiGFoeboSz0MtXTAKCTQ3RFj/ACpxODHFRWJ3Rcee5u/h9Cdz9jh0j/euFzAjFkUnO
	 tH7TTHP0OLMgk5SUQyE2ntDbodxhXwnNL+F0rWhIitSTasOZ2Tmcgs/Ci/Evsg4e/9gob
	 Rkv2/qgYTB9nWhihObjqlewxRAUmc/2n9X8DFoAwipKIf//8nlpx2WZ1jasmbkpHv1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJ++aXop;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNPCmhYf;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EA9B606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 21:39:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EA9B606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oJ++aXop;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=dNPCmhYf
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2K6ASg372213
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 21:39:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=PHBqgIS2a1m9GORwkqpCGvAXjRtw2HSeDsQ
	nUYOO8L0=; b=oJ++aXoppqWbvzDgovVL7Xy9qHXZaRCpJSpIxiQh750QP1mHBZI
	9BvkWad7l/BLVcBJu5uTMAuf+evP+qIkQJf+eMUeuRkW2VDwqSrTob2pD3bNkC00
	D1lwh/uC9Sj15vqpo9yxr3OOPmd+s3p8TocMsXWbuYq85YTrlO+lGAEmGnzoeGk0
	ZYmF0hRoAistcZzOjCaNHPXZEkJ4qrDiCFvD7G3i0YbgA0cacmj7kyNK8vPVusCQ
	NgevXYfOYgzu62ngtm0jWzGd+FPG+mGKA16mqqf9nRycIGHTCsH+//UfipZMTawe
	eYKBF4WkjdxDbiIKZ/0V+0wqvCYbdtGB2+Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq07r0km9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 21:39:40 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b0d864826cso5540269c88.1
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 13:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793655579; x=1794260379; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PHBqgIS2a1m9GORwkqpCGvAXjRtw2HSeDsQnUYOO8L0=;
        b=dNPCmhYfkOeq1yQ8FA5R/AZKMcmMY4uq4du7cEk7yMZHnlZz9myjLbYCYybTouth9O
         ivWBXyw0HX7aCbN5P6hZ+sFLino2srWk6Nqz7Go2EPFOwRUKeei0OoP841rQuiCV1Wab
         K1Wy8WC2ndDLe+nxn/RQ2zRfBBJ4aKb2r4+z42t/syySmi6eKchMaBIeOvff1AHo7M84
         P3DAK8QD9SfL5pSU6LQbz7VAsGVbMhcVvce5bzBmDV31DQImPB2QXbkQnz5ZMme1Utn5
         6GsAdbaXJa/wVe8nEzdTbmruKaPsM+v2VbKAp7IGF7vrCYLgmsM57mSFp39a65akkFTj
         0GCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793655579; x=1794260379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PHBqgIS2a1m9GORwkqpCGvAXjRtw2HSeDsQnUYOO8L0=;
        b=kezuUtkIMd4/UESGbKC8NZpQzkWtQdUG4GHC75tTvSa2jLsd+o0Hp0GGGgvEvc5ceL
         MD+L+kPFnyiIKfc4Ho36RFmumeVgy3MVQltcjdSwP+qFBluBGKxTX0RSreHf4wANrfeD
         EFTNkWNZfnC0fvPjGbio95DFeq/b5xnnBu57mgMekmeNMCPLNLtDCkfSJC6uULEp8RRR
         qkIFk/VR1/SlCrc/WshUP/0CxfDJFlMvJ31Gi6Xq1dFSGuI0fXjqJ2u8BQIYvsGo9yiN
         owcICYvXjwXwDxIEnHm/IohDjguAbreTY/04cCeEOmSM/Pt5+kefZRSp8x+shq4oSwf6
         22hw==
X-Forwarded-Encrypted: i=1; AKwUvBy/hYtFATIPr/4S5itcOL2SxkJ75yk2Vhc6+0JLhi152eU1sl1bxgH5rM2IDcDOoQIKUpNRhL65RLC4Kw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIwM4tFdd6RWymV94nCPg4b7YSsS1vJO1zBDgABzS26i1A8txlq
	tzjqcERX0NwWckpW0VowoHUlXWvIBvLkEvzffbuP/LSedhwyOyty7TyK4RnBjreu8bELKbvQy1V
	/P1jPvjQ+C83CN78kWiMo5kPoVbp5MS8Ge3jcnaYm05pxma9T+nZzReZ0O73I9Z2p8A==
X-Gm-Gg: AYBFou3+kwn27s7KI1C56EGJ4FZtxSRPScscAyzUkWdBZO5RIubJAcijYd60u11ddD+
	7pD1Xo7ZOeslNxVm1LHRV3LwPdLq/0em/QupIyHxPZkJng1gbNP0ZRaKz0n7YTgffjNWmgu1tYP
	72pMLkeVCFY6bE7qCgsh/IJDfcybO/c0cZ50FrFIaueT/1fda2v7jeM822gOwfTKeV1LQUNpabt
	qtPNinLYupJQkFpOU3kbYVI6833S8r218MkN4tpkrQuYcX+dywzSO91Qq/jvYpZznMPA7/zr9Bm
	Mfz+kfV0AqixatRFz0PVA13R4NEqN0Kfidjq2I/a16vPWwOjgQl8CA0UsHuuKx1lQHpozp4gel0
	JZKSCrC1whOYhFYpF4Ob2nJ0KMvUKxwgyVvPA2QWKrf/0phNi1fN7csAhkUG7oKAOxayn4xNIZV
	hoDsrB6wxkfJhHHqv4IapPljK+2s0=
X-Received: by 2002:a05:7022:f50a:b0:149:50cb:2175 with SMTP id a92af1059eb24-1ac5cb1881bmr15551207c88.33.1793655578858;
        Mon, 02 Nov 2026 13:39:38 -0800 (PST)
X-Received: by 2002:a05:7022:f50a:b0:149:50cb:2175 with SMTP id a92af1059eb24-1ac5cb1881bmr15551155c88.33.1793655578052;
        Mon, 02 Nov 2026 13:39:38 -0800 (PST)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42a61a0csm47056885eec.22.2026.11.02.13.39.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 13:39:37 -0800 (PST)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3] phy: qcom-mipi-csi2: Add support for single power-domain SoCs
Date: Mon,  2 Nov 2026 13:39:36 -0800
Message-Id: <20261102213936.1251316-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: V07-TTLNL7ZgHIA4ozthdxZ1Ibxr6U7A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA4NiBTYWx0ZWRfX23xTmjvOUHz0
 juXYf4+5z89oMxPyBvSiwnYV2m7VGpOAicOJMkGDZwpdH90dVki6B+XyGzEJw6NjmwOavAN3aXf
 BqJFBWCI86nlT8HBVfz8SSV7cMjEe0kjn9uNJ4K68wNeBfMy+w9DqJwMS0P3UWIRf9r7FZJCrpN
 L4LjHqCFFjP3jzjMUDQqq7vpznyMoSjfNT0k0PfT/jn/lZlqI0hqdt0ei6Y6hjG4QaUdo9Hj7cM
 76LBtE3VEg1wcmIJUceRpm/3f2IQaMsnAsAgneCYHI8dz9/JSnb7OmtQv1+H9LIsKzoRxP7La2r
 hQT4rblchO9m/2ybuybZjDrlRgkUUJJOFz2sNY9aNfh6aZMrBeINQLBWDKPmx+PCtwmFXhwlij7
 7LTExFPcQ5Gw6OgcOTUoj6x1ueR7vu8xPNdN8KSShuZdPx6k+3tZtLIRlm26voQKBQFxxzuCiqV
 jRGXKTyGSxOgiPBJk4Q==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA4NiBTYWx0ZWRfXxoRjS5JKnPuW
 W3RBRM20q5WyApBN0etxDvAq37hNM9Tr+3x7E/iA69zOjl/aQXn5iRXBT0R512OlSGfqgAb5rHx
 IWBe3tw559ApEIw89KlwD4/5YWxCRl4=
X-Proofpoint-GUID: V07-TTLNL7ZgHIA4ozthdxZ1Ibxr6U7A
X-Authority-Analysis: v=2.4 cv=NZlzRGD4 c=1 sm=1 tr=0 ts=6ae9031c cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=szogs_k01QmFkf2JtiMA:9 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_06,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 phishscore=0 priorityscore=1501 suspectscore=0
 clxscore=1015 adultscore=0 lowpriorityscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020086

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

devm_pm_domain_attach_list() returns the number of attached
power-domains on success, so a bare "ret < 0" check in probe() is not
enough to catch the case where it succeeds without actually attaching
any domains. phy_qcom_mipi_csi2_attach_pm_domains() now also checks for
that case directly and reports -ENODEV, keeping probe()'s own check
unchanged.

Reviewed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../phy/qualcomm/phy-qcom-mipi-csi2-core.c    | 25 +++++++++++--------
 1 file changed, 15 insertions(+), 10 deletions(-)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..269232499fca 100644
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
 
@@ -231,7 +231,11 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 {
 	struct dev_pm_domain_attach_data pd_data = { 0 };
 	const char **pd_names;
-	int i;
+	int i, ret;
+
+	/* Single power-domain devices are already attached by the bus core. */
+	if (csi2phy->soc_cfg->num_genpds == 1)
+		return dev_pm_domain_attach(csi2phy->dev, 0);
 
 	pd_names = devm_kzalloc(csi2phy->dev,
 				sizeof(char *) * csi2phy->soc_cfg->num_genpds,
@@ -245,8 +249,12 @@ static int phy_qcom_mipi_csi2_attach_pm_domains(struct mipi_csi2phy_device *csi2
 	pd_data.pd_names = pd_names;
 	pd_data.num_pd_names = csi2phy->soc_cfg->num_genpds;
 
-	return devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
-					  &csi2phy->pd_list);
+	ret = devm_pm_domain_attach_list(csi2phy->dev, &pd_data,
+					 &csi2phy->pd_list);
+	if (ret < 0)
+		return ret;
+
+	return 0;
 }
 
 static int phy_qcom_mipi_csi2_parse_routing(struct mipi_csi2phy_device *csi2phy)
@@ -369,11 +377,8 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
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

