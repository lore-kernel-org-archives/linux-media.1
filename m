Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 169734119F4
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455333; cv=none; b=B8Bb5KCdQb/J61ZQ5SzeSpruEyFAX4PXJ1w7kQriPLN2yW6HpLHWaUBBntZv4Az9nksjI46wq+FbV71nTic2xZjEXMHa1YErGsggnqf0rfcykqqb+llq4r5VjASEKYzJIJkwpWk9r+zzd/z/fLWOttoW7D/GiiWPCTrXzl81gOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455333; c=relaxed/simple;
	bh=G1iz4Bv/zZJDr9uAWK0a3xmht38Pw9Rlb9gyga4TQoE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hr4JuxNIvvQuOQDb0jH4wavZi6QZ1tiipv5jlRzM5ZdWYd8dbfrTg4cf3zl5HKSWSIOZ8VSpQpoCGEkeOJEMd+vchAdJxm7Ct1ztM5UurPQcAUxJ+fAlkD6K5szgD/jZDRnxlwW3vkHSR8WeKht1O6z3iunzu3S5hG27stlaWf4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Zz5pS3D0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eRa8c3tK; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zz5pS3D0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eRa8c3tK"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMr1uw2203157
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/GTFbXOohkValQXgSlm+Jq/eKfOs9ZyAyYV4CHrtf74=; b=Zz5pS3D0dP6RtLXa
	KBl+eFgOkrPesDjxVKQLZhqPY6NE5+soVOl7jvvOwoZPxvfPhz1ByJ3ZuvYVCZDO
	l8WycINSK2mtvnw93MhRe2eMvjNyq9+1BsnXC29w7eEh7+XHNyZY9vRnotpvojjt
	b0iNcw50IYyflwAlzK3T1rmPx2K5QDBYJgfxzvq21gLSM+KfS94FLmb/CQL0f/Bw
	nkeIjqn9vqjZmflASTNAwWmO1hLm5PUT4oIFJ0jeAFVung0jK8FBynyrHCYLJP8J
	MNuqvgbPhuby3K0eBXLx9Sf4awBPfaFTwmgAPXQ4ues+5Rv3U2UMlgL4qXFKyjx3
	WT49gQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frdjgrkts-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-51c21c01cf3so6204031cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455329; x=1786060129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/GTFbXOohkValQXgSlm+Jq/eKfOs9ZyAyYV4CHrtf74=;
        b=eRa8c3tK/pbzyhDgw3TGXy3uW9IalYdABwF9G2gylwzLW70xF4Im+sE7cQHorK5Cr9
         QgGE05AwzIw2EDFsS6FQAdE5c/FNIMm8froofDiPusBaT9pR8ta18/rSrz3eR7EQwLCU
         BG0PMOhpxkBPy6wAP6n82CEqDTSGc3SACHVsepFBTw8qpUDHyKzCs56tbjwUXhKldCdZ
         VYBtyhZOHXLNs9IaoUoSyyR09ZUKN7+WevSjx8rtRm6S8P9nO+HB4t4wJvxmE+iM/N3l
         XAlDbsg6FXX/mhBYn3xsCo/i8GWYikET0t+qLMKUGEbu1plXD0YwhWernnHmk7mKqDUn
         EPbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455329; x=1786060129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/GTFbXOohkValQXgSlm+Jq/eKfOs9ZyAyYV4CHrtf74=;
        b=gpAyfwNZuYlWrSgSuii3tSxr9UXRwa6YXE3jJldRCsMtBLYJtcFAOgN+V3ee1a8h1I
         iTt/YW8OiWxwzjlnrNu8fQtuczMC/RX6QtmZNj1mo1wfG15EK/XiDDtaVgqmZdYeC87b
         e9mk/fGDq0ODDV+6BGp2hRceKE3GI68cKFFH32czovk0OjzILjho4xmTW6D8u8+VXQev
         SGFquMP6F3WerZ8MXzI53ODK2ZzQ4w+KzmcdNUfUb3V1PZxbcvhwmbIIRTaA7Hu58wNB
         sJ8kKpxeE9FiGxwfQJB9tfqVIN9nVVcA+4PODfUaw40LtKq20VxoxPUutFRHRTN5SuVB
         Tmow==
X-Gm-Message-State: AOJu0YxcTS6FA3L+Ln5olF7n4P+MXbhu4r0dLfRV+/YCAo+1fanqUsaI
	xYHfG51onH+lkucZjp4LwAbRcUwVVrxAZmxAWuQj7PDNOY5NnhmZF3F8zsTwg5bUafnWNvG8grd
	qyRqLZr5cddZZzjb3u/jZSe3Z0F0/WHHGOxBxBUqWcGeUl7Mff/hN+OfTflTx8/cBSA==
X-Gm-Gg: AR+sD13GM4jrHyVvVKm8mt6jnrjqRppNbUX4RTW+JJ3cZTd/x1gbBtdiQHy67Kri/Pu
	/xK/G73EHmnuK5aQndKBLWq0VsXBuDW/CdK9X12hU79CKyvvFRTviALWKfyuGyBG97r8lWvUYz/
	8zeuelfKq/jQucKjkd7BrsDW4OAa+RS+ns1ycB+jJds3Av9amN3vIP0XJAQKoX9PeFGYMKXuUHm
	yFIINVz7euH/Iq9eYVme9NHRyODgkBp/hRcn951cbsbsB/Bxluf1311gY71UC8HPYYyEGchtJjM
	JGDA42RQUNPwGTkSy4k/MElGM3zmQlwD9cYaWIzA8v4185QJaen8dvtK5RyrMCC1QGSrWsZ2Dr9
	MnK32W/W32Bu0k4DQHKteC2K7PFb4UH9dgOiuFtdKoY2gLVuDErP4OX+rxikSyut/mKkTCCXp/U
	Vb9zYUwbxIWm6W1Q==
X-Received: by 2002:a05:622a:392:b0:51c:7b12:1211 with SMTP id d75a77b69052e-52b38768f96mr48558301cf.79.1785455329357;
        Thu, 30 Jul 2026 16:48:49 -0700 (PDT)
X-Received: by 2002:a05:622a:392:b0:51c:7b12:1211 with SMTP id d75a77b69052e-52b38768f96mr48558131cf.79.1785455328874;
        Thu, 30 Jul 2026 16:48:48 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:30 +0300
Subject: [PATCH v9 09/19] media: iris: Add platform data field for watchdog
 interrupt mask
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-9-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6941;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6boUal5eeTssOiSkSkYuxr//JHAIpwrQg0P8adRbaEM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LLVfW5i5AWtLqnCn8nTgMs9JwRvgpZDBy4p
 sMN8lQUlNaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviywAKCRCLPIo+Aiko
 1X0QB/4rBl8dJ5QpWzhXIC4DtnD4kWP3hiLyXPOTpgnenEaVqkDk/Fm0soJEvEPX/DzfIgXNK5o
 6kZZys0OGH+0aYBKW8iBbPakufrnuA3ykDimeVySfdNpuMwIiC76FNUyfN82gcYfTbh+P0SZznI
 S4wejAVa/4Ev5g/FvAsujv9QYdPDeM906nu8tTpcv9tTiHz/zNSHkDKtnUqc01ZiASHkGEcjqVm
 ReBCD4lJwCfgn1d/BxJi3BvBDyAWRqnyBwVGZTKUQWPblENLF/83cBqS7l47tBzBZq9Ju+HtSvl
 o0oSS9fGHIAf50HbqWvFt1fIwZPGMjzSNH6PxhFNxVu6GSVd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UHklY368SeHj6Biqo5dF6sNU8UdTtdq_
X-Proofpoint-ORIG-GUID: UHklY368SeHj6Biqo5dF6sNU8UdTtdq_
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX3G4mRCB0m+q/
 VusfS9B+oPxtjnBh94vbR2ZKT95Cl8ZViEfy9518SffCaVj49EVTQS/AMfUFKJenCwVZ5eShIRF
 JQPU5I/OBGXFmpOJk2EumWs9GQRn0y0=
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a6be2e1 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=6vpm4igQ2ooD_hm6sYAA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXwPnitY8ZTHNu
 2gZUCSf+Mx6N2FVzU0q3c6aFUjgEpqFsDlRSkjKU2p/7rcX6vbaShnxyzgCdHHVSXvehpOSQ0BA
 zCDMLM5XPB9cWv6wNw5tQ1bgqkp7gTnbIUAiVb1EALQzcQ3XILlV7GyZlYMajpGTD7vZti/ZpLY
 i0j+8lnSjj0JmPWiJ6zbS3RT1YcjsFKGqObzav+pxPswVzed1ZNcZcCPlVRIsRbjs8obhBgq8tf
 +v3OyuWCcYu+TQwN5Eq3T0Ob+hWCGd5roy62hnXnmwIsLnxRKj//oXdBRN9V3TtHL0pShwGJo2G
 kSOyltraG5+jFL/zotJe6ohIGo+mzLt+Jl4S+wBlzUIusJuLfAUdfoLZqYyvVGEN/u7bAS9rLXy
 MLx3hI16sAn1e6f7mDou2KTsctAWqMjaW/3SRuUJ6l9pc8yQFHO4DxgTFOmLlJYAFL6yMivl1qd
 ExfMPavY0MmQY+tf+iA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 clxscore=1015
 bulkscore=0 adultscore=0 spamscore=0 impostorscore=0 phishscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300168

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
index 974809509146..a35b487b50ee 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -318,6 +318,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	u32 wd_intr_mask;
 	u32 max_session_count;
 	/* max number of macroblocks per frame supported */
 	u32 max_core_mbpf;
diff --git a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
index ee80bc5decaa..562ff0d6716b 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_platform_vpu2.c
@@ -17,6 +17,8 @@
 #include "iris_platform_sc7280.h"
 #include "iris_platform_sm8250.h"
 
+#define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
+
 static const struct iris_firmware_desc iris_milos_desc = {
 	.firmware_data = &iris_hfi_milos_data,
 	.get_vpu_buffer_size = iris_vpu_buf_size,
@@ -129,6 +131,7 @@ const struct iris_platform_data sc7280_data = {
 	.tz_cp_config_data_size = ARRAY_SIZE(tz_cp_config_vpu2),
 	.num_vpp_pipe = 1,
 	.no_aon = true,
+	.wd_intr_mask = WRAPPER_INTR_STATUS_A2HWD_BMSK,
 	.max_session_count = 16,
 	.max_core_mbpf = 4096 * 2176 / 256 * 2 + 1920 * 1088 / 256,
 	/* max spec for SC7280 is 4096x2176@60fps */
@@ -159,6 +162,7 @@ const struct iris_platform_data sm8250_data = {
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
index 9a89e8ae06ce..3fa1a3cd4de9 100644
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

