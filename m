Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61A624756AC
	for <linux-media@vger.kernel.org>; Wed,  7 Oct 2026 09:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791363704; cv=none; b=r1bKr+kCPxI5l2wx0nY2iscWTjkoqWiVCPxozaCWxx/sgNqqXL4qzee1izpZprKu/YTYeQ2o7nxrrIrGkDaMkHkNHW814g7Vj/Fe6c0m5PygAzF0CvpBZq5n320mKe5jARN4Dz8lAFwwZui1YvyLsM1c0TSgItD5Zfrdebqp1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791363704; c=relaxed/simple;
	bh=x+2CF1jHTGfXACxIJAQKrjjmwEkoqG7clP8ryz2Vikw=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=PusVX2EPZEd/Nl3Tsk9H3mR6GQl/vmfaAVS4/Go2A2CZlvJ3bKfGt+lQ+wj1tDHas/f9WEK5oc21g7DpL7eGZLtNRtbFiG5DIO2VL4WJj8mwWHnqoRuCRCgKWdHLHJ8UUs3w/CiRM7WgBNAtWkTpbUMjxIs8OJBB5ancZKl0ncQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsoYnjvy reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsoYnjvy"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6977jRPE3298187
	for <linux-media@vger.kernel.org>; Wed, 7 Oct 2026 09:01:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=xcEA/V/zUbB
	oXQi0RsH1U4+VJOomeplfVtzzdrwhlnA=; b=UsoYnjvyTXEGPsB1z8SeLfWtA60
	k+dd0n/a6pmNlm4vsWvF9sbaNfgw4fcWnR1KeEEqAjlt0ESYruyaHEpFcWl6ocq9
	2QlFb6m+B49yXmCfu6kUyMDHEvBhjehq75DKDo8MZWQdhK8e2UJYVkYA1MLzkvqq
	wpe/eKmncFdQNBM4M0XQiDkL/6KKocxesapjE8HFN0zPKt+O4Z1gTmOl1ZVouZV8
	sZSSmVLa1Bo/wGJR9Mw1bbJVOh2M/d6qU36ccmP/iZCSQlcNOjMp+7rrAcIzQyNU
	n5IqPYzChp1xl+A6m8IBwnNWmau9PJ32hhR+CsL0mvWeH8tCXaAEPeZ2q8g==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h5hdcrbqv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 09:01:19 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-934956beec8so824224885a.0
        for <linux-media@vger.kernel.org>; Wed, 07 Oct 2026 02:01:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791363679; x=1791968479;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=xcEA/V/zUbBoXQi0RsH1U4+VJOomeplfVtzzdrwhlnA=;
        b=bR3kiJWWvICGSkrZAqEkKaCm9d7V3nQwuV0SY2Nfc3wShkSDv1K+peCZ58hp6uRcLI
         jDicuI8Xe48lx/e/SmVZON9B74AUbfvY1DuZEU++Ck52RFUxxC1JSDy+JJaSxn9q8ZmA
         B2FOTYN772Idwl/sp/JcocmEIyBGbarJlnumriAp49+EJJcBK2ZZcpHGW160vyG2yvYx
         ZCWke6ddI4Ptu8IObkZisGgDQUd4xgMdG5aVFHbQ5vgxBbh6BbVqYdZ22TdkBmwC5/Hw
         KVMEP3qfrrBhyc4SJKSNgHAIoPb4JFjbTAebk6t6q4ZQ5GVmT4UstMhQGhDDK6aFsGMy
         yg7A==
X-Forwarded-Encrypted: i=1; AKwUvBx1BtVmvhdu5hzMxo3nU2fJX1RAQxw/ZSzE0eTy0UHBeb9GIHUpsNdy0KNidGSy6ELP3HrsWWH0KBUSwQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kFK2VgoC7QRCIIAquXL4vvhuwfLRmttrKU6XgCglmShivxUerJ
	uBym+TjqhSENsJfswSJh7Xhs/yEd6yEs08SM9ehwR7fT9vqzBLJtn1JLLdqBK3rOEIOS3JaEBgv
	XV6cx/FaB9ccZ8If/Qa9TvyFuRLnRn6rV/K1maKpD5LO3KFIiVi8Ylp3zoST5kWjSlA==
X-Gm-Gg: AYBFou26B0/hSxHeptgEgWGh8pH1yMR9suZwKVyhxjbzy1zipZvCeIFFhZJmeXapP7j
	NPGwlW7Jb7dNUHqma6jVQfiGfUTKr/XXpbNuLK6vbimBszLaCYGZkDkML8bL1soBFUc+k9NXSD1
	BQ46KlSv4GQVCJSg2gvywtO4PcculNx7UBtAtPmW/Dwrr+arhFbHWo7nOwbGZmuboqzmGk7Wyam
	lhCRFfXfr/3bppT0AKBL8qzJUhrGIiMsrYswsaoixy2x5yLEOTvTABzI9k0r1gx6AxF+tJkZu9i
	371f7T1BSukvbQ2aPgcAJBgD6txNm/vnxLTvJY7W7mIcy/o6hZPuFD7TNAc=
X-Received: by 2002:a05:620a:4081:b0:93c:66da:ee08 with SMTP id af79cd13be357-93e9b76c7bamr302066885a.14.1791363678604;
        Wed, 07 Oct 2026 02:01:18 -0700 (PDT)
X-Received: by 2002:a05:620a:4081:b0:93c:66da:ee08 with SMTP id af79cd13be357-93e9b76c7bamr302056685a.14.1791363677950;
        Wed, 07 Oct 2026 02:01:17 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c3188d412besm4197366b.80.2026.10.07.02.01.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Oct 2026 02:01:17 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Deepa Guthyappa Madivalara <deepa.madivalara@oss.qualcomm.com>,
        Yuchan Nam <entropy1110@gmail.com>,
        Jai Luthra <jai.luthra+renesas@ideasonboard.com>,
        Robert Foss <rfoss@kernel.org>, hariram.purushothaman@oss.qualcomm.com,
        pshrotri@qti.qualcomm.com, johannes.goede@oss.qualcomm.com,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH RESEND 09/45] media: qcom: camss: sm8250: add IFE top v20x
Date: Wed,  7 Oct 2026 12:00:05 +0300
Message-Id: <20261007090041.3732717-10-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261007090041.3732717-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: qtYb4iT4A7hmyuoAqpYlHm1XOMLp474k
X-Authority-Analysis: v=2.4 cv=aKFlOr9m c=1 sm=1 tr=0 ts=6ac60a5f cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8 a=dWnZOXp09chh-tGprhQA:9
 a=HFyrwIGFEYZ3i1qu:21 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX7ArP5UDQFr9t
 0iGLgo8RkAKW+4BbnIend+5dLf5e1NDHZlF1/R1dSpaz7nBxRnFLASCgGUgFnO0AjSuzgTp/9iq
 P/Ew33iD3+LFCxptlZ/9LpZSCAn/U+M=
X-Proofpoint-ORIG-GUID: qtYb4iT4A7hmyuoAqpYlHm1XOMLp474k
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA3MDAzNSBTYWx0ZWRfX3kaw4w/H79Wi
 ixejMzBpH+WbRguXU9XV0mgPBOtN6FfHGnGBDiGYXv2mT8EWfub/dKayP6Qbb1yor6vhh+Qwpir
 iYoc0IcVHA+BUsqLStonaQhyY70pdtVKrIauwKz4S3badka+brUm1TRnJJBHErGkbvJTtY4DPC6
 iXSRUUJlxG2E0khtAEu49jNPm3roPy0sG/obpJZyZ282EEUaJxzgRCM5SVOPLAO9NhOgGvjn8bk
 mGpGZmMmRMLFgmzSe3mdqk7lX4W88jxucMzhPNWFkIwjNWmsCBVasiMRLYKuzZG7te0JOFf7HMy
 722g1VuUCl5uqWWx2Lsh2tcKS0xPukdDH5Uu56Z03/xDtAYocxhwVVTVEPjirbgv1xzsZ0WKTyX
 kaC3Z46JknDG3N9v8/20FQ9vAB5VfaB0ttU5DLJy/SzahqaaoejZCm8ww/bU2kW/Gz4Y974aBrd
 7i/mPZamMb6t/R7LQDw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-07_03,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 bulkscore=0 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610070035

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the IFE top controller used by the SM8250 full pixel path.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-top-v20x.c  | 570 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   1 +
 3 files changed, 572 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-top-v20x.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 92f1938a693d..f26806c69e14 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -18,6 +18,7 @@ qcom-camss-objs += \
 		camss-ife-camif-v10x.o \
 		camss-ife-mod-v10x.o \
 		camss-ife-scale-v10x.o \
+		camss-ife-top-v20x.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-top-v20x.c b/drivers/media/platform/qcom/camss/camss-ife-top-v20x.c
new file mode 100644
index 000000000000..bd1ce71c2dd4
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-top-v20x.c
@@ -0,0 +1,570 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include "camss-ife-camif-v10x.h"
+#include "camss-ife-scale-v10x.h"
+#include "camss-ife.h"
+#include "camss.h"
+
+/* Block base offsets */
+#define IFE_V20X_TOP_OFFS		0x0000
+#define IFE_V20X_CAMIF_PP_OFFSET	(IFE_V20X_TOP_OFFS + 0x2600)
+#define IFE_V20X_CAMIF_RDI_OFFSET	(IFE_V20X_TOP_OFFS + 0x9a00)
+
+/* Per-output DS M/N scaler base offsets */
+#define IFE_V20X_VID_DS_MN_Y_OFFSET	0x6400
+#define IFE_V20X_DISP_DS_MN_Y_OFFSET	0x4c00
+#define IFE_V20X_FD_DS_MN_Y_OFFSET	0x4400
+#define IFE_V20X_DS_MN_C_OFFSET(addr)	((addr) + 0x200)
+
+/* HW version fields */
+#define IFE_V20X_TOP_VER_MAJOR		GENMASK(31, 28)
+#define IFE_V20X_TOP_VER_MINOR		GENMASK(27, 16)
+#define IFE_V20X_TOP_VER_STEPS		GENMASK(15, 0)
+#define IFE_V20X_TOP_MAJOR_VERSION(val)	FIELD_GET(IFE_V20X_TOP_VER_MAJOR, val)
+#define IFE_V20X_TOP_MINOR_VERSION(val)	FIELD_GET(IFE_V20X_TOP_VER_MINOR, val)
+#define IFE_V20X_TOP_STEPS_VERSION(val)	FIELD_GET(IFE_V20X_TOP_VER_STEPS, val)
+
+/* CSID-level reset and register-update */
+#define IFE_V20X_TOP_RST_CMD_CORE_SW_RST	BIT(0)
+#define IFE_V20X_TOP_IRQ_CMD_CLEAR		BIT(0)
+
+/* IRQ_STATUS_0 bits - overflow, frame drop, reset */
+#define IFE_V20X_TOP_IRQ_S0_PP_OVERFLOW		BIT(31)
+#define IFE_V20X_TOP_IRQ_S0_DUAL_PD_OVERFLOW	BIT(30)
+#define IFE_V20X_TOP_IRQ_S0_RDI0_OVERFLOW	BIT(29)
+#define IFE_V20X_TOP_IRQ_S0_RDI1_OVERFLOW	BIT(28)
+#define IFE_V20X_TOP_IRQ_S0_RDI2_OVERFLOW	BIT(27)
+#define IFE_V20X_TOP_IRQ_S0_PP_FRAME_DROP	BIT(25)
+#define IFE_V20X_TOP_IRQ_S0_DUAL_PD_FRAME_DROP	BIT(24)
+#define IFE_V20X_TOP_IRQ_S0_RDI0_FRAME_DROP	BIT(23)
+#define IFE_V20X_TOP_IRQ_S0_RDI1_FRAME_DROP	BIT(22)
+#define IFE_V20X_TOP_IRQ_S0_RDI2_FRAME_DROP	BIT(21)
+#define IFE_V20X_TOP_IRQ_S0_DSP_OVERFLOW	BIT(9)
+#define IFE_V20X_TOP_IRQ_S0_BUSWR		BIT(7)
+#define IFE_V20X_TOP_IRQ_S0_RST_DONE		BIT(0)
+
+#define	IFE_V20X_TOP_IRQ_S0_ERRORS_MASK \
+	(IFE_V20X_TOP_IRQ_S0_PP_OVERFLOW	| \
+	 IFE_V20X_TOP_IRQ_S0_DUAL_PD_OVERFLOW	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI0_OVERFLOW	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI1_OVERFLOW	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI2_OVERFLOW	| \
+	 IFE_V20X_TOP_IRQ_S0_PP_FRAME_DROP	| \
+	 IFE_V20X_TOP_IRQ_S0_DUAL_PD_FRAME_DROP	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI0_FRAME_DROP	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI1_FRAME_DROP	| \
+	 IFE_V20X_TOP_IRQ_S0_RDI2_FRAME_DROP	| \
+	 IFE_V20X_TOP_IRQ_S0_DSP_OVERFLOW)
+
+/* IRQ_STATUS_1 bits - per-pipe SOF/EOF/EPOCH */
+#define IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH1		BIT(15)
+#define IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH0		BIT(14)
+#define IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EOF		BIT(13)
+#define IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_SOF		BIT(12)
+#define IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH1		BIT(11)
+#define IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH0		BIT(10)
+#define IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EOF		BIT(9)
+#define IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_SOF		BIT(8)
+#define IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH1		BIT(7)
+#define IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH0		BIT(6)
+#define IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EOF		BIT(5)
+#define IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_SOF		BIT(4)
+#define IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH1		BIT(3)
+#define IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH0		BIT(2)
+#define IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EOF		BIT(1)
+#define IFE_V20X_TOP_IRQ_S1_PP_CAMIF_SOF		BIT(0)
+
+#define IFE_V20X_TOP_IRQ_S1_RDI0 \
+	(IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH1	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH0	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EOF	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_SOF)
+
+#define IFE_V20X_TOP_IRQ_S1_RDI1 \
+	(IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH1	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH0	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EOF	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_SOF)
+
+#define IFE_V20X_TOP_IRQ_S1_RDI2 \
+	(IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH1	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH0	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EOF	| \
+	 IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_SOF)
+
+#define IFE_V20X_TOP_IRQ_S1_PP \
+	(IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH1	| \
+	 IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH0	| \
+	 IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EOF	| \
+	 IFE_V20X_TOP_IRQ_S1_PP_CAMIF_SOF)
+
+/* IRQ_STATUS_2 bits - violations */
+#define IFE_V20X_TOP_IRQ_S2_RDI2_CAMIF_VIOLATION	BIT(19)
+#define IFE_V20X_TOP_IRQ_S2_RDI1_CAMIF_VIOLATION	BIT(18)
+#define IFE_V20X_TOP_IRQ_S2_RDI0_CAMIF_VIOLATION	BIT(17)
+#define IFE_V20X_TOP_IRQ_S2_PP_VIOLATION		BIT(12)
+#define IFE_V20X_TOP_IRQ_S2_PP_CAMIF_VIOLATION		BIT(11)
+#define IFE_V20X_TOP_IRQ_S2_PP_PREPROCESS_VIOLATION	BIT(10)
+
+#define	IFE_V20X_TOP_IRQ_S2_ERRORS_MASK \
+	(IFE_V20X_TOP_IRQ_S2_RDI2_CAMIF_VIOLATION	| \
+	 IFE_V20X_TOP_IRQ_S2_RDI1_CAMIF_VIOLATION	| \
+	 IFE_V20X_TOP_IRQ_S2_RDI0_CAMIF_VIOLATION	| \
+	 IFE_V20X_TOP_IRQ_S2_PP_VIOLATION		| \
+	 IFE_V20X_TOP_IRQ_S2_PP_CAMIF_VIOLATION		| \
+	 IFE_V20X_TOP_IRQ_S2_PP_PREPROCESS_VIOLATION)
+
+/* Pixel-path write-master IDs */
+#define IFE_V20X_CFG0_PP_FULL_Y_WM	0
+#define IFE_V20X_CFG0_PP_FULL_C_WM	1
+#define IFE_V20X_CFG0_PP_DISP_Y_WM	4
+#define IFE_V20X_CFG0_PP_DISP_C_WM	5
+#define IFE_V20X_CFG0_PP_FD_Y_WM	8
+#define IFE_V20X_CFG0_PP_FD_C_WM	9
+
+/* CORE_CFG_0 fields */
+#define IFE_V20X_CFG0_VID_DS16_R2PD_DISABLE		BIT(30)
+#define IFE_V20X_CFG0_VID_DS4_R2PD_DISABLE		BIT(29)
+#define IFE_V20X_CFG0_DISP_DS16_R2PD_DISABLE		BIT(28)
+#define IFE_V20X_CFG0_DISP_DS4_R2PD_DISABLE		BIT(27)
+#define IFE_V20X_CFG0_DUAL_PD_OPERATING_MODE		BIT(13)
+#define IFE_V20X_CFG0_PP_OPERATING_MODE_OFFLINE		1
+#define IFE_V20X_CFG0_PP_OPERATING_MODE			GENMASK(12, 11)
+
+/* CORE_CFG_1 fields */
+#define IFE_V20X_CFG1_BAYER_PLAIN16	1
+#define IFE_V20X_CFG1_PIXEL_RAW_FMT	GENMASK(7, 4)
+
+/* Register-update command bits */
+#define IFE_V20X_TOP_RUP_CMD_RDI2_UPDATE	BIT(3)
+#define IFE_V20X_TOP_RUP_CMD_RDI1_UPDATE	BIT(2)
+#define IFE_V20X_TOP_RUP_CMD_RDI0_UPDATE	BIT(1)
+#define IFE_V20X_TOP_RUP_CMD_PP_UPDATE		BIT(0)
+
+/* Top register offsets */
+#define IFE_V20X_HW_VERSION		0x00000000
+#define IFE_V20X_RST_CMD		0x0000001c
+#define IFE_V20X_CGC_OVERRIDE_0		0x00000020
+#define IFE_V20X_CGC_OVERRIDE_1		0x00000024
+#define IFE_V20X_CGC_OVERRIDE_2		0x00000028
+#define IFE_V20X_CGC_OVERRIDE_3		0x00000094
+#define IFE_V20X_CORE_CFG_0		0x0000002c
+#define IFE_V20X_CORE_CFG_1		0x00000030
+#define IFE_V20X_REG_UPDATE_CMD		0x00000034
+#define IFE_V20X_IRQ_CMD		0x00000038
+#define IFE_V20X_IRQ_MASK_S0		0x0000003c
+#define IFE_V20X_IRQ_MASK_S1		0x00000040
+#define IFE_V20X_IRQ_MASK_S2		0x00000044
+#define IFE_V20X_IRQ_CLEAR_S0		0x00000048
+#define IFE_V20X_IRQ_CLEAR_S1		0x0000004c
+#define IFE_V20X_IRQ_CLEAR_S2		0x00000050
+#define IFE_V20X_IRQ_STATUS_S0		0x00000054
+#define IFE_V20X_IRQ_STATUS_S1		0x00000058
+#define IFE_V20X_IRQ_STATUS_S2		0x0000005c
+
+static inline void __iomem *ife_v20x_get_vid_base(void __iomem *base)
+{
+	return base + IFE_V20X_VID_DS_MN_Y_OFFSET;
+}
+
+static inline void __iomem *ife_v20x_get_disp_base(void __iomem *base)
+{
+	return base + IFE_V20X_DISP_DS_MN_Y_OFFSET;
+}
+
+static inline void __iomem *ife_v20x_get_fd_base(void __iomem *base)
+{
+	return base + IFE_V20X_FD_DS_MN_Y_OFFSET;
+}
+
+static int ife_top_v20x_acquire(struct ife_device *ife, void __iomem *base,
+				void __iomem *csid_base)
+{
+	struct ife_top_ctx *ctx = &ife->top_ctx;
+
+	ctx->base	= base + IFE_V20X_TOP_OFFS;
+	ctx->rdi_base	= base + IFE_V20X_CAMIF_RDI_OFFSET;
+	ctx->pp_base	= base + IFE_V20X_CAMIF_PP_OFFSET;
+	ctx->camif_ops	= ife->res->camif_ops;
+	ctx->dev	= ife->camss->dev;
+
+	return 0;
+}
+
+static void ife_top_v20x_release(struct ife_top_ctx *ctx)
+{
+	ctx->base      = NULL;
+	ctx->camif_ops = NULL;
+}
+
+static int ife_top_v20x_pipe_config(struct ife_top_ctx *ctx,
+				    const struct ife_pad_desc *desc,
+				    const struct camss_ife_pipeline_cfg *pipeline_cfg,
+				    const struct camss_ife_wm_config *wm_cfg)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+	void __iomem *base = ctx->base;
+	void __iomem *scale_base;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		camif_ops->config(ctx->rdi_base + IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe),
+				  hw_pipe, pipeline_cfg);
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		/* Config CAMIF hardware pipeline */
+		camif_ops->config(ctx->pp_base, hw_pipe, pipeline_cfg);
+
+		/* Config FULL M/N DS scalers */
+		if (wm_cfg[Y_PLANE].wm_id == IFE_V20X_CFG0_PP_FULL_Y_WM &&
+		    wm_cfg[C_PLANE].wm_id == IFE_V20X_CFG0_PP_FULL_C_WM) {
+			scale_base = ife_v20x_get_vid_base(base);
+			camif_v10x_scale_config(scale_base, pipeline_cfg, &wm_cfg[Y_PLANE]);
+			camif_v10x_scale_config(IFE_V20X_DS_MN_C_OFFSET(scale_base), pipeline_cfg,
+						&wm_cfg[C_PLANE]);
+		}
+
+		/* Config DISP M/N DS scalers */
+		if (wm_cfg[Y_PLANE].wm_id == IFE_V20X_CFG0_PP_DISP_Y_WM &&
+		    wm_cfg[C_PLANE].wm_id == IFE_V20X_CFG0_PP_DISP_C_WM) {
+			scale_base = ife_v20x_get_disp_base(base);
+			camif_v10x_scale_config(scale_base, pipeline_cfg, &wm_cfg[Y_PLANE]);
+			camif_v10x_scale_config(IFE_V20X_DS_MN_C_OFFSET(scale_base), pipeline_cfg,
+						&wm_cfg[C_PLANE]);
+		}
+
+		/* Config FD M/N DS scalers */
+		if (wm_cfg[Y_PLANE].wm_id == IFE_V20X_CFG0_PP_FD_Y_WM &&
+		    wm_cfg[C_PLANE].wm_id == IFE_V20X_CFG0_PP_FD_C_WM) {
+			scale_base = ife_v20x_get_fd_base(base);
+			camif_v10x_scale_config(scale_base, pipeline_cfg, &wm_cfg[Y_PLANE]);
+			camif_v10x_scale_config(IFE_V20X_DS_MN_C_OFFSET(scale_base), pipeline_cfg,
+						&wm_cfg[C_PLANE]);
+		}
+
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_top_v20x_pipe_enable(struct ife_top_ctx *ctx,
+				    const struct ife_pad_desc *desc)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+	void __iomem *base = ctx->base;
+	void __iomem *scale_base;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		camif_ops->enable(ctx->rdi_base + IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe),
+				  hw_pipe);
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		/* Enable FULL M/N DS scalers */
+		scale_base = ife_v20x_get_vid_base(base);
+		camif_v10x_scale_enable(scale_base);
+		camif_v10x_scale_enable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Enable DISP M/N DS scalers */
+		scale_base = ife_v20x_get_disp_base(base);
+		camif_v10x_scale_enable(scale_base);
+		camif_v10x_scale_enable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Enable FD M/N DS scalers */
+		scale_base = ife_v20x_get_fd_base(base);
+		camif_v10x_scale_enable(scale_base);
+		camif_v10x_scale_enable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Enable CAMIF hardware pipeline */
+		camif_ops->enable(ctx->pp_base, hw_pipe);
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static int ife_top_v20x_pipe_disable(struct ife_top_ctx *ctx,
+				     const struct ife_pad_desc *desc)
+{
+	const struct ife_hw_camif_ops *camif_ops = ctx->camif_ops;
+	enum camss_ife_hw_pipe hw_pipe = desc->hw_pipe;
+	void __iomem *base = ctx->base;
+	void __iomem *scale_base;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+	case CAMSS_IFE_HW_PIPE_RDI1:
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		camif_ops->disable(ctx->rdi_base + IFE_CAMIF_V10X_RDIX_OFFS(hw_pipe),
+				   hw_pipe);
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		/* Disable FULL M/N DS scalers */
+		scale_base = ife_v20x_get_vid_base(base);
+		camif_v10x_scale_disable(scale_base);
+		camif_v10x_scale_disable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Disable DISP M/N DS scalers */
+		scale_base = ife_v20x_get_disp_base(base);
+		camif_v10x_scale_disable(scale_base);
+		camif_v10x_scale_disable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Disable FD M/N DS scalers */
+		scale_base = ife_v20x_get_fd_base(base);
+		camif_v10x_scale_disable(scale_base);
+		camif_v10x_scale_disable(IFE_V20X_DS_MN_C_OFFSET(scale_base));
+
+		/* Disable CAMIF hardware pipeline */
+		camif_ops->disable(ctx->pp_base, hw_pipe);
+
+		break;
+	default:
+		dev_err(ctx->dev, "Invalid HW pipeline identifier: 0x%x\n", hw_pipe);
+		return -EINVAL;
+	}
+
+	return 0;
+}
+
+static u32 ife_top_20x_version(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 reg = readl_relaxed(base + IFE_V20X_HW_VERSION);
+	struct camss_hw_version hw_ver;
+
+	hw_ver.ids.major = IFE_V20X_TOP_MAJOR_VERSION(reg);
+	hw_ver.ids.minor = IFE_V20X_TOP_MINOR_VERSION(reg);
+	hw_ver.ids.steps = IFE_V20X_TOP_STEPS_VERSION(reg);
+
+	return hw_ver.hw_version;
+}
+
+static void ife_top_20x_reset(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S0);
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S1);
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S2);
+	writel_relaxed(IFE_V20X_TOP_IRQ_S0_RST_DONE,
+		       base + IFE_V20X_IRQ_MASK_S0);
+	writel_relaxed(IFE_V20X_TOP_RST_CMD_CORE_SW_RST, base + IFE_V20X_RST_CMD);
+}
+
+static void ife_top_20x_reg_update(struct ife_top_ctx *ctx,
+				   const struct ife_pad_desc *dsc)
+{
+	void __iomem *base = ctx->base;
+
+	switch (dsc->hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		writel_relaxed(IFE_V20X_TOP_RUP_CMD_RDI0_UPDATE, base + IFE_V20X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		writel_relaxed(IFE_V20X_TOP_RUP_CMD_RDI1_UPDATE, base + IFE_V20X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		writel_relaxed(IFE_V20X_TOP_RUP_CMD_RDI2_UPDATE, base + IFE_V20X_REG_UPDATE_CMD);
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		writel_relaxed(IFE_V20X_TOP_RUP_CMD_PP_UPDATE, base + IFE_V20X_REG_UPDATE_CMD);
+		break;
+	default:
+		dev_warn(ctx->dev, "The requested RUP is invalid: 0x%x\n", dsc->hw_pipe);
+	}
+}
+
+static void ife_top_20x_prepare(struct ife_top_ctx *ctx)
+{
+	void __iomem *base = ctx->base;
+	u32 rval;
+
+	writel_relaxed(~0, base + IFE_V20X_CGC_OVERRIDE_0);
+	writel_relaxed(~0, base + IFE_V20X_CGC_OVERRIDE_1);
+	writel_relaxed(~0, base + IFE_V20X_CGC_OVERRIDE_2);
+	writel_relaxed(~0, base + IFE_V20X_CGC_OVERRIDE_3);
+
+	rval  = IFE_V20X_CFG0_VID_DS16_R2PD_DISABLE;
+	rval |= IFE_V20X_CFG0_VID_DS4_R2PD_DISABLE;
+	rval |= IFE_V20X_CFG0_DUAL_PD_OPERATING_MODE;
+	rval |= IFE_V20X_CFG0_DISP_DS16_R2PD_DISABLE;
+	rval |= IFE_V20X_CFG0_DISP_DS4_R2PD_DISABLE;
+	rval |= FIELD_PREP(IFE_V20X_CFG0_PP_OPERATING_MODE,
+			   IFE_V20X_CFG0_PP_OPERATING_MODE_OFFLINE);
+	writel_relaxed(rval, base + IFE_V20X_CORE_CFG_0);
+
+	rval = FIELD_PREP(IFE_V20X_CFG1_PIXEL_RAW_FMT, IFE_V20X_CFG1_BAYER_PLAIN16);
+	writel_relaxed(rval, base + IFE_V20X_CORE_CFG_1);
+
+	/* Clear pending interrupts */
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S0);
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S1);
+	writel_relaxed(~0, base + IFE_V20X_IRQ_CLEAR_S2);
+	writel_relaxed(IFE_V20X_TOP_IRQ_CMD_CLEAR, base + IFE_V20X_IRQ_CMD);
+
+	/* Enable common, frame drops and overflow interrupts */
+	rval = IFE_V20X_TOP_IRQ_S0_BUSWR | IFE_V20X_TOP_IRQ_S0_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_V20X_IRQ_MASK_S0);
+
+	/* Enable violation error interrupts */
+	rval = IFE_V20X_TOP_IRQ_S2_ERRORS_MASK;
+	writel_relaxed(rval, base + IFE_V20X_IRQ_MASK_S2);
+}
+
+static void ife_top_20x_enable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 mask;
+	u32 rval;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		mask = IFE_V20X_TOP_IRQ_S1_PP;
+		break;
+	default:
+		WARN_ONCE(true, "The hw_pipe is invalid: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	rval = readl_relaxed(base + IFE_V20X_IRQ_MASK_S1);
+	writel_relaxed(rval | mask, base + IFE_V20X_IRQ_MASK_S1);
+}
+
+static void ife_top_20x_disable(struct ife_top_ctx *ctx, enum camss_ife_hw_pipe hw_pipe)
+{
+	void __iomem *base = ctx->base;
+	u32 mask;
+	u32 rval;
+
+	switch (hw_pipe) {
+	case CAMSS_IFE_HW_PIPE_RDI0:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI0;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI1:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI1;
+		break;
+	case CAMSS_IFE_HW_PIPE_RDI2:
+		mask = IFE_V20X_TOP_IRQ_S1_RDI2;
+		break;
+	case CAMSS_IFE_HW_PIPE_PP:
+		mask = IFE_V20X_TOP_IRQ_S1_PP;
+		break;
+	default:
+		WARN_ONCE(true, "The hw_pipe is invalid: 0x%x\n", hw_pipe);
+		return;
+	}
+
+	rval = readl_relaxed(base + IFE_V20X_IRQ_MASK_S1);
+	writel_relaxed(rval & ~mask, base + IFE_V20X_IRQ_MASK_S1);
+}
+
+static void ife_top_20x_irq_status(struct ife_top_ctx *ctx, u32 isr_stat[IFE_TOP_STATUS_MAX])
+{
+	void __iomem *base = ctx->base;
+	u32 top_stat;
+
+	isr_stat[IFE_TOP_STATUS_ID0] = 0;
+
+	top_stat = readl_relaxed(base + IFE_V20X_IRQ_STATUS_S0);
+	writel_relaxed(top_stat, base + IFE_V20X_IRQ_CLEAR_S0);
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S0_RST_DONE)
+		isr_stat[IFE_TOP_STATUS_ID0] = IFE_HW_TOP_IRQ0_RST_DONE;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S0_BUSWR)
+		isr_stat[IFE_TOP_STATUS_ID0] |= IFE_HW_TOP_IRQ0_BUSWR;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S0_ERRORS_MASK)
+		isr_stat[IFE_TOP_STATUS_ID0] |= top_stat & IFE_V20X_TOP_IRQ_S0_ERRORS_MASK;
+
+	isr_stat[IFE_TOP_STATUS_ID1] = 0;
+
+	top_stat = readl_relaxed(base + IFE_V20X_IRQ_STATUS_S1);
+	writel_relaxed(top_stat, base + IFE_V20X_IRQ_CLEAR_S1);
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_SOF;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_SOF;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_SOF;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_PP_CAMIF_SOF)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_SOF;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH0)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_EPOCH0;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI0_CAMIF_EPOCH1)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI0_EPOCH1;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH0)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_EPOCH0;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI1_CAMIF_EPOCH1)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI1_EPOCH1;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH0)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_EPOCH0;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_RDI2_CAMIF_EPOCH1)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_RDI2_EPOCH1;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH0)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_EPOCH0;
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S1_PP_CAMIF_EPOCH1)
+		isr_stat[IFE_TOP_STATUS_ID1] |= IFE_HW_TOP_IRQ1_PP_EPOCH1;
+
+	isr_stat[IFE_TOP_STATUS_ID2] = 0;
+
+	top_stat = readl_relaxed(base + IFE_V20X_IRQ_STATUS_S2);
+	writel_relaxed(top_stat, base + IFE_V20X_IRQ_CLEAR_S2);
+
+	if (top_stat & IFE_V20X_TOP_IRQ_S2_ERRORS_MASK)
+		isr_stat[IFE_TOP_STATUS_ID2] |= top_stat & IFE_V20X_TOP_IRQ_S2_ERRORS_MASK;
+
+	writel_relaxed(IFE_V20X_TOP_IRQ_CMD_CLEAR, base + IFE_V20X_IRQ_CMD);
+}
+
+const struct ife_hw_top_ops ife_top_20x_ops = {
+	.acquire	= ife_top_v20x_acquire,
+	.release	= ife_top_v20x_release,
+	.version	= ife_top_20x_version,
+	.prepare	= ife_top_20x_prepare,
+	.enable		= ife_top_20x_enable,
+	.disable	= ife_top_20x_disable,
+	.pipe_config	= ife_top_v20x_pipe_config,
+	.pipe_enable	= ife_top_v20x_pipe_enable,
+	.pipe_disable	= ife_top_v20x_pipe_disable,
+	.reg_update	= ife_top_20x_reg_update,
+	.reset		= ife_top_20x_reset,
+	.irq_status	= ife_top_20x_irq_status,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index 233b0292c107..258af76c94ea 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -389,6 +389,7 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     const struct camss_ife_stream *streams,
 			     u32 id);
 
+extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
-- 
2.34.1

