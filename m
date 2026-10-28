Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793200870;
	b=ecGyTAb7w1tQxkleLKRB6D/Hy62bwpM69HpEAIepM06P5EtEpi/o2L/kv/PQKcA+QzFW
	 H/HSKMBIpZay1i02b9wTs7JWHyeTVPXMSxCgVguH2QHYslZ8fW+keZSjRfXkj5XYUSWf4
	 oFTc90OGn3oA9619OCuvCT9BzN+u+dkczVyO2ne6qgNd7WCezk2zpsusHvm22BbXoKatB
	 YmdXBRD5x+3RIA9KZGqUAHJvATqexg+a2tlUZKuBr+8JX8S2t9fIictFf2D+lJafcJKlu
	 TvW/9ULQp3rsliE7mG3melYisKeda/Qs/h44INfIUfFO5epz8WC5UA7YOQ2/9bttvYw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793200870;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
	b=q/AZiI99ryFp1LVzSGLMQVpT9YVjr5ghCqT/cJiwl17HZmaBQNDPSKLhQGyVEQgRlceG
	 rtR71kBB3uEBorOUVOr5FDUUxnZwWdSdyNKqVQzqB6efs6pFcNcVKHKwA6OHMg1jDR5Md
	 YFwnuVmtlnjk9tWJhH0HjAZliQEDW1Zt0cTcOBYlXMr5JbWHvbZFOQ8Akv+Jo+iB8h2or
	 EO6yzW9Uz3dRkfi36rejYZ2CaWolIPBkcn01uYnFh2x/G5bHxECU2qyyIE6WATAL7Eexv
	 KQc6UClTMGHQzA0Y5QNAk5m2hio6dLwKzvxFeW+nOckO6O5PPstMimBydnY3cevgrAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="mZbUf/nG";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB58606A332
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5DB58606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mZbUf/nG;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XHwGfAqh
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SFAZS81458805
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=; b=mZbUf/nGhN1KTNs0
	KQnai4oOh0VL32rWnYxOUmaLRkXEw+m3FYHCLQDAZSEt+hvET5E2g+3XXnZA2KCz
	gwHuF5DeEMIFuPacHKlzv0nUvABbChp13NgcHZlGEDK+km2uMP2IWeiCWb6b8war
	7K7KZQz8fzNf2JeUm3h4456A5s0rn4LWL91dbGS6t75Aj1qzTAaLc+S1HrPVKSWF
	SSkeaIkXpe+g05gQ7YPs4u8i3lkmYUBHojBhw945msyR47P0H3WrUnleL/isdRcQ
	+2tYJiJ8DFZA6guWvYIZYpaljJeIZO0aE7KWa0zto7O4v+4WJ08YEmZtsdVlYUH4
	IZmKxA==
Received: from mail-yw1-f200.google.com (mail-yw1-f200.google.com [209.85.128.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk82ttrn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 15:21:09 +0000 (GMT)
Received: by mail-yw1-f200.google.com with SMTP id 00721157ae682-8ace1d95f5eso401997b3.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 08:21:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793200869; x=1793805669; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=XHwGfAqhRbL6FWck5/aRfJmkhAQT4/7oeN5BpRhKisp1lNn31xxKiFDV+dgjBWQoEu
         SCzp9rk1D1YnO3HNKbaDFmGSA5oS/IPfITpADH8H9olMMx1eOt3NckQbDUn7EDr4OBiA
         tptB4RrQCu7k1VjNt1qAnHQcCDLagoZGNH/lZfzeB5y6ZZ43qMAXcaAdt3l0vVHEWt+f
         Jp06UiwLGvdS6e9BsuI93dUfGIpcLlNohiA8QS4l8RY6urS+bHwR1h0UYI3RdLoKeWSr
         k7EoSA2q7v8gm0+gf9/Y4eQ0Fm1M8yayEiq2CJu2exVfG16or6X3hJ6ssi2zSoEb78Hh
         KzGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793200869; x=1793805669;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WC8KaNzexqILvj+nwYYKocvsByBerULznJgP9Q96RzY=;
        b=uV037+Eci1iMq+um+pbqjp9d1nG+tXHsJ7aejsUC7KEQ0Yrq6smQ0u+qQkftATsgRX
         Vwi/KmeRTEzkjZbIMT0JKHMLvMBBWUYY+hZby5mLMQR/7wl17TIg7CD2RmQ2uTmI7RxH
         Y7oie3N8tALoXpoG5AHoYxvMymzqZcyM2ze35wra+CWesWVnvf4i5VPdiXpSdQ6AdIGT
         zYWlQe4GedAwl5aA+HrnYHn6ZQd1uK6FpJB5Inrx4kRdDDifpESvrwgX8jL8CbFG4SAy
         /mw1gYRMQBbXJjdsOHWULIrmr0KpVomhoC/+5OxHHmFx2tyMBVyim+KXJIWlH+ZEcQ3B
         t+ug==
X-Forwarded-Encrypted: i=1; AKwUvBzy21/p2JnsKjJuWESD2UZCYWJ7I1qI+jdU3KxuXJsVNqxEXQEjwlQKl3aVOOEhDn4iWPcWnlVsRmryqA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIhEH/gKeL/eTn0vWH+fBVED8Rf56NxXM3zJSJxEi3dCnSMEzTF
	XKSx+HoC1S+h5t58sTdTqckDnwgbqRNTfUDN3/OltxlutBBUx0WeNotMofF5FOzSJwOx8p4PZj/
	I7l06Lsef/0D8Kf7SnUUa6rGwvXG1/U5Oy9DWM3A8MIh21uA7MHx4+KLx5yv2A2udmQ==
X-Gm-Gg: AYBFou3YWEpjADoyxKyo7zI63SXW9SkI9Fvxi7ihU/qQrLMUO1fxJCnWsiaidhVNo+V
	nwoZSt01hstpCb9lEXOaTscwoNc9XoyFLvmkrCLsz1fvTixjuurXMGNltcWl7dJNNTjGUE723M6
	Mc7zukLyjw0bMNu3cKdH3ybVSNix0voPGMv3UJONFXoJrmqwBvZ2cxJxzaFSHqtMIdprizFmQWy
	6si42o6eH9mU4jBN3nO90+iuQ6jn+i1uf3NAIp8TC/Wyi9YQvneGYEmx/Jy9ML56ancRhHkz1Ir
	zjDBz6yDXXrIT0KkAQi2NkKo4/jBVVCFDQlOpE6yfyVoAdJVyBrEX/PmFXWeMz4IfdCbHIItoqG
	8+UQUW2JHgE8c2QRaekOPLvIcsRZMq/zvfNPI9mi3wFohkY0VteqbZX4rC4x2j9xNdJLgW9vn/H
	dlNnuqKUi9jR6JUFmKIR1JuxtwjDYZ0nn96BrmWaG9TICF2DlXRmfVjmnzAorR
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290682d50.31.1793200868855;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
X-Received: by 2002:a05:690e:13ce:b0:679:8c43:a140 with SMTP id 956f58d0204a3-67a7bbf9a0cmr2290626d50.31.1793200868178;
        Wed, 28 Oct 2026 08:21:08 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a803cdd1asm1107541d50.4.2026.10.28.08.20.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 08:20:58 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 08:20:37 -0700
Subject: [PATCH v23 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261028-kaanapali-camss-v23-3-95f250b18612@oss.qualcomm.com>
References: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
In-Reply-To: <20261028-kaanapali-camss-v23-0-95f250b18612@oss.qualcomm.com>
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
X-Proofpoint-GUID: LptzkeiVC3e2CS4Y6W5qwTlynKWdTFTT
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfXz9JYC6pHsjTH
 HsUQmWXRYDtOWOoeweKJPF8GGl3SmDmfOKy93SuXw9vb2zdZXS6gEL4D9xl1qwxqFKBNeTD4Mj+
 V/IdnSfyEYOWH5Gmfjrtve6/jOZQ2YY=
X-Authority-Analysis: v=2.4 cv=Tr1zFzXh c=1 sm=1 tr=0 ts=6ae212e5 cx=c_pps
 a=NMvoxGxYzVyQPkMeJjVPKg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=kLokIza1BN8a-hAJ3hfR:22
X-Proofpoint-ORIG-GUID: LptzkeiVC3e2CS4Y6W5qwTlynKWdTFTT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA2MSBTYWx0ZWRfX/AOasHhye+Sa
 CR5D9J7nq2Pm+H7SF93HIhilWHbLdamx2qibGMyOEnhMYmi5SUBEd6eT34wVXS5YJO9E1OHs9OK
 1SgnIv4ozG9ZfApC9W0bVyP2mLZiPzqMuMduKdVXzmLGSbXzyik7gLBGm8/diPxrbkc9YzRxuU6
 dK/EnIroxjouqE5PnPwSiMiy1QQ8iv+HmY94AuOiBjYCZvkyahctx4YoWUdOPS0VwgGHhYhrkRb
 b3v0KqBv4plDsin3rwAvvhFJlOlNm+aOCnzJHEV6dKwHRCBPh/hPyejPIs/bkY1hN5VdgBBVsYM
 Hg0ppAs8xJtgdXDmsRO2jl31ihaZJ/mhHlJ0aj6qfS7YftBqPf7nargmFItjFwyTj+mbIbXKJY0
 f8Mf/JuDuzGIafVuj6sbPZb4UMX6uI41YhiKnQAgYnGxaGwm5SR2fSh3OQj1/GHc0m39oGcgEPn
 JkZ02NdNIprbkvCi3FQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0
 impostorscore=0 malwarescore=0 adultscore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280061

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

