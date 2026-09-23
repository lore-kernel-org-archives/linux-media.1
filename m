Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08455391833
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790134111; cv=none; b=ij7YIfeNRzZ1Z6Jj7hVa0VrnJjwCV8un/KEnj9yWwQqGJzsxRuZ0T9DgY+Eikc8J+j3klNOddWGyjtjCZT9pn9NHm4oYK68p2EMwDSe0kI8Z2JGZEUncOBgYVjVlwFv592fsTiW3coe49xywCeUU/B1Wvg8qdk2gsLr2ZmIe240=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790134111; c=relaxed/simple;
	bh=Xlbwl6Vx4+HGBNlzMqIIKgTeAZAgMjnSyrLdOon688A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VUYcDXNJnVvGV/69/k8MukgIr3BAj9X/RadY1PSAkV/xei8SSxcqVorGQub5CE7hvLrhxoxatVNMtHaWkvck++8YxqFaRD8QKwrze7DK6e9fo+94hoZTgjMSXtnrDr5tMMpqAg46nDqnB06nqH5Zo0FSUu+kiHUqJRjNggGc5GI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=f59X0lWb; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ch/hX09R; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="f59X0lWb";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ch/hX09R"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MJDXlN1167885
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=; b=f59X0lWbtAMCILuf
	kCWvNsAj9GLXLTZImBXrbYDQtYNA26eK/XF6/MsYGRm0HEnWryP4f9R2VSCZhJMY
	KJC5z2anH3PxYD97u2ctTLUGQrSV9MIG7xJ/Nda/DhNHMTIrEOB5XrDRELzYpzpR
	Dgox8jfQP4LP2dg2mHl+3cEJ+BTRnkXPkzOVlQTajuzMYiJx6li+rmYanFHTKBo8
	t4koR8t2OCi64z5XRxS0oup/FEZNSYDVmYEqb6Qu+WCFcJUmJgLnrQ/Jw6NhmIDF
	sMI/ImvrjGMOZsH4BpavwtXvrUILmsmCS7ApdYZh9xjI4BdZlIZ9DkcihzFpHwpK
	RCwI2Q==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4guymw1syj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 03:28:29 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2ccb687f82eso3225715ad.3
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790134108; x=1790738908; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=;
        b=Ch/hX09RLrnpDMGlxlPf/NPv8XS9I68Mchi//I/KZXW7JMRbwcBPsDkWv2QQLauG4p
         nuVQ/P381YgjvfG/+7Nd79bb8y5CMDef3TV4B3dq25rwO2VaWhjg/7u1RCpQbRc+J2nf
         sKNbCMpJOUs8KYsI7oAsgor08gHM/xHw/MMXZDBU7klfah1Ek7tNx1qJCtldi1FBYULK
         Zf8i8ZLRrVR0R5Yf0e8Nil7oYKiKy91vp5pdIPBBO3V8/kzw9+16Nt43Bimgti5xmhKC
         VKvF/BmUIsHrhU0W1sCzrNtPb0Sv6AD97zyo8SkaD3Q6ppklMDo+u8LWdB24mEBkwTcY
         t1aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790134108; x=1790738908;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m11kiYCAwMQ7W55vXcbMY21fBGFpt1wSVq3rfYTVbAI=;
        b=QuhZ9pmBs6LTuhlVp+5LiirXBgWE+ty2o19E5xBL5Xfu9lZm6wcOJhb0ygl40T9c2Y
         AkPqdnOGt+V02Z4ATcJEx7fgaS+68aiMK3LpKhOMsQPk8IprRI4S4tw3a5gEXLHwElMP
         ORsr5WnugneCNbRPV5qeH4vAo9iIvWtRvk4sSBBRwYDHtMxSAYj2Y7LLZusk/oythoPy
         jX9ZxCd5cBZ2uddikOEm/jl4MBenrd4wU7WFl52G1rY/kPYWeqnLqmWIjszyqLhFrfdk
         mVGtTZdQHyInj7j2zOpNCzJwXVZtDpwMCDXdTaGrQwsoJmjRWYAROkt5bIAHRzzHuRHe
         FDRg==
X-Forwarded-Encrypted: i=1; AKwUvBzMB4d+2bXDRSPRxTEbm5h2YOHEbPel5IN8yaepvk+ZMO83V3wc3kQVkZ+bPIirk/U05Hnj2mbJXcxj9A==@vger.kernel.org
X-Gm-Message-State: AFuF++lK+R7CiEh1UBx3UaP4o/jwjGHexSkxE+Oq5XCHlUl/hN/WK1Qg
	npXsoqsVtwCGAjzZz1/h1vsVUTSh1fDQvmEoKersCJOSxhMdhAVrrup8+CG4VN76HbK2IKJuuAN
	HjucdbG+qkWfQdjtmkA6PTYY5RWtBPDA0HaQqTbTPI8ozCUN1IF+tKPRn9eCTMOnWPw==
X-Gm-Gg: AYBFou0cfHJTj/Cx5e5svZ8DWeC3Of8ABoml4xdXhz6su2uteoi4re/eUcbNnCKwvNB
	e13yet6fX8wK9T4WeBnl2YVI9yTmKWYsWKkqzK8+RCHYgscpY5jrRjOMKK3IEo5SzH4agShnKbF
	UiOgwRXrdjicQnlEFk9a4t73F9NhK9zH+FzEq5kEIhVNB+3bZ9GMzwVxB8TYnkc211BJqteL4Lx
	HDlHF6BE3plif+tzv2R34rYU2vDXkeBfZJBSs0eeOaf7OLd5U540K9lTjhXn9c7/j1avJ6XjS1O
	EHg5hVqPrbeA2zInhEePgcXSdzT33/3JUE1ImLNzhHrD5xmT8vyHylmLIpE8QosDhkiSsgn43aS
	/8GkRGM5K8OB/vrmCKx0Qw4ZcUgQDEQ1SZ/LxcCewuhlpRXeOg4MTGpF3PnNPsHEQQ9vQxhM+/Q
	==
X-Received: by 2002:a17:903:908:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df69e1c3cfmr10374135ad.55.1790134108376;
        Tue, 22 Sep 2026 20:28:28 -0700 (PDT)
X-Received: by 2002:a17:903:908:b0:2dd:c100:b2cc with SMTP id d9443c01a7336-2df69e1c3cfmr10373955ad.55.1790134107861;
        Tue, 22 Sep 2026 20:28:27 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2df6a5c3733sm3603525ad.41.2026.09.22.20.28.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 20:28:27 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 11:27:52 +0800
Subject: [PATCH v2 2/7] media: iris: move shared APV PM helpers to
 iris_vpu_common
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_hawi-v2-2-016ec3d24b79@oss.qualcomm.com>
References: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_hawi-v2-0-016ec3d24b79@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790134092; l=12865;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=Xlbwl6Vx4+HGBNlzMqIIKgTeAZAgMjnSyrLdOon688A=;
 b=/DBn+w7lUN0YvQZsWrIa3iKaFhD6c0MhuVY/Qhz1Wv+DAvs1TmhAwQODqHkbhwcijAodvVt4Y
 ZYslWFCZaOiDXdzZFZsAm4LU+gJxm+3HiADlbPoi1MJTvITjucWkMgm
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX4968Cjn8C6Qo
 t78/KYAYaB+u02xsJtu7H1Rgz8DXifITnNEK5NfAsrtypfH/dw/jUwQIuvW6D+KGh6qIfaCGCgQ
 LNWg6usDnuG/XRrYON5G/RQHAaLkmfcZf3ZIBaHlgBF2Lk5QKFX/TzMMK22UOwqvVJj1DhHqazp
 0x47KazqJjXJ7OlBdxI7DUYFjpGDOo1qDnBdQoU1OjnQmjksLQvTUjTQWp+JSCLmYRR+vWKvXpy
 /F2ApIk25PdEx4FKqRAWtfqocFe6W7PT8H2zbZzBMHLhKote0Wo4VTlTAFtpeIkcnT+SUcJqIYq
 AkBKrtneSPHs1GuCvm1cDdhfc1Z0SDQLeRIstz4OfCVNuLGYp/Dj9o0/a4odDTP4Un2nSr4ZKjw
 exkxKD5+W7mqYZ/LMWpY+ihNlCraQZATWaHTdgWbHEfI3zygmwwkaP/hDVLMlwVlI9TaDspSA6G
 4L9H96VwBXw6HxugZbA==
X-Authority-Analysis: v=2.4 cv=feI4WEQF c=1 sm=1 tr=0 ts=6ab3475d cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=jRDX25Ug_5KbIaVBG-EA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-GUID: hfVKTTy46KPFvUJawf1pU2gsMprDh1Cb
X-Proofpoint-ORIG-GUID: hfVKTTy46KPFvUJawf1pU2gsMprDh1Cb
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMyBTYWx0ZWRfX96PlpffzK2y+
 7aJ4bvPollzHd+SulzTqcGgtm3s4SRqTegrwRRjURyl0w3G71gOh70nsNPif17sBPlgP0RI3ElR
 UcwJhXzHojGtKykWIztv1kmgZIItOow=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 impostorscore=0 malwarescore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230013

The APV power on/off sequences and AHB bridge sync reset helpers are
currently local to iris_vpu4x.c. VPU5x uses the same sequences, so keeping
them in the VPU4x implementation would either prevent reuse or require
duplicating the code.

Move the helpers to iris_vpu_common.c and rename them with a vpu4x_vpu5x
prefix to reflect their shared usage.

Move the associated register constants, including APV_CLK_HALT, the efuse
control bits, CPU_CS_APV_BRIDGE_SYNC_RESET, WRAPPER_EFUSE_MONITOR, and
AON_WRAPPER_MVP_NOC_RESET_SYNCRST, to iris_vpu_register_defines.h so both
implementations can use them.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 105 +--------------------
 drivers/media/platform/qcom/iris/iris_vpu_common.c |  91 ++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h |   4 +
 .../platform/qcom/iris/iris_vpu_register_defines.h |  10 ++
 4 files changed, 109 insertions(+), 101 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index 02e100a4045fced33d7a3545b632cc5f0955233f..93acbfa0f471fdec1cb75db732f37ef6c6ef5cbf 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -10,18 +10,11 @@
 #include "iris_vpu_common.h"
 #include "iris_vpu_register_defines.h"
 
-#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
-#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_BASE_OFFS + 0x174)
 #define MVP_NOC_RESET_REQ_MASK			0x70103
 #define VPU_IDLE_BITS				0x7103
-#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
 
-#define APV_CLK_HALT		BIT(1)
 #define CORE_CLK_HALT		BIT(0)
 #define CORE_PWR_ON		BIT(1)
-#define DISABLE_VIDEO_APV_BIT	BIT(27)
-#define DISABLE_VIDEO_VPP1_BIT	BIT(28)
-#define DISABLE_VIDEO_VPP0_BIT	BIT(29)
 
 static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32 efuse_value)
 {
@@ -68,96 +61,6 @@ static int iris_vpu4x_genpd_set_hwmode(struct iris_core *core, bool hw_mode, u32
 	return ret;
 }
 
-static int iris_vpu4x_power_on_apv(struct iris_core *core)
-{
-	int ret;
-
-	ret = iris_enable_power_domains(core,
-					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-	if (ret)
-		return ret;
-
-	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
-	if (ret)
-		goto disable_apv_hw_power_domain;
-
-	return 0;
-
-disable_apv_hw_power_domain:
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-
-	return ret;
-}
-
-static void iris_vpu4x_power_off_apv(struct iris_core *core)
-{
-	bool handshake_done, handshake_busy;
-	u32 value, count = 0;
-	int ret;
-
-	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	if (value & APV_CLK_HALT)
-		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
-
-	do {
-		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
-
-		handshake_done = value & NOC_LPI_STATUS_DONE;
-		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
-
-		if (handshake_done || !handshake_busy)
-			break;
-
-		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
-		usleep_range(10, 20);
-
-	} while (++count < 1000);
-
-	if (!handshake_done && handshake_busy)
-		dev_err(core->dev, "LPI handshake timeout\n");
-
-	writel(0x080200, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value & 0x080200, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
-	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
-	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
-				 value, value == 0x0, 200, 2000);
-	if (ret)
-		goto disable_clocks_and_power;
-
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-
-disable_clocks_and_power:
-	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
-	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
-}
-
-static void iris_vpu4x_ahb_sync_reset_apv(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
-}
-
-static void iris_vpu4x_ahb_sync_reset_hardware(struct iris_core *core)
-{
-	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
-	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
-}
-
 static int iris_vpu4x_enable_hardware_clocks(struct iris_core *core, u32 efuse_value)
 {
 	int ret;
@@ -249,7 +152,7 @@ static int iris_vpu4x_power_on_hardware(struct iris_core *core)
 		goto disable_vpp1_power_domain;
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT)) {
-		ret = iris_vpu4x_power_on_apv(core);
+		ret = iris_vpu4x_vpu5x_power_on_apv(core);
 		if (ret)
 			goto disable_hw_clocks;
 	}
@@ -282,7 +185,7 @@ static void iris_vpu4x_power_off_hardware(struct iris_core *core)
 	iris_vpu4x_genpd_set_hwmode(core, false, efuse_value);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_power_off_apv(core);
+		iris_vpu4x_vpu5x_power_off_apv(core);
 
 	value = readl(core->reg_base + WRAPPER_CORE_POWER_STATUS);
 
@@ -353,9 +256,9 @@ static int iris_vpu4x_set_hwmode(struct iris_core *core)
 	u32 efuse_value = readl(core->reg_base + WRAPPER_EFUSE_MONITOR);
 
 	if (!(efuse_value & DISABLE_VIDEO_APV_BIT))
-		iris_vpu4x_ahb_sync_reset_apv(core);
+		iris_vpu4x_vpu5x_ahb_sync_reset_apv(core);
 
-	iris_vpu4x_ahb_sync_reset_hardware(core);
+	iris_vpu4x_vpu5x_ahb_sync_reset_hardware(core);
 
 	return iris_vpu4x_genpd_set_hwmode(core, true, efuse_value);
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index e4847c1077097160cfc8324e807b4aabd9747812..a0129ed39cf2dfd0d56ecdc63d909f26f8acedf8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -21,6 +21,7 @@
 #define CTRL_INIT_IDLE_MSG_BMSK			0x40000000
 #define CTRL_ERROR_STATUS__M			0xfe
 #define CTRL_STATUS_PC_READY			0x100
+#define NOC_RESET_APV				0x080200
 
 #define QTBL_INFO				(CPU_CS_BASE_OFFS + 0x50)
 #define QTBL_ENABLE				BIT(0)
@@ -501,6 +502,96 @@ int iris_vpu_power_on(struct iris_core *core)
 	return ret;
 }
 
+int iris_vpu4x_vpu5x_power_on_apv(struct iris_core *core)
+{
+	int ret;
+
+	ret = iris_enable_power_domains(core,
+					core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+	if (ret)
+		return ret;
+
+	ret = iris_prepare_enable_clock(core, IRIS_APV_HW_CLK);
+	if (ret)
+		goto disable_apv_hw_power_domain;
+
+	return 0;
+
+disable_apv_hw_power_domain:
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+
+	return ret;
+}
+
+void iris_vpu4x_vpu5x_power_off_apv(struct iris_core *core)
+{
+	bool handshake_done, handshake_busy;
+	u32 value, count = 0;
+	int ret;
+
+	value = readl(core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	if (value & APV_CLK_HALT)
+		writel(0x0, core->reg_base + WRAPPER_CORE_CLOCK_CONFIG);
+
+	do {
+		writel(REQ_POWER_DOWN_PREP, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+		value = readl(core->reg_base + AON_WRAPPER_MVP_NOC_LPI_STATUS);
+
+		handshake_done = value & NOC_LPI_STATUS_DONE;
+		handshake_busy = value & (NOC_LPI_STATUS_DENY | NOC_LPI_STATUS_ACTIVE);
+
+		if (handshake_done || !handshake_busy)
+			break;
+
+		writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_LPI_CONTROL);
+		usleep_range(10, 20);
+
+	} while (++count < 1000);
+
+	if (!handshake_done && handshake_busy)
+		dev_err(core->dev, "LPI handshake timeout\n");
+
+	writel(NOC_RESET_APV, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value & NOC_RESET_APV, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_SYNCRST);
+	writel(0x0, core->reg_base + AON_WRAPPER_MVP_NOC_RESET_REQ);
+	ret = readl_poll_timeout(core->reg_base + AON_WRAPPER_MVP_NOC_RESET_ACK,
+				 value, value == 0x0, 200, 2000);
+	if (ret)
+		goto disable_clocks_and_power;
+
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+
+disable_clocks_and_power:
+	iris_disable_unprepare_clock(core, IRIS_APV_HW_CLK);
+	iris_disable_power_domains(core, core->pmdomain_tbl->pd_devs[IRIS_APV_HW_POWER_DOMAIN]);
+}
+
+void iris_vpu4x_vpu5x_ahb_sync_reset_apv(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_APV_BRIDGE_SYNC_RESET);
+}
+
+void iris_vpu4x_vpu5x_ahb_sync_reset_hardware(struct iris_core *core)
+{
+	writel(CORE_BRIDGE_SW_RESET | CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base +
+	       CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(CORE_BRIDGE_HW_RESET_DISABLE, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+	writel(0x0, core->reg_base + CPU_CS_AHB_BRIDGE_SYNC_RESET);
+}
+
 void iris_vpu_set_preset_registers(struct iris_core *core)
 {
 	writel(0x0, core->reg_base + 0xb0088);
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c1426d808ab5ea4fdfcac3a203e15b3..cc22c7459c4b77fdcb95b546fb8a55eea522bfb8 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -41,6 +41,10 @@ int iris_vpu35_vpu4x_power_off_controller(struct iris_core *core);
 int iris_vpu35_vpu4x_power_on_controller(struct iris_core *core);
 void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
+int iris_vpu4x_vpu5x_power_on_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_power_off_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_ahb_sync_reset_apv(struct iris_core *core);
+void iris_vpu4x_vpu5x_ahb_sync_reset_hardware(struct iris_core *core);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
index 72168b9ffa7385d53d7190265d1c0922ee04a656..33f3d01cf79d763a62a2be9eac910a462bcd479b 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_register_defines.h
@@ -19,6 +19,7 @@
 #define VIDEO_NOC_RESET_REQ			(BIT(0) | BIT(1))
 
 #define AON_WRAPPER_MVP_NOC_RESET_ACK		(AON_MVP_NOC_RESET + 0x004)
+#define AON_WRAPPER_MVP_NOC_RESET_SYNCRST	(AON_MVP_NOC_RESET + 0x08)
 
 #define CPU_CS_BASE_OFFS			(CPU_BASE_OFFS)
 #define CPU_IC_BASE_OFFS			(CPU_BASE_OFFS)
@@ -40,6 +41,14 @@
 #define MSK_SIGNAL_FROM_TENSILICA		BIT(0)
 #define MSK_CORE_POWER_ON			BIT(1)
 
+#define CPU_CS_APV_BRIDGE_SYNC_RESET		(CPU_CS_BASE_OFFS + 0x174)
+
+/* Efuse bits controlling optional hardware blocks */
+#define WRAPPER_EFUSE_MONITOR			(WRAPPER_BASE_OFFS + 0x08)
+#define DISABLE_VIDEO_APV_BIT			BIT(27)
+#define DISABLE_VIDEO_VPP1_BIT			BIT(28)
+#define DISABLE_VIDEO_VPP0_BIT			BIT(29)
+
 #define WRAPPER_INTR_STATUS			(WRAPPER_BASE_OFFS + 0x0C)
 #define WRAPPER_INTR_STATUS_A2HWD_BMSK		BIT(3)
 #define WRAPPER_INTR_STATUS_A2H_BMSK		BIT(2)
@@ -62,6 +71,7 @@
 #define WRAPPER_CORE_POWER_STATUS		(WRAPPER_BASE_OFFS + 0x80)
 #define WRAPPER_CORE_CLOCK_CONFIG		(WRAPPER_BASE_OFFS + 0x88)
 #define CORE_CLK_RUN				0x0
+#define APV_CLK_HALT				BIT(1)
 
 #define WRAPPER_TZ_CPU_STATUS			(WRAPPER_TZ_BASE_OFFS + 0x10)
 

-- 
2.43.0

