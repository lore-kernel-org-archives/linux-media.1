Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1AE63E1687
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609494; cv=none; b=uAN0h9OrkCA5iJtli5s86TyZAJZXsMcfzC1tNWOzHRta+YuZ9E0C2E1CALnQsrbQBiCPQg+ZR8K49vCGMEpxX47Jk4BGOmXUaJqCQbCQPpgveSBLMclOM/b+bsZTVRiv2erHVTYbF9pJxvVA8e/3nIXqEWyPVIh40ghR0ENzvWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609494; c=relaxed/simple;
	bh=zmTrx4BEFpHl2vUPXnF+HrCB6o5grW81ptzF8zyZisg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=YrnoCqTEMUxme7qVrmOQ9MIdKTPwGCWn/9DWXWH8D1L38cxaOBQb/9Ypi1Wmg7+Q0H01ETxpgemAJMc9HY273fYBM2Fwje2tGurexN4BdR3gF/hFE1FVMOB7jFRLgK3laBB2jeldhMojIkfrsYlD1YDZFguKV00PuHpLrQWaIPo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cCG0V76K; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NIynvkIp; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cCG0V76K";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NIynvkIp"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2T5Va092220
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=; b=cCG0V76K2LNJ6gN+
	bJBny094JrII9GDHqefKlIaUo9UugpZ7ZFRW49zVkvtn11eCC1fglTmKQxihOZo/
	1/Ss2igRxCEuxwBy+waFmfZ4soQ3xJxhPk23tYcdR+O7qgWb2BZHgpl5in+dv6QO
	y4hFvJRtlvgkCN+GZDi3VbSB4wCn5Hpy8RjFWHBYGaeo+sppILuSV6o2mH6tEbx7
	F+nZStvl3TM8TbVa6MPZOU2FKrt7nVkcO1bH78xMXTFz/6L9wl99TQu07n0csbmZ
	sMpiyprWX6wu3QO8rumJqFRPDbiWW6YhXoikAUceGArLQOBddOZ4blpSwJlRfoys
	Xs2wJQ==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj01a8fjd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:30 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-384419c6c74so13819036a91.1
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609489; x=1785214289; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=;
        b=NIynvkIpzkcQe/ByVwCfIe25s850CRWGSQC5zvSS6rvXIwvN7OEbJoMHqY1ra42ztT
         /cdMoqNrZLM0rgoKSnBsmsKpY97j11466VIoa2rQ5peEpd5DGO9m1CzPda/ZpDj7hsij
         F+0f/HvU7Z+InKmPOQZZDwm9mLpHgYRhR/xeF2Vgsi86U77RHGluGFKOAcfO0b73svIY
         UTLJ+q/5Nk+aOC3cC7AQDzNbogaRKFg8C1OOb9RS3KNcshEdsCQHiBOsY1MA9Nc79xsf
         dR7uQ9i96pzS62ejlcP3e8tHKK1LGHYx0MJVtWHkHXTmkXIkeRoyCy4HE2ZVTo5yJ+lq
         tDrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609489; x=1785214289;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WIQSVQa7SgN8IyDhJ3Xm6uhLiwBR83zKu8arMD1TNIA=;
        b=XQTJkIomSVZjWX3YNLMhvCZMBQelgzXekbiHrpV4gW9HGt1YtBYxLblEJSpuDlqhsx
         yxfv0QvKuy/frKM2it3KDN9DZI21LrAbr0Z0M+I1bwRjEOZNy3Ai0XNc26J0yydcD2IR
         C9c164X4aOYLwdx+gkaqLMSYxlkgpGfhVUWRg9mmYiA2a8Ug61HFU5MnwpZ4AVjK3BPl
         /UJ2Qks97kiSu4j/Uj1HkFmjunzj11pHjb4ZUuGeMAhXegg0F7JmUoNNmkC5h06RUZ9k
         aGFJmgaM7UfWLKbk2Po9gDrvrEWhRo249uRKAuOR/AoQw/covj7SYtH6p+yUukiDHEBm
         gqgQ==
X-Forwarded-Encrypted: i=1; AHgh+RqyOcRxMFSh7mTB90bz/l/i0e5cdufg643Fm8Jl6aHiHmnb4pP3EcmKKtmaXuIEE0A1cH9QQJu6Wf5xTg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7yEaISuPnSWm1qXZaJJyDDc174wT7KXIKhRZSywKiVNWiGVsG
	OerSmprXucUY5bMo/7kVsCEg/7X7s+AsaeCR8nXCm9FFk/9GsS1tAQ7QMAVEZP6rJDryhQ3y5PR
	WF3UZUsRssPjfT+b1a+M1SUIS+AZZovSy5b/LxKQQW8yX4w0X/7+4mA5YyjTyW7OzCw==
X-Gm-Gg: AfdE7cmVrMGQz0yvo/4ovsjKbGiWm+pHnzPk3SREfiw92Tyab4q+BD9HtQipsSH6xMx
	9TM5KQ2CtuyxRV6dGUFG7cDEpcklD2775ExPezJ4zhMYIxBmxfxyvnqAMR75SkMJT6g4lmIBxjM
	d1slyjPj25OaxkEWULyheQFKSG8bUEOULv4ZZEsrf28vUq6HRRTheqKj8aEV4yPh2y1j3Ep5lxj
	CnNXeoExE/xAHb5c+q7jhtBlIDsnV1zbR1uIT0olRq0spyfd+OypHzwRDpIWa/5q6KF5zIU2CWS
	YByt2LZ2CM9w+HsWIAArTBjgsBK3+J8PxrnT4fIZzKzsHTEvJCJbAl7ZTDyhgVzUP5Y+5fliTnC
	bVjN4h1yevp2Jhd6DnikRYzxt2SyUqEATsVfVWf5m20VY3wxEzT5Qa94=
X-Received: by 2002:a05:6a21:7d06:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c3ad7d2491mr18271032637.20.1784609489279;
        Mon, 20 Jul 2026 21:51:29 -0700 (PDT)
X-Received: by 2002:a05:6a21:7d06:b0:3b4:6cae:4a50 with SMTP id adf61e73a8af0-3c3ad7d2491mr18271011637.20.1784609488800;
        Mon, 20 Jul 2026 21:51:28 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:27 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:38 -0700
Subject: [PATCH v15 5/8] media: qcom: camss: csiphy: Add support for v2.4.0
 two-phase CSIPHY
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-5-c0b1c1167c5d@oss.qualcomm.com>
References: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
In-Reply-To: <20260720-kaanapali-camss-v15-0-c0b1c1167c5d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Robert Foss <rfoss@kernel.org>,
        Todor Tomov <todor.too@gmail.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Authority-Analysis: v=2.4 cv=BL6DalQG c=1 sm=1 tr=0 ts=6a5efad2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=YI0lirVkik_cQ8OgtUwA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX1lA3MaUuxT32
 9bdAq1Mo3YmWOn+zL3qMw/PEi4PG8eeZ23zCKI+O3R60fKVmYo5+9fkyoRD2tBePK7eoSGRYTKV
 V/U4yIKK2ELQAvVX9noUnmn7VVhH0ahOtBY64gKexhWHOc8OXNGl+moXDUbbffMsVv96Cy9c6hA
 8Zj5hswce/fkX0H/nehq6LAgmMLP/ADM4J1XJkLcOYd5l7ZG77oQui0o+HR65WrxS6Yg2xnyUTi
 oWuccuRELloFRjs/SD7j5J2+xVbLke1u4KVqOlM/FHCVeKeB76YIam+GLtrk274ajzEaop/m01r
 4lY2z/+VExOHovyZrES2iCMFvmNlhPx609rQ2KwPV8Y30MXQhEXkixHoJSKKPQCHc5L+82tjX8Y
 Uvl0FG/7fYSSBXg5yZQy/Nc7aMgwlnGoYddF7jrabpFkFMpaTuV7eyWMbUH/Ip5Eg1g3BWKQaWM
 u09H5VoDBnbwD1NBS0w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX3o/o1PmW9XVg
 GH2/CvLgbsQ5wAZ1GbV3RaW/8/+HsHgyLJEVWJ7U3IEsJuyO2M2iiNL6OoCSlKEs8/PFF/UWtJ5
 zEfUnwYJuqOGQXP6gn8a3JD7lGpG9i8=
X-Proofpoint-ORIG-GUID: Ybwvr8ddB76OeSkq5vjjgl5Yf1r3ivTe
X-Proofpoint-GUID: Ybwvr8ddB76OeSkq5vjjgl5Yf1r3ivTe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 clxscore=1015 malwarescore=0 suspectscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add support for the v2.4.0 two-phase CSIPHY found on Kaanapali, where
the PHY is driven by the standalone phy-qcom-mipi-csi2 DPHY driver
rather than by CAMSS. Add the mipi_csi2_dphy_3nm_kaanapali configuration,
which reuses the x1e80100 lane sequence, clocks, supplies and power
domains but selects the v2.4.0 common status offset, and register the
"qcom,kaanapali-csi2-phy" compatible.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c          | 53 ++++++++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-3ph-dphy.c | 16 +++++++
 drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c     |  1 +
 drivers/phy/qualcomm/phy-qcom-mipi-csi2.h          |  1 +
 4 files changed, 71 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index d41ac42919f2..c19190f2a439 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -35,6 +35,57 @@
 
 static const struct parent_dev_ops vfe_parent_dev_ops;
 
+static const struct camss_subdev_resources csiphy_res_kaanapali[] = {
+	/* CSIPHY0 */
+	{
+		.csiphy = {
+			.id = 0,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY1 */
+	{
+		.csiphy = {
+			.id = 1,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY2 */
+	{
+		.csiphy = {
+			.id = 2,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY3 */
+	{
+		.csiphy = {
+			.id = 3,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY4 */
+	{
+		.csiphy = {
+			.id = 4,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+	/* CSIPHY5 */
+	{
+		.csiphy = {
+			.id = 5,
+			.hw_ops = &csiphy_ops_3ph_1_0,
+			.formats = &csiphy_formats_sdm845
+		},
+	},
+};
+
 static const struct resources_icc icc_res_kaanapali[] = {
 	{
 		.name = "ahb",
@@ -5549,8 +5600,10 @@ static void camss_remove(struct platform_device *pdev)
 static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
+	.csiphy_res = csiphy_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
+	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
 };
 
 static const struct camss_resources msm8916_resources = {
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
index aae049f0ec16..aaa81bbb4862 100644
--- a/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
+++ b/drivers/phy/qualcomm/phy-qcom-mipi-csi2-core.c
@@ -430,6 +430,7 @@ static int phy_qcom_mipi_csi2_probe(struct platform_device *pdev)
 
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

