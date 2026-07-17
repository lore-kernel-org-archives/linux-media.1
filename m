Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A0E3EB10B
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784330025; cv=none; b=REo/uen/g37tlJXh45vDMdOHKAKYy+rQVQzI5rwxPlIj7kLGNZY0XdLk6Xvd1tdDIsWZ69iw4Z+7jB1XL26PiPa3PxmZL6VipVIGeFqaZysOYPoBAmEP1PFUnK59DDPNQNi75dddYj1fySOeTAsvuh42s/ILoyaZTPw3wwlMs8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784330025; c=relaxed/simple;
	bh=Zl0LFSEFsJdCNL/OuKedRgjdy8YoeVU0SqQjKpm35UE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=WWl21GOL5F0cOUP2CHAEUYm6gafARCd8YpEkAB6qxpXcX8drrdER+jBA8sfK0fOKW1D9PE+Y/Ak6hLCAw00R66luIDTjo2Kfzw9kY/qECk7PUvnokDIQ+TELuv+lR8XLtz+jXLLo/zipvb+0plGtAUBrZQePxVehhiPb1pCTGWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=T+m29tzn; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HeL3nWgz; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="T+m29tzn";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HeL3nWgz"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HJtY3c2780218
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=Zxre7hEUg8W
	r/oicOD4TvdtaAgWt7ciGNGss6Fe12N4=; b=T+m29tznjg0BOLVf0V27nY6bX9B
	zbX1IliDSi1EuCGKLLHiecaiBbvALNsNPuogOz0uGyeYnHzYv4KWeLl1qeY3COJx
	h+STiNBIfnEZ+BOGuCtKtQ28JgAkluIxMAHVIWJhf0isuvWNXoaYOR7DaDofWn/g
	qr+yNEfq6hOa/eSqamEiYplKFhwB0PZV+8PvwDf9YOXirROFRn/6Y3ESQkOidSL+
	+K6aEIqb1t5fHZN074F8UyoM/P23zUf0klj/U8CONQmsa9xFotPppgLd7dAMcAJy
	oeKiM0uYDMSH9aBiMG27Fe/F3+tGfhADobjxCpngsczySas213PUd5d0YLQ==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fff9guq3x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 23:13:38 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-38dbf293831so11263272a91.3
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 16:13:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784330017; x=1784934817; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zxre7hEUg8Wr/oicOD4TvdtaAgWt7ciGNGss6Fe12N4=;
        b=HeL3nWgzQn29jmiyhs5SV8GKZTjkIuJM9kybeU/A0UK7zalAEXtWhea6jq3z0CSHyL
         EPVKhbZrpnk8QN92rbnFJvNcOfMcRONptDP7lH4f6JlR1f0VUYqAQouLOsI4Jr6a1Nh3
         Yr8OiV9SGnFuG6lYl/A9jddacNsLmsR6MmH2ci1qQKa/upu0QEnGgBfYbqQo3pOdCbqf
         X8OAOZYzVdiqfAZ5oURv7cliGuT7bmcae/qGRXubR1HrQdPJeITHuR+4eKdxm0xP6A3V
         NRUSlpzc7xamzoAXOhefmEQz9R/ht9FLGz8tMnnr4geLXEmBwLMc3spLSiiqp5BKja8j
         E8WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784330017; x=1784934817;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zxre7hEUg8Wr/oicOD4TvdtaAgWt7ciGNGss6Fe12N4=;
        b=Iy0fqnuSTVI9Zy8WcYfYIcFGvM8iJYMt6wEUoIJ2U3738o6OGMR7znaF8MVAzr7o9Y
         DfOCV9AAhvJONELp75D/fUjhCh1oF83SUj8cyijM/u1fVZefSt/p+dR4opwp2zFOESbx
         AAFmv5I97KxRsXs/c2yJ0OqkAih9rvYaamDnrF5Xt7YjoTn+zrDpAIdlUUpjfvD51OsR
         ldamXV5QqPUYVtqoHWG9VOFwyqUq54uVnr26Q54VEDvXaLkMvmGkQNBt7Y9KpWycSGJP
         kAq6ZJIc4uFIQlWISezYeGSHApzC7xIvmErJAEAUVaHDPXISIH34aDF/ENt9iGVgdSkF
         s4YQ==
X-Gm-Message-State: AOJu0YwR9hHg6g9toGZ9M6NCFt/+dsvT+09o9I+DIqER4GYiezSKwGAO
	o5emA5bFqr07vg+gjYJm+zKSD3rX1SLdESDIpzUA/PW+CzzqebCIZiAod9b+Kczg4CutF7iTQwV
	OpLSXi86oQn/hmGT6CgrGiWSs1SYLcmEevzGc3+5D26MRIf5vYSqXSiYlPjBvMg/CFEs50ZV++Q
	==
X-Gm-Gg: AfdE7cmhDcHRxY1UF44L3Ki34ACMVG+iarK802JxVu+Cl6Hr5gFUd0Okmkb0gMole85
	+t5chJK3mm8AQMAwPYThSVWI3+zd3uz5IMnlBzo8K9NeoOU+zTrDJaYPZcUMjMwD4CQ1fJ9MIpR
	TLZytEwQziZbeSfy98jNGqjuNjRdFafzbOpvY4hoPJ5Cx4IebR3N1uHgSbKrOhm9zmRekptVZQ7
	fZCop/MiyseZa9K+S2BSZUpLNYm6bs+zEK/j5Jlyd5SEGLaO7oM2on5rTIz9b5rM7nniBdNhNjm
	oFdCXJGPsvEHuWEpw6/XLxxfryHrj5tI6DqwY2SnGh5T2UAIZZfhJoawyaGVz76Il2ZBojg8mJb
	WeKIWbC3R4SDLQV8S6lqNiU1PYxpnxkt8L8wsLooRLJfSFW04cL2sYKg=
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr5169021a91.41.1784330017207;
        Fri, 17 Jul 2026 16:13:37 -0700 (PDT)
X-Received: by 2002:a17:90b:5546:b0:38d:ec31:4843 with SMTP id 98e67ed59e1d1-38e4b5f2212mr5168980a91.41.1784330016640;
        Fri, 17 Jul 2026 16:13:36 -0700 (PDT)
Received: from hu-aarunnan-lv.qualcomm.com (Global_NAT1.qualcomm.com. [129.46.96.20])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13ce2a18a47sm8145264c88.8.2026.07.17.16.13.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 16:13:36 -0700 (PDT)
From: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
To: linux-media@vger.kernel.org
Cc: anusha.nandi@oss.qualcomm.com, bryan.odonoghue@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        jigarkumar.zala@oss.qualcomm.com, gjorgji.rosikopulos@oss.qualcomm.com
Subject: [PATCH 5/6] media: qcom: camss: Dynamic data-rate specific C-PHY register settings
Date: Fri, 17 Jul 2026 16:13:30 -0700
Message-Id: <20260717231331.1229693-6-anusha.nandi@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
References: <20260717231331.1229693-1-anusha.nandi@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX52tAoCL/NFGg
 hwRAlnl+h1p39+gQt6OPjlmhCyhDBXR0YM5rEAvic1Vc5NgqN5Gck64yeVUT06jI69tT6CSMBYW
 /behmzs7oJi4bhq9n94wzHaOc9cTwXw=
X-Proofpoint-ORIG-GUID: Uus50EaDm086WPr2-GS7nHFlndkFZ92F
X-Proofpoint-GUID: Uus50EaDm086WPr2-GS7nHFlndkFZ92F
X-Authority-Analysis: v=2.4 cv=TaumcxQh c=1 sm=1 tr=0 ts=6a5ab722 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ouPCqIW2jiPt+lZRy3xVPw==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=SK8wPOPCHov2sd3_MXgA:9 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDIzOCBTYWx0ZWRfX+AEYT1mtklsZ
 cMVIGNf3/GlZVDoRzEz3t/sx3Ds7K8/YPgLXzzQllSII+Br/QfOczKTcVfpVNd/agWM+ap0Z+De
 AA5N9uXtthcyN+ua+8Nzk+jk75mY1pZX1dtGFs841+eTOufo0Q/lYRVeu7WbJmZ1OvufbTWy4FX
 C2M+QSpTlGe/XRYBVFcwXiQ9n+F6gGHOLYmdGE0oGGgZJnQGIZ/GdXnLJ/mAm7qbJA2PkyUlsNc
 IV/FF6fdN8M9NVFPLuW3Av26DvQFGHbdP7Ln/uO6hY1CLvuEFQWP61lDpx+vCl0I/to7SRWmbGj
 3ke9Ujc3ocniSnuOCy5mGjh8oLo9A4IpbgaYK1QeSYI84TaY4sDPByzs75oBMY5dxEv5UjpPxKG
 wWFEwfVofkMg6RR9c5bHpogp2mlHV96RNT5GrFqmqZxE6b6/MgUrc5ngadM7Avj7LKuOMONM2an
 10T9M+sD8pgsQAJ29+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_06,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 clxscore=1015 adultscore=0 phishscore=0
 spamscore=0 bulkscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170238

The C-PHY PHY register configuration needs to vary with the link
(symbol) data rate. Until now only a single base lane_regs table was
applied per platform, regardless of the negotiated rate.

Introduce a data-rate selection mechanism for C-PHY:

 - Add struct data_rate_reg_info describing a per-bandwidth register
   override table.
 - Add csiphy_cphy_data_rate_config(), which selects the first table
   entry whose bandwidth satisfies the required PHY data rate (derived
   from the resolved link frequency) and writes those overrides on top
   of the base lane_regs configuration. The settle-count parameter
   types are handled specially. When the link frequency cannot be
   resolved, it falls back to the lowest supported rate.

 - Add per-data-rate register tables and data_rate_settings tables for
   sa8775p and 8300(1.5/1.7/2.5/3.5/4.5 GSpS)
   and sm8250 (2.5/3.5/4.5 GSpS).

 - Select the appropriate data-rate settings table in
   csiphy_lanes_enable() for both platforms when the endpoint is
   configured for C-PHY.

Co-developed-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>
Signed-off-by: Anusha Arun Nandi <anusha.nandi@oss.qualcomm.com>
---
 .../qcom/camss/camss-csiphy-3ph-1-0.c         | 249 ++++++++++++++++++
 .../media/platform/qcom/camss/camss-csiphy.h  |   6 +
 2 files changed, 255 insertions(+)

diff --git a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
index 0d5d4d4410f2..77484cbb6c15 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
+++ b/drivers/media/platform/qcom/camss/camss-csiphy-3ph-1-0.c
@@ -72,6 +72,8 @@
 #define CSIPHY_3PH_REGS			6
 #define CSIPHY_SKEW_CAL			7
 
+#define CSIPHY_CPHY_DATA_RATE_DEFAULT_IDX	0
+
 struct csiphy_lane_regs {
 	s32 reg_addr;
 	s32 reg_data;
@@ -236,6 +238,9 @@ csiphy_lane_regs lane_regs_sa8775p_3ph[] = {
 	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(32), 0x61, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(44), 0x01, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sa8775p_3ph_1p5Gsps[] = {
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
 	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
@@ -253,6 +258,183 @@ csiphy_lane_regs lane_regs_sa8775p_3ph[] = {
 	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
 };
 
+struct csiphy_lane_regs datarate_sa8775p_3ph_1p7Gsps[] = {
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x56, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0xAE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x65, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x56, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0xAE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x65, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x56, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0xAE, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x65, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x12, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45),  0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sa8775p_3ph_2p5Gsps[] = {
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0xC8, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45),  0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(34),  0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x08, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sa8775p_3ph_3p5Gsps[] = {
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45),  0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(34),  0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sa8775p_3ph_4p5Gsps[] = {
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN1_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN3_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(26), 0x80, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(23), 0x46, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(27), 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN5_CSI_3PH_CTRLn_ADDR(3),  0x08, 0x00, CSIPHY_SETTLE_CNT_LOWER_BYTE},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(45),  0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN9_CSI_3PH_CTRLn_ADDR(34),  0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(45), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN10_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(45), 0x02, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{CSIPHY_LN11_CSI_3PH_CTRLn_ADDR(34), 0x05, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+static struct data_rate_reg_info data_rate_settings_sa8775p_3ph[] = {
+	{
+		/* 1.5 GSpS */
+		.bandwidth = 1500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sa8775p_3ph_1p5Gsps),
+		.data_rate_reg_array = datarate_sa8775p_3ph_1p5Gsps,
+	},
+	{
+		/* 1.7 GSpS */
+		.bandwidth = 1700000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sa8775p_3ph_1p7Gsps),
+		.data_rate_reg_array = datarate_sa8775p_3ph_1p7Gsps,
+	},
+	{
+		/* 2.5 GSpS */
+		.bandwidth = 2500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sa8775p_3ph_2p5Gsps),
+		.data_rate_reg_array = datarate_sa8775p_3ph_2p5Gsps,
+	},
+	{
+		/* 3.5 GSpS */
+		.bandwidth = 3500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sa8775p_3ph_3p5Gsps),
+		.data_rate_reg_array = datarate_sa8775p_3ph_3p5Gsps,
+	},
+	{
+		/* 4.5 GSpS */
+		.bandwidth = 4500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sa8775p_3ph_4p5Gsps),
+		.data_rate_reg_array = datarate_sa8775p_3ph_4p5Gsps,
+	},
+};
+
+struct csiphy_lane_regs datarate_sm8250_3ph_2p5Gsps[] = {
+	{0x144, 0x32, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x164, 0x0B, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x16C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x344, 0x32, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x364, 0x0B, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x36C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x544, 0x32, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x564, 0x0B, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x56C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sm8250_3ph_3p5Gsps[] = {
+	{0x144, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x164, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x16C, 0x1D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x9B4, 0x03, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x344, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x364, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x36C, 0x1D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0xAB4, 0x03, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x544, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x564, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x56C, 0x1D, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0xBB4, 0x03, 0x01, CSIPHY_DEFAULT_PARAMS},
+};
+
+struct csiphy_lane_regs datarate_sm8250_3ph_4p5Gsps[] = {
+	{0x144, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x164, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x16C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x9B4, 0x02, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x344, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x364, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x36C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0xAB4, 0x02, 0x01, CSIPHY_DEFAULT_PARAMS},
+	{0x544, 0xB2, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x564, 0x33, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0x56C, 0x25, 0x00, CSIPHY_DEFAULT_PARAMS},
+	{0xBB4, 0x02, 0x01, CSIPHY_DEFAULT_PARAMS},
+};
+
+static struct data_rate_reg_info data_rate_settings_sm8250_3ph[] = {
+	{
+		/* 2.5 GSpS */
+		.bandwidth = 2500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sm8250_3ph_2p5Gsps),
+		.data_rate_reg_array = datarate_sm8250_3ph_2p5Gsps,
+	},
+	{
+		/* 3.5 GSpS */
+		.bandwidth = 3500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sm8250_3ph_3p5Gsps),
+		.data_rate_reg_array = datarate_sm8250_3ph_3p5Gsps,
+	},
+	{
+		/* 4.5 GSpS */
+		.bandwidth = 4500000000,
+		.data_rate_reg_array_size = ARRAY_SIZE(datarate_sm8250_3ph_4p5Gsps),
+		.data_rate_reg_array = datarate_sm8250_3ph_4p5Gsps,
+	},
+};
+
 /* GEN2 1.0 2PH */
 /* 5 entries: clock + 4 lanes */
 static const struct
@@ -1257,6 +1439,60 @@ static void csiphy_gen1_config_lanes(struct csiphy_device *csiphy,
 	writel_relaxed(val, csiphy->base + CSIPHY_3PH_LNn_MISC1(l));
 }
 
+/*
+ * csiphy_cphy_data_rate_config - Apply data-rate specific C-PHY overrides
+ *
+ * Applied on top of the base lane_regs. Selects the first table entry whose
+ * bandwidth >= the data rate derived from @link_freq (highest entry if none
+ * qualifies, default entry if @link_freq is unknown) and writes its overrides.
+ */
+static void csiphy_cphy_data_rate_config(struct csiphy_device *csiphy,
+					 struct data_rate_reg_info *settings,
+					 size_t num_settings,
+					 s64 link_freq, u8 settle_cnt)
+{
+	struct device *dev = csiphy->camss->dev;
+	const struct csiphy_lane_regs *r;
+	size_t idx, i;
+	u32 val;
+
+	if (!settings || !num_settings)
+		return;
+
+	if (!link_freq) {
+		/* Link frequency unknown; use the default (lowest) entry. */
+		idx = CSIPHY_CPHY_DATA_RATE_DEFAULT_IDX;
+	} else {
+		/* First entry that satisfies the rate, else the highest. */
+		for (idx = 0; idx < num_settings; idx++) {
+			if (settings[idx].bandwidth >= link_freq)
+				break;
+		}
+	}
+
+	dev_dbg(dev,
+		"CSIPHY using specific bandwidth %llu bits/s (entry %zu) for link_freq %lld\n",
+		settings[idx].bandwidth, idx, link_freq);
+
+	r = settings[idx].data_rate_reg_array;
+	for (i = 0; i < settings[idx].data_rate_reg_array_size; i++, r++) {
+		switch (r->csiphy_param_type) {
+		case CSIPHY_SETTLE_CNT_LOWER_BYTE:
+			val = settle_cnt & 0xff;
+			break;
+		case CSIPHY_SETTLE_CNT_HIGHER_BYTE:
+			val = (settle_cnt >> 8) & 0xff;
+			break;
+		default:
+			val = r->reg_data;
+			break;
+		}
+		writel_relaxed(val, csiphy->base + r->reg_addr);
+		if (r->delay_us)
+			udelay(r->delay_us);
+	}
+}
+
 static void csiphy_gen2_config_lanes(struct csiphy_device *csiphy,
 				     u8 settle_cnt)
 {
@@ -1336,6 +1572,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 {
 	struct csiphy_lanes_cfg *c = &cfg->csi2->lane_cfg;
 	struct csiphy_device_regs *regs = csiphy->regs;
+	struct data_rate_reg_info *data_rate_settings = NULL;
+	size_t num_data_rate_settings = 0;
 	u8 settle_cnt;
 	u8 val;
 	int i;
@@ -1420,6 +1658,8 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 		if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY) {
 			regs->lane_regs = &lane_regs_sa8775p_3ph[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p_3ph);
+			data_rate_settings = data_rate_settings_sa8775p_3ph;
+			num_data_rate_settings = ARRAY_SIZE(data_rate_settings_sa8775p_3ph);
 		} else {
 			regs->lane_regs = &lane_regs_sa8775p[0];
 			regs->lane_array_size = ARRAY_SIZE(lane_regs_sa8775p);
@@ -1483,6 +1723,15 @@ static void csiphy_lanes_enable(struct csiphy_device *csiphy,
 	else
 		csiphy_gen1_config_lanes(csiphy, cfg, settle_cnt);
 
+	/*
+	 * For C-PHY platforms with a data-rate settings table, apply the
+	 * data-rate specific overrides on top of the base lane_regs config.
+	 */
+	if (c->phy_cfg == V4L2_MBUS_CSI2_CPHY && data_rate_settings)
+		csiphy_cphy_data_rate_config(csiphy, data_rate_settings,
+					     num_data_rate_settings,
+					     link_freq, settle_cnt);
+
 	/* IRQ_MASK registers - disable all interrupts */
 	for (i = 11; i < 22; i++) {
 		writel_relaxed(0, csiphy->base +
diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.h b/drivers/media/platform/qcom/camss/camss-csiphy.h
index 2ebb307be18b..6578802823d3 100644
--- a/drivers/media/platform/qcom/camss/camss-csiphy.h
+++ b/drivers/media/platform/qcom/camss/camss-csiphy.h
@@ -62,6 +62,12 @@ struct csiphy_formats {
 	const struct csiphy_format_info *formats;
 };
 
+struct data_rate_reg_info {
+	u64 bandwidth;
+	ssize_t  data_rate_reg_array_size;
+	struct csiphy_lane_regs *data_rate_reg_array;
+};
+
 struct csiphy_device;
 
 struct csiphy_hw_ops {
-- 
2.34.1

