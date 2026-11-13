Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794548041;
	b=JoIETRx8MOtRbK0UfxJy7W/OJja6IvuhXCHcR/5FvMA4Ba9FCYSRIWbcyydFuZCfMblR
	 UQmlD/DgHxrGXNKeV/zpBhBaSyvBWkthW7dMmRyhB6BA8HyJEWhnQgR5TP7V9iLGVbKNK
	 t8dflg49jIwAlX1MkB1B2l1Kz8l1VaZmT+g7HZQJKaIiXbtkLVsSxmwG+uMxUIFZJ61ik
	 O9uNxkrP2CsoIu+b4XTgLBCurYPsgWEMo5NAsocwrrhM8LEAGdm01+OgJlfHgS4wyp6LY
	 wxpAneZFyb12ljZOgdUe8Cmg/rTXZfX8lDH/NZOXxb26mdp50H6zT/rzUJ1f2A4pPcA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794548041;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
	b=Cmy+pzvK/otMB2Q4xC7TlX+Flku4GtT9Tss3pFuqvN+RLzuNYUC+xjpVtLucMXk4sU/4
	 Bl17cSH69RFGaYdrffJ9CM+tGSBCw4V/cI4j+dxQrLLbkUkRSH4bnSckZXdQCRYunFoiZ
	 msME6qzqxK6vhcrLg9Tn2keX3UNZ/HzG4t2k8XAnsudghY0DMlBlqTpj+fmdc8Vt4RX38
	 EhppVXpXM/pXooNzQysgfVszBtA3NH8vJMonTYKuEATpPmY3bNmjvEBKJ7zr+RBjJ9eCo
	 Y3SKPmDXXUnizSauQNKpgnXXifWX3Fx4IPvM3/x+9/9Df777uc0hTOK5UTguE/TCUnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2aPvc79;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBDrdS95;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E45460A2605
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E45460A2605
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=f2aPvc79;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=GBDrdS95
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD570AZ2618629
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=; b=f2aPvc79nLvTWKNM
	IxfETBKwhI6tCoNH/edqjV2tUBnIfCjrTaGER7Cp4ZoOgwRCK1ACqciq96qib9Fo
	5XQHMhQiKwWF+V47LNOJrNxEmUUo6d84ADe/PXSomfurk+OFNfxaw+nAbXe7yZGk
	WrVdUGqvlAa/oT0ITQF7VlMX+azY70OmSxeB2lx/A+CmumrR/euRtzEbwfx74fm/
	HDOweX5wr1TdxKg4L2Q2nDH+ZIDqdO0q9tl80n4Jyt7eH/AlWJey0PwG0+Of9aDY
	H5FKrn2a3TPEnj+ohfQB52/ywhxLb0tNBs87Pls2zZRxM9na1C9tedKgnphS6i3s
	CRGxjA==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwu2mrafe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 05:34:00 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-5682eb98dafso1058684b6e.0
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 21:34:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794548039; x=1795152839; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
        b=GBDrdS95xKRVNl7ieuHTdAxoGpZ1ha/f5LTLFp/zEtx1fzRORKYil7Ae45a1ixUoQA
         oMovWugQIET/uSDjFXeLRclMdc1de0aui7hcMQfVUBJjSoqUsuPuX+IQFTIX4RxzGFCP
         C2OvZUhMF7g6kt0d9rZtyfk/EeR+g7rHWdaqU5Y2mYToqhAnzFofN+/d3jLjgggMw3LF
         +UYlziDUgxtZbgclrIXmDtBt3EMsLYI5Hafl/8HW0uAH42G28ZXRBrWFWrUjBFnf2O7g
         aQ9Qf6NrFOdyArLgaJ9SegH/IPnk/SM5gBsFlmWU+/qzv52zU/73BKqJcOxg5aidwjOD
         b2+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794548039; x=1795152839;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hrrGUXvg5LDwt/d33DGTAK5iq0jDAdxvcOqzbPiJbqg=;
        b=sWZh8Fq39zfimMGOwM7fvPrpM5/EqoJ6IcssGfmnOR3BSofeQT8+ddn3xXGRCEJHYM
         2U7xEVFFCNozWAhTv1x9NB7F/pcavmxLbKRjSU+0F+rHkkPw08EyDi0x5W9FX0eq06bG
         e97klhzguIN0Aa8kOZBErJ/tlzyh+/mD5pkA1mSwcu/LLwP6kNIrdJyCySRe46WwF1ob
         xr8ZEk8zeDzTRdwSPNnbJimU5Rkwb+yTujAKtZml7MbfNpTV0UvBaDjtLnP+4hkbJ3+W
         qzke/0uxVkcKXTzOvtF9pAe+fPNZKPc8HSPeG+SbySu4IhO+AZEdbkfeAwYS+9X2PfSc
         Z9Gw==
X-Forwarded-Encrypted: i=1; AL+hErGoT2hnY/WoWAF2suSexE2xFCkPscnqlL6t3lVQ+f/mJJcVeUEF3Hk/xj49nnLy3HIoxsldCuFqHml+mw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/chKNnk0KO8/TytBt7PZbuFbVJ+ZJIfm5xrnlnnWu/4ooW9A0m
	m9pJB9LUVdktLDH/FSJMBQhALObc8egEPJCwJOoCuB6q8WURcUx4AG8g+TegY/68fwcdysn2App
	muWhDshrSs+z01QcZFlaAk9PThoJJ/U2kovjcWHTA4DLRSIzo6fi6iXCYuRgvHHKaoQ==
X-Gm-Gg: AYBFou3LIqZ7oejR/H9lHIpKSPOM1V53dot+hcg7HK0NYRfKnrNEqvxdvmtcnQ2lZLl
	AVSVItjjxQA4g2Vf4LI0DIVu0z17jHiaXkgA0HIKLD/nwuqc3OQAqpLK7hujJLa1wi4q0u0ZwuY
	aYD5dxrnZmDJPS892o6SJa0vgX1/bdFtICsMztg8TojH5uI/B6xUpUo4a9OMvxYdR/seEOs6oC4
	baM5HielaYXZbAwPez46L08JeEEoxepjdE3PSiWOWyK7EPi9fldvos6hIXRT9DprFFoeLOGncUu
	19nBETQv6tV4s3EFwufLj3nokU6V15tRS4/HYR/oKbettI9C56DZMkrLElXGTh11CblRUUY6RpM
	WcCQgeN27h7QsX+6r1hCEuPqAubgU+BaTHufQFXrJYQudbdZk9n9vzTr8mwSoETdyALPynOJifo
	XPrhot9Jsw7RUDcC2DnpVTwBeOf6jmC6BSUmKnCocurPxMrRflkSLfMVzQnuUZ
X-Received: by 2002:a05:6820:2228:b0:719:1627:6c0e with SMTP id 006d021491bc7-71ab4d06a4fmr994571eaf.5.1794548039433;
        Thu, 12 Nov 2026 21:33:59 -0800 (PST)
X-Received: by 2002:a05:6820:2228:b0:719:1627:6c0e with SMTP id 006d021491bc7-71ab4d06a4fmr994557eaf.5.1794548038963;
        Thu, 12 Nov 2026 21:33:58 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4afe22576bfsm803252fac.7.2026.11.12.21.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 21:33:58 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 21:33:35 -0800
Subject: [PATCH v25 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261112-kaanapali-camss-v25-3-1d709f57f370@oss.qualcomm.com>
References: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
In-Reply-To: <20261112-kaanapali-camss-v25-0-1d709f57f370@oss.qualcomm.com>
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
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.16.1-dev-17221
X-Proofpoint-ORIG-GUID: LrSAJ19bMISL7tbEwqyMT3DtbybzloDb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX2ee+jvfop1nx
 l/0H46M6UGFYFKM8IET+q7zFPy10mT59oN1HwzJzmEvyFAq6KmVujLIXL8udf0gV4qmPigqoRAk
 sSPRZxBOPKKJcHcFhGQFY6rQ9Ifr+sq1500HDAm976tKa4Zu7s+8uj435ZUDvD3qOB5G2Ot/OOt
 cHMIMkkGSl9UhAT+H5WCC+DajRURu1i/W/sprxP/nCy5tT00CqvY7J2U0x9d+GksFjTNCoX/Dc+
 Snk9GeGhYai1oDvqaBtJ9wtcZOnYqUSk19Cu3TPp7ZI8lVgwiurmBCGJAWXeP9qqjA7jQJEGaew
 ElqlteH9pX8Ui7V/kS6sgbO1D07JhZDn4+n/MGnmxPZkGh/oHDuVAXtmrFxO0RWxEtRxcsuLW2R
 P0/FXAyV9q4NVaYq5MQVi6pFV3YXUBpDQeL1pePwxisn1o0WZ4HUXBO6pwUhRHnbL9fbp9t8uvr
 /KTkl/0eWlVG1iygPwg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAyMSBTYWx0ZWRfX7klNtddeD4wN
 FQwJFLAsj1zIl5h1JPmClLLPwKp/q6wbbccwvEBiUEelmn/IcrWH/xQM3RIc4g+XhkJbKwT+cPd
 E7gDpCBQWuuCjkDqXj9Rk325awsO3Dc=
X-Authority-Analysis: v=2.4 cv=ddQVTnXe c=1 sm=1 tr=0 ts=6af6a148 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: LrSAJ19bMISL7tbEwqyMT3DtbybzloDb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130021

Add the Kaanapali 3nm configuration for the standalone CSI2 DPHY
driver, including the Kaanapali common status offset and power domain.

Reviewed-by: Bryan O'Donoghue <bod@kernel.org>
Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 ++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 3 files changed, 18 insertions(+)

diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
index 8cd331cfb4b3..ed40934d67ea 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c
@@ -374,6 +374,22 @@ static struct mipi_csi2_genpd x1e_genpds[] = {
 	{ .name = "mx", .scaled = true },
 };
 
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
+
 const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e = {
 	.ops = &phy_qcom_mipi_csi2_ops_3ph_1_0,
 	.reg_info = {
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
index e04bde03e278..165e3d026872 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -443,6 +443,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 }
 
 static const struct of_device_id phy_qcom_mipi_csi2_of_match_table[] = {
+	{ .compatible	= "qcom,kaanapali-csi2-phy", .data = &mipi_csi2_dphy_3nm_kaanapali },
 	{ .compatible	= "qcom,x1e80100-csi2-phy", .data = &mipi_csi2_dphy_4nm_x1e },
 	{ }
 };
diff --git a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
index d6366f809e51..832c8d048b77 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2.h
@@ -93,6 +93,7 @@ struct mipi_csi2phy_device {
 	u32 hw_version;
 };
 
+extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_3nm_kaanapali;
 extern const struct mipi_csi2phy_soc_cfg mipi_csi2_dphy_4nm_x1e;
 
 #endif /* __PHY_QCOM_MIPI_CSI2_H__ */

-- 
2.34.1

