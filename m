Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D7C415F01
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455324; cv=none; b=PJA2za1HXBvyJKUQtaPgk2pU6mklMvFd2EM1AJCwkWgnST/ecJ8Kz/kZ2JeT0E8C6dJjIbtei/Gjm4gIQO6Y4iVY14SrHt0TYrIkSkrb9AuewxASm8aAIi+VtLoltMgV0m8+608vajm0T0j6fu15j3UEVKcl0B9jRUKPpYM4Si0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455324; c=relaxed/simple;
	bh=l0/lfLbQNiyyqQ8kXdTopoSs0dF+CQUlVAKRACqlzE0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CejhsUT2kX3yPuiQtP1miZ3indYyDtO29Tp9Ujjb41Mb/kzbaEdIoMcvaJrB0fH9C+1HYvbFJfmS48VqHQQ/TzTNVZ7aaE/qQ+MSPfY8wTE2K+lZqQ1xb5pESCuf4a/F/DfOgPq1aEfLhCxl4TzBlSAFRuLDJkCMJ8+ogy5Wwyo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=OGnUzzM0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Y8eF7cSn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="OGnUzzM0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Y8eF7cSn"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqrXb2064756
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=; b=OGnUzzM0cqek1Zyn
	3czpyPUjRY+8n6GC/6UiKKY/Da0/Sqfou67rODL7yEAtLAEHPDsOlz3aR2OOrusY
	949rWIN0IY+Jh7ZOJgWzst/i0+D7S3sSBdPu9pT21AjsMERfxIAaonynCyhu0ZKJ
	2j8dzb+MSbol0SemUVkmiSQdnNAV55bFtSrEOJSy0ZTx+B8D3HKE9LG4l9gvuOny
	srcej644yXWzx7tYTlYVzbGradQkpsOlb71ue17eSFEOhjLXc5mrNLJm3G+TwJ5U
	KWMul57Dj7QtsuhdFu0aecaNc6AvaZhWHhvPSdD4+rbexu0yJUPxvMK8M+Oj4MRb
	YzARtg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frfja85jq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:42 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c26012cd0so3346651cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455321; x=1786060121; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=;
        b=Y8eF7cSnTRbhc3tNOAHcmrSqsdNfraF0B80J7hMU90u2pF86ANmRYIsT6u+rsy76uD
         BVC6pkrbmXQyz0/BXUobaWeME/ZptWmwEaKlkWpgD8/3Rqj1oaKnKTEeqPa3igvhWkm0
         EJJaTx2756YVYmF9oaNKFu9Qa4Z0NkGFE5SeG3zmUhgY5RDyr2nZD45YiyL7lkEO8icO
         ycDgTblbh0wi878/5+XaIQcDdSbcIMNjwrefzpKGiUs7X/WwORkmHzqgB5DL/byNpSpy
         0Gu4yz+XtZ/Houyuf8nQ/hD5bvp2m4WhoIoEJk1GjtMH6RCtkmXUEV3eDIwv2I5JL29t
         yk7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455321; x=1786060121;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OB/FTkskig77PdEo8cv9AazpmiyqKhTEhHN6amZjUVU=;
        b=Z4wQzozzHnwCx3C12gSyj6qREBFU8NzQ9Vu+FrPnMUgambi126fl8xL54mjBeGBBCa
         HP37jjUfskDJ3pInDNkFMTapZj9tH8Jvs50dQlk/uQ7Vd6JYzoztenDSA00XIdE8Z9O2
         WCNx5Hym+P2Ur1Z6pdhZ4/nh5iQGfLTS2nOHVHmQ1ig10FPGl3bkvd2zhP7s0tgLzEdX
         lESvUdrlXaBPxJt3QRrx7+Pr02dGqeB0e8YorcZVHQjSrpxtJjOp8aKnm0tLoeW7IUO7
         PTwM15F5Vsxh9ki4951j52ReDLpGEmOeh5P33giyDSYeEqfejfT9q+nOUlctCWAGVc5I
         bjFA==
X-Gm-Message-State: AOJu0YxULRcTJsEmpWNEkfQeYJImV4T4kzUvepRcPHwoG4Br0j4sWwMe
	2xb2G67Ywhv5NCRH7azCdTmDm0KlWywmhR1WGFMaCfOJIsJR7lnC0/eKn4H7joq/7x6ChfoI44m
	K6ICnvKXD165QzqQrjb4mcIHx5zBwNcLndSUxfPWBkLlSM5s5O43DQZ/O6i3uAs+m+Q==
X-Gm-Gg: AR+sD1126FUfydLbXXSWEHqdGS3Yv5UXt3yd0w5ArDmWS/z9BBIrWjt/yKlSQPPue0y
	WF81NZPOXGqakzlL0v1cdB95rUQGi3jdEBev97j/m4a7uHSYQsqMiQ6r2Itp9CGLrva/9I5BtdN
	Z9Gt7y57wkf2gG7PgE9Qomj5u+6hCbBpjKu23kC0wmcFc3Y3xLVYwxMfHp8jkM3dzU72oiJIYkO
	PIu2Xt4A+u9LvKYbsAxtIFeDkPJ+Nx8CEAFp27hpYJBoHU0Zf+zI3U2EHfgg3k6RcL0/zvXSHcH
	e3xOG88z6LsfA3P6kCeoiyDPPuMAOTifi01Mq/Y5RpfKtvi7Jsm6GTX/D1nm7P5yBve1bhr5ewP
	6PPUn5ZvXL8xpw0uaYT/cTnZF7lX+xVd7tXG931CV+YLQ4OgkGqSGpPp5Q4+J1QAoRRwR9yAmzp
	u17KdG3rL5agdtpw==
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr54196381cf.56.1785455321332;
        Thu, 30 Jul 2026 16:48:41 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr54196131cf.56.1785455320830;
        Thu, 30 Jul 2026 16:48:40 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:25 +0300
Subject: [PATCH v9 04/19] media: iris: drop IRIS_FMT_foo enumeration
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-4-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4515;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=l0/lfLbQNiyyqQ8kXdTopoSs0dF+CQUlVAKRACqlzE0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LK5KPfce2Hu7u791nJbh9RDcHPzrXZE7Blz
 HNcatbeQ76JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1a/4CACoAadyPaTR1l1nGkXAvgHI3E5Udm74e0fsWzgxYP6ot2rytjFG7mRPWhH5GVWn3VJY+BG
 uf84+9P1vWltASqryj5sUI4GSRE3gKN5ObvZUhPg2ZjO9ySHVuHy82ewtorkjZUg/hVlD3+4eqk
 kcIyr3HRoX27XmmNeSXankDFkPcbKGyf57mlQ0FqpO793OAHGsEujC/zJgi93y+glzFVEOJza55
 4q53N6o4Ac2zOUpJ/IMNyZ6gDk47IJunqE/Ac5cF/W7dB3xyT1eWw46wsmMNOmwaliqOcKtm0c6
 927onb7v8ZWT/yGbZavrn3J/ESpI8Iwuy02PWtpc/DUHMgRy
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: CzROVzeE-FfMPYniZpmfYgKqOhsA9zYO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX1irpvRSXw4pC
 QY43lGgoQ+KXbnLJKoVyCPZ5YZC4kVyuZU3m+7Dglo0vNrsP/sKcFsu+QgFY/YduWCYxa5TPNE/
 Vg2qjoHWvzmwp33IYj67N6AXuDZ1FMPNwb/QDPvvvtguhziaqTP9s9PtBqTJLfNUoOtasyYJBxG
 O3k/80vjT0q+ifjds9I66xq6eVM1FGT9q/9rfOMsNFBV3F3OiI5qBJEN/X8KkdTlp5Gwk6/kIzU
 Th1iWuybKvkBMNUfMMslK5W5rpWxmiQe0QCde7tbUsjUp1IbX/0JH5XrquIUAYI0MlnLrEWI8v+
 Gg1vdBy6DkuExD5EOYDM4Hl5+IskCFAxXnfPJ1zI3P9EHe9kDKfZQivv/QyPVAndWPh3d5G+Av0
 zTu2/dtPaC/J6/vWp9mc52x+UtYsudREjHnrJiD3rwtlC3D4RjQ9CMh9WUDXUFyobsFgAqldwh7
 NuRHk5IYfQIq72YfREA==
X-Proofpoint-GUID: CzROVzeE-FfMPYniZpmfYgKqOhsA9zYO
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXw6HhC32iWkpu
 0kENmgu8rTXaQX9njI+xRzzI5CBpGI9OHv2eKG6H/4xU+fbuc3cSgzZxHrkfcvIYjTUwXoo+m67
 CXtJZoLViFvXxHWVRBlBPpMCDIGrfbY=
X-Authority-Analysis: v=2.4 cv=XtzK/1F9 c=1 sm=1 tr=0 ts=6a6be2da cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=Azqn4rg6zLMgtGihcfEA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 impostorscore=0 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

The IRIS_FMT_foo defines are only used for indexing values in the format
enumeration arrays. However this kind of enumeration doesn't follow the
V4L2 logic (which expects an array with consequtive indexing rather
than a sparse array) and complicates adding support for platforms which
support different sets of formats. Drop this enumeration and use flat
lists of supported formats.

Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_instance.h       | 14 --------------
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c  |  6 +++---
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c |  8 ++++----
 drivers/media/platform/qcom/iris/iris_vdec.c           |  8 ++++----
 drivers/media/platform/qcom/iris/iris_venc.c           |  8 ++++----
 5 files changed, 15 insertions(+), 29 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_instance.h b/drivers/media/platform/qcom/iris/iris_instance.h
index a770331d1675..ffdbbd20901a 100644
--- a/drivers/media/platform/qcom/iris/iris_instance.h
+++ b/drivers/media/platform/qcom/iris/iris_instance.h
@@ -17,20 +17,6 @@
 
 struct iris_hfi_session_ops;
 
-enum iris_fmt_type_out {
-	IRIS_FMT_H264,
-	IRIS_FMT_HEVC,
-	IRIS_FMT_VP9,
-	IRIS_FMT_AV1,
-};
-
-enum iris_fmt_type_cap {
-	IRIS_FMT_NV12,
-	IRIS_FMT_QC08C,
-	IRIS_FMT_TP10,
-	IRIS_FMT_QC10C,
-};
-
 /**
  * struct iris_inst - holds per video instance parameters
  *
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index bbdbf21961d7..ee80bc5decaa 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -42,9 +42,9 @@ static const struct iris_firmware_desc iris_vpu20_p4_gen1_desc = {
 };
 
 static const u32 iris_fmts_vpu2_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
 };
 
 static struct platform_inst_caps platform_inst_cap_vpu2 = {
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 74626b35d9cb..7098b652c117 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -49,10 +49,10 @@ static const struct iris_firmware_desc iris_vpu35_p4_gen2_desc = {
 };
 
 static const u32 iris_fmts_vpu3x_dec[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
-	[IRIS_FMT_VP9] = V4L2_PIX_FMT_VP9,
-	[IRIS_FMT_AV1] = V4L2_PIX_FMT_AV1,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_VP9,
+	V4L2_PIX_FMT_AV1,
 };
 
 static const struct icc_info iris_icc_info_vpu3x[] = {
diff --git a/drivers/media/platform/qcom/iris/iris_vdec.c b/drivers/media/platform/qcom/iris/iris_vdec.c
index 7f89e745a4b1..c4d13ae58336 100644
--- a/drivers/media/platform/qcom/iris/iris_vdec.c
+++ b/drivers/media/platform/qcom/iris/iris_vdec.c
@@ -63,10 +63,10 @@ int iris_vdec_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_vdec_formats_cap[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
-	[IRIS_FMT_TP10] =  V4L2_PIX_FMT_P010,
-	[IRIS_FMT_QC10C] =  V4L2_PIX_FMT_QC10C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_P010,
+	V4L2_PIX_FMT_QC10C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)
diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
index a945992f63aa..16c52ad07e2c 100644
--- a/drivers/media/platform/qcom/iris/iris_venc.c
+++ b/drivers/media/platform/qcom/iris/iris_venc.c
@@ -80,13 +80,13 @@ int iris_venc_inst_init(struct iris_inst *inst)
 }
 
 static const u32 iris_venc_formats_cap[] = {
-	[IRIS_FMT_H264] = V4L2_PIX_FMT_H264,
-	[IRIS_FMT_HEVC] = V4L2_PIX_FMT_HEVC,
+	V4L2_PIX_FMT_H264,
+	V4L2_PIX_FMT_HEVC,
 };
 
 static const u32 iris_venc_formats_out[] = {
-	[IRIS_FMT_NV12] = V4L2_PIX_FMT_NV12,
-	[IRIS_FMT_QC08C] = V4L2_PIX_FMT_QC08C,
+	V4L2_PIX_FMT_NV12,
+	V4L2_PIX_FMT_QC08C,
 };
 
 static bool check_format(struct iris_inst *inst, u32 pixfmt, u32 type)

-- 
2.47.3

