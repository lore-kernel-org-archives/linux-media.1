Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A2C43B47EF
	for <linux-media@vger.kernel.org>; Tue,  6 Oct 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791326510; cv=none; b=fQPQMWqHnaxfgbYYQ8byMxEkzd8gwwxmg62jdARKFMeS1g8fLdUBvJ1oc5x8EftjKfde+2L2/bNEmt0/t3vGsbG4r2QMU6OL62p+eZrIR8RKGjvQdn6QndTcnWdyeGMlcSA2+VN2Z22Dnwlvpm9e4r7izwCHEhYixOM0pvSZGBY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791326510; c=relaxed/simple;
	bh=z6CZq0aGRyg9p9DVVIEbOnUdoi5GFbVFDJh5xSrFglQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=R/aXLju2LyyTnP64FTFsd3pr7vwZgej2EMAsWUcBH5O6h5P/HurQ1S3c8Oba+akkaz9cR/OizjixPgckbHomgKg+MXRCRYvMnoVWSfdiGVfpMLq7ynL+e3rffuFQlTfDGLwrQuVnDg8Ljhl8kx+9/x3CQs7jnDrXdPJGzc9smt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=fail (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=O1B/B8qW reason="signature verification failed"; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="O1B/B8qW"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 696LerhU2389912
	for <linux-media@vger.kernel.org>; Tue, 6 Oct 2026 22:40:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=FUnGOqWJyAO
	xPtoaJ9zFyHDhr6IuWMPalDNRkbmUSKI=; b=O1B/B8qWecb3rerak5Uix50KQRj
	bRJgmGSirurbmbfbV8MSGnYz66ZFVnVnkknnSLXH2VZbzTNdk1jfhy9N57LuuJSC
	wW3XQKJXQvjKfFgKSHm7aaGWPSYncCyApJnDPXUrMuvV7SdCksBHJqX7jk5z0ktD
	MYjW6cjnGHVuf6m31n9B7FzYuy1UQyIloB6sh1uIUOqwArorx9T1k8kO4vqPvih1
	XX9yIdHNj9WCRiIGTxIm4YC+mAUkMzffTannX9U1WGI4pIVczmFezv1DS/Yp6ikU
	dDP9P3XMOzuel/7i6/WwABbb2Eyt0+rWqugOTF3ytLoPVQY/RB1VQRaAZQQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h4xfbk0sy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 22:40:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93bfb2da664so764128585a.1
        for <linux-media@vger.kernel.org>; Tue, 06 Oct 2026 15:40:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791326447; x=1791931247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=FUnGOqWJyAOxPtoaJ9zFyHDhr6IuWMPalDNRkbmUSKI=;
        b=rQMnG3AGfrKeDvP58sMfrXxs+BdpF+YCXVM8xspLXXR/GPcorYofXVGJcuu3iD1Q/m
         +qJOPfAypcH0Xyep/2JipbWSJknKcqw3ntlK3nF5r65elZXz5A5NaGzdGwRN92Md7Lt9
         +MmZsXCBo/w9CVMbgfnCm1mcRHHLT8rsC87WjDh34ZhLsdKOSL44pYB4fqngE5pwIpoo
         VbKmNyPQIUxWxIm8WyL+vlqPEFy+df87H0G9Y2Brf6vTe/49VwB/IpgGbSI7vAog+cye
         w20OnqW5C9nZW3q3HA5cuSALZgjznFIWVp9vcvAIM1GuQoZrf3Wp/NlbvlxnWB9hyyUC
         dhsA==
X-Forwarded-Encrypted: i=1; AKwUvBwSxEKxHr92IbjPe86NShVyO1/VhVUO2AOog6x4JZZcqb3VjenpKWoRaXz6ZFiYIktWqhlOaue+cxCdOA==@vger.kernel.org
X-Gm-Message-State: AFuF++mW/TVKMyWhtbiDNmw56pE8aDUekfhSDZf0QxlLBCTSEPWGTl9/
	lcNa4UX8SEVvnSvKNsupXonh/N9luM1rfPiDX/idgBzyAFYiZtb+mC0ocfmFvq/GBzvXllfQ6rq
	/8H0vZol6xgPJbX3vR13x4EoEw1SXi1iszeakL4VixZiFQTW/XSVTaZDu4xKar7U6Uw==
X-Gm-Gg: AYBFou3sJcaKjXaoINYSz7opYiCyyHarKvAGOQtenLg4n5LxAmsHqoxnSvdlq/xXrIG
	z7+rb4niwNh32fsiLKoXJAnCr3VWdJSA2Hv3JGfuyESggRRrfhvcigVGVTRYyWEH5qBTT/GMKUW
	fX0Dq5ngmeGT7U3KZEzqsMcTC9l3BHK623AOkgnw3yQA7zY9w8UoX065W5HCt/x+JrAYwDZfLBz
	CW6n0Ksc0+VUECT0QqsLRrAt4aNe+0HAD1RnmdU9sFDfVanaHwUf/He2cs4itocgzpZvLLUu38W
	dtMJWhqkn89UttCk7wiRhFF/rDBO/ZYimfu7mRP1IJV71nF/+cI8PbuVJtM=
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr73390085a.31.1791326447144;
        Tue, 06 Oct 2026 15:40:47 -0700 (PDT)
X-Received: by 2002:a05:620a:6287:b0:939:de48:e41f with SMTP id af79cd13be357-93e9b74b82amr73386585a.31.1791326446549;
        Tue, 06 Oct 2026 15:40:46 -0700 (PDT)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a178c53299sm167263575e9.11.2026.10.06.15.40.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Oct 2026 15:40:44 -0700 (PDT)
From: Gjorgji.Rosikopulos.gjorgji.rosikopulos@oss.qualcomm.com
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        hariram.purushothaman@oss.qualcomm.com, pshrotri@qti.qualcomm.com,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        johannes.goede@oss.qualcomm.com, konradybcio@kernel.org
Subject: [PATCH 13/45] media: qcom: camss: sm8250: add IFE pad descriptors
Date: Wed,  7 Oct 2026 01:39:21 +0300
Message-Id: <20261006223953.3382273-14-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261006223953.3382273-1-gjorgji.rosikopulos@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=D8TSufRj c=1 sm=1 tr=0 ts=6ac578f0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8 a=NpnfLZo9eu9fMg92iX8A:9
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: w1LOMYF6d9c_e9vY6u5WY_zs_d9amKbd
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfXy31XpuHeWXVs
 Eh/M4LPaN35tv6YLF0ZK2AjZTiVCQ2tchcuto/qau0sgYh3kKYA398hLu0tFX4/rHzWMpDDQpn8
 nnIl0owL5MThQBCgoXUaQ1ZdumsayfU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA2MDA5MCBTYWx0ZWRfX36irIFyaONEP
 bWIJ2KBSpWA/3KufkfioXi0RRgmtNlrGN1ycBfpGgbAwrWr+JLVJdwg8RMY0r9wCiDC5jFPD48X
 G7Et03AJUEyRqOkNkPSTjfP1d/NH99AUfuZwUYwEi619I7oXvTpk4oP6AOEMbCI7FSv7mel1lbF
 CcK6bfF/Fn8L3SuWqlhFT9ZjgWv4Zt1eS0IveAPmmfMAzwK6veZ6xaxXRxTSjKzhoHjX0GjhsMe
 iNb4XvxW3YDzPYcviJ/gIfSxaMOJ0diNXZxTFCeHiiyKOQKvgddxz+2NeIPtFzfrcX4IOewgiyz
 LjNn+WZnWtcAq3fRliabn0hAb9grMnkft2zrel9WI3YbqYPbUSnKFVyA9aRtKigazFTeeahpYq5
 G8OqchtO5xLTy4GmggeXE9FANv+e4iUUtNUWfauPrKfS8M4zGHyA31sH6dL6MzShcVTIGUmYK98
 Zmiz3XLqpCfnl/Dl5Cg==
X-Proofpoint-ORIG-GUID: w1LOMYF6d9c_e9vY6u5WY_zs_d9amKbd
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-06_05,2026-10-06_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 suspectscore=0 priorityscore=1501
 bulkscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610060090

From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Add the pad, format, size and write-master tables for the SM8250 full
and lite IFE blocks.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/Makefile    |   1 +
 .../platform/qcom/camss/camss-ife-pads.c      | 306 ++++++++++++++++++
 drivers/media/platform/qcom/camss/camss-ife.h |   2 +
 3 files changed, 309 insertions(+)
 create mode 100644 drivers/media/platform/qcom/camss/camss-ife-pads.c

diff --git a/drivers/media/platform/qcom/camss/Makefile b/drivers/media/platform/qcom/camss/Makefile
index 22df889656ba..547da75b24b4 100644
--- a/drivers/media/platform/qcom/camss/Makefile
+++ b/drivers/media/platform/qcom/camss/Makefile
@@ -20,6 +20,7 @@ qcom-camss-objs += \
 		camss-ife-mod-v10x.o \
 		camss-ife-scale-v10x.o \
 		camss-ife-top-v20x.o \
+		camss-ife-pads.o \
 		camss-ispif.o \
 		camss-tpg.o \
 		camss-tpg-gen1.o \
diff --git a/drivers/media/platform/qcom/camss/camss-ife-pads.c b/drivers/media/platform/qcom/camss/camss-ife-pads.c
new file mode 100644
index 000000000000..926ba96a7603
--- /dev/null
+++ b/drivers/media/platform/qcom/camss/camss-ife-pads.c
@@ -0,0 +1,306 @@
+// SPDX-License-Identifier: GPL-2.0
+/* Copyright (c) 2023, The Linux Foundation. All rights reserved.
+ * Copyright (c) 2023 Qualcomm Technologies, Inc.
+ */
+
+#include <linux/videodev2.h>
+#include <media/v4l2-mediabus.h>
+
+#include "camss-format.h"
+#include "camss-ife.h"
+
+static const struct camss_format_info ife_sink_fmts_v20x[] = {
+	{ MEDIA_BUS_FMT_UYVY8_1X16, 8, V4L2_PIX_FMT_UYVY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_VYUY8_1X16, 8, V4L2_PIX_FMT_VYUY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_YUYV8_1X16, 8, V4L2_PIX_FMT_YUYV, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_YVYU8_1X16, 8, V4L2_PIX_FMT_YVYU, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_SBGGR8_1X8, 8, V4L2_PIX_FMT_SBGGR8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SGBRG8_1X8, 8, V4L2_PIX_FMT_SGBRG8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SGRBG8_1X8, 8, V4L2_PIX_FMT_SGRBG8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SRGGB8_1X8, 8, V4L2_PIX_FMT_SRGGB8, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_SBGGR10_1X10, 10, V4L2_PIX_FMT_SBGGR10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SGBRG10_1X10, 10, V4L2_PIX_FMT_SGBRG10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SGRBG10_1X10, 10, V4L2_PIX_FMT_SGRBG10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SRGGB10_1X10, 10, V4L2_PIX_FMT_SRGGB10P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 10 } },
+	{ MEDIA_BUS_FMT_SBGGR10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_SBGGR10, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+	{ MEDIA_BUS_FMT_SBGGR12_1X12, 12, V4L2_PIX_FMT_SBGGR12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SGBRG12_1X12, 12, V4L2_PIX_FMT_SGBRG12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SGRBG12_1X12, 12, V4L2_PIX_FMT_SGRBG12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SRGGB12_1X12, 12, V4L2_PIX_FMT_SRGGB12P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 12 } },
+	{ MEDIA_BUS_FMT_SBGGR14_1X14, 14, V4L2_PIX_FMT_SBGGR14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SGBRG14_1X14, 14, V4L2_PIX_FMT_SGBRG14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SGRBG14_1X14, 14, V4L2_PIX_FMT_SGRBG14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_SRGGB14_1X14, 14, V4L2_PIX_FMT_SRGGB14P, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 14 } },
+	{ MEDIA_BUS_FMT_Y8_1X8, 8, V4L2_PIX_FMT_GREY, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 8 } },
+	{ MEDIA_BUS_FMT_Y10_2X8_PADHI_LE, 16, V4L2_PIX_FMT_Y10, 1,
+	  { { 1, 1 } }, { { 1, 1 } }, { 16 } },
+};
+
+static const struct camss_format_info ife_vid_pix_fmts_v20x[] = {
+	{ MEDIA_BUS_FMT_YUYV8_1_5X8, 8, V4L2_PIX_FMT_NV12, 1,
+	  { { 1, 1 } }, { { 2, 3 } }, { 8 } },
+};
+
+static const struct ife_pad_limits ife_vid_limits_v20x = {
+	.min_width	= 320,
+	.min_height	= 240,
+	.max_width	= 4928,
+	.max_height	= 8192,
+	.max_h_ratio	= 16,
+	.max_v_ratio	= 16,
+};
+
+static const struct ife_pad_limits ife_fd_limits = {
+	.min_width	= 320,
+	.min_height	= 240,
+	.max_width	= 1920,
+	.max_height	= 1080,
+	.max_h_ratio	= 16,
+	.max_v_ratio	= 16,
+};
+
+static const struct ife_pad_desc ife_lite_pad_desc_v20x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(4),
+		.num_wms = 1,
+		.wm = { 0 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(1),
+		.comp_group_mask = BIT(5),
+		.num_wms = 1,
+		.wm = { 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(2),
+		.comp_group_mask = BIT(6),
+		.num_wms = 1,
+		.wm = { 2 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi3",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI3,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI3,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(3),
+		.comp_group_mask = BIT(7),
+		.num_wms = 1,
+		.wm = { 3 },
+	},
+};
+
+static const struct ife_pad_desc ife_pad_desc_v20x[] = {
+	{
+		.pad_flags = MEDIA_PAD_FL_SINK,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi0",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI0,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI0,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(3),
+		.comp_group_mask = BIT(17),
+		.num_wms = 1,
+		.wm = { 23 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi1",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI1,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI1,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(4),
+		.comp_group_mask = BIT(18),
+		.num_wms = 1,
+		.wm = { 24 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_sink_fmts_v20x),
+			.formats = ife_sink_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "rdi2",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_RDI2,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_RDI2,
+		.packing_fmt = 0x0,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_FRAME_BASED,
+		.rup_group_mask = BIT(5),
+		.comp_group_mask = BIT(19),
+		.num_wms = 1,
+		.wm = { 25 },
+	},
+
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "vid_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_VID_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(6),
+		.num_wms = 2,
+		.wm = { 0, 1 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_vid_limits_v20x,
+		.video_name = "disp_full",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_DISP_FULL,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(7),
+		.num_wms = 2,
+		.wm = { 4, 5 },
+	},
+	{
+		.pad_flags = MEDIA_PAD_FL_SOURCE,
+		.sup_fmts = {
+			.nformats = ARRAY_SIZE(ife_vid_pix_fmts_v20x),
+			.formats = ife_vid_pix_fmts_v20x,
+		},
+		.limits = &ife_fd_limits,
+		.video_name = "fd",
+		.link_flags = MEDIA_LNK_FL_IMMUTABLE | MEDIA_LNK_FL_ENABLED,
+		.buf_type = V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE,
+		.output = CAMSS_IFE_OUTPUT_FD,
+		.hw_pipe = CAMSS_IFE_HW_PIPE_PP,
+		.packing_fmt = 0x1,
+		.mode_config = BUSWR_CLIENT_CFG_MODE_LINE_BASED,
+		.rup_group_mask = BIT(0),
+		.comp_group_mask = BIT(8),
+		.num_wms = 2,
+		.wm[0] = 8,
+		.wm[1] = 9,
+	},
+};
+
+const struct ife_pads_descriptors ife_lite_pads_v20x = {
+	.num_desc = ARRAY_SIZE(ife_lite_pad_desc_v20x),
+	.desc = ife_lite_pad_desc_v20x,
+};
+
+const struct ife_pads_descriptors ife_pads_v20x = {
+	.num_desc = ARRAY_SIZE(ife_pad_desc_v20x),
+	.desc = ife_pad_desc_v20x,
+};
diff --git a/drivers/media/platform/qcom/camss/camss-ife.h b/drivers/media/platform/qcom/camss/camss-ife.h
index a36efd8a6352..45fce7e33c4a 100644
--- a/drivers/media/platform/qcom/camss/camss-ife.h
+++ b/drivers/media/platform/qcom/camss/camss-ife.h
@@ -389,10 +389,12 @@ camss_ife_pipe_for_stream_id(int nstreams,
 			     const struct camss_ife_stream *streams,
 			     u32 id);
 
+extern const struct ife_pads_descriptors ife_pads_v20x;
 extern const struct ife_hw_top_ops ife_top_20x_ops;
 extern const struct ife_hw_buswr_ops ife_buswr_20x_ops;
 extern const struct camss_mod_ops ife_mod_v10x_ops;
 
+extern const struct ife_pads_descriptors ife_lite_pads_v20x;
 extern const struct ife_hw_top_ops ife_lite_top_10x_ops;
 
 #endif /* CAMSS_IFE_SUB_DEV_H */
-- 
2.34.1

