Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793164207;
	b=yNc+UZuzVXXGP7am2bCpii8zD6vGPD/rurSedcRD3VCTKI6mfgeKYEkvVVCS9jyd5178
	 0mIj+PR04Zq7isL/uELnk0/U/r11gAr+N7rwvAJgsIb6ichbOU74jEDlMs5eVl0gQq+OV
	 AHkrhLopBYF4RlC4wvMRNx2i8M8TB51dUD7HgCh25MAjqX510uanR57CysjVxAfKB5MYz
	 gkYl1G6wwqIDEU8vswF615m91AakCrS+f7hC/6kdopziKV0cBvikwS6EDDbyJP8p1M9Et
	 HfIVCoC0ug97bqZUk1Kf4uNRTmf8mOZkMorzg66INEKp5eSJsaJXm/rAjSAkkQUjIYg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793164207;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
	b=PpdW7U/BO2/vTjPsoj/K85nI76CKL/lz174ebmNQla9qlRAgWsULW3Mn09ZuN/F5D9BO
	 ORzxi4Wvu5s9w+dzUbEDkQp8UWRo1ryqonXTEE1A0uV6IDPiDcJ/v7mwpRagskF6KO8GW
	 Ybzku8DpX0fMaA733FKbChZCH09ez5/OkLXbAVQ5yWAvoFeU0XGHvuYeTH2EV1ABbvWTw
	 H71aO8Ayn4a5/omuioxfguZO62TKRH1D+8C462CA1huDNZIVb5bxSVpBS9c6cJYGiG02d
	 9i36CvmngPOKxSRB5eXTeNMZILxH3rJRHJ3U34UqRXz4+MFmqrzvD9lgVspxdp2ienA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5AEDCL9;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbN5iZmG;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 820E9606A31E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:10:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 820E9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=T5AEDCL9;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BbN5iZmG
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S4Padq059318
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUP
	eC8YB9yg=; b=T5AEDCL9mjhVY8bYsqtWdIFYc+kh1OrWEAG6OvdR6gzaZLK0BaF
	DDrAYsSYdPAaIP8D9YE97RmKoExz52lul6kbIWXsAW/56tl554kzFVpiIHR0hl6y
	+JChosL+MyI/Z0P75bnnVFPVsQsBNaCNk37r0EdmwJY0Hd2UJl8xGpZdH1rNNrZ+
	NUb6ufob3H+eOorb6RfL9CvVwYnpPX4bMJL8qJVfdCMx2TC9r4FuIhsZVDVnsRTn
	ZqIrntEUqc/Ovi1oW9mVGAiwRkXFrKBZcZT++kmtV0tcsHB+ROK7zBomfOO9fI0F
	0fDT3a4SVXcERFtzfZVCo3Fo+kQi/YzDuuw==
Received: from mail-oo1-f70.google.com (mail-oo1-f70.google.com [209.85.161.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjy672jdc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:10:03 +0000 (GMT)
Received: by mail-oo1-f70.google.com with SMTP id 006d021491bc7-6f508fd6f44so560729eaf.0
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 22:10:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793164203; x=1793769003; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
        b=BbN5iZmGGxdrbSDSU8seK3dITQtJoacUIU9NFSYWZKhE7rHasupqFhcqdx58JveB8k
         1Bw07Q0FVvj9rstcnfSJm3HfCi7vcUdMKZSGBbGdsoefiXfHB9+nlzRudjUr1IXqdBQ4
         Yf3wmDhz/RaaZ5rZg49IIHOg8lrqpMNWHVJKO7zFBhrwb7rY8D0XoWk1H1YPSUVBu3AE
         OX0gnaUmi2QPvlN/BwPIH3MhplD51h5iifb+ThvoIpHIULKTiJpgK5qJcHYGS/3BYCVI
         auPyThVUeWovYReN0UgCYj8+4fHSS0rXNYQsGFshMQPEOVr0RIf9iCJwng30o0lDJ6WJ
         dYSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793164203; x=1793769003;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=e5W6PLruHf5ReVXisrJnJK3zbKxib4hojUPeC8YB9yg=;
        b=UD1hcFBqGuu3FW5LqkA9zuhys9lv+lTdZTRMsShasTPOGnfMAIR0Bb2ovCH/FNBrXi
         053F9uzXTYbX+5qBZnBRwPXNLUHMOOAw4B/BZVjM/KqZ7wBEBi+78+Q6gYsvytPI7PwE
         C2L1vfmxs5m7CnYD/T1Vyn/Zcd4dmRYFpzaeEF7PEAWiGrVt9mAL50yrEnWA7TFdXIWc
         LbEqJPCUUDsnaIOCguTf0Yel+fujF0uxDst9HK0daZxnx9ppNjG9q0EheliWUovd4uX3
         JBHuK2BxJSY7Z599Nw5eIEUeAa5GrSL1i/Gpv+WRCbHer7CihaiNHivN3IcErKuSNxfC
         +keQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/DGkguQ5CgX3K43JTMudcUxGVgX9R48VNfcWiiui0o/12jScYMFrFblfCgtqMxHlQKK0MkrBVxNn27Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKHlV8cLxNGylSe3uzMQZLyCBLayNLVktCQ6P5p7Vs3r/XSg/JK
	jUGckbQzTTEG4JeWwZROotxhrBKW2xqa5cZaIQlCc8hdP05TUMornNmWCVDqg8Hdag37nzsmJxw
	X0bxhobO7lKdyLteSctMN0u1A8n3QBSsCGlGHBNTJHLaDABgbnXz3F2rC51jLShp9/w==
X-Gm-Gg: AYBFou2nFSH6pDcZb71192+ZdJdZdiUG0QRs58XKXFpygLiZMy8Es4wcpUiI/r5PBOJ
	//KLnlrzqa/PVZlzAJABHTDvQDFqKOjAnGJjOOI9WqiqKzcyfS8mxt6UaVEPqDaxx4wokyq/DED
	qSIpZzpOkx5jKC/BU2Dcdrq1L9u+tYvmXAEOLRi1tUyqXj9RjQ+0uS3KL0uKqWfeocFoC0CSA/q
	l4/ALVyDgiHTGEYMqqKiukPC6luP0j1eh4B5QVCAmT+6ymPz9lewUEYpFqVmOBF/Xnwef4Qnu84
	j5fx1ei1yrXjtsOu/2UQIn/81FW/9bTlbSURRicCdF2lIUtmKn9ofZ1dz1q8EauX59Ggq7A9iTE
	gxFN65nQduWCaXrh9pdpgjPpvLE6PiaimPiYSCUYkn+QzuCej4dqj2Qxu4WFGfAr6D9xwToCap8
	oDMLVUppDk1S0fAsd9iZ/dNzIZbGC8
X-Received: by 2002:a05:6820:55d7:20b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-713edca6cffmr498240eaf.34.1793164203237;
        Tue, 27 Oct 2026 22:10:03 -0700 (PDT)
X-Received: by 2002:a05:6820:55d7:20b0:6e0:e81:e5e8 with SMTP id 006d021491bc7-713edca6cffmr498230eaf.34.1793164202777;
        Tue, 27 Oct 2026 22:10:02 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85b1f436687sm650864a34.8.2026.10.27.22.10.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 22:10:02 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: kernel@oss.qualcomm.com, Bryan O'Donoghue <bod@kernel.org>
Cc: gjorgji.rosikopulos@oss.qualcomm.com,
        hariram.purushothaman@oss.qualcomm.com, akapatra@quicinc.com,
        jigarkumar.zala@oss.qualcomm.com, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v2] phy: qcom-mipi-csi2: Add support for single power-domain SoCs
Date: Tue, 27 Oct 2026 22:10:00 -0700
Message-Id: <20261028051000.2650923-1-anusha.nandi@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: CWIj00B0_ujN_-q1JNWoFQq2kHcZR21w
X-Authority-Analysis: v=2.4 cv=QvfLTlyd c=1 sm=1 tr=0 ts=6ae183ab cx=c_pps
 a=lkkFf9KBb43tY3aOjL++dA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=uorg23y0nfgcnAkg4s0A:9 a=k4UEASGLJojhI9HsvVT1:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAyMCBTYWx0ZWRfX5tc+EcLeHbbA
 e5DReAVAKyTAuEcKqbyUomCbTwU7hSlv1UK8D4RftjV79ON0qAbJ6P0G4nGxflnNB04x09BYXM+
 iOgscCMZgvGl3uGsNAw3OXFV9KS6HdQ=
X-Proofpoint-GUID: CWIj00B0_ujN_-q1JNWoFQq2kHcZR21w
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAyMCBTYWx0ZWRfX3/L7gtBXiP35
 cLoo4t4rCR8J4zLj5+TasJhI/KxratIrTLdrMZQKMCvgoNXUrXskiju1Owgi7e416SP0e0SX+vk
 O0rOgJkEwaj+qHKJGWU18T5AvOpTk7wGI2eKnZteWQGRe6t9WtNQEgmUE9pV7v4fW9p/boZOZrX
 zlGZCjJB6BNmHZVVDzIl2DUn3qD4kpNpqVjqt56VVblwgcEAeoL/qartDDdkFOdaQzawjTlyoYY
 7/AED0i5mAmvqaz4mebcnC9lXYBv5s3MciPf6ZtkkMw9Ic6R5bk+C3jmkLY53zgdRsXkfbswnyT
 xKpsS9d6ALPXQRQnMwTjHknmNvJ46NtCD1tEZvbL8psnn+RrX6RPB+PSCMdLylCLC6uPo2rLPD1
 cTbiL2r/AiWnHkdAJp7qBSxu9uvkXpVoPgUQRc2eQOMhNVlmyTRnRxLYD7X8UbMz4Amz3hls4uh
 iAcp2W9J9An4K6Dc8Og==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 spamscore=0 impostorscore=0 clxscore=1015 adultscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280020

sa8775p, qcs8300 and sc7280 each list exactly one power-domain ("top")
on the CSI2 PHY node. For a device with a single power-domain phandle,
the generic platform-bus code (platform_probe() ->
dev_pm_domain_attach()) auto-attaches it via genpd_dev_pm_attach()
before the driver's own probe() runs. phy_qcom_mipi_csi2_probe() then
unconditionally calls devm_pm_domain_attach_list(), which fails with
-EEXIST because dev->pm_domain is already set, and the driver treats
that as fatal:

  qcom-mipi-csi2-phy ace6000.phy: error -EEXIST: Failed to attach
  power-domain list
  qcom-mipi-csi2-phy ace6000.phy: probe with driver qcom-mipi-csi2-phy
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

