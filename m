Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4F2443AAB
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424866; cv=none; b=HfDp0fdBPKerWklyQygT1ZV/q5GS8YB/dCNXJRcsR58/f8mC5CnNZx6dU26V/rQT20hPzY0kiST4nBxS+Sc8MFIioEJQBHkjftBLpitEGecrJpphzeHD1X1EYcJOg+N1Li3xfhK0uoMGa4+yQFOkhlMSbpX2Ejsdn+5xI1bB+VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424866; c=relaxed/simple;
	bh=SUPr9326R8/I85NqmtSxzGXasITRZ38mBZxBYOCk/p0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=k8WOULmqt8OP2jF4s8msRfVcOa3a+LUPpTzE2imz6Dvc5LAiD3y2J4SNFL1D90bRoWAG9CMokISsR4TGSC/BkOM4rVD/wmb7swVkS/Z2lIgEvGmOPyjQqZHbkTWqc3nT4d+kLrnx4IDLC0rGB7lFBnURaXyEo2NMWJqtVTaNpLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZeLXZKWB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=i79eZzbm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZeLXZKWB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="i79eZzbm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEh47D1384881
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=; b=ZeLXZKWBqvyC9kh7
	uKzOoVfavLiUOu25fDqy8aHdx1vJuPGs8qlt0qItacaMn22Q8jjt5Ii2FaomTUaX
	UR4xuWn1MyvPep6H3bikiRHdapXP+rGImHT1YGk1aXKmjpsHNTMVzg5M1HguWzJt
	IB9B2ghS6NutdqOfpBJqeC0rkEo0LZ0skROyaO2Dm75BlDCcC5YcfEluaXLwqC+w
	sCFqam8VTGEotlhS5flHL3hHy5/I/j16NLCmzo1Kqa5PGVGoTKUzaqcuCeYhbXqq
	3VJORPN+KrdMKTPquofW6QJVWU1lRUo225k3K3CR6NFx1nXU+ysRM3LWNCmtRf7e
	dk55tw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8md06ss-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:03 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso22869501cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424863; x=1786029663; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=i79eZzbmuca3c9TQw0+6EMNP5yLhwlPgBvCADg6Ny1TXW3xXeFc3WOnhv7jfRsWr7f
         ET1XRtoBuy/kY/O6BMzkTztyJalf5hyqm5cgKyYMm11veZnmSfXS+9ysXr1p93MWGW+2
         J5XjKUCajFmMRwm39ftlIa/vgaZ9a/eYLBQEgg4zkcGZnUqEo1QbsmNkL8trYp2oCS+A
         qB7ABDwsPt2q1uSJfT5QfJHx4ctLq5PGTEcv1sIANsrAILkQJT/yr49SZ14zWOabWzGG
         jg5mRi5TgCHKDxhBpAlqxrJFUNgW16RyVlLaT3SsC7q/yrgfEADR/b+oD9XsSBeNw7Uo
         v/rw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424863; x=1786029663;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rZBfUegtVT46gf+3kV/ulvsSL+G4ssvBArwyOeiJ5Vw=;
        b=qzl0HALaOfQkM0WPoKgsGRtP1/aZyj4n9dgcVpvbC8qqVZ11C7nUrYO5d5k8bKWKdP
         axVWFCla15OXcfTxcSqUt7OGSlf0io7sKTQpnHUMAzPBj3ytcFrIFsGt3sGmhdZApvgT
         YDOQeNPkQATgpgEdp4J/xLF4x3lW/Oa6lj9OvlBb8P/SkYuISaWQemuPpcZUycdTbmXD
         3LpynQHhQCANx9bhPT9ALZRvFHEQcKs9IRGdJspj5cwRYyiYknSs0iXl+T0ZL+hO5UGX
         f+md0oyrCi92p035WucSKWn5wv4ftE+mpj6BMynDxYVRtXgxYaYHH1l942uhitf+gvOm
         ibSg==
X-Gm-Message-State: AOJu0YwavUy0cITdzqTupLVxragCqvcXLbQ+2+XuEnmbmAObSTarb8OH
	7Ybh4mvKaLbmYWrftk6+CFFlQPptU/Ii9bJgu4TP/gqHIiJHNkAZnsjjjc7NHF4LTpJB2LmWpYH
	Zuikkhxo7Nm+0sccHoT08h88Nny0D7k7q3tE3h71mTGrUmKDjw42EzGfhDSycMV3M7Q==
X-Gm-Gg: AR+sD13hmMdv7CXG13etrTIcvIayImTVlNkoa/giAXOdtSrscl0TXoM8DePY4nupF9U
	81jp3h/qcAg5Bav37bG+FKNVTz2hDCJ/l9MCm6xJieOr4J8C4VikPo/mre1hE7LlVbxnXclSTYx
	OnZPNvVdS48vGWd0uhWZhaalBeKfv5QCy+n8E1GOQp7OClld1lbJPxplO8lo5doe6VbWvMmbKzb
	PQJpGKBSqOuwbH+CQSS+czQo1iXEXMlciT5SSZc/5P/krpOFgbic4GvvjLy1AAuj9eXbemwZf0g
	mrNiXzD3UQAaESnEkkrDPxhccLYRLan8QiNCPp816GuMgD5NcxZZp9KfweFamOk2POBC0wAMxU+
	MsW+PhOg9fxm0cLAqaZzH4+w5u1EtII4nY52uItA3eKz5nHSRS0AZjENYwxuvtCfLkdVLM9j1cn
	zkd8rSaFwCShoglg==
X-Received: by 2002:a05:622a:5598:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-52b38373e20mr32545911cf.17.1785424862844;
        Thu, 30 Jul 2026 08:21:02 -0700 (PDT)
X-Received: by 2002:a05:622a:5598:b0:51b:f40b:2fb5 with SMTP id d75a77b69052e-52b38373e20mr32545451cf.17.1785424862327;
        Thu, 30 Jul 2026 08:21:02 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:48 +0300
Subject: [PATCH v8 05/18] media: iris: Introduce set_preset_register as a
 vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-5-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4447;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=vk2n05YaqyNL1lA1l7CdzDHPMAEMMeRGvxRtE9L+Mhs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vQyR4KKQkL0BskKc7qti1ODab8vnD6SU6G7
 CTK8lA0VlCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0AAKCRCLPIo+Aiko
 1XwaCACt7/sOV/6BWgXYc7NCczqRYeoHvxSJmBTYAejCfk3EczXmqoeGVLdWq7g7JlJwx7Bm2rs
 Xr5SwYIbz2xTGqFpVuCIsFymn2lWv30jkMIA1f4ilYhzByWM+OQ2DvHtayysx71DsxiFw2/btgA
 179xg4Tf6aj015ZolUShsx2XIJ1L9Vl9gJIOcwZsIVC9j/vRWvxP+GfwAbn6M6oZjQ6nn710sUj
 /tpfUWVCXqP9+WObNG63uYeANDYRzBBoGTOyN6DHuLIVycPx7XhTcwcVPGVlOIx2e9EJAwWebhi
 GMx0xQJxTXDn2XIKcnxLuTq9d4zkzF/IF/aPboXBweWnuyb4
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=UZphjqSN c=1 sm=1 tr=0 ts=6a6b6bdf cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=4Uh0hlRDs2lXuULb_e4A:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: WaEXOfYodXSAKT9_Xq57bDkD3pu9szBj
X-Proofpoint-GUID: WaEXOfYodXSAKT9_Xq57bDkD3pu9szBj
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfXyO8RFEP/KNxS
 Nc2zXnmjMdBwzay/H4j9QrnecdA1B6GCUoZ/9b9gBUbxgN/RXv7lRV8rhPmds7ZJmhNCTWcFJck
 3UnJHkDFZkRgS3X77+Q4QOvhXrZa9LE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX5mfHY7r3hOoY
 wVLFmvrPhdOf97h423vzxOPUr6Prp4Ymh39+82PQD2WlgojTEGOLQawyAL6TabgrOTRgaov3Fdn
 Gvl8cOR+N/+2l6GXDe/bC85O/0QjZeJPmbE7xIFyXopr2kmG8nmgQtEcqSvOmz6qpRukpKAQhL2
 WZmy7WJBO+TpNa5+BZ2pioTu5Co8H4c1ceqWdUbnEQErpnqaHf5z4LUNunJOdogPRCqqG5KGmi5
 nEW5nE/IliHvcKK5GzCvoAd0Bn6zbYf3Otbek/8+AaGfRFHYwL7eJNlVBL2k5SGxWik46mq9QJ0
 aILbgBs/1udoEvOmyyK6DAOkGM4FzLD3sHPcx1KnX5QAQqv/TFWEifdwFhHLh1O0MWJfPa7u9ku
 68Bmx2AepOQxjP4pyaJsvpT7ewMwp/Ta6q+wVnpAVw5GGHzmVzku8mDWlg4TS9Eg0+3TT2eD+t5
 nfoCjbrFzvlDbQYL2NQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 clxscore=1015 spamscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

The set_preset_registers sequence is currently shared across all
supported devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move set_preset_register into a vpu_op to allow per-device
customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 2 +-
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 5 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index b8714dcbad10..2dc121a3f5e8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -45,4 +45,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b5..dc02ced1b931 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -261,6 +261,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +271,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -280,4 +282,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045f..f608a297d4a3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -368,4 +368,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.program_bootup_registers = iris_vpu35_vpu4x_program_bootup_registers,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
+	.set_preset_registers = iris_vpu_set_preset_registers,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index ab41da1f47c8..a49113b0da23 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -483,7 +483,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	iris_opp_set_rate(core->dev, freq);
 
-	iris_vpu_set_preset_registers(core);
+	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
 	iris_vpu_interrupt_init(core);
 	core->intr_status = 0;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c14..21ed4c9bd5e3 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,7 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	void (*set_preset_registers)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

