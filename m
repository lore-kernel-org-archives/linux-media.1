Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795065231;
	b=oCMHlyjK+ds5yFQV1kc+cUyTBT94rvWpItpQ6GrAfiUS+HSb2AbEaNygxCTZbRQD8O0M
	 N6i+uO6tkhWtojpWu0hBCpbni6SAbbVbL0DbK8zgvfEAzgg0JvsMMpeX7F1Cn2XKDRNjv
	 6aELgqWrbJyM4rlTb8XuIMzrskPNwU4OzdTDsS3vHs8KkbuqPnP/giPbuBJOuZOxyFsCJ
	 JcEZ+FJqm1yWg3H0GzTENm/RIe0CyWyCaT4GVnxjWvcbqWcAjvIWYhNMixWOijI/0Xr4O
	 L6CoU1k4gThB0ZVojQCPaWB6JlbIEKWHy3WV4ZY/jAhPUVTM8mMyIt++X3uQVwlTA7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795065231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
	b=i7xUiM/qg0/DD/I5Y7zdC8sq1BR3zATOxaUgM78UyfGH1ukSq1H0lrAnabLFumF7Motj
	 l6uFfKoc5I71HMDuUpRuHHo8LlQ1vure23QAPkRY5/Z0g8/nNLB7zlachCqy3tgOByV3d
	 FQq8TY2BGyYTRkA7/OMaNUIVyTiiw5MzYmR4XKHGC/PhMNGMdeV7Gb2VxNxuwf4+ge4/l
	 8aSVOOvBtAyDADRJ6WBXwn9Kimu9M4pr2ESdIssixZwk++QU/7qXf7x6BzhOhJcLz63bZ
	 3r8NbGwovo3iiHCy3PeJpJYqJG/1cBFMuok4HPQ9XYDIy+v+3QBg4VlK/eS92PmPWkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SrTAlKRT;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvlPgVXN;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94E4360A2615
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94E4360A2615
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SrTAlKRT;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fvlPgVXN
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ1B7io3490630
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=; b=SrTAlKRTmKSSj7A1
	vjJKuJ319ySX8p4sp1M4YfUwUuXMESvJoKzkHF/y7hqYHnZFaQK1F8V1hoKtfC5+
	gNgiNSCHUqVjXfAa/iR5RhQrrfeqgayQcdCNC46Gzy2hgxunQjicPJ89pdFkab8Q
	QjOVGC31xKLNSuEJG7Pl1/6qokjKO6zgANnuhDWaS+AaYQCTw8VlDR6Ru0xTTOXS
	fbeOdcJJkaXDPl0gBpVZtMdNpzT6leFhJF+Y1TKvtzawXu7MA1vCZy8rFNNAaEMW
	Ti5Wn1AHzhVZRVVVprCYMekQMvmiGzN1FwFqnrG+65XPLNk38JLXnP4jJPu9Sm2g
	rkapXg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j1g3baprb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 19 Nov 2026 05:13:49 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b0c7ab2427so1436514a91.1
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 21:13:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795065228; x=1795670028; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
        b=fvlPgVXNVeVTAAN4FVbtzB9drKmGGURPE2HqvpSaY9giR2bLp4pwpLknkEm9E/LzVP
         YSWIaxDQSlaR+p6aTdKoAfho2XDIcuYxNjU2vhBUwC1hiIEilDjPVwEp1ON8Tiiqanzl
         VyybggkRAJNzAIIQse8m9ZRoLcnb8+YsVXXsmUTHlSEdCFi73tWPW276aJwIJcdvdjqI
         xPe0ruS6zpNHcZRkTJXMECzyqx4SE+tvXJJR8wVgnNjI+DCNe8wPF8zkU+m3OVRdDeH/
         iVKrv4cmdZFoiAj/0+/PZ26Wg3z6Jew2qrTLXF7sD+aZN3xI0FPDV8cWN8tXaD8Sww2a
         24jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795065228; x=1795670028;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IVvkPNQEUwNZ3chdYSux2+Mypq9FkawR6GMfmWIF96w=;
        b=yzkcvt2J4TYDATXX+BkWw80aqMmD1gpkPdO+gil/FP7WzQV/IjaN89ddWz/4hoALyP
         7VW8mF2yaHmr0npE7xjtAkk0ajBYq7KOHZsWSFhpZ3KL3OZ3uDZkgPG+gZJpxc/H84am
         XVadvVqNOUcdfn3bomVhJ+R80KC5vAby4UknR+sVCk5p4QJKdLCReDtthvmeBmQcjjAG
         mTCHr58YXMXT+wGCYCza5Yy0zdqBR1uuYhW+oo6ncfwlBOGvOM2sNv7l38GDy+DHGldM
         W9U7NehMAS1RFY3NGIg69EjE11/eaG80d9S8tilMx+PQUqYX9CVBDcB400svOr+GY9nd
         ldEQ==
X-Gm-Message-State: APuU4Z/DZ3IN/85YlEa83zyQRTpLuQ+KweJo0G+bl2SSAuJVrSmPwh2C
	RQ6sU3eNb4cUOYDTqX62wwCCkd1yZ0HwXIaNRaeCFSDEbhhzyBDFux80qbEdv3aa3yR6vGD4+9P
	+wPzjeeAFOqRtu9KqjMvNgAIVTIDX32pgK5Egt5Ewl/P8CKTwQ1CzfuSyBmN5Yz5cXQ==
X-Gm-Gg: AZFdTZe4rEVWilbfRlpVieuyy9KGAw6zBX1qF110jpdVrDooovVIsLulvO5KFtbTGbK
	rCkZpnYIypsLmArLKXNu1hmW4V7MkBOLhYdl1Q653uZyCWub6JDFJsiKvI1/Fo5JaJWHefWv2Z6
	E+VqcmtnqPMnXNsX/i4MjraG6WhIIkrpemsHkA8c/ivGo73xUmiTC5S07iVuSTGB6esOszO0W+v
	PA92o0hzdgVFBbSMzwrAzqXt90cxCxAsLhWkdC5AnbmRtr+EQ0M+zoMrNKeBPheK6a9Yw6vt4vj
	Fa3RXIFq/DC3WMtoHv7KRvBH5yPrCYIsaFKONsH72KqGkPVyEH+Cev9Jti4lR/SzPBDF8LjWP3N
	re/liOl1qopxz33UWF8Mq/fFeYzac/fy/Yp8eC4CuPg5V2oK4QeB4dwaiix/tvax6NnaTARmoEu
	eiqv2+RmDxwvDkQP0DFYViyGiggkQ3o38FUoEC12x/OY0s4fc=
X-Received: by 2002:a17:90b:3b8a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b3d07cafb6mr4781610a91.58.1795065228060;
        Wed, 18 Nov 2026 21:13:48 -0800 (PST)
X-Received: by 2002:a17:90b:3b8a:b0:3a7:b260:9ced with SMTP id 98e67ed59e1d1-3b3d07cafb6mr4781569a91.58.1795065227320;
        Wed, 18 Nov 2026 21:13:47 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eff622c0a5sm24067185ad.50.2026.11.18.21.13.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 21:13:46 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Thu, 19 Nov 2026 13:13:26 +0800
Subject: [PATCH v3 3/5] media: iris: add maili platform data
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
Message-Id: <20261119-add_iris_for_maili-v3-3-d47d047a3f7c@oss.qualcomm.com>
References: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
In-Reply-To: <20261119-add_iris_for_maili-v3-0-d47d047a3f7c@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795065207; l=7477;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=d1OhJgAf7Mlr/7pAToICQrDH3kuVVptJvPTxOmBkEoQ=;
 b=/SrcDSnsAFGwHY7XrDS9e36NdhSN14XhcwI7DTwO1QM3lmtfeTYEZHFhuaQHzrCG3Er1q2K5Z
 9SEuCmZ7dVCAOF5oa4IOgF3MPmXYG8Pf9DTTiGObNeeDYLt7aUc/l1v
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: nOfCVJZ6pDN_JT3ZmLqtjPExHDwfLBku
X-Proofpoint-GUID: nOfCVJZ6pDN_JT3ZmLqtjPExHDwfLBku
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX0TrhpjoZhKlo
 H3amGGluvjjoD54dJU7SOcZ3J4eOJpU5qgBpC7iES4MSqfw8c+UO4y8e3923QeFdbI93LlorM8k
 YkYg5GJTZPVNG4SyBKKxy3FGQVVtM08=
X-Authority-Analysis: v=2.4 cv=dZQVTnXe c=1 sm=1 tr=0 ts=6afe858d cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=nOOC7wKebdr8b9UYWzYA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAyMCBTYWx0ZWRfX/sdubQ9z4cnO
 tJzMhGwGf3xxtEJsTelfSkh50cgqj8T4TuYr975V1ZUmMuygA2mT/HT3skgb7XGceqRfaTrDs54
 4Ryd1ty3ndPfXW9JpFn9uQ7/Vvs6+YZvwO4uGJYv53JjmgHtP9ucNUzmiJMkW/oLbT2wPEDjVxT
 QiLOvB1fUhTA3oFbf0BQB6COP84emOpr3MymU0ERdwZRQRBLPDSKnzXIgMOnm/kz3tHo/YYaI6Q
 a9LadQ3b6/O2IxJPq1To+jkVkknUMapmteKzNkVyROWx2Z/NSDiv56DVELyWyvCYn4ilu6oVF/O
 iHY4DHAmTX4acYSd+lfS5YvC+6LvBj3rpYH+YuAeVD9cECYy+QdichWIiZCI6tY4u9aYblVrTC0
 ZHyZAyrkmV5MTw/G5hFhR69GzVxJ6iKMNvjpWpUKSaFUfc37SxbOHzlJFFhxuRCIV+g8vBM1FUk
 EzcS31QX1y55AvV60XA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 spamscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 bulkscore=0 clxscore=1015 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611190020

Add platform data for the Maili Iris VPU4 block so the driver can
match the qcom,maili-iris compatible and initialize the hardware.
Describe the Maili-specific clocks, power domains, firmware, resets,
bandwidth data, DMA range, secure memory configuration, and decode
capabilities.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |  1 +
 .../platform/qcom/iris/iris_platform_common.h      |  4 ++
 .../media/platform/qcom/iris/iris_platform_maili.h | 58 ++++++++++++++++
 .../media/platform/qcom/iris/iris_platform_vpu4x.c | 81 ++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_probe.c      |  4 ++
 5 files changed, 148 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index bbd1f724963e66d45d9b52e5158c593f4061fd95..f7c94ffa1e4491b6ded8d51c3a0e23f041d91756 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -14,6 +14,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_hfi_queue.o \
              iris_platform_vpu2.o \
              iris_platform_vpu3x.o \
+             iris_platform_vpu4x.o \
              iris_platform_vpu_ar50lt.o \
              iris_power.o \
              iris_probe.o \
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 49a3dcec7546d04114675061ec581b31518d18dc..47a23b0add88cf319c2d8ddc4bfa5e1302a43b27 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -43,6 +43,9 @@ struct iris_inst;
 #define BITRATE_DEFAULT_AR50LT		20000000
 #define MIN_QP_8BIT_AR50LT		0
 
+#define VIDEO_REGION_VM0_SECURE_NP_ID		1
+#define VIDEO_REGION_VM0_NONSECURE_NP_ID	5
+
 enum stage_type {
 	STAGE_1 = 1,
 	STAGE_2 = 2,
@@ -62,6 +65,7 @@ extern const struct iris_firmware_data iris_hfi_gen2_ar50lt_data;
 extern const struct platform_inst_slice_caps iris_vpu2_vpu3x_slice_caps;
 extern const struct platform_inst_slice_caps iris_ar50lt_slice_caps;
 
+extern const struct iris_platform_data maili_data;
 extern const struct iris_platform_data milos_data;
 extern const struct iris_platform_data qcm2290_data;
 extern const struct iris_platform_data qcs8300_data;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_maili.h b/drivers/media/platform/qcom/iris/iris_platform_maili.h
new file mode 100644
index 0000000000000000000000000000000000000000..fe1b0db0a5ac62a28d7a1abbf42065949f1a5477
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_maili.h
@@ -0,0 +1,58 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#ifndef __IRIS_PLATFORM_MAILI_H__
+#define __IRIS_PLATFORM_MAILI_H__
+
+static const char *const maili_clk_reset_table[] = {
+	"bus0",
+	"bus1",
+	"core",
+	"vcodec0_core",
+};
+
+static const struct iris_power_domain_data maili_ctrl_data = {
+	.pd_names = (const char *[]) {
+		"venus",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"iface1", "core", "core_freerun",
+	},
+	.clk_cnt = 3,
+};
+
+static const struct iris_power_domain_data maili_vcodec_data[] = {
+	{
+		.pd_names = (const char *[]) {
+			"vcodec0",
+		},
+		.pd_cnt = 1,
+		.clk_names = (const char *[]) {
+			"iface", "vcodec0_core", "vcodec0_core_freerun", "vcodec_bse",
+		},
+		.clk_cnt = 4,
+	},
+};
+
+static const struct iris_power_domain_data maili_vpp0_data = {
+	.pd_names = (const char *[]) {
+		"vpp0",
+	},
+	.pd_cnt = 1,
+	.clk_names = (const char *[]) {
+		"vcodec_vpp0",
+	},
+	.clk_cnt = 1,
+};
+
+static const char *const maili_opp_clk_table[] = {
+	"vcodec0_core",
+	"vcodec_bse",
+	"core",
+	NULL,
+};
+
+#endif /* __IRIS_PLATFORM_MAILI_H__ */
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
new file mode 100644
index 0000000000000000000000000000000000000000..528f5ef2537f504aff465fc1f578d65da936232c
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu4x.c
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
+ */
+
+#include "iris_hfi_gen2.h"
+#include "iris_vpu_buffer.h"
+#include "iris_vpu_common.h"
+
+#include "iris_platform_sm8550.h"
+#include "iris_platform_maili.h"
+
+static const struct iris_firmware_desc iris_vpu40_p1_s8_gen2_desc = {
+	.firmware_data = &iris_hfi_gen2_data,
+	.get_vpu_buffer_size = iris_vpu4x_buf_size,
+	.fwname = "qcom/vpu/vpu40_p1_s8.mbn",
+};
+
+static const u32 iris_fmts_vpu4x_dec[] = {
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
+};
+
+static const struct icc_info iris_icc_info_vpu4x[] = {
+	{ "cpu-cfg",    1000, 1000     },
+	{ "video-mem",  1000, 15000000 },
+};
+
+static const struct bw_info iris_bw_table_dec_vpu4x[] = {
+	{ ((4096 * 2160) / 256) * 60, 1608000 },
+	{ ((4096 * 2160) / 256) * 30,  826000 },
+	{ ((1920 * 1080) / 256) * 60,  567000 },
+	{ ((1920 * 1080) / 256) * 30,  294000 },
+};
+
+static const char * const iris_opp_pd_table_vpu4x[] = { "mxc", "mmcx" };
+
+static const struct tz_cp_config tz_cp_config_vpu4x[] = {
+	{
+		.cp_start = VIDEO_REGION_VM0_SECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x01000000,
+		.cp_nonpixel_size = 0x24800000,
+	},
+	{
+		.cp_start = VIDEO_REGION_VM0_NONSECURE_NP_ID,
+		.cp_size = 0,
+		.cp_nonpixel_start = 0x25800000,
+		.cp_nonpixel_size = 0xda400000,
+	},
+};
+
+const struct iris_platform_data maili_data = {
+	.firmware_desc_gen2 = &iris_vpu40_p1_s8_gen2_desc,
+	.vpu_ops = &iris_vpu4x_ops,
+	.icc_tbl = iris_icc_info_vpu4x,
+	.icc_tbl_size = ARRAY_SIZE(iris_icc_info_vpu4x),
+	.clk_rst_tbl = maili_clk_reset_table,
+	.clk_rst_tbl_size = ARRAY_SIZE(maili_clk_reset_table),
+	.bw_tbl_dec = iris_bw_table_dec_vpu4x,
+	.bw_tbl_dec_size = ARRAY_SIZE(iris_bw_table_dec_vpu4x),
+	.ctrl_data = &maili_ctrl_data,
+	.vcodec_data = maili_vcodec_data,
+	.vcodec_vpp0_data = &maili_vpp0_data,
+	.opp_pd_tbl = iris_opp_pd_table_vpu4x,
+	.opp_pd_tbl_size = ARRAY_SIZE(iris_opp_pd_table_vpu4x),
+	.opp_clk_tbl = maili_opp_clk_table,
+	/* Upper bound of DMA address range */
+	.dma_mask = 0xffc00000 - 1,
+	.inst_iris_fmts = iris_fmts_vpu4x_dec,
+	.inst_iris_fmts_size = ARRAY_SIZE(iris_fmts_vpu4x_dec),
+	.inst_caps = &platform_inst_cap_sm8550,
+	.tz_cp_config_data = tz_cp_config_vpu4x,
+	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu4x),
+	.num_vpp_pipe = 1,
+	.max_session_count = 16,
+	.max_core_mbpf = NUM_MBS_8K,
+	.max_core_mbps = NUM_MBS_8K * 30,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index f57767582114903fce0088d8b8a9af0089843faf..a402fbc64e7290301446432ca8f436cc364d7538 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -526,6 +526,10 @@ static const struct dev_pm_ops iris_pm_ops = {
 };
 
 static const struct of_device_id iris_dt_match[] = {
+	{
+		.compatible = "qcom,maili-iris",
+		.data = &maili_data,
+	},
 	{
 		.compatible = "qcom,milos-iris",
 		.data = &milos_data,

-- 
2.43.0

