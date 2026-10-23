Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792768183;
	b=JDYL6Cq1WkQU3vqcPIB+ry/XfcPXsojdv00vqgCpAYGHINd+fmEF78GoCBtzifJWdqn+
	 rcJZ0JCgwLsV7iEm7WuH0bSdEO0vpJXd3IwL5k8OGitgnw2zylPAU+67E2GrsfKOIbpKI
	 amOGa9RNAHbmJ64iyniNFOpNTumYmV5QctwPEUbo+WQWdmAZmA65C+aT4i6EHFdUsRHZ/
	 5PSSrB+/EqTPxV4Q54kSFPbynhXUW+ce6jofQZO7TLzAQ9iDLocBqvsqM4eVdB6DtBOSz
	 y3MW7tMPeL9hpxZEOJlcbycBPSzgo33Zdq1gdIJ1cY4TrSL0lmlXdtFgUHXR374gyLg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768183;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
	b=DqtGvQeydxhpdh9Uc09mYnTcCJ02o02OYI8Qb5uOPp6InGBAMqOuApz6elkaP6sykBg3
	 n97j3199MDVJElkQrEUSrxPPnGgAkHxbhezeClrQGlhOl/Z60SbUNZnIN/zDYPEilkHgx
	 kixSLHs8186pd3obUYLlZrRHyoMkFwJu9xXj7aievSOfpaM0eX6EgNZMoHUi8O1Z7lDhm
	 Vkz4MlSpNDSNOA7ZXWBKXUZ6wrvd335sMIKXvMKRcwLH10qkvctyHTUKaFTRusduqBPZP
	 yFBdgbKk83UMpcJm2nvVXtJC09ydRUO6surqh2UrzrgOpob6GmpKPITKOByzBuczlHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0uevluw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="XgrRrB7/";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60FE460A261F
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 60FE460A261F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=K0uevluw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XgrRrB7/
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE66X81955000
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=; b=K0uevluwF3j1dVC0
	AXuhj/+Mq0KZumoPpFAa6bCDlfbXM5Si1AB2lxhhRYByyqgllDezXezANhuJ65S1
	IZPmsfFItm3aW/4io/d2jxVr3ohO3W8ilp0fViKB9/x/NCKr0v+Bf5OFDUiZsOBV
	MLRxikl7TTDwCcQqaTAtRNIoZdVOvWuSheFVPsVXsfgX/sooWz4jDN085sLb1oPx
	gOzar7czeFZ5VPwI5S9bmENzKlELCF0Ygbw2dTUVdemeL3pkR13Ee9CAu0KZfWk6
	kFrymcyb6C6jwa2+NqboovfRd9oliymL3MIpP8EQyfdCPsjaCqI32jJ0smP5tlkm
	kQC3JQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmbm99s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:09:42 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso195847137.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:09:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768181; x=1793372981; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
        b=XgrRrB7/LKrF6VBXaKTxLInNmexSyJTjM/sX6wViF0szKP2w/HeDYKknUGO4/AEuKz
         AXVIut9WY7rthZHKM/0q8nZ8luazkWT6drsazaaKdKzAMig4/yqmFzDTrRZSWxuR2NkK
         N3Prcag64l6gouSMvqSUIcEypfSUnEprj7FJeFexYgroRYQzfi7injaLHdBDw14WoSkQ
         +1X3NBfFAQA8uOTNvdGt5XDJ1OUwjcbdu9sF/dTcXNe97X5pvxTB6xD+d7Ci8NF8uGdb
         63r2TP3MiD33GrZPfBscgxp8rvbQEh3TD728OXuceCCVLifchOeiGwPH+uFOeMpdaKSC
         pgyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768181; x=1793372981;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GK+YDzIPYZBQYW/Kyml/YWjbXuZpS9AEGYoSg6CWENU=;
        b=OkU/BnHj5l6nElrxmXStKpYRoTpr4+SxHjYXG+dUq6vti3tHVsAMmL99J5+SovCjTu
         qg1IA2y5fAqm1RldC0RezyOiCCISBacsaMlKYKz7EmslwdXfUfRe79N5LhfY5IUc1LdO
         J9oLFLZoQ47qdoPSBwIatoB5chm41WawBJYH7O0g6xI+x9E2xicrvInERxjhT3lR8enj
         Fla8cwSc2XXlRkbw6pXGFsebp2ZMpcx6STRUAcGPuhgTcAY0DNLtnG7Wkenw+yPk/pj9
         9CWCS1pkFtaVHHs/2qbbQVUWVdydLiCra3v1QgQl+ZPOX6I+ffctIP0BKyqNpGqGTggM
         84Tw==
X-Gm-Message-State: AFq9FYIlSwDp7DF010x7mUHSVnB2PT3zHOgq3VJqeNUHudsIr2VTh/zZ
	6m9Pe/W2Ft9Y7q3BMGbKtVB3RdZdn/iXT3+zIOIz0NIJu2scC0y2EMzahTqvcDSXIWUWyNUOQNu
	JXJixIxVzMcBBX2kYw0ofLb0TWEgkDosjQ+K08iLTnoa8gMPMLz7WTwlzaM5HqtFB/w==
X-Gm-Gg: AYBFou1JeS7QKQ22kBzoRH/MEALI/Kx/vvxmMod4cI+Z7CuBHh5momXoKCulETGOj4F
	8LOQUDRDvkd5gPfmruJdnh/iAgJ49LkoGeBvV9dm/0HMoZpnJrLw7lwg6WTpAZixieardEX/oEy
	GGi4uglfuxdiZC2cBHw0bhn7MAo7qtQEPW5Xqo15t2DZQm/eDL2uB+EtdTeLm9wDvHvy0OdYanB
	cukh+jOaLR7pcNzxtJmQ2HpyfI0Dg7ScR+3zfkhEvpFfOeUGAk8zcPZsfj7zPxGpxV+25OqEpW9
	3G/Y3zgh6+QarEBpDEqvoqxXeqnOU1z/UIrnJc6P6gUjYPbfNAQICFtazaHAaN5NFkW2L15bYs+
	cS3ktUGMPf9sV7jbRDEaUQhMmGtX0976e4Hca7Dnw8u6nqnfOhkSA1+xfcdoIe646GmY2M91qjF
	TUWPssff2QrC7lpfhfpO9mP7M8cDz7tOKkYzJb9hzZM/EBxLB2ydA=
X-Received: by 2002:a05:6102:4457:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7ccc31d07bemr714543137.11.1792768181389;
        Fri, 23 Oct 2026 08:09:41 -0700 (PDT)
X-Received: by 2002:a05:6102:4457:b0:79c:99ea:2c9a with SMTP id ada2fe7eead31-7ccc31d07bemr714495137.11.1792768180779;
        Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:d0fb:daf1:3106:3697])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3d4040d3sm323962f8f.27.2026.10.23.08.09.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 08:09:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:09:15 +0200
Subject: [PATCH v11 4/9] media: uapi: Add CAMSS ISP configuration
 definition
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261023-camss-isp-ope-v11-4-0c2937195298@oss.qualcomm.com>
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX7Y6Bj1N0slpr
 xS51V41mEJvW7IOlGpfcsIhHq3h9V9LQ0iLdD8X+F7dAlaqNCi+AvhDmU/BKGyaM014ihSlem87
 piWjr1J8aynwSVcJbnq4PwSHMNTnlII=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX8UDnf8c8eipU
 8qx7FsDh+NGbDrocMQdrim0N4Kmn/z63dVsodkIa9Dm4JPxx2LdA3OPZul/vXfuSl018NNixmwF
 eUqfwqtWVn+URLeMbDtAUCslibnFJ8ocHLQpzPI5gLxJ0CAss7qTO32XjA2Uut3cocpHXJktnd9
 /YiTS8bAyiYr5GC3Y6LWlncK03LmX50LFdS0bCP0JnHVvmvXNsNPXB/vp6iTQM2OSD3tPaXUzqa
 wzwf0JgFDE7fViFKbsuMxM/VbBF7F/m1lvch4Rqu8HhQuDI7u8ikfobBRixyylw+++rx1OBqgVG
 Ta9eMw2ys1vYLqrs6M5n2UI6P+UpwC30jJkkeA26zdF0KrQfiKS42TolXTdblwg/5/G9BLByvQS
 iEG6gCLNytxy8Frw8/lhzpb6nvP3OsyiMGkw8dX97X8X+va0JNrst7p8WtzsKkcftGre+wmM4Al
 s9eInxiafvBP+3eFFsg==
X-Proofpoint-ORIG-GUID: XLiccIpR8z9LK0wK0UVwq6e3lC7n9ftb
X-Authority-Analysis: v=2.4 cv=Nt1E4MdJ c=1 sm=1 tr=0 ts=6adb78b6 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=cBt3T3tByBXynNCq78MA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-GUID: XLiccIpR8z9LK0wK0UVwq6e3lC7n9ftb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

Add the uapi header qcom-camss-config.h defining the ISP parameter
structures used by the CAMSS Offline Processing Engine (OPE) driver.
This includes structures for white balance, chroma enhancement and
color correction configuration.

The block type enum is shared across CAMSS ISPs so that userspace only
has to deal with a single set of block identifiers.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 include/uapi/linux/qcom-camss-config.h | 212 +++++++++++++++++++++++++++++++++
 1 file changed, 212 insertions(+)

diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linux/qcom-camss-config.h
new file mode 100644
index 0000000000000000000000000000000000000000..5756d165e7e873a6d268909da077acb6f5f56054
--- /dev/null
+++ b/include/uapi/linux/qcom-camss-config.h
@@ -0,0 +1,212 @@
+/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
+/*
+ * Qualcomm CAMSS ISP Driver - Userspace API
+ *
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
+
+#include <linux/types.h>
+#include <linux/media/v4l2-isp.h>
+
+/**
+ * enum camss_params_block_type - CAMSS ISP parameter block identifiers
+ *
+ * Each value identifies one ISP processing block.  The value is placed in
+ * the @type field of &struct v4l2_isp_block_header.
+ *
+ * @CAMSS_PARAMS_WB_GAIN: white balance gains and offsets (CLC_WB),
+ *	&struct camss_params_wb_gain
+ * @CAMSS_PARAMS_CHROMA_ENHAN: RGB to YUV colour transfer matrix
+ *	(CLC_CHROMA_ENHAN), &struct camss_params_chroma_enhan
+ * @CAMSS_PARAMS_COLOR_CORRECT: colour correction matrix (CLC_CC),
+ *	&struct camss_params_color_correct
+ * @CAMSS_PARAMS_GAMMA: per-channel gamma correction curves (CLC_GLUT),
+ *	&struct camss_params_gamma
+ */
+enum camss_params_block_type {
+	CAMSS_PARAMS_WB_GAIN = 1,
+	CAMSS_PARAMS_CHROMA_ENHAN = 2,
+	CAMSS_PARAMS_COLOR_CORRECT = 3,
+	CAMSS_PARAMS_GAMMA = 4,
+};
+
+/* Number of entries in each gamma channel LUT. */
+#define CAMSS_GAMMA_LUT_SIZE	256
+
+/**
+ * struct camss_params_wb_gain - White Balance gains
+ *
+ * Implements the CLC_WB pipeline module.  The pipeline applies three
+ * sequential operations per channel:
+ *   1. Subtract sub-offset (black-level subtraction)
+ *   2. Multiply by gain    (colour balance)
+ *   3. Add add-offset      (output pedestal)
+ *
+ * Gains are 15uQ10 (15-bit unsigned, 10 fractional bits). Offsets
+ * are 16-bit unsigned, normalised to full input scale (65535 = 1.0)
+ *
+ * @header:   block header; @header.type = CAMSS_PARAMS_WB_GAIN
+ * @g_gain:   green channel gain (15uQ10, 1024 = 1.0)
+ * @b_gain:   blue  channel gain (15uQ10, 1024 = 1.0)
+ * @r_gain:   red   channel gain (15uQ10, 1024 = 1.0)
+ * @g_sub:    green sub-offset, subtracted before gain (16u)
+ * @b_sub:    blue  sub-offset, subtracted before gain (16u)
+ * @r_sub:    red   sub-offset, subtracted before gain (16u)
+ * @g_add:    green add-offset, added after gain (16u)
+ * @b_add:    blue  add-offset, added after gain (16u)
+ * @r_add:    red   add-offset, added after gain (16u)
+ * @_pad:     padding for 64-bit alignment, must be zero
+ */
+struct camss_params_wb_gain {
+	struct v4l2_isp_block_header header;
+	__u16 g_gain;
+	__u16 b_gain;
+	__u16 r_gain;
+	__u16 g_sub;
+	__u16 b_sub;
+	__u16 r_sub;
+	__u16 g_add;
+	__u16 b_add;
+	__u16 r_add;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_chroma_enhan - RGB to YUV colour transfer matrix
+ *
+ * Implements the CLC_CHROMA_ENHAN pipeline module. All coefficients are
+ * signed 12-bit fixed-point Q3.8 (range roughly -8.0 to +7.996).
+ *
+ * RGB2Y - Luma (Y) coefficients
+ * Y = v0 * R + v1 * G + v2 * B
+ *
+ * @luma_v0:  R-to-Y coefficient (12sQ8)
+ * @luma_v1:  G-to-Y coefficient (12sQ8)
+ * @luma_v2:  B-to-Y coefficient (12sQ8)
+ * @luma_k:   Y output offset    (9s,  0 = no offset)
+ *
+ * RGB2Cb - Chroma (Cb) coefficients
+ * Cb = a x ((B - G) + b(R - G)) + KCb
+ * with:
+ *   a = ap, when (B-G) + b(R-G) > 0; a = am, when (B-G) + b(R-G) ≤ 0;
+ *   b = bp when (R-G) > 0; b = bm when (R-G) ≤ 0
+ *
+ * @coeff_ap: Cb positive coefficient (12sQ8)
+ * @coeff_am: Cb negative coefficient (12sQ8)
+ * @coeff_bp: Cb positive coefficient (12sQ8)
+ * @coeff_bm: Cb negative coefficient (12sQ8)
+ * @kcb:      Cb output offset        (11s)
+ *
+ * RGB2Cr - Chroma (Cr) coefficients:
+ * Cr = c x ((R - G) + d(B - G)) + KCr
+ * with:
+ *   c = cp, when (R-G) + d(B-G) > 0; c = cm, when (R-G) + d(B-G) ≤ 0
+ *   d = dp when (B-G) > 0; d = dm when (B-G) ≤ 0
+ *
+ * @coeff_cp: Cr positive coefficient (12sQ8)
+ * @coeff_cm: Cr negative coefficient (12sQ8)
+ * @coeff_dp: Cr positive coefficient (12sQ8)
+ * @coeff_dm: Cr negative coefficient (12sQ8)
+ * @kcr:      Cr output offset        (11s)
+ *
+ * @header: generic block header; @header.type = CAMSS_PARAMS_CHROMA_ENHAN
+ * @_pad:   padding for 64-bit alignment, must be zero
+ */
+struct camss_params_chroma_enhan {
+	struct v4l2_isp_block_header header;
+	__s16 luma_v0;
+	__s16 luma_v1;
+	__s16 luma_v2;
+	__s16 luma_k;
+	__s16 coeff_ap;
+	__s16 coeff_am;
+	__s16 coeff_bp;
+	__s16 coeff_bm;
+	__s16 coeff_cp;
+	__s16 coeff_cm;
+	__s16 coeff_dp;
+	__s16 coeff_dm;
+	__s16 kcb;
+	__s16 kcr;
+	__u16 _pad[2];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_color_correct - colour correction matrix
+ *
+ * Implements the CLC_CC pipeline module.  The matrix computes:
+ *   Out_ch0 (G) = a0*G + b0*B + c0*R + k0
+ *   Out_ch1 (B) = a1*G + b1*B + c1*R + k1
+ *   Out_ch2 (R) = a2*G + b2*B + c2*R + k2
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_COLOR_CORRECT
+ * @a:       G-input coefficients per output channel (12s;
+ *           a[0]=Out_G, a[1]=Out_B, a[2]=Out_R)
+ * @b:       B-input coefficients (12s)
+ * @c:       R-input coefficients (12s)
+ * @k:       per-output-channel offsets (typically 9s effective)
+ * @qfactor: Q-format selector (2u):
+ *           0 = 12sQ7  (range ~-16.0 .. +15.992)
+ *           1 = 12sQ8  (range  ~-8.0 ..  +7.996)
+ *           2 = 12sQ9  (range  ~-4.0 ..  +3.998)
+ *           3 = 12sQ10 (range  ~-2.0 ..  +1.999)
+ * @_pad:    padding for 64-bit alignment, must be zero
+ */
+struct camss_params_color_correct {
+	struct v4l2_isp_block_header header;
+	__s16 a[3];
+	__s16 b[3];
+	__s16 c[3];
+	__s16 k[3];
+	__u16 qfactor;
+	__u16 _pad[3];
+} __attribute__((aligned(8)));
+
+/**
+ * struct camss_params_gamma - per-channel gamma correction curves
+ *
+ * Implements the CLC_GLUT pipeline module, applied in the RGB domain.  It
+ * holds one independent lookup table per colour channel. Each table is a
+ * direct (not segmented) map of input level to output level.
+ *
+ * Each table has @CAMSS_GAMMA_LUT_SIZE (256) entries of 16-bit unsigned
+ * output. The number of significant output bits follows the width of the
+ * engine's internal bus; the upper bits are ignored by the hardware.
+ *
+ * The module maps a 12-bit input to an 8-bit output: the top 8 input bits
+ * index the table and the low 4 bits are used to linearly interpolate
+ * between adjacent entries. Entry i therefore represents the output for
+ * input level i/255 of full scale.
+ * Output range: 0x00 = black, 0xFF = white.
+ *
+ * How to fill a curve (same on all three channels for pure luminance
+ * gamma; different curves per channel additionally shift colour balance):
+ *
+ *   Identity (pass-through, gamma 1.0):
+ *     lut[i] = i;                                // i = 0..255
+ *
+ *   Encode with gamma g (e.g. sRGB-like, g = 2.2):
+ *     lut[i] = round(pow(i / 255.0, 1.0 / g) * 255.0);
+ *
+ * @header:  block header; @header.type = CAMSS_PARAMS_GAMMA
+ * @glut:    green channel gamma curve
+ * @blut:    blue  channel gamma curve
+ * @rlut:    red   channel gamma curve
+ */
+struct camss_params_gamma {
+	struct v4l2_isp_block_header header;
+	__u16 glut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 blut[CAMSS_GAMMA_LUT_SIZE];
+	__u16 rlut[CAMSS_GAMMA_LUT_SIZE];
+} __attribute__((aligned(8)));
+
+#define CAMSS_PARAMS_OPE_MAX_PAYLOAD		\
+	(sizeof(struct camss_params_wb_gain)	+\
+	 sizeof(struct camss_params_chroma_enhan)	+\
+	 sizeof(struct camss_params_color_correct)	+\
+	 sizeof(struct camss_params_gamma))
+
+#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */

-- 
2.34.1

