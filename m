Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CC09445AD7
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424874; cv=none; b=GqRMWYLhkJgkxdi5eyGIHmsLA7zycMxtwjmisihW4GkvjeQz9jxJFwcIj2Fvd+QoOIz+ZYFlzdZkxt8OQICOB4ba1z/wvRQB79zESUjCTBnSd1Zlf9Bj09R3OEaF+k0gOioxzx4vTS3XPD8BsqRwMCEf7iWQz77OmoFIY3574IM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424874; c=relaxed/simple;
	bh=cPTXXI3mknLotK+Tb+V1ad85mR3WKey4eZTl/ep3O08=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=g6sMn6T0kYifG1YmKXOjtG25y534r2kWDn0Lx38nXGEtfbcG5jDwbh/IV+APLb4+nekDaiUKHspD8+hRCM70qm/2jtq1wi7WiHL95fTUmfgl6NGBkd01yAKMQdW0KoSETbWTDIi2hKzWkEHEaGTS0gSq1Y6Jvdm0HlXdJZABGew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lvp6+E1J; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZrwcrHoq; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lvp6+E1J";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZrwcrHoq"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfgDt1117918
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=; b=lvp6+E1JsPlb5u2l
	TYeKqThYArWlZbpCiDLMPc3cGjdmqVJ52SxKnlAFE7WqP2Pgq+/vac/Pf1nUdbF0
	HFJB0Cv2tME35y7CZeIQeBAEq2t+En97HYK6Fm/PkXMZjDI5QNXiPBy0cuMipRO5
	GASg1N7bIpxkKUlR0SoZWoGoI/2huEyIQWwPdX+UovSa4UpSQBWF+9tui7Lj8jvz
	UNqpp942BAe+c4uysru74xOU0bk0clZlIUEZBiN541mHA/8damW6Xb5ZmWy5Nj6x
	P+ZWpW0CpKxSQg9vuA1nw5pIROCvmzdmcDdJjalq0+3puNhhKD8wwwjazVW6FAG7
	jsfd9A==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn07m9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:10 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so25461141cf.0
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424870; x=1786029670; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=ZrwcrHoqYpxtnuqDxXqZECNt/Z/dbITYcAk6mxp7pUsDnKpXQU6bY/OPagVpPCtvHT
         rQEGh7GfzMLbuXHjFbzLvxG4Z5BGTItj8DiftNx3ExBOzWJOvkyO0dgw1fNBIyhYGQA0
         Vo3U1YZlXcEK6epLY+BcSGhRmrTJ5neaf/xI1fpX2cD8u+Y87VAAJ9szNqVg1LXnDpRl
         p3XxcrrkTzzm4JrsnefN9HAejzntY6s2im7dIDuKmJFwR73vGwekfIhi2XcRtsCQROgZ
         5gfIiBmfbSxkiWOIFb5RiKnNj6a+wj38nZq+2p0GPuFW+haCl+UUrgAFMZcV+M175cdM
         0J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424870; x=1786029670;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ww3O+xZWHTL3y5Bq6dWUkA7w+aF9j0eNrHZL0WdKA3Y=;
        b=TPfaOZ2mS7FwM80PPfLotP8Td8Raad4fm6JoB4mlv0I3dlEA+b+/GNJ3lJ/20Tla3/
         MQnwBYuMxCKqEwgMJ0DuDKgj/HTEALpJp3HLfBWmlThabQnnJFuuTfqGCJxAUfirEDgQ
         +5JBOBucCz/eGisGzjhwMa2bt6gsTXWwX8CkdSDF3zGPoLvAVIg/zZJ1qsy9KHkTOwyO
         s8oBBUCEqcKXq2vMa4OotjufuVJ994zYpuTT/Rpjp25fIJlE20agsNmDT9QOMKZiQgVS
         o/4sRUUw0fHze3uZ4lJkkFt0qLQCUbRn+hNvjDiTTUwClyfVYk8zDUxFHZZFMf8ti6be
         Pmcw==
X-Gm-Message-State: AOJu0Ywq8PTK588skWdNMcLuOrLf7koLzFliWgAwXAFI3be3tTdnUzb7
	h1aqikj4lqTZJNqp67Ent5QtSHlBC4VXNXyn52vh3Fv3KSVsIXvjynzG0vTZTsahP7/XRXaakSy
	z0GVUdziFlJktfuRFvQXLMAK8RYUQftEgRjcUpCnijHIPhIxYrTYvo1Man2ZnMcz4hw==
X-Gm-Gg: AR+sD12doy6FXlkv47UfxZdGPrzO3RH/L0LFypc/oAmYehTaM42UKv02pWFFlV5U6AN
	kPGGUwj4dW9uNldLlo9dW1Dciq8jfJDCe/+3UTrQrV5NL1DbMzL1uJxDfX/tghbyboCUPnDCpSX
	busx06Lz3zE+1L0w7+OmYZhkqb8H7nddTOukM6FNTsZIRBio2m/afzADTZtNx6ZuuhNU5+VQpP7
	jz+iq64E8fycwZu8Xf+CQczpb8ibb+DDKpdpnJOOgd/TVadzXr3+FqGJ87vscyLz7EafFPDaJFV
	hQJxMUZfC5HKx7DMIyGIWUmqL5MTkUX6FX9VYi/ApaJrk8FfKQveEv3gXm8lQNhzWgYt7BRNp5g
	sCtEIFHdAggDJ6ZRuRGpskZx5VRqWpWGK9qN3VYHhk8e7rrdcy4wRxEQGY32v/60oO8o4tKMJGL
	0qwm6MesOBvAZyvw==
X-Received: by 2002:a05:622a:1449:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-52b3877fe49mr32790091cf.61.1785424870296;
        Thu, 30 Jul 2026 08:21:10 -0700 (PDT)
X-Received: by 2002:a05:622a:1449:b0:51a:8c9b:6499 with SMTP id d75a77b69052e-52b3877fe49mr32789681cf.61.1785424869847;
        Thu, 30 Jul 2026 08:21:09 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:51 +0300
Subject: [PATCH v8 08/18] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-8-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6946;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KKYwQvV6HfPLmLckhIvkwX1DNxqvTV0Ag1veh8Tp1rA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vRkffmF+Sp0l2e0Xs0yGPoNJ1XWE3HZ9szp
 hBYAvMQTlKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1ctwB/kBuzZdKx//KXH/IoqCLPivulX74aX+gJlnogQXutBQIKsyQqldtbgpjr7HaLh1u8ksiZ2
 KQSsNHh2Zz2y7jiMtgh1i4tz77tqxgoWcZyHdNcDzC7xr2M90EjQCCy2ntxWI7WyLKQ5rpMnWsp
 a+WRi9ugnXMx2ktNpT0Ue4oJTxmwlWke2bRAZxzWscKYUgilJPqkxdKjBbwLWMteyXxWX44W33E
 GOzDtdeizVXpyW5iYuLmgUnNy58SvIEwgMdQkiwLSH/6HkqfeLnM9VKqmJA4UggQBe8j9C9m92H
 y5a77cbfJGAeUzX01ToAGhlOSdwPJ2hGb1t8iGtbC87XTWlE
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX0Lyh05M1TTxb
 Bc6ihNXB0ks/h34zWu5f1Cm5uDpbHyvncyimaZeCLIhGiwasHgqrUSSppZ43flAT6zqNeLtexCE
 MNsNai/BKDb0xhBnPqHWx/Jtk3HJYyo=
X-Proofpoint-GUID: E34xybtZq5FdcDhFEZaM0D869bD92SZM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX8x8c09urh7Gy
 9bPjgB074EshredszKqUDiAbBWBchriVLxLW+477dgD8DfrCsZyj3NKw9feVwJCxYZ3Iwb6nKqF
 FF9d+GMbB38c2g9BgzbErys4Pds2LaJa2tFB90UyXb7izZ2pRUGxuJIQ0Ytp3UjJxD/F5X5CNu7
 sVb0kXfOy1IjdWZmCNfHAUYwNO0B86ZfU9R1PjmwMGkFdsui+xBekEP6DwNIX1pgXDMKnSUa6wH
 jwZD1j7Al/4EMAZKtQh5qxuxOks2J7F1ITPA6VEixYKV9FijGeWP4fqhpIOpuJSZ4nlZ0haepGP
 +RhwwJKP6CdXVsr4K8yn0003CMdBZo9xMKCK+BnlEXmPOVl4sYY1zuRe/65IrT2aYYh1Wdrg1PE
 lc8+qyNbtrI8ef6Q/RBEHflc9HBXwFCs27UQX2m0HjDeDNPIUaQ478TvA1YTqQOS4+LmMJhMKwO
 o4OWH1vcyEIG0aGIMxw==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6be7 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-ORIG-GUID: E34xybtZq5FdcDhFEZaM0D869bD92SZM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

For AR50LT core, the value of WRAPPER_INTR_STATUS_A2HWD_BMASK differs
from the currently supported VPUs. In preparation for adding AR50LT
support in subsequent patches, introduce a platform data field,
wd_intr_mask, to capture the watchdog interrupt bitmask per platform.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_platform_common.h      | 1 +
 drivers/media/platform/qcom/iris/iris_platform_vpu2.c        | 4 ++++
 drivers/media/platform/qcom/iris/iris_platform_vpu3x.c       | 7 +++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c           | 8 +++++---
 drivers/media/platform/qcom/iris/iris_vpu_register_defines.h | 1 -
 5 files changed, 17 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index 55a4fa356985..81fcb2854772 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -315,6 +315,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ba91672df1bb..940daddbafcf 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -16,6 +16,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu20_p1_gen1_desc = {
 	.firmware_data = &iris_hfi_gen1_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -94,6 +96,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -124,6 +127,7 @@ const struct iris_platform_data sm8250_data = {
 	.tz_cp_config_data = tz_cp_config_vpu2,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
index 7098b652c117..eeedde8fc9ce 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu3x.c
@@ -18,6 +18,8 @@
 #include "iris_platform_sm8750.h"
 #include "iris_platform_x1p42100.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_vpu30_p4_s6_gen2_desc = {
 	.firmware_data = &iris_hfi_gen2_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -113,6 +115,7 @@ const struct iris_platform_data qcs8300_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 2,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = ((4096 * 2176) / 256) * 4,
 	.max_core_mbps = (((3840 * 2176) / 256) * 120),
@@ -142,6 +145,7 @@ const struct iris_platform_data sm8550_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -179,6 +183,7 @@ const struct iris_platform_data sm8650_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -208,6 +213,7 @@ const struct iris_platform_data sm8750_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 4,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
@@ -243,6 +249,7 @@ const struct iris_platform_data x1p42100_data = {
 	.tz_cp_config_data = tz_cp_config_vpu3,
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu3),
 	.num_vpp_pipe = 1,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = NUM_MBS_8K * 2,
 	.max_core_mbps = ((7680 * 4320) / 256) * 60,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 375bcd923476..41498f94480e 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -109,11 +109,11 @@ void iris_vpu_raise_interrupt(struct iris_core *core)
 
 void iris_vpu_clear_interrupt(struct iris_core *core)
 {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
 	u32 intr_status, mask;
 
 	intr_status = readl(core->reg_base + WRAPPER_INTR_STATUS);
-	mask = (WRAPPER_INTR_STATUS_A2H_BMSK |
-		WRAPPER_INTR_STATUS_A2HWD_BMSK |
+	mask = (WRAPPER_INTR_STATUS_A2H_BMSK | wd_intr_mask |
 		CTRL_INIT_IDLE_MSG_BMSK);
 
 	if (intr_status & mask)
@@ -124,7 +124,9 @@ void iris_vpu_clear_interrupt(struct iris_core *core)
 
 int iris_vpu_watchdog(struct iris_core *core, u32 intr_status)
 {
-	if (intr_status & WRAPPER_INTR_STATUS_A2HWD_BMSK) {
+	u32 wd_intr_mask = core->iris_platform_data->wd_intr_mask;
+
+	if (intr_status & wd_intr_mask) {
 		dev_err(core->dev, "received watchdog interrupt\n");
 		return -ETIME;
 	}
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa73..4fffa094c52f 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -41,7 +41,6 @@
 #define MSK_CORE_POWER_ON			BIT(1)
 
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
-#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
 
 #define WRAPPER_INTR_MASK			(WRAPPER_BASE_OFFS + 0x10)

-- 
2.47.3

