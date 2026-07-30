Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CF2544211B
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424865; cv=none; b=b5IWniwVGOyyn2lxiDDN6DsR1URi+LYvB/x7QLz9WRbIsSq8GA44J1dkMjYmkiKztjQE3yrP5ludrpHICqFrLEgd3xkKuwJnW7yg1Wni0Davtf3is8+ZFYZpLAAWbstIIykcdG52N+3PKYlJCEykzTgOwCyAECwsir/P/AtK0+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424865; c=relaxed/simple;
	bh=cYc+1E2eHpZ2S0978mDPtfA4RJNpbiA8HBac/J6pG6s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ve1/Dcf4ppcUcuEbQLNQnmk9v/IF9G3/61r2cveNiE69r8UWgw9mZzYISG3nMUC3vUn8WKldNSPgX81ZP7que3Il9zRByClCeUHi/A6ox6VVKVHhxVcrrorggcNVZqMf3EnuIbXkyvTgvKRWmfSmpLENSz+P6T3UXathNbqpiNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AMf3oT8C; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jcZfYdLg; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AMf3oT8C";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jcZfYdLg"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEdKIp1110041
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	5HHk72bmSy94CGQo7N8ldYDCmgWWt0+pRYMNfySlPsQ=; b=AMf3oT8CWKqlU2UC
	NandmX+3MNJjLWl8wn877YrAipWvMoG64eUxrz66zRJwQJ4KaL5r7en6zZylorCb
	Fku3rpEqiNlcRNMZJREdj23/vh9KY1gnL3G4TyS9DLranS0Pir2fOHa1PSfKs+Zr
	NHsEfBRRvpADpVk23Gb3B340FBDJ3Y1jsnvlUTE9rMwLSsOs00RWsdJ90TRn2jOV
	bI8c55dwHMRIvEF0CnuAewrzoC5CRnKPFJoWUmYGFppOa43b05hUO+/sNSWMIOl+
	Y2SsvyLiR6cZz8hEHPJUPtLcCSeetNcIq4dQB1wAh0edqpf006nLUi0iG1BeNaIT
	v0+NwQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8jmr7qm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93106d8affcso199086385a.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424861; x=1786029661; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5HHk72bmSy94CGQo7N8ldYDCmgWWt0+pRYMNfySlPsQ=;
        b=jcZfYdLgJa32eeRWVPpfKY3yCiZlswDabDMnBkRNZ/mW7StM8HeXzCZjQD/l4gPqTH
         llqWRoEuFo5o7pjQl1Gk7jevmyGBOCN37v0Xipp/8AQMNMb3SpUfI+vael1b25Wv6Bo5
         c9LvWVfQb7mtFIHiWIHwIroPyzEWrMt/ABGB2G3wmRPQNzhaLiJVEZUsNsR2uHkIc+pY
         x1bX11hEhjoLB6U/8IE5SUSQnAEIfnA6odwGcNe7Pt24hTrZdTgtqPLAc9aujAJeBTcY
         9pA8g5Py9CyovWniWZ6pyvCHfGqLi+lRQFsWnzDIKIHdk3fksrUfaE5iESK94hvkrwTb
         IZdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424861; x=1786029661;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5HHk72bmSy94CGQo7N8ldYDCmgWWt0+pRYMNfySlPsQ=;
        b=Nz9Sn5gnPNCzfx81kpG+8Z6v6qpNZdjW8uAxdjgc3s/odxIk9mK5zreDcrQcQkHo6m
         Y0abcTI5ibqtLknkmjsCCVw32TKsSEL1SuuTOsa/tzX8rBvaxSYIqsRLBpRUnhxBdjux
         yXgMCzmcc+EH0IEzm4dDx/XP1ckDTFtexpbsb3kt+k+g2RLVwkLE4637ytDFYY7HWhK4
         IAS6GlJ2jIdaPAlhJZFfMrhBfUKCMal6nZRsZYo4n7yWNSuLSiByifE+1hhWA8hZdi6g
         qRgWJUTPucYxPlz0grgNJIYgyFkPPoNpTDDGErgc+XiRsTQs7M/MNiDC1ye5Fm5p+Ai0
         /9Ag==
X-Gm-Message-State: AOJu0YzvF0zB5VhliXmQXTon25LP4o0gjzRa/UaRaar4OUBz4/ONPwaS
	NCoG1Usvagq3wG1xcn0R/MxL4Szk7yP8RrTd1IOG/lxN9nBbKdctiJLhtfO64MDfiNHJ8kz9fLf
	V+2liHxlWqTqOVLbAZ435K6Ohvezc1JATMKsma+rzGRUaLyXXRfBcbNUcJyD1WfyRbQ==
X-Gm-Gg: AR+sD12O1kaMFnEh7q5R0u9df2rwPszC9jh/A0NshqlSYI1HMlC2z6jgUCUxQCJEyRF
	YQ0Yl73LJ/nljzgR5Fk2DqvZy7nT8Epnr6UXxEDoBA3zskQcgidYM98ognyMD1E0UhxdsQ5om1Z
	Ukr/Amy4XONiTN5veCb8s8B7my4JdO94q5c+2Zyus1QzOXdzybNCl+CBmAmSofqYRXBD1UycU0z
	FYG6jILGVGk0CLjGpPCi6fnzqurqZS/DePouWF8q5VfgscYPqRoQUFypdKewOmjnyJnbmDl52ks
	akTyJa01Vuy6O0koYdv1Hv9C2qZ0tFqMFi/dmyjTSOsNTOd2SZtWzQjrqeeEEEsHnYzfxHjIv6d
	1f7k0X3MqbGMVr9iGA/nrTbhZOyMSK7Eh+Q8mEK19KMQ+HioJ9Esx73SSrQrIVACyH/bzTGIi3D
	2OqlV1UhTk9XMTeQ==
X-Received: by 2002:ac8:7e81:0:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52b3836970emr34161601cf.5.1785424860997;
        Thu, 30 Jul 2026 08:21:00 -0700 (PDT)
X-Received: by 2002:ac8:7e81:0:b0:51c:1d18:2fe9 with SMTP id d75a77b69052e-52b3836970emr34160951cf.5.1785424860460;
        Thu, 30 Jul 2026 08:21:00 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.20.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:20:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:47 +0300
Subject: [PATCH v8 04/18] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-4-6597c08cea6f@oss.qualcomm.com>
References: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
In-Reply-To: <20260730-iris-ar50lt-v8-0-6597c08cea6f@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5192;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=BKmQDEfPtd7l2pOiyWBOoT+wXWKO8dafY/4qIlapa8E=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ1Z29oXAIht1h6mzDm5+LbHf1cl7Re+0hGC3/U3dMXuKs
 u5U5Lh3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BeAir9n/mVZf2yFxuP3VotO3
 ouN95V7XuPmbF5r+vxaT+OfE6WJvlXvL6pesvfblVfM0B7GuK53Wf9NKC5j6pxuzdmxYm9oyd+f
 2k35mEUviTV5FC5ZueCr2WSQrOerEl0er99e0VrSGTynR4WCVurN8R6BAitNGubiUEBOHu0pRzK
 4cRzZlr+3QcdL9t/qlqNZ9Ca7N0nJ3n51cza6tu2CuehE/z/eeT5n3n+1eYOu0miPl/OwQ4TJvB
 snVGfnpb2avyypatlfrCsP1kIlqqgJfrzjdtAxr//K1mdWxiHPJ5ck/Q1env9y/R3P10n6dhlb/
 jB9K4nEyltYrjN8lyzXNz+mYl5Bh0KGqr+L8q+iYZSoA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=V4tNF+ni c=1 sm=1 tr=0 ts=6a6b6bdd cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: F_ia9PrfzP2Etx8U5ZAwCZMc62_C0r0G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX4fbE3FPyd1PO
 5NcMJQNT7TLYKdEQ0H8ybI5Rq4kUG1FADV44uZ03Ntum2ZAFl1b/AxDQ92LszkDRPgXAlAOk2cg
 CCmcyKtCUbu8eT02Ae9gyos3XX6WAv8ss2db2xLgysTJW+2foQkBRcXmbbW69oPSEO+iylhxts8
 HUBlnHe9Gy8SRmIJXNtl0JWdX7KOvlZFx/Yq2SEiW4+Az4Eo+zDiEljBiuEFRo8F6KL7waLnIJk
 VdioOw58FDhpc/WMYx6ieN7zYGYZcoIVRVVnaiVkD8G8/+BEr19yNUsXzXKrx/7H4sEq40l8bFi
 mmUEPFL/pH12W/r/2x1QbIiBljmlx4VT6GXVSye2mb3VLqDLjLUG5bIqirFb2y7gn4mXvFHboHo
 OJmQMCPruQ1VPhijKMJY0OYjLec19BSrGuZYh2FQK2ALO6pic8eu5YdvPOJQkS6j70XC53KxDnI
 x9yrYsVKESeESjpYc8A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX4zdpkFhn2sX2
 ctwTu0kZP+Ng0IuI5fc1o9P0I1FjsyK+VwFoV7MaCOasCWVGg/hoU18hZvPbm0L8q6OwWGtFRyE
 I1T8hsF9pkeJ5FanQFqynXabzaTEGZA=
X-Proofpoint-ORIG-GUID: F_ia9PrfzP2Etx8U5ZAwCZMc62_C0r0G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 impostorscore=0 suspectscore=0 phishscore=0
 adultscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The raw formats supported by Iris were previously advertised
unconditionally, assuming UBWC support on all platforms. However, some
platforms do not support UBWC which results in incorrect format
capability exposure.

Use the UBWC configuration provided by the platform to dynamically
filter raw formats at runtime. If UBWC is not supported, UBWC-based
formats are omitted from the advertised capability list, while linear
formats remain available.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vdec.c | 26 ++++++++++++++++++++++----
 drivers/media/platform/qcom/iris/iris_venc.c | 25 +++++++++++++++++++++----
 2 files changed, 43 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 4c8bc7aac135..9fee5f28097d 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -69,8 +70,14 @@ static const u32 iris_vdec_formats_cap[] = {
 	V4L2_PIX_FMT_QC10C,
 };
 
+static const u32 iris_vdec_formats_noubwc_cap[] = {
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_P010,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
@@ -80,8 +87,13 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return false;
@@ -110,6 +122,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -119,8 +132,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 		size = inst->core->iris_platform_data->inst_iris_fmts_size;
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
-		fmt = iris_vdec_formats_cap;
-		size = ARRAY_SIZE(iris_vdec_formats_cap);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_vdec_formats_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_cap);
+		} else {
+			fmt = iris_vdec_formats_noubwc_cap;
+			size = ARRAY_SIZE(iris_vdec_formats_noubwc_cap);
+		}
 		break;
 	default:
 		return 0;
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index 16c52ad07e2c..2f2c56bf9122 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -3,6 +3,7 @@
  * Copyright (c) 2022-2025 Qualcomm Innovation Center, Inc. All rights reserved.
  */
 
+#include <linux/soc/qcom/ubwc.h>
 #include <media/v4l2-event.h>
 #include <media/v4l2-mem2mem.h>
 
@@ -89,15 +90,25 @@ static const u32 iris_venc_formats_out[] = {
 	V4L2_PIX_FMT_QC08C,
 };
 
+static const u32 iris_venc_formats_noubwc_out[] = {
+	V4L2_PIX_FMT_NV12,
+};
+
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size, i;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;
@@ -117,13 +128,19 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
 	switch (type) {
 	case V4L2_BUF_TYPE_VIDEO_OUTPUT_MPLANE:
-		fmt = iris_venc_formats_out;
-		size = ARRAY_SIZE(iris_venc_formats_out);
+		if (ubwc->ubwc_enc_version) {
+			fmt = iris_venc_formats_out;
+			size = ARRAY_SIZE(iris_venc_formats_out);
+		} else {
+			fmt = iris_venc_formats_noubwc_out;
+			size = ARRAY_SIZE(iris_venc_formats_noubwc_out);
+		}
 		break;
 	case V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE:
 		fmt = iris_venc_formats_cap;

-- 
2.47.3

