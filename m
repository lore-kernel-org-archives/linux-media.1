Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792898251;
	b=As2BWG2Kljytp2GveduDtqnGB3XC5BIiB2rxJserLbVgaBImUNILc3wAeStJ0Ck3Y3rm
	 DvxMPlUJNRF2Mxsbt5Z2Tvctr2KncGfBsV+vscNydMfLQ2aXov2TH4+9i7a5D/7Pte8JL
	 l96QGIIixC57+9XsCNl+onQPZqZ7NGfCxzPisxtpIdWBi6Yq0cgpXJ+ElPJ5wYXhQo1q3
	 kJTH6JGtaHCTMxUhzDW7Zinm7t5Zmex/RmbbkiU6G7Ht/i1sGLXWJNujco2MKLZ9SD49V
	 YG+VoXpatYzBwDIPTsBxFoA0gchaG+aPNfQKVLJmHa5VDeyRtt/jLGngvWSjucuxHpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792898251;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
	b=sT4W4lY31ZELeYI60nZmYlg7oUOaLHd7FCUZB83ARiU/l2CY44gRMR2E+a9dfQn6hv3W
	 svRiBUOqyQrUtZOFPXLuYvDAYuQ7cZB9y3pYAsuk4W7BKoLg3n+5L7HWrib3pnopMV26c
	 rgU2Cc9KGsG5NoS6D3ttvtXSb6PkshZA/g7ZOrI/vliPA3I5dUchH+j0tOvvOTz+7oC2W
	 TtJqLiN+5t9gsQ20vBsRzQCIEzO/43z4Ou1lzkSj9aYoDbKuTTdiqhJh1lCqVSU5AsdJX
	 kaFHZkgoIrhluo1ur6oAsxkCRdOcgPThjq0rCazVrG51rwlMCRcSt2slS0FlyRhn4tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0NxnS4q;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAbk7CE7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67B960A2609
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A67B960A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0NxnS4q;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=VAbk7CE7
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69P17El63666242
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=K0NxnS4qiKGsicvn
	gO/yo4GACPhn7eiaXAZFRGJ0TsREzYjJjpoG64CL1T0/LaoQBHoIzO5Obhxefqpw
	vmrdlnjPWNIp/QCGMnCzjGTZknvlKhVWo0mjVcoPG3BjpzOkAAMKTgz8woSsRUt8
	HnUwve/FbAPGpJCBm1n60mepHHZfrgSlUy76VUtVkvqKOo7wyTqGlmN5DHu3w809
	4pC6P10vaoqAl2SQ8eL+Hk996k1gMLJwbWu80m910H1JwaThoYbYseu6uD0T0eI9
	NjJ20kKpHoey+5dR1eioX6kaU5tmtcuuLpxE5lzeOffbLrYiJS8IOfrVRg17+9+k
	eIY6zw==
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm8xjcbt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 25 Oct 2026 03:17:29 +0000 (GMT)
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-3552883bd19so7350415eec.1
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 20:17:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792898249; x=1793503049; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=VAbk7CE7hC6xcskeyMypExVqeG9wCZpHHdtyT8b/+fwJW3xH4eyxkH/E+eoSiFAc0A
         iOwdx/Mj3tBxIxfFTo0NPE6iyrST37ClVhWXUgxqmJmbVNTJaYroj/7NppkVoTn8OqrV
         wPUHkLYXY/a1UEJPSO1fNvWAtUN2iLc20jQk8jkmeHr26cYIAph7/6rTKOwOPpGWx5rP
         kF4OR1UACmsAaqhzYKytWiharWW7uz7QaNc3TPXCiMuCy8OWs8iLkn31lOWGMSyTD+TJ
         ea0fdZw6Tp2S/g/oJDcGBPIV8jTAMI+Hq5tFDt5dYyxj5JTXhBSzjMBVv+LQ06MmUiCm
         nwGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792898249; x=1793503049;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=QJW8E1s3hFtLma1xGyyCgwPc+o7n0edOIHDurGeQ3dbIDJEdeY2i+ZqostrlghSsj7
         XmgRsdVyht+WdJm4lMqdbLaxxsgb+/8k2Quy2R8iTsUXvM63bQvxZUIknkRT2a/TdSVI
         CzvfJ5skLSEtvQtoqq5IeMDRGEgck25nmSW4kVd73+13SHHnlU4Cpp1+WCTUudIszFuK
         o20IgQxQgYUPf/PXo4j7d2BDb+ubB1u54UT4ozbYr2jap1S7RRPAW0OZxeZt8x5jBlEg
         jUKhYlv4diEcnv7/cHL+rv7E6AvR2K/tXEUglY5nUTin86UNfRQanCd+1NuUjZYd6AaN
         dK7A==
X-Forwarded-Encrypted: i=1; AKwUvBxxrQfZylg7VkiRr70kfrzfbtjprq6JCu32XbTOsJdCaBxsa0/Mh5MC5SXT5J3XTvGTYo9nxrVm8V9/gg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLMA90ANMThYHu2TdX2iZtBTtK6CiLmrl0Hsvdtq+I5piacsox6
	C5EOeQ6nfLffP+b0OLivv96jbPNKV/Xm1KiCfYWcC+f7RuK3pmlpNN7kW1e5Xz7N7wgNhfPtGQL
	BwnnPDiyBYCFmpjbAFpnDSBOgu6cs9BEpwHrKnjfWoJqWXSpdr7saPXCGOweVBlyTFg==
X-Gm-Gg: AYBFou3r/6YpXHaGfigdFof0935PlmVNn2pgrAZi+0QCBK8QPmPFC+L9V0TvMEMLkK2
	rxemifyr7T9tp/RO4+RrYLxWtMmKVdCqKF6cZrsV/ufp+x/GsOQmdqAbKTKg79pAPUgNqQuEhsj
	c5ubDztE6iimfoimDhHNtgAOzN5z/usEwL5opBmg5BZ6NT0JwzCTExJWvAoueitSF+nMcqeXoev
	Ja/hGGPYTJHUqhWejazxUiyloeOiuU1wJ+K8Q62a/r4oxOCacdsQobLcY2Cf2WDuT6zaexIguF/
	gMIQBOxnPHTEu1I2WWgBdIN+9yTZFuYekv7zfy+e/ilu6VZrnwyqpiMH11GBdLrS0ma75As6elQ
	4sAL7nxCqfE8jUmZwzc4bY6OZqOSy+HkBcxVRlIUMFGeVA4lp0vMoA5oTitI14QEbz1FVYEuoGJ
	bs8zInT6copw==
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2491803eec.11.1792898248562;
        Sat, 24 Oct 2026 20:17:28 -0700 (PDT)
X-Received: by 2002:a05:693c:66cf:20b0:369:f18f:34ab with SMTP id 5a478bee46e88-369f18f376amr2491774eec.11.1792898247987;
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-369e8ec50bcsm24133054eec.23.2026.10.24.20.17.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 20:17:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Sat, 24 Oct 2026 20:17:22 -0700
Subject: [PATCH v22 03/14] phy: qcom-mipi-csi2: Add Kaanapali support
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-kaanapali-camss-v22-3-7da3ea49c8a1@oss.qualcomm.com>
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
In-Reply-To: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-GUID: jzS-nIh6FggX-2mt1tWpMzFGjbp6o0k1
X-Authority-Analysis: v=2.4 cv=Ra0FmFtv c=1 sm=1 tr=0 ts=6add74c9 cx=c_pps
 a=Uww141gWH0fZj/3QKPojxA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=PxkB5W3o20Ba91AHUih5:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXx4NIW0IVbSYq
 cR/z9xj2bywZmajsZhBxwOgOVYmdJOYSKO2iotjz4v22dwlSaDezy6m5y8aNl7XSyaHFdkXUY/3
 n1/cOx2EdpHrewTdA/Tg77aZMCXd8zQ=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI1MDAxMiBTYWx0ZWRfXyRZTGMPu+eEF
 lf5icc3+J+DXIgSuGCoGCsCPI0f8NtHFylUGiXfcDURpNsOCbVFjIWNRFInRUx1rVgLWVHkgB7p
 4ZdwdWvWSiLC52KLnJw69ftSrjhU0L1hw5X+UrGsyjATn4TF99Ixm7VVeWIXBf7QNh8RNwvpXDF
 2748ru8N4IM1vxZOsWOpdhq+cuB6KiNgNoQPa8yC0bEdj+Nwq9ocfSG4LSZvjbJMajJrjkY+FXi
 +olg+akAO5dvZGDpLdeMywBMwkVaNSCNNb2KqAw+QgYb91VcpXqhmEuQZruAQrVUAy9FCQmv5Us
 Yv6DKmkAzKZdM/xWD9d96B5Ji8nFBejkNy6Wzq2rY6vSMSIx2GuWxdIRU3nMJX2M0M2grK0pYxS
 Pcs6X8Y4/lFmQqoGOILW+6V8ue2BFhEGaOKxNsm83kVO+n8H9WABc+jRX2giGZ/5qnW6IThNEeb
 vvglO7RGTjAxAUiO8wA==
X-Proofpoint-ORIG-GUID: jzS-nIh6FggX-2mt1tWpMzFGjbp6o0k1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-25_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 suspectscore=0 bulkscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610250012

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..658a39463104 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -389,3 +389,19 @@ const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.genpds = x1e_genpds,
 	.num_genpds = ARRAY_SIZE(x1e_genpds),
 };
+
+const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali = {
+	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
+	.reg_info = {
+		.init_seq = lane_regs_x1e80100,
+		.lane_array_size = ARRAY_SIZE(lane_regs_x1e80100),
+		.common_regs_offset = 0x1000,
+		.common_status_offset = 0x138,
+	},
+	.supply_names = (const char **)x1e_supplies,
+	.num_supplies = ARRAY_SIZE(x1e_supplies),
+	.clk_names = (const char **)x1e_clks,
+	.num_clk = ARRAY_SIZE(x1e_clks),
+	.genpds = x1e_genpds,
+	.num_genpds = ARRAY_SIZE(x1e_genpds),
+};
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index c0a4fa20eaf0..aff9e66f0352 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -444,6 +444,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ }
 };
 MODULE_DEVICE_TABLE(of, phy_qcom_mipi_csi2_of_match_table);
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..2355a1db9b94 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -94,5 +94,6 @@ struct mipi_csi2phy_device {
 };
 
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

