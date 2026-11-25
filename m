Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795577140;
	b=eR2uzlV5HTj79CABxZW9CJTWTahaiuC10jmqeDH71tX40KrzFeb/0ARE7arLdD8W5iiW
	 4nHXhx+kRvOEiisp0bOw5kBAndVnsvN4/Cw4e9gMjMCwKa0SXb4zqoK2D3tx1SDduFE8t
	 wnGuKgRQcN1Tq7WZrc0Al7tpr2JH/JLXAsyssTOBO1pnxqTAIw7Nj9plwGAR1iKdcFim+
	 +8BCuB1SSyJoqEQ1/XlxIX8V6wE9vv6bqWbtafx2Xx6LZcVd94+b9yqfPPhZn/j7rLt8s
	 jV7e/6QwXyJylU/JEJEf61gJ3GBwkq2g24T2Cj10bsb/fjiqL+xVBHUXFzp5c7EOnTw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795577140;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
	b=kIb6uusSn1B1xStU3cOnnZhHRSEexChwiXNB50bPgmzypuFzB2LbcwmdzftJbH0PBZYW
	 X+HyJ0GV3bkKJZDOzgSyxPuPQLcpHwJqaOJ3u30Qw9c9B0IUjVpqYGwojknlUiux4tzyk
	 eI8o8+ljGkjLpxqC8jeMkD15m6UxGSamiOXwL8A6HHPB7ow6R02JQH3qomk3RxzcErE/i
	 btblMT8V0lpxf0j5pjCyQYVpEPLjk3zerrBKOiSpwGvo0G3vHU6reIFGuaTU4dKrFgfOm
	 U82/EcYLlZhi1URE5sMg1EEv6815+XxNj/AgTmJL4OlS7jVwRDM7rG9px1vzD5TFK4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZDEqt8X;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbwg+2Eo;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B134606A339
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B134606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=eZDEqt8X;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bbwg+2Eo
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AP2sCYt578182
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=; b=eZDEqt8XulVDGJCn
	Kp66i7jlsHV2B6h+SFq3lMl2RrzACNngTk18E+bjVwE1DhSK00S1C2FJsq2DJZux
	rTQEAstPeaKz2XUWzMi+WSrjDPgikk5gZOKfDtPkgatbU4wxM207JDIgcaY4fLoK
	DmSja8BYZNdC1tKsOgZsOGwjSDj6wVBfwiKfcW836ZYRNRnh8AZ6dT7hF5jNpIfy
	aB9AapkAXX+bKDMjFzK4BQErmLVi8jR2aCjePq4KSODOz8kQ/pkyacegphneAEcX
	q7ZB21/Zqc/6cLh1UBM/uT8OmIGnwRhJRDn4NyfQFRRzc46cgfw26r4AtgraoaX4
	3/fUAw==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5qa28369-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 03:25:37 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cde75c957a7so2545364a12.0
        for <linux-media@vger.kernel.org>; Tue, 24 Nov 2026 19:25:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795577136; x=1796181936; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
        b=bbwg+2EoSn+8N5G72mpAfQwDjaZteapE62ZnGuIEU4903cP1lPCjCPy41TIH2+z2sW
         Q27c3JwiXmL2DaWzq9FzzEIhushOEfuRkOOKb3/u/OsCPDZ7IpPMHl34gN5YGHyRcxEk
         ZTa2A6bze1jc+gLacdnQfbxGblPCPWXRFqWHWkXUpeI2cvPtuShfK1Z2pQ0/XHqdTaRf
         9eb7FLMEzQWKb0tzSxQqmXTyx9kbVGYvq4oOd+RdwdviPwJzV/inLPUuoF5jjXzYtu/N
         Weh1rCyCI4BxtP/ITyJuBPUFyl2JevMu4HazoA7S33ORcLqvqbMh965EsDG7CpPGlRy/
         5asQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795577136; x=1796181936;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fxW02MjIIj9lNpN8LtrcO3xk8J8fGx0yK28B3VA44fY=;
        b=FGvAFC/TCDqAHjWlaNWSl06myq+avO4kIEER0uEl6573oym3yRl1OVt7uDSejwfUz6
         j7WzvskCIBJVDOzwtlS3d1OMymQ0h/oWJBrws6Dh+B99sJFk5tmJUudWfV3tAeZfUEt9
         8k0zRpqi3qmUq0/t0VgWL8EQesJDIBzXdisJb4RspwZvj8b2PCEU2m2X2N/gSVBnAL25
         acWgqTK22+rESyZ3ZWPwXENGSdZV573Jk+FIRjbcalk9BjFc5encEnW8Q4uVGa9v3q3E
         zcM9NsYOjZfERJqK0OgPNhaoGCIXsqEn7oeWVwNTKmjT9DVDapsDCdVEnDFO9KF/M5GP
         8XEQ==
X-Forwarded-Encrypted: i=1; AL+hErEtOZbp7u3tQ8INC5Y+POHjEMnGCw93bQ7KEpH9IzNilXFMWVDmkClWJIa5L141A9FnT5lDahJDfk5O9A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+IOI2594a4wAgmsfQzpcRyTWK6gkop3gK7KrPzttV5nZ+ZOgQf
	cpb3Nw2VVSR4OFZpapjIxbxHX9IzrWkHkm1V2IvL4t2SwUWWQy0ZRw+x3JofobDmacNzfrtd0nZ
	IyyT+6lIamLeRrSdtgmBSSiL4E3joKsZl+nP9aw0Uekj5sRBOKXVmH/7fJnYg1yrjcZyWN4TFcQ
	==
X-Gm-Gg: AZFdTZd/ioaMqyNsIDWp6W7u4SiXJXeOOPzi2LptD2i1iEoHg08cMcfvFNY6Nkczbg8
	UiK78qy+zX17a9cR61rqh7X0LYq2h0cxSZzODAtImETXuGeCY5caqDNcROHW9qNNqYVvovFrkyd
	vIwn2zA047CHsC81bxtnCr4+ymm+SL7jmodIEfCMigPypb1YzqUO6e8QvFekyMsYcrwISU+ZXRr
	VUHfFWO8sF8nRzMzfv2UuGZ3rp+aW03nGL/Ow09Ni2+yBmNIGHPVYF9dBWNFXYQlGYGOq/9Rcii
	0oRM3SsC/ODfOHpj1+wizEFFZmcdF9cAuhNrFCNOgnoCXp46oNypWU7dxsIf78v5/AWPJcsF1r0
	DVrEjwneux8j6YTuLawXR+qE6LXWDJxm+LpGJM3oOo7H8EjlUQRR3A+buRh6+AXmKkPOUAA8Qbu
	Cm24hibJo=
X-Received: by 2002:a05:6300:492:b0:3e0:df21:9df2 with SMTP id adf61e73a8af0-4014ca45234mr9898102637.10.1795577135732;
        Tue, 24 Nov 2026 19:25:35 -0800 (PST)
X-Received: by 2002:a05:6300:492:b0:3e0:df21:9df2 with SMTP id adf61e73a8af0-4014ca45234mr9898044637.10.1795577135012;
        Tue, 24 Nov 2026 19:25:35 -0800 (PST)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8cbe173453dsm4762399b3a.25.2026.11.24.19.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 19:25:34 -0800 (PST)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Wed, 25 Nov 2026 08:54:14 +0530
Subject: [PATCH v12 7/9] media: iris: Add platform data for glymur
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
Message-Id: <20261125-glymur-v12-7-5c34dfd73fc2@oss.qualcomm.com>
References: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
In-Reply-To: <20261125-glymur-v12-0-5c34dfd73fc2@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795577086; l=8372;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=EXAYms0vfMmdIXWMf76HNXfjxCH2Q/exRT6gyligzFE=;
 b=pHOnrA5evF9yPeyEshe9XQ5393PtvKeu1b604Zh8KJvIN0wmJdlglshPA28+omR2PXsJhuPp8
 9JOh7ritWZtCDMPguGRpc8Ba0l17wrTLDTBcyUj/g6mxU04iR/K+SoZ
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: fZk2G3AkafnI36cI6oHnQAI7PW5QSPjE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX2w/3/r+/QM4m
 7s7dc4ZK9VOwAirkXXO/6JZdQT2tLWMo6W347f72hpBoWwNenxs1RCqZ8yKbQo8J4kn14nDY+eQ
 uXjPx+ukOIJ83jSGRmxBViIel8XqSJg=
X-Proofpoint-GUID: fZk2G3AkafnI36cI6oHnQAI7PW5QSPjE
X-Authority-Analysis: v=2.4 cv=CKu/zhrD c=1 sm=1 tr=0 ts=6b065531 cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=lg3Sk5cav7_8jeuIVHsA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDAxMyBTYWx0ZWRfX+SoZKKCqou9H
 PX71+v0nIP7YnyNbZ3CO9itatErDvfGWV4jBjT+O36nVcT2urwpp9DAum8A/efLyZlS2XnXTHfb
 4ips0F4owZkc8h5Jlpi3R1wWwSK9jqTmcmFeITVfE7tLpRPYoO8ZEL+RU8CAxa9z37ayDM45EV0
 ekjhX4zeZwA1l3VIes9tZg9WMBlVN2KcCHuyl39hxelFczQK1HBw+/XRvwlLhNHHoMBy1ZXMa3m
 HE30tjS/rUbVQ9LhT2A6qnz9Uv0r/8/YQjGT0T7nGxwoKxpx74j8GUQL4ZE+y3F5zRtHcHqdL6l
 Q7e3FOxD9TksZIdGMEG92boUsW986wMOiwipIuSoukqXB+pv7BbteKLOP4n2W/HSg8RSLpg8cV0
 XfEp8YNvSnmpjtnfStZ0TW4RU0QJRpSILBjzDGcZU3Z8OqOhnt5eH6miDFAfBTdUmTslDoM/Coo
 Jl/hIKaIg1WrsMvf7Fg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_01,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 spamscore=0 phishscore=0 impostorscore=0 suspectscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611250013

On glymur platform, the iris core shares most properties with the
iris core on the SM8550 platform. The major difference is that glymur
integrates two codec cores (vcodec0 and vcodec1), while SM8550 has only
one. Add glymur specific platform data, reusing SM8550 definitions
wherever applicable.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  5 ++
 .../platform/qcom/iris/iris_platform_glymur.c      | 79 ++++++++++++++++++++++
 .../platform/qcom/iris/iris_platform_glymur.h      | 15 ++++
 .../media/platform/qcom/iris/iris_platform_vpu3x.c | 38 +++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 6 files changed, 142 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index bbd1f724963e..4a70e124e75f 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -12,6 +12,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_gen2_packet.o \
              iris_hfi_gen2_response.o \
              iris_hfi_queue.o \
+             iris_platform_glymur.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
              iris_platform_vpu_ar50lt.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49a3dcec7546..1eb8f33a7564 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,10 @@ struct iris_inst;
 #define BITRATE_DEFAULT_AR50LT		20000000
 #define MIN_QP_8BIT_AR50LT		0
 
+#define VIDEO_REGION_SECURE_FW_REGION_ID	0
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -62,6 +66,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data glymur_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.c b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
new file mode 100644
index 000000000000..268f57d95989
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.c
@@ -0,0 +1,79 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include "iris_core.h"
+#include "iris_platform_common.h"
+#include "iris_platform_glymur.h"
+
+const struct iris_power_domain_data iris_ctrl_glymur = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"core_iface", "core_freerun", "core",
+	},
+	.clk_cnt = 3,
+};
+
+const struct iris_power_domain_data iris_vcodec_glymur[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec0_iface", "vcodec0_core_freerun", "vcodec0_core",
+		},
+		.clk_cnt = 3,
+	},
+	{
+		.pd_names = (const char *[]) {
+			"vcodec1",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"vcodec1_iface", "vcodec1_core_freerun", "vcodec1_core",
+		},
+		.clk_cnt = 3,
+	},
+};
+
+const char * const iris_glymur_clk_reset_table[] = {
+	"core_bus",
+	"vcodec0_bus",
+	"core",
+	"vcodec0_core",
+	"vcodec1_bus",
+	"vcodec1_core",
+};
+
+const char * const iris_glymur_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec1_core",
+	"core",
+	NULL,
+};
+
+const struct tz_cp_config iris_glymur_tz_cp_config[] = {
+	{
+		.cp_start = VIDEO_REGION_SECURE_FW_REGION_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0,
+		.cp_nonpixel_size = 0x1000000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x1000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda600000,
+	},
+};
diff --git a/drivers/media/platform/qcom/iris/iris_platform_glymur.h b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
new file mode 100644
index 000000000000..577a1a4d58aa
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_glymur.h
@@ -0,0 +1,15 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#ifndef __IRIS_PLATFORM_GLYMUR_H__
+#define __IRIS_PLATFORM_GLYMUR_H__
+
+extern const struct iris_power_domain_data iris_ctrl_glymur;
+extern const struct iris_power_domain_data iris_vcodec_glymur[2];
+extern const char * const iris_glymur_clk_reset_table[6];
+extern const char * const iris_glymur_opp_clk_table[4];
+extern const struct tz_cp_config iris_glymur_tz_cp_config[3];
+
+#endif /* __IRIS_PLATFORM_GLYMUR_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index bcda31a5b8f5..e64a6386ace6 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -12,6 +12,7 @@
 #include "iris_vpu_buffer.h"
 #include "iris_vpu_common.h"
 
+#include "iris_platform_glymur.h"
 #include "iris_platform_qcs8300.h"
 #include "iris_platform_sm8550.h"
 #include "iris_platform_sm8650.h"
@@ -50,6 +51,12 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 	.fwname = "qcom/vpu/vpu35_p4.mbn",
 };
 
+static const struct iris_firmware_desc iris_vpu36_p4_s7_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu_buf_size,
+	.fwname = "qcom/vpu/vpu36_p4_s7.mbn",
+};
+
 static const u32 iris_fmts_vpu3x_dec[] = {
 	V4L2_PIX_FMT_H264,
 	V4L2_PIX_FMT_HEVC,
@@ -85,6 +92,37 @@ static const struct tz_cp_config tz_cp_config_vpu3[] = {
 	},
 };
 
+const struct iris_platform_data glymur_data = {
+	.firmware_desc_gen2 = &iris_vpu36_p4_s7_gen2_desc,
+	.vpu_ops = &iris_vpu36_ops,
+	.icc_tbl = iris_icc_info_vpu3x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu3x),
+	.clk_rst_tbl = iris_glymur_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(iris_glymur_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu3x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu3x),
+	.ctrl_data = &iris_ctrl_glymur,
+	.vcodec_data = iris_vcodec_glymur,
+	.opp_pd_tbl = iris_opp_pd_table_vpu3x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu3x),
+	.opp_clk_tbl = iris_glymur_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffe00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu3x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu3x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.slice_caps = &iris_vpu2_vpu3x_slice_caps,
+	.tz_cp_config_data = iris_glymur_tz_cp_config,
+	.tz_cp_config_data_size = ARRAY_SIZE(iris_glymur_tz_cp_config),
+	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
+	.icc_ib_multiplier = 1,
+	.max_session_count = 16,
+	.num_cores = 2,
+	.max_core_mbpf = NUM_MBS_8K * 2,
+	.max_core_mbps = ((8192 * 4320) / 256) * 60,
+};
+
 /*
  * Shares most of SM8550 data except:
  * - inst_caps to platform_inst_cap_qcs8300
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 37401365192a..26ae8d246e4d 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -666,6 +666,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,glymur-iris",
+		.data = &glymur_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.34.1

