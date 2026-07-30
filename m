Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B90419FCC
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455327; cv=none; b=lrvUr/FQQrzpqmxLJ63SKhI6vKE+apkyD2DnmRmJ3JZm2BWTeZeVAIeO3x2IJOR6Jc9joyetL2KfCQso6eFnks/xCxNFBpqKPiU+aHdncqeG1Mkc1BZotiIz3z38F03p7x3FNmZKpxWeMSrrKcCNKDQ/61XgLkzOQ6YabZH1ZAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455327; c=relaxed/simple;
	bh=UqR7JCx3AsHFi6Of58Oo2FXxMtcndjl1ZU6I5Zx+Tns=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y+fJQNEEJxXqz5cOyJDnTM2mkavXxrljW4YdjPqmveIXxNdLEfV+geZP46b/m8cUNpHhul2nFQtxuA5+co6ALuDrx6lZToCwEvMQ9cLNqV0fjfyN4pn9oKLzY0pd4I/hprO8z+m0iI6KPUURPM+eKPe0PmRSMnFChjRTVwA7paQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NhNX0yO5; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EpXOtZal; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NhNX0yO5";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EpXOtZal"
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMrSJ82352363
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=; b=NhNX0yO5B1Xreb+Y
	DhnBMqjPyWB9ae3diwAWBzniDnRzxJ0hNYXQaZz5qXKKGwmdyjkai/LN8xjcCN8k
	II8wcOXscFd1JiAK7Gd95i3I5uLuayFbNyjE8yfqdT4+svnv6gVPAZl3ncWDUVQN
	56+DbU7O6q2njDSINIHBcw/QKHbnBKhkl/QDO4vFoyxp/C0swPgZlMBmHKfvn3Bv
	K66rGg+Z3+mAKTXXyjmvoF21ETeYUa/yw8Aee3+bgWAwr6C6xjeY/uiLgdgd++yR
	hNEFExzLlWoiBBt5oWT8Ddw/OzrtBpc4afUfwpYqfQKON7kixSJnIWsCEoyejz5A
	mgKdLA==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfn0r54f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c0f0a0760so6849951cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455323; x=1786060123; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=;
        b=EpXOtZalKhx9stntlYETPZ8udk5RGTBZ1b0imX9aGbuJ2P/f1wuHiNMtiwnYx9r0oI
         acoH7mvspyRtNht0A9wD8C5ZTP6a+1wUan7tPTM4Ce+tbU9KxzvdjpFAlfHeaRo+aSFs
         vPE4ytuKl76S/zZqwa0UoibcvN/ItUbbjn4K6g12kAdVapm9kgazHUeqmPOM9ioEiPZs
         o0+QxYSslrxEbXD9ynQ1Gwv9Lg4OcVa8NxlkauUoQI0aCZUzzua3FnzSMoRmdm5VEvWh
         7C5JtWHouJbrNKlPxqGnTEO+7+YjsXvw6HoVkV8TxrZYzb68nUlcLUsUSSrk/2bl4hjW
         dsqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455323; x=1786060123;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XOF6mW8u+mcgpBSLz7Y/Z5fdusWH3hWcOP9sfEPktH0=;
        b=O5IrNnVWFj53EZOKqucXKDLdszSJ8VGFNBeNPWGpM/vU1q5N2phE3ZFslskJJt98xk
         es4PB7A366XfFCi0GctuB0RGCBuhv7tjrwdsWGvLNudaxrlZnYTc/ovx5H1Xok0KUyI+
         wC9jCB9c+YH4Q8pW499cwgHCZAG8Hx6rqJs7Mjr+rIWCJ6o43h4/tSyM5fLDnz8ot+ab
         QWat0rWrYJyqmeVxDivfVkKptmn5Sb37hjJiTUctJ4vL930yVNUM6YdhdMnBxnL6ZjFh
         WuzAvy2IKJhSlbmmJ+IjQBML3x0j0vdvrwTTrkuTaRqld8WTF2rCQHFYO1M4S8qVp0BM
         sD9Q==
X-Gm-Message-State: AOJu0YxKfmWtsaPeRHNPkUflJJTFn2KZx2jn8AUYmOT03NNnoHqY06LY
	eAxZVEkjQLTA4G534lSjaUahHcQYQ2nE5zEPnZM2V5Naw/UdkL7xYa6CIc3mxCpYHbuzl8TYp+1
	TDI6srfxEa5hI+F2//XY85PBqKeM+dWIdpZ+6BciXl1TvUI+9cwtHjTwI1SSmfYf2Xv3HuuCSxQ
	==
X-Gm-Gg: AR+sD116efcPbxMGFZk+NBa/+CBahqXhMOovLuCnEgX9/KDYoMwra1akvwpKWdZlOV/
	rPocIWrNVyLixcabTF5JUHw7e0VGo23Rdj5pNTdlPskF8s1NIxOhbcmFEaoHBXEsYrAf5wmjSHd
	NtQBwTNtCrgjezTHEutXJ8nzOZ/fROmmWzI7LUzyH1rVTso5EvIIvS197HwkhXH046SC83pWnzO
	ETzHJLFgcRwyiJ7YOAekhoICsq48MdrNxmOUxRP2VFJNcyooY63wFA+2CIt/CshcUTMoodcRUdA
	GVBGbf25L7q/oyMUp3L14C3WE8c42JW9TCdeIhWk4kTD7TL8JpbN2wDG6Ge5aPiaYuBx+6xS3Vg
	MCOvvL09hDE5myjFLV4e7hywym/fU/JM9e8iVNqF1QUNEydbX0CSpbmSUJFMe1kWkVn9uJWefMX
	95HO9Y3am0hE+bRg==
X-Received: by 2002:a05:622a:5149:b0:528:3b83:3483 with SMTP id d75a77b69052e-52b384b0630mr51774261cf.23.1785455322886;
        Thu, 30 Jul 2026 16:48:42 -0700 (PDT)
X-Received: by 2002:a05:622a:5149:b0:528:3b83:3483 with SMTP id d75a77b69052e-52b384b0630mr51774071cf.23.1785455322476;
        Thu, 30 Jul 2026 16:48:42 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:26 +0300
Subject: [PATCH v9 05/19] media: iris: Filter UBWC raw formats based on
 hardware capabilities
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-5-d71a782001c0@oss.qualcomm.com>
References: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
In-Reply-To: <20260731-iris-ar50lt-v9-0-d71a782001c0@oss.qualcomm.com>
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
 bh=s1WY6CnSsSdbwrbtarQlKHIXpgz9X6EpNUw0sdwkkxo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKSINhLEjMhIimxh1nuG1driAAQeFF38pq0
 ZucoiIUWe+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1dNdCACKhb2vJAmoNSVLr5rUMNvCH4GoSftd1Zs5fzWjjXbQstBZCnuUULnMsDlJ2ScIdhONB4w
 D0UDydtGRh9O9Jx1UqVkcc6Z/oDMnQ7c4bqW5ZLeHy6KykZDjAs9hC8rG5TMLYqI+6IWY3+wOa0
 vIALxCmMCtfy3mgP9xNA9SFAs+9SDCOYQhioglFxa9la8i32wCzJIOJe+pXmgBuykgBNXhJaYVb
 DXKgxqYl97bWkxF74Sya9zoJfSrZiSMD/6RE4ZZ7F+3iUCKqzJXawNqTVpNRUbYhxZfUAGHlyRv
 6iJwxEOo8YO/sFfBY6j3NKOHu9fAd5lyZrVtAB+xAwSLHRCq
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX2rvx+N1bbK0g
 RWAse8q9VG/oKcyilAg9+GiMoD03EayHLo5aKh7/2Kpuv+ED0eFRZueKjChjQGRd+tibN3OU7nJ
 odGKtEb3hserQ5SkxgEyOjC8zmceEy0jcOJQZpIZKjo1lANUBLnhpQuF3NkAMDf3et1NTsXAqEr
 IB4TyaqBH3/IXY8VFqCmO80TyE5oy2vxzvTMn0OrFFz+Dd7i4nLV42v9Q9D1RXLIy5nrl7m3Go2
 xhv6Rr8KPdKbmbozXgjLCkk61DYdZ7emWaAMo03EVVV9xjbCFo6p37kgysmOsGuKiwppWfX9SQM
 n81HoCtweIz8zbcUCFohdFP7zF1Lj3tiGqIKN4y8GnQXxryenvQ7z75u3MtNf9S452gns5ynTnY
 XCAo2AHfUVliIQGm/RcmU40HzjEtnYMnkqjM7V0Xw6Y8QPBg2uF7KxnCJzM3M4OrVmRVJL/tdfN
 idtS8UDXPUV5EnLhgHg==
X-Proofpoint-GUID: OhYmEeAWTiHAN4mz2zdh3rXJhrPoH0hK
X-Authority-Analysis: v=2.4 cv=fszsol4f c=1 sm=1 tr=0 ts=6a6be2db cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=gowsoOTTUOVcmtlkKump:22 a=EUspDBNiAAAA:8
 a=gsa84qigJ8via7s57H0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: OhYmEeAWTiHAN4mz2zdh3rXJhrPoH0hK
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX5BAHIRXfo5mP
 79Lrgwd1o50LIQX62A1R7ekdHuGfsX7wNAPmdWfVDBXNng+xqiDYfaB+O2P+PzjnrUa5CkyJN0h
 MhjS7GID6BtvObW9FVmI+wnNwFFTYqE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015
 impostorscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

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
index c4d13ae58336..0dd33ff447bb 100644
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
@@ -100,6 +112,7 @@ static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
 
 static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
 {
+	const struct qcom_ubwc_cfg_data *ubwc = inst->core->ubwc_cfg;
 	unsigned int size;
 	const u32 *fmt;
 
@@ -109,8 +122,13 @@ static u32 find_format_by_index(struct iris_inst *inst, u32 index, u32 type)
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

