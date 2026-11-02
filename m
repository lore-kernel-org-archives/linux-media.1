Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793616144;
	b=1fT9ilp+ufBriTx+E1O3yoVkmLmroAw4lxK0jxnLVQr9p+gdz2G9Nph58PlO5dQ1StuJ
	 TwM2NMQnP9JBBNLPJ71zzIJ1p1dwv+u82uhJeHPRwx/pf3oG5Dci84XQpJ9x7mOyY3R7Y
	 +kczdxoWvdPyBVSq/CT28WC7nnv3r38II0Hsb+rpGYYlAVCbcWor7FJmoBWp2GF5Ie3wL
	 Dh/H/h06SCuDJ9dG89RhMmqMm1ENNrkeDBicp9O8gW6NCzN8N1PcNysmoW80dslBX6Zpi
	 x8taugOaq9fGNPO6qsVUu1Tnzpzx7tkt6agxwSk8Xnyzv2hHBK8oS2VwUwGVFe9D3fA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793616144;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
	b=f4yteUsBKSrL8vI8yp7m9efLBYlr1kaABPFCe4zsgb4zZNJDDeLYDnNzmKdww8P85dzd
	 4PfpmY4TV0mjGLFrM5+QCBxBQCG5FHDRLI3QNE08FmmQDd7kVAggtSsK8OHCA7WLKUK4T
	 Dpr9qdOZUEGM511JuXRNQAJb+owglh1Fqea/wwvhHzVOJh1ImOcIssJgXfugfKQvYL1d9
	 zTzCoUt/F0yFjM2IG+YBMNbgzYzzai9IVzWGS2ZFsRhDK4cLCksD9Fi+y9PDVMTgqxDLJ
	 30iMLVL6YXhiVVBn90laIEaywKNHom209zeHMNu9ePYOiULC6Q7OXuhBTrCZViY4plA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9978B60A261A
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 10:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9978B60A261A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=pJUbaKvP;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=iqGmYOtZ
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A29B1Z74015067
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 10:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=; b=pJUbaKvPrrcSeGWp
	Fpdcp3GwLwIwJTuFEuG9cwnvINisD9IPIgcsII4SdQyGFX9xf6HahdObMi4g6XWu
	wcZ5OvC1vRXtFTk4RRwKgz0qz1Ycdgs1RpNX1/UQse7ItspMfZJwog593Wee7XZX
	xn6gICP5YSKNdURe/zwvfw1Jg47C9rR8bBJ2ap2E5ij9s+aAskQu3tJp7yEUKeGu
	ssg0XeQi6Kd7aMddybhXfM0lAq1PO2JMvg6C9W6AJZmu6N3qh52lqccPTQehqD1g
	9X2Xlz3nmcWG9ofUdq/unY5FE+Enb/Kb5WmbCyqAuTnQQERt81mgY4MLQHbKtOeb
	7X7k+g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com [209.85.167.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hn7b6pmfq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 10:42:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id 5614622812f47-4cc89e86e9eso3730196b6e.3
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 02:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793616142; x=1794220942; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=iqGmYOtZXJo/+xupZeV8JrfLw973pMHZB6ERSEAK0C5ZZif2Zs4tFyoK7DHV4UX8NT
         Qocw7vt0Xpkc+tHNeWK5E/0VWiOsiv9O8cLH4GPxGc47nF6QX8GEOEs0byB5sksmYzoU
         AojvrRfXDqFb94lmYQDjPAwWS5ImsXLzhAB4gj+RUgk46g5NzSGFLJ0m4tajiihR0HNt
         jHm7y+DdlR2Sw78UMjjlxwHucZMoEErpaky8HThBa0F89b1va4A4RteKhpmC0v28+93D
         VkmB69g4DsU5IEenJP1GDtjaCmu9hTl51/KECaMCVeNYUSbBp5lIKn8F6EVF2UktSq8O
         RRag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793616142; x=1794220942;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MID0gSdRFYEtOdMRf2Fnw6acFNQMV+62kE4jNStcaWI=;
        b=z6pbs+yvfNOmsMb3Lfn0w5IrtAZfVC4amuVHxH8YUkgC6rPrCszjj0dcG605OIw74x
         O5wIu/JJ2e0lmLMB9hRHvqeprojqHayCaATma86/qUnWyB+hUG041aFVwJWsm6Skei4S
         Vc4xpBOy56bJDVzNKF3jqbQOY+B6MEgQYGZjd6sE4l9d03+8F1Huprln0rREXK3U46Mk
         d7qi13gFIEcIMJaVXwbwAkOolw+dmtDAH3FVyi93N4RNpVlMMlIgeEN1wF5Pa8xJsc+l
         A1CkqM2uN2OLcjAz6n2GmA325oD6hDrwEtBWnOiTNdzDq5gu7bdrpcRWUWYRvalm9b5m
         9Olg==
X-Forwarded-Encrypted: i=1; AKwUvBy8DNn0QG7GoTie9I50TiOyKJIPLya7i2GpHOjIFplHCDNbJnpfYgWRSgtYj6dx2aGMX4RV0eSl2gJxsg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLU30hvSYxcbpbtEoNWyuSxKspa/N+vRwaQOpvXndC2PRN7l1LY
	AaZSsYD76Hwo+poR3UmF6KlN2/E9CJD+2XpwaiE/KbS1qvt/58/bZwM5SnEDkcKbHc5eNToKwfN
	C0OsLqOF1zxYeyN3r0VIMhs5MViucP11okaptdotZkycooP+iOnRmLFnFKselsZecWw==
X-Gm-Gg: AYBFou3AE+lsfXz/XBIHaa15kzwAZNIug+XritKgzjO5KwETbSoHp/RKkAjDUwXTEgH
	pzY0gt+7M+XS1db589W2qHdZXvZyeGFtrnNSCOw6XuWbMfXNd46i7WCYpW6uAgePvD9rec7Xgs0
	u8SJY5556EIh2iE7Gf/pK0wJGWnjnMYx1U5r+0CbN4AFD6jWuYLGxxF6uZZjlU0QoHmjVh8uDhh
	mw16Tdxz7cVGtKohAAoFIBx7iReifHKM3YVxflMeCAwtqsomkTo26RvVpXsqQAT7dpKu7WmfsHM
	xhYJYlWP8hDKWDV8G6+KhpzPqa1ktFynB6esaylTttRqWzq5aDdBw2NSYUSQkZGJnb200+50Iqi
	0Pfay8pTICTe+ZtzBjXv/c/+eKxeLGgb7cukLPIUEhGNd6/eyF1n4b99jafjWhzPAjUKmR4+S9S
	bcqs53TIpjVUhipFWXpeeZSeZ+IHKYN49gxInsILetnVHhYxkR2QYJTOH+dRk=
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861949b6e.58.1793616142050;
        Mon, 02 Nov 2026 02:42:22 -0800 (PST)
X-Received: by 2002:a05:6808:6508:b0:4f3:36ff:e521 with SMTP id 5614622812f47-5640df1c54bmr5861941b6e.58.1793616141658;
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-5640fe0fc77sm7447171b6e.12.2026.11.02.02.42.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 02:42:21 -0800 (PST)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 02:42:11 -0800
Subject: [PATCH v24 03/15] phy: qcom-mipi-csi2: Add Kaanapali support
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
Message-Id: <20261102-kaanapali-camss-v24-3-d6b8f3f6f66f@oss.qualcomm.com>
References: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
In-Reply-To: <20261102-kaanapali-camss-v24-0-d6b8f3f6f66f@oss.qualcomm.com>
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
X-Proofpoint-ORIG-GUID: 2n0w6PmG5LWYjTyxJoljIpmrH6Gy5Qwy
X-Authority-Analysis: v=2.4 cv=QuvLTlyd c=1 sm=1 tr=0 ts=6ae8690e cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=1e3Zegj4IIqRqDCgfwkA:9 a=QEXdDO2ut3YA:10
 a=efpaJB4zofY2dbm2aIRb:22
X-Proofpoint-GUID: 2n0w6PmG5LWYjTyxJoljIpmrH6Gy5Qwy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX2mwYK1v9RX0o
 Ty0J2T2stWWdBrBQR1Tbn8BOrDHgXKri88UADo+ZaGr0vol/XHJv0jK/J/jMs52WTrMk4fe6sWq
 re027iVf0FjYtVELYxGT0Ckl9FGW0+0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA0MiBTYWx0ZWRfX5h/CK8MdxDHO
 4j+yK3/UAFuQF/HfRIQ5lvvowsz2/mlXEBsGh9pyi9lNd13BPt6DqdlWHgqM7qn67XV4WyJzNPW
 cBdDbx3pH+EWcfmN/OLAH0UxB+0GqaJUMN/E9urib/SdTyKz6EurTGYCWgruCXvxHf5uw7z75UX
 v8yvGVSrAWl8s3t5QZaCQF3rD1by4AHWMGTmiFGwUpF8h1mopWeqe9xb73bg1n/uQnzwbpYJNc3
 pfd3bMtKwzCrhVFgK0BhUrogvb6GFGCk3uPCMBX/qZjTf4bK8LENJcmOhH3WMnbHUUlDSCJInWl
 WoYOl6bMhvTNFvl/y4xjG7AmaJ7UVCZmDYFgB7wSoIdhB1iddYI9x0VHh93NWj+7XTE1JLtb/ki
 c2/kqOWygFBimM+YahdPgg5Zx0e5qee7oqFY22CGh+e8YvD/eFVpwhXoyqe8XD+kQ7vgrJqKLC8
 DCshxXeMs0WhN/BtI3A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 clxscore=1015
 impostorscore=0 priorityscore=1501 malwarescore=0 spamscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020042

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
index c0a4fa20eaf0..941f8b920b1d 100644
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

