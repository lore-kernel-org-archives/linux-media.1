Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D4C03AF643
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784609501; cv=none; b=r0YCLjumcfNd1hh1MiU+1IkoNdCpGb5/K3qGOPwDD1CVKP9QvA61AJaQyTW6GQEm3wdw2AKKkoh+olxu31YNE8pZL+nasDuMs5HtKr8P7vSqVfDeADPgbjrf039sfZTILp3zwJTCFm3v0VDobbgTAWD+Dt5tRbZWH4XrHwNAoV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784609501; c=relaxed/simple;
	bh=suDyrdZ/A/Ib++uryCq3ydxopc51LoKQbJy83eSgB+Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=S9YG8DCJSMr2+/N+gAQHJe+Phvw71KczF782Bpqt9mVxUgegbWK5gg0eYPjZgntyv8XGOz1u2mZxgKr9l8ds/JNKLllnrcoBdzrPgOj7ydaVKe6q6yGP+L8DRoYP8XFPSOssd82IdJOBvTmW2CGyCFRBKFxjHqMU2P10eliiJ98=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=noZOm0zk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MMXn/9wj; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="noZOm0zk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MMXn/9wj"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66L2nMqn043573
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=; b=noZOm0zk+QX+wd3k
	emsSj6bTVzC4PX2cILocBw+Tm+7p+qI+Q9YQeVfBLLLApyrWn9G2QLiCYx1yrrJK
	bWLC68fLI/nmof9LrJXkAGid4gE4D8zQBka84odLmPpMI6+t/AnjUfkv0ZaO0BPP
	ETefBethg6ZEoWxVc/g/Hcm2Webty/VtLDCF6Mg9EJAbb4AkHj48dX2d9iNgFbp7
	oWmvg2zRhd7NUKfVsAMAXHF5qALthAZUX8HYBFyfmJWvKwL/3ainxH1SETkqJj6z
	IXAgQLuUvI/mIoDL8BqOcgtG1L0jdgis7cUN7KPq69ccvAmMINNfop4XSSWKZdrp
	moJV1Q==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj0as0dpv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 04:51:38 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-38e1118e4abso11588837a91.0
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 21:51:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784609498; x=1785214298; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=;
        b=MMXn/9wjySroYsbkKqt/2eDlg1sx5kYLyORaW6tW7zxUHc/bNWhy9d9TDtE6F804VU
         jI0y4iWp8ukNTtR/hqVeeGQROtM1qW4AnpD5SS4htn6eKshdm4BREXLvuBrgllJOb3B/
         sliY+ZrbpNoQ0SO4L2SV36OyYTd+u6AbPDyiErN76dqrPpr0iP+ZW7qF5/ifeTJt7msU
         rZvHuSBvDylN2quoES5S+jOmkr1aqtO1dEkObybY0mKCXyWSVYCavuPzNE2x6uSEDlDk
         xqKqSWQeLDjumclPT6IKQfcOa9x84jwfzRk3Mbxdoyq4sF0u3a/vPAoQJz4Ubp5uvJ3Q
         Vj3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784609498; x=1785214298;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9/JnqSJZbQ41bq4121VskR/EW6Mw3oBqa6LEu9vKNDQ=;
        b=fNQSUpJcISxTpdjPCjhURwOgh+W1LqfMSBkt4JPCrOpsJARRT/R/Uq/P8TwR3j0pG4
         VDAYQrMCRwJB94+EAYcKkKogaJb1yLLh2Hvg33w4c2gCvj3MuNR+IQrrLXjnMmDPUIdw
         zehHnCQkRVYsMuJEe9L4ccRzFolj46PPgyaaqtlJOqnmarMCfjaqAljhiu6EiiyV31BS
         fE1lBWbUHyUVxwXjuEY9D3Wn+oGpZoZ7MEDUkzIM2gT/pUhmNh87X8NObBpUZDp5X64D
         VtkWwe+l7R4XfmRwpwR8smADVqSYDahmNS97D5Rj1aACZ8nDonR1Xh0iOPdJf/q5zqx+
         CN6g==
X-Forwarded-Encrypted: i=1; AHgh+Rp0Yp2gAdHnPzq3Yl5Qm0fr5CI0rG1uFG3pQGOd7Mhmic6olXpvXejggGDAmtabw2EbXaBvQLBCVRztIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YybiRM+C00yJjGBuONZIn4rRNk7aFCxDlNlqHqngnRQdxnPO2hN
	++wv2Yizoi+2a4z08iVC+8PBpHK9hKZE2nBFUAwHYTy8bRse0zJiJHo5NRJSzQBQX8rAFfOLdu9
	SQcxyaj9YBuh4X4eDwdS3yGwy4HsYII8/LshAw/tjdnQJTUbuCNjlGEcjulLZ10qmcw==
X-Gm-Gg: AR+sD1374wEoRL+URdy3rYhl5VrztYvhtIriQM7fXtnypVrQmn96Kniw4HPsY5P8lrq
	lBGU7PIdhkYOKEvKaoeDWY9J9NgwdFnyvnQTjE7GlJ2iTIMk/iUaVbS/BRglChcJWqhU6xMeRf7
	lE8dpGmqumO8sq64KG0m0QVzkq7DIIY+PLks7vkG0hbqP3tDRwJirNOaz/Ue0ENuZkZP6yAkMcr
	h4EuDCCyzLKIMr+LPO5k1Kmii8JewpcrLz7za0cJw2p8d10nhUB+ycFlwQ7uHgn5qKlOLWOWb8c
	by0xYzABtvM4DPCvNWouy3C6pj/FthLQHshR1FUTdAu/j5QhBLUhj5ynU3PrNlieKWCYPwNPOT6
	H/7YEk7kF5gxNsifVff0flcjNHKIWq3XZJq1wLXYutucvGn7cUvBp+rY=
X-Received: by 2002:a17:90b:544b:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38e9045bb96mr2852023a91.7.1784609497734;
        Mon, 20 Jul 2026 21:51:37 -0700 (PDT)
X-Received: by 2002:a17:90b:544b:b0:38e:9045:babe with SMTP id 98e67ed59e1d1-38e9045bb96mr2851996a91.7.1784609497265;
        Mon, 20 Jul 2026 21:51:37 -0700 (PDT)
Received: from hu-hangxian-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2ddfb35sm37963183c88.14.2026.07.20.21.51.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 21:51:35 -0700 (PDT)
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 21:50:41 -0700
Subject: [PATCH v15 8/8] media: qcom: camss: tpg: Add support for v2.4.0
 TPG
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-kaanapali-camss-v15-8-c0b1c1167c5d@oss.qualcomm.com>
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX+Ru84stAqK8I
 njTILAjMo2VgjyG5GcFMR55bKqnAlJqiud9PZozXLGMzRiRqauoFmkzHKT0bnZySnyNTxEwKlbo
 yA3HD+2l5Mym2nxp8ra1mBNKgMVFMlGHxpczDqihA/IGlExHOiarJnxGC1bWGl1tR4zOCXlR6zU
 6CbbnIPtwsGad6jukBDRy7dVZB/Onh63uvNtBXwt/QqUacWfsUHiboxuWOHZseMx09D3Spo3fn/
 nf9Z/VUQzzw552EV0sKqVRKM0fUluw9z7K1d9u8XbVxtrysJSU6FTUWhMIzTgyWjQWDaZYXp2j9
 zJnKA9Qk9p2vSCpp5GUSvbCvOQ7oHlkdYYRgFRezyOwCeshJuu3XbZl6XFpvptpjjuewCkG8Lo/
 tnGh21ROJVLON8KDMuhkisynQnqTQcd+Kh92DdkatWSH5MN8B9gCivZl3S4plHpWlc87sEw7b3U
 aEZn8eyZANOO11K7cmg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDA0NiBTYWx0ZWRfX5h1HZ0x4vTMm
 M0vs5Rf+h0wRPZ8ef+Cc2p0DtKjP672J+rRa1FAOz0nzQsd1z3gddWbuxzz5lWHUbxKJ6QRG6cP
 H0eaD2BamQL7BbV2+gLgUaoBaInkdRU=
X-Authority-Analysis: v=2.4 cv=DoFmPm/+ c=1 sm=1 tr=0 ts=6a5efada cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=zvpRHedlNIWp6186mRgA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: MydJ6qFN2MZYOI0NYaGuV125NdeeF5Is
X-Proofpoint-ORIG-GUID: MydJ6qFN2MZYOI0NYaGuV125NdeeF5Is
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_06,2026-07-20_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1015 phishscore=0
 suspectscore=0 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210046

Add support for the TPG found on Kaanapali. This TPG uses hardware
version 2.4.0, which drives test-enable and reset through a separate
TPG_CTRL_CMD register instead of TPG_CTRL, and routes its output into
the CSID gen4 RX via the CSI2 TPG mux.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen4.c    | 15 ++++++++++--
 drivers/media/platform/qcom/camss/camss-tpg-gen1.c | 27 +++++++++++++++++-----
 drivers/media/platform/qcom/camss/camss.c          |  2 ++
 3 files changed, 36 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen4.c b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
index 4ff2f41f70f7..bc52e4a1135c 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen4.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen4.c
@@ -63,6 +63,8 @@
 #define		CSI2_RX_CFG0_NUM_ACTIVE_LANES		0
 #define		CSI2_RX_CFG0_DL0_INPUT_SEL		4
 #define		CSI2_RX_CFG0_PHY_NUM_SEL		20
+#define		CSI2_RX_CFG0_TPG_MUX_EN			BIT(27)
+#define		CSI2_RX_CFG0_TPG_MUX_SEL		GENMASK(29, 28)
 #define		CSI2_RX_CFG0_PHY_SEL_BASE_IDX		1
 #define CSID_CSI2_RX_CFG1			0x884
 #define		CSI2_RX_CFG1_ECC_CORRECTION_EN		BIT(0)
@@ -140,12 +142,21 @@ static void __csid_reg_update(struct csid_device *csid, int port_id)
 static void __csid_configure_rx(struct csid_device *csid,
 				struct csid_phy_config *phy)
 {
+	struct camss *camss = csid->camss;
 	int val;
 
 	val = (phy->lane_cnt - 1) << CSI2_RX_CFG0_NUM_ACTIVE_LANES;
 	val |= phy->lane_assign << CSI2_RX_CFG0_DL0_INPUT_SEL;
-	val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
-	       << CSI2_RX_CFG0_PHY_NUM_SEL;
+
+	if (camss->tpg && csid->tpg_linked &&
+	    camss->tpg[phy->csiphy_id].testgen.mode != TPG_PAYLOAD_MODE_DISABLED) {
+		val |= FIELD_PREP(CSI2_RX_CFG0_TPG_MUX_SEL, phy->csiphy_id + 1);
+		val |= CSI2_RX_CFG0_TPG_MUX_EN;
+	} else {
+		val |= (phy->csiphy_id + CSI2_RX_CFG0_PHY_SEL_BASE_IDX)
+			<< CSI2_RX_CFG0_PHY_NUM_SEL;
+	}
+
 	writel(val, csid->base + CSID_CSI2_RX_CFG0);
 
 	val = CSI2_RX_CFG1_ECC_CORRECTION_EN;
diff --git a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
index d29de5f93c18..770a9e5d5ba5 100644
--- a/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
+++ b/drivers/media/platform/qcom/camss/camss-tpg-gen1.c
@@ -22,6 +22,7 @@
 
 #define TPG_HW_VER_2_0_0                TPG_HW_VER(2, 0, 0)
 #define TPG_HW_VER_2_1_0                TPG_HW_VER(2, 1, 0)
+#define TPG_HW_VER_2_4_0                TPG_HW_VER(2, 4, 0)
 
 #define TPG_HW_STATUS		0x4
 
@@ -33,7 +34,9 @@
 # define TPG_CTRL_OVERLAP_SHDR_EN	BIT(10)
 # define TPG_CTRL_NUM_ACTIVE_VC		GENMASK(31, 30)
 
-#define TPG_CLEAR		0x1F4
+#define TPG_CTRL_CMD		0x1F4
+# define TPG_CTRL_CMD_TEST_EN		BIT(4)
+# define TPG_CTRL_CMD_HW_RESET		BIT(0)
 
 /* TPG VC-based registers */
 #define TPG_VC_n_GAIN_CFG(n)		(0x60 + (n) * 0x60)
@@ -164,18 +167,30 @@ static int tpg_stream_on(struct tpg_device *tpg)
 	}
 
 	/* Global TPG control */
-	val = FIELD_PREP(TPG_CTRL_TEST_EN, 1) |
-	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
+	val = FIELD_PREP(TPG_CTRL_NUM_ACTIVE_LANES, lane_cnt - 1) |
 	      FIELD_PREP(TPG_CTRL_NUM_ACTIVE_VC, last_vc);
-	writel(val, tpg->base + TPG_CTRL);
+
+	if (tpg->hw_version >= TPG_HW_VER_2_4_0) {
+		writel(val, tpg->base + TPG_CTRL);
+		writel(TPG_CTRL_CMD_TEST_EN, tpg->base + TPG_CTRL_CMD);
+	} else {
+		val |= FIELD_PREP(TPG_CTRL_TEST_EN, 1);
+		writel(val, tpg->base + TPG_CTRL);
+	}
 
 	return 0;
 }
 
 static int tpg_reset(struct tpg_device *tpg)
 {
-	writel(0, tpg->base + TPG_CTRL);
-	writel(1, tpg->base + TPG_CLEAR);
+	/*
+	 * On TPG older than v2.4.0 test-enable lives in TPG_CTRL, so clear it
+	 * first; v2.4.0+ drives both test-enable and reset through TPG_CTRL_CMD.
+	 */
+	if (tpg->hw_version < TPG_HW_VER_2_4_0)
+		writel(0, tpg->base + TPG_CTRL);
+
+	writel(TPG_CTRL_CMD_HW_RESET, tpg->base + TPG_CTRL_CMD);
 
 	return 0;
 }
diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index e5cf1e42dbb1..252dc2fe4207 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5825,11 +5825,13 @@ static const struct camss_resources kaanapali_resources = {
 	.version = CAMSS_KAANAPALI,
 	.pd_name = "top",
 	.csiphy_res = csiphy_res_kaanapali,
+	.tpg_res = tpg_res_x1e80100,
 	.csid_res = csid_res_kaanapali,
 	.vfe_res = vfe_res_kaanapali,
 	.icc_res = icc_res_kaanapali,
 	.icc_path_num = ARRAY_SIZE(icc_res_kaanapali),
 	.csiphy_num = ARRAY_SIZE(csiphy_res_kaanapali),
+	.tpg_num = ARRAY_SIZE(tpg_res_x1e80100),
 	.csid_num = ARRAY_SIZE(csid_res_kaanapali),
 	.vfe_num = ARRAY_SIZE(vfe_res_kaanapali),
 };

-- 
2.34.1

