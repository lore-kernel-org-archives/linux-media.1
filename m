Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44AB9449B30
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785424881; cv=none; b=upYNr/ACrFDUH1eneL2lFIMzbl3ZxON66Zre5YW9O5r/R1eFQ3eJrApV/ggRJvzv0XNs/y996HrxRe300Lv1EyI3iOJ7JvoMXPIVU/VN2XSlBlq+1bTvc/K8JciAFh4JaJr7WQ7a0gCky20sb6zSEgdkBeefA1kXZpRa2yqlAKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785424881; c=relaxed/simple;
	bh=eWBuYUxiPRLNEUIgfV+vqLLnwaNm4PSnLM0AEfIgUw0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ATrgiu2FmSe5TCYON/VJNzqpICameUabVVboJDeLce/vZuDKeZChbcdf9IZUyJNBfU8+pF83fVZKcwaryKKZhGC/6JJOr5Fju0c1an31DksI+IPA7auwWd3SAfoxTDlN+3MotpWVYDd0aIXbj+iITNS0tNGH5snGny1s3R6buCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=jY2L7+GG; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=b8tgurI7; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="jY2L7+GG";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="b8tgurI7"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UEfcsc1117734
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XPM3XBIk4a0PPDT3uwMgAJ9SyoWSMerEPw9LjEWsLPM=; b=jY2L7+GGG+Eufvqa
	NWfAMckELqbxepwa2KI3JzWI3EmN/WVM1V4txP2udATBf4ym3ldK0zVNxaejt1Gv
	Pk1jhFOA7Nip1LHgBRoLhbDNttxuGMAFx71d9VXgeknpCm7TH0ic/KiLYLoq41E/
	eKGPcu/u6w07RPb6kNBqEadC8Wt8BOBJGCJ49F2wmN6bBVjswFEdheqEYeD51rNx
	Yq605iR7i1oHvlYJGW5kOeUyWW3tsqH081Agw1zz+zNgVv/+il/dTpEQozKEPjDo
	u4kpxefz5y/dciwR+oDT8xXODbYKnd2w6Zd7U42j7IX0nE76fOBoo2z25Z27P8JE
	LY4L7g==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr8kn07n3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 15:21:17 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-92ac0a54110so271354185a.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 08:21:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785424877; x=1786029677; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XPM3XBIk4a0PPDT3uwMgAJ9SyoWSMerEPw9LjEWsLPM=;
        b=b8tgurI7nGpIdkanXKWT8EdFe1IgA1QCaJrEiYP08jjzx/6nrYHqQW7+GagQ+bT0Or
         4m3Iv9A2cmtx/xD+Cv98Rz0gMURFmUwMyJC/2eI6eGNF7qDDJi8AoiUWn2+TdzNqBclV
         pcgdZhGvUI7EC9cFw6hgnldjLzvxYDdXQ0mQBmLIvZtBaWRI8wN4kyLO6mP4PxKUH+Dr
         YE8GxZqDCT9o1goQCkJKPN3+HkgiTrZtlfXUFo6mlwwDmnVsFmpacdku2PoDpH2DQn9t
         OhoszHz2UqPShDWRnDNoTcdGpr+kN6QtBAh57xke3lxL4YTRgIXC/J6ysUisMfz/OXKS
         5BFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785424877; x=1786029677;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XPM3XBIk4a0PPDT3uwMgAJ9SyoWSMerEPw9LjEWsLPM=;
        b=HVItcRhCXLgIRuZjpJiWy6GVzyLtazx3k5h0o/cj4+ab41IVHUpuX2+Yok/7gaK22j
         v+iyZ0N+HoJxJlBd+X1j87an6KpEXcxCkKR5fAGbOoARSlFQsjVONcMNLFGIh1+KU3rA
         xOc4EsOFOV48oATF9Nmx4MaRq4R7n+ddssXgdOanGeC6adZ818EesFkSj891Dci0cYFY
         DrGp0w+COUSwgzgGz2oxLWAUiKQoi0rMvBeOWoCSSlbSguTFhslTZXtuBFbieT7k+Ji3
         3pFO/+F93hOPf7sxf2LbmMMEt0b9eH1S6G0p6hAlAK4528dQEPL6LSlBuUWJ8xSeCJEY
         ZppQ==
X-Gm-Message-State: AOJu0YxNZhDPU1JNquWCcI8GmoJo9i7+s02ar/3E2XVN9pY2+eTrIlwS
	I8iA/Rk5DTGtNSLj0fWt0NISL8IUOAw6egpPYLoCKMxvmpvplLQHhukWOYWG1nWUAtg5uBuWI8+
	z8uujFwmemsErjvAIIuFkwFqU3L+1bNNZ1EpQDUT+qAoF62oXZ6bBapD0BqbVqEvYKg==
X-Gm-Gg: AR+sD12RsV0+LlhEO7UkK2EP3y4JfNzHnMZ3+3/QyoonStHSoT6G6kPBbLM6MfVMeiG
	85z6y+SZgdw+bWBLvoRaMLxghltQy8P2RWxrd+o/REufZ8qZH69L91T1FZpMLyMFYYIfhqCryBB
	L8SLFYKKXF9odvo3i/A6OgqZbxf6gxN58PGR5ztRu7OX+PfvAKYewZFcyit6TJqq7oZqSxrsHLY
	7jhAEoIwUtXeeKfc3CIB+aF+n/qrWm7jzJVliJTuIYoerDeiv67XELtvk/9HWXEfL1ReDSLmdRx
	BRMW/Ay/Sx0UFy8CtJ3Y1Wl3d6jkwFGO3CpzUKHZjs+VXBNRQMH+GuGKrEbP8XVvq+fAISOOUmO
	HGmN3h6ZoipFeHAYD8asKs+zwGdkpex5ZrsEK+3gAN9iC8eAaFs30o21rlFyg9kN3KdamBuoxSK
	NoxWnKKkyrYZq+mA==
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr34965591cf.56.1785424877209;
        Thu, 30 Jul 2026 08:21:17 -0700 (PDT)
X-Received: by 2002:a05:622a:551a:b0:51c:9a3:4c25 with SMTP id d75a77b69052e-52b3867e025mr34965061cf.56.1785424876593;
        Thu, 30 Jul 2026 08:21:16 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db95aae1sm420927e87.37.2026.07.30.08.21.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 08:21:15 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 18:20:54 +0300
Subject: [PATCH v8 11/18] media: iris: Add framework support for AR50_LITE
 video core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-iris-ar50lt-v8-11-6597c08cea6f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=10792;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=TwzuS5dFG4jVkEf3fLvjHe0gieDHA1T+la50ZQ8BqqA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa2vRQ7j9HgwmKTwuBCsxhiS1vKSJ5bJYzlYMg
 wSgI97mr2OJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamtr0QAKCRCLPIo+Aiko
 1X0VB/9krXYzRmBCRjKLDXo0fqLvqCPFTo1Jyk909jHGo5un0U75qm8mrreMC9NII1QUgsT3LNT
 F4/wbhBFHfsrEh0UFyQ7RC2fExFQEgKx02obpIU+jhqdq0OuKK80vcfq3QwhiTG+c0NtCnkEvv0
 GFKcxOHSbK5h+XxXRl71fy2rfi6B7fiC0/uqfUHAloayZlItEXi9Dkh1qpFW4IZAO+Qr/HFQmUF
 ViLaaW7kUHemTG5/KDCZl+ZMhQ70pZIwgtGc8ULfRPZkm0h++LStbWPCixi+uEW1i3qRbWvqu01
 hpuU0mL8qJhI40pQk87yEB2PnaPDXPjxH93FU3fuQYT3ELtA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX3jTz0axfYilT
 RbQ28BzvxkPxpCcd+GtKDw8AFVUQj1+7GXuQoRzja/DIX7DNJj76TBYUp/aVjc34nV7lt+qJxoj
 Kp5KobrbHaCakG3uWO0jAR2XCZn2u5g=
X-Proofpoint-GUID: Dg98NL2shZP3NT57avwQhCkpbP2K3pAZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDExNiBTYWx0ZWRfX22ZVdUru39hD
 v8MXL7QXdGr1q1UoOJp9wxK27bgIvZIoUJK9VTE2DQqI88oAW8iLSyT19p0avflHbuEu2IP1DCG
 uY2yp5OCG1t6MzReI6nUr42l9Nc2hGvv9RGIiagbFIKlyo6+SHbH55Spd/IYpE3Sig5biWE7Bds
 TTJbXgzDW7RUVPeXadF3PU6JUcmFaH/8/XdnhpYJpgXrrhRcKEXOZ1MrgnkmZSezGxs19OrCX6J
 nUR7cyZsFUVfi565Ub8GDJrobNqloc5dsdzPCWKCcBHUZ1FcbHpiT/HdSXwESZRJ2HP7xlDGyLU
 aaTTt5wAfEN906/rv9qLJ+CTpXInQEyT157ub6QeWnokvhxufriqTQOhdqaHZwUACu/PCvYJ1bk
 7DGdmubVn4i14HYEugrgwc+SfsKGkeb76D/i6mo8O/SDxsgSGL3c7huMQLYLRkZwbS+EzNQbZhB
 nDiGrJL0qispKTiONoA==
X-Authority-Analysis: v=2.4 cv=V7NNF+ni c=1 sm=1 tr=0 ts=6a6b6bee cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=oth-URKmseDdlDMfR28A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: Dg98NL2shZP3NT57avwQhCkpbP2K3pAZ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_04,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 phishscore=0 suspectscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300116

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

Add power sequence for ar5lt core.
Add register handling for ar50lt by hooking up vpu op with ar50lt
specific implemtation or resue from earlier generation wherever
feasible.

Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Makefile          |   1 +
 .../platform/qcom/iris/iris_platform_common.h      |   2 +
 drivers/media/platform/qcom/iris/iris_vpu2.c       |  28 +----
 drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c | 130 +++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  29 ++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   2 +
 6 files changed, 164 insertions(+), 28 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/Makefile b/drivers/media/platform/qcom/iris/Makefile
index 48e415cbc439..f1b204b95694 100644
--- a/drivers/media/platform/qcom/iris/Makefile
+++ b/drivers/media/platform/qcom/iris/Makefile
@@ -26,6 +26,7 @@ qcom-iris-objs += iris_buffer.o \
              iris_vpu2.o \
              iris_vpu3x.o \
              iris_vpu4x.o \
+             iris_vpu_ar50lt.o \
              iris_vpu_buffer.o \
              iris_vpu_common.o \
 
diff --git a/drivers/media/platform/qcom/iris/iris_platform_common.h b/drivers/media/platform/qcom/iris/iris_platform_common.h
index accc1627defd..6a189489369f 100644
--- a/drivers/media/platform/qcom/iris/iris_platform_common.h
+++ b/drivers/media/platform/qcom/iris/iris_platform_common.h
@@ -74,6 +74,7 @@ enum platform_clk_type {
 	IRIS_VPP0_HW_CLK,
 	IRIS_VPP1_HW_CLK,
 	IRIS_APV_HW_CLK,
+	IRIS_THROTTLE_CLK,
 };
 
 struct platform_clk_data {
@@ -315,6 +316,7 @@ struct iris_platform_data {
 	u32 tz_cp_config_data_size;
 	u32 num_vpp_pipe;
 	bool no_aon;
+	bool no_rpmh;
 	u32 wd_intr_mask;
 	u32 icc_ib_multiplier;
 	u32 max_session_count;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index dd2eeae0d9eb..5419a5096b00 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -12,38 +12,12 @@
 
 #include "iris_vpu_register_defines.h"
 
-static u64 iris_vpu2_calc_freq(struct iris_inst *inst, size_t data_size)
-{
-	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
-	struct v4l2_format *inp_f = inst->fmt_src;
-	u32 mbs_per_second, mbpf, height, width;
-	unsigned long vpp_freq, vsp_freq;
-	u32 fps = inst->frame_rate;
-
-	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
-	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
-
-	mbpf = NUM_MBS_PER_FRAME(height, width);
-	mbs_per_second = mbpf * fps;
-
-	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
-
-	/* 21 / 20 is overhead factor */
-	vpp_freq += vpp_freq / 20;
-	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
-
-	/* 10 / 7 is overhead factor */
-	vsp_freq += ((fps * data_size * 8) * 10) / 7;
-
-	return max(vpp_freq, vsp_freq);
-}
-
 const struct vpu_ops iris_vpu2_ops = {
 	.power_off_hw = iris_vpu_power_off_hw,
 	.power_on_hw = iris_vpu_power_on_hw,
 	.power_off_controller = iris_vpu_power_off_controller,
 	.power_on_controller = iris_vpu_power_on_controller,
-	.calc_freq = iris_vpu2_calc_freq,
+	.calc_freq = iris_vpu2_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
 	.interrupt_init = iris_vpu_interrupt_init,
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
new file mode 100644
index 000000000000..e084a5b49f2e
--- /dev/null
+++ b/drivers/media/platform/qcom/iris/iris_vpu_ar50lt.c
@@ -0,0 +1,130 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * Copyright (c) 2026 Qualcomm Innovation Center, Inc. All rights reserved.
+ */
+
+#include <linux/bits.h>
+#include <linux/iopoll.h>
+#include <linux/reset.h>
+
+#include "iris_instance.h"
+#include "iris_vpu_common.h"
+
+#include "iris_vpu_register_defines.h"
+
+#define WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT BIT(3)
+
+#define WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT		0xb0080
+
+#define CPU_CS_VCICMD					0xa0020
+#define CPU_CS_VCICMD_ARP_OFF			0x1
+
+static void iris_vpu_ar50lt_set_preset_registers(struct iris_core *core)
+{
+	writel(0x0, core->reg_base + WRAPPER_VCODEC0_CLOCK_CONFIG_AR50LT);
+}
+
+static void iris_vpu_ar50lt_interrupt_init(struct iris_core *core)
+{
+	writel(WRAPPER_INTR_MASK_A2HVCODEC_BMSK_AR50LT, core->reg_base + WRAPPER_INTR_MASK);
+}
+
+static void iris_vpu_ar50lt_disable_arp(struct iris_core *core)
+{
+	writel(CPU_CS_VCICMD_ARP_OFF, core->reg_base + CPU_CS_VCICMD);
+}
+
+static int iris_vpu_ar50lt_power_off_controller(struct iris_core *core)
+{
+	iris_disable_unprepare_clock(core, IRIS_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return 0;
+}
+
+static void iris_vpu_ar50lt_power_off_hw(struct iris_core *core)
+{
+	dev_pm_genpd_set_hwmode(core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN], false);
+	iris_disable_unprepare_clock(core, IRIS_THROTTLE_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+}
+
+static int iris_vpu_ar50lt_power_on_controller(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_CTRL_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AXI_CLK);
+	if (ret && ret != -ENOENT)
+		goto err_disable_ctrl_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_AHB_CLK);
+	if (ret)
+		goto err_disable_axi_clock;
+
+	return 0;
+
+err_disable_axi_clock:
+	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
+err_disable_ctrl_clock:
+	iris_disable_unprepare_clock(core, IRIS_CTRL_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_CTRL_POWER_DOMAIN]);
+
+	return ret;
+}
+
+static int iris_vpu_ar50lt_power_on_hw(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_CLK);
+	if (ret)
+		goto err_disable_power;
+
+	ret = iris_prepare_enable_clock(core, IRIS_HW_AHB_CLK);
+	if (ret)
+		goto err_disable_hw_clock;
+
+	ret = iris_prepare_enable_clock(core, IRIS_THROTTLE_CLK);
+	if (ret)
+		goto err_disable_hw_ahb_clock;
+
+	return 0;
+
+err_disable_hw_ahb_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_AHB_CLK);
+err_disable_hw_clock:
+	iris_disable_unprepare_clock(core, IRIS_HW_CLK);
+err_disable_power:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+const struct vpu_ops iris_vpu_ar50lt_ops = {
+	.power_off_hw = iris_vpu_ar50lt_power_off_hw,
+	.power_on_hw = iris_vpu_ar50lt_power_on_hw,
+	.power_off_controller = iris_vpu_ar50lt_power_off_controller,
+	.power_on_controller = iris_vpu_ar50lt_power_on_controller,
+	.calc_freq = iris_vpu2_calculate_frequency,
+	.set_hwmode = iris_vpu_set_hwmode,
+	.set_preset_registers = iris_vpu_ar50lt_set_preset_registers,
+	.interrupt_init = iris_vpu_ar50lt_interrupt_init,
+	.disable_arp = iris_vpu_ar50lt_disable_arp,
+};
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 41498f94480e..d64e7745a63d 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -97,7 +97,8 @@ int iris_vpu_boot_firmware(struct iris_core *core)
 	}
 
 	writel(HOST2XTENSA_INTR_ENABLE, core->reg_base + CPU_CS_H2XSOFTINTEN);
-	writel(0x0, core->reg_base + CPU_CS_X2RPMH);
+	if (!core->iris_platform_data->no_rpmh)
+		writel(0x0, core->reg_base + CPU_CS_X2RPMH);
 
 	return 0;
 }
@@ -422,6 +423,32 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core)
 	writel(0x1, core->reg_base + WRAPPER_IRIS_VCODEC_VPU_WRAPPER_SPARE_0);
 }
 
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size)
+{
+	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
+	struct v4l2_format *inp_f = inst->fmt_src;
+	u32 mbs_per_second, mbpf, height, width;
+	unsigned long vpp_freq, vsp_freq;
+	u32 fps = inst->frame_rate;
+
+	width = max(inp_f->fmt.pix_mp.width, inst->crop.width);
+	height = max(inp_f->fmt.pix_mp.height, inst->crop.height);
+
+	mbpf = NUM_MBS_PER_FRAME(height, width);
+	mbs_per_second = mbpf * fps;
+
+	vpp_freq = mbs_per_second * caps->mb_cycles_vpp;
+
+	/* 21 / 20 is overhead factor */
+	vpp_freq += vpp_freq / 20;
+	vsp_freq = mbs_per_second * caps->mb_cycles_vsp;
+
+	/* 10 / 7 is overhead factor */
+	vsp_freq += ((fps * data_size * 8) * 10) / 7;
+
+	return max(vpp_freq, vsp_freq);
+}
+
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size)
 {
 	struct platform_inst_caps *caps = inst->core->iris_platform_data->inst_caps;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 71d96921ed37..a62b6184bde7 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -13,6 +13,7 @@ extern const struct vpu_ops iris_vpu3_ops;
 extern const struct vpu_ops iris_vpu33_ops;
 extern const struct vpu_ops iris_vpu35_ops;
 extern const struct vpu_ops iris_vpu4x_ops;
+extern const struct vpu_ops iris_vpu_ar50lt_ops;
 
 struct vpu_ops {
 	void (*power_off_hw)(struct iris_core *core);
@@ -40,6 +41,7 @@ int iris_vpu_power_on(struct iris_core *core);
 int iris_vpu_power_off_controller(struct iris_core *core);
 void iris_vpu_power_off_hw(struct iris_core *core);
 void iris_vpu_power_off(struct iris_core *core);
+u64 iris_vpu2_calculate_frequency(struct iris_inst *inst, size_t data_size);
 int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);

-- 
2.47.3

