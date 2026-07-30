Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B3A047A0C2
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455330; cv=none; b=sGzXIDQzLazGcFdLnEckxqUD3NJZDf58SZFFgmP1wGaaucLQbyelhG5FtzpTj/GCy8Cou7k988O6Rb1iz/foKpk1cU57D0tZ9no4iKOOd8Q+BN0qn3tYlSQdZbkYnYVzYbyXg6wXxkm9epFg2WKq6z2khFOlB1vGGel2oMnUZSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455330; c=relaxed/simple;
	bh=fZh8pXjBLV7CL4L4cLP+s2vvhCR34CRwnZrtXuVWgK4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XSsmh+diU7RMNpOdqqh6Sd2r8bOi0HzSQ50eujea/abPmwWpTfSAhxDB5y4KRam1CgoB6yGf3KH/vPyHXrEWTErPBcCP1oS173oURjZTR9yRgPYAtYYAqYVXLFxniuZTRUevxmh7om9058A4LtbCHeVHQLym55I030J+pm3rvWc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=TS9cePoi; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=MLWfudYB; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS9cePoi";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="MLWfudYB"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqvKh2203096
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JE84nLukSQ0KFz43ytsORYlHeEC7W0lihrEPK4IA49Q=; b=TS9cePoi+R8phAXC
	bisSxjvPa4QgUXFywAOWOlnhdemlHoHTwk4m+LpkwY4ztptduYFe5QzcnGGyHgUY
	ymlaFEDLANxwcOirTnE6hkUPyEwiUBl75AvI5UlpMB3YSTdMlIQE+MqLHxh/3++I
	z77ekWRVYZziXaoj2rBtuIw7KolR47jauxB7gYvnR0np/vSjDIsnRTkqRfxeSd3P
	gRsU9DDK2pOr61H3kL0PVDXcCYfcTr2uZnf06UsqStutDYAo0v/GcIZbmsDixPec
	VkaSpOqNKArjiCvrmCTaHRpiJiA5ccXx8uZSxAbMejgDfPv6S5OKM/XjQkP3Isxw
	n4b0yQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frdjgrktj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:46 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-526da7e3c9dso3224901cf.1
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455326; x=1786060126; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JE84nLukSQ0KFz43ytsORYlHeEC7W0lihrEPK4IA49Q=;
        b=MLWfudYBGRBBiByrVSxnkAc3buytNpBFvsFaO6v8HetugdUL8DpLlP3SPPNrqkplZR
         8W/6PC7K8Cc0cBfPeUmjYfCZqliKr4IpFZgXEWCJvrj//IOt1iNBOKlXIciKB4Ux5Ceg
         OcOUiXXs/Jt5joah1xe2vieNsjdSvEqTxEr3vFRReAL7H7QJkxBwv1WNBRnfOjXlHYId
         kfeMUghfqf1juW1upKdTi5j3W7DnVLYdG6oDlk/n+5SjhmnB7Ho0a9+n8B0QJs6qIhvx
         8QIvOARCRRmj3C56wokmC8jTLmot/4IaVjq7cm103/HhCYv7ZlFf8XOU3ZwCFgQrd+Ku
         Gizw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455326; x=1786060126;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JE84nLukSQ0KFz43ytsORYlHeEC7W0lihrEPK4IA49Q=;
        b=dZRD64YgSc5wiSTvT8+hvTgZE7o40bq6hxv00KAk5iE19qoGzmc0rFPGkc2xhiNBTR
         SHhMpasMxe/xq66NI+X0OF0vH2byWYSB/N9TLUE3wQ510Zaka7UPm3SwURQ2giIeK9Ep
         Oe+wNpioQhzfiWv3DtmJdaEErKP7T80JVqH1kdb+qqLKRJb41eVQMPtgvYIjePvEeLTA
         txgGkC306LsfkuNIhsm2G/qqsLzlbQNs5Vh6t982WRz5PnzFx43hY+Ka9BK+4atl0mDS
         xcrUeOdi+EFmoZuhuXNT59mQEnDmCk7Y80ZGgWuGZneL1tZ1vylKG1Lvf0sqjRNxQzfn
         3jqA==
X-Gm-Message-State: AOJu0Yz2NcBWeAJhpeb+YriZEQE0M1bfUxA6K6Nw3uaIRSpb43YcCfXh
	DUKlLUKP2eU0KFtdoWwEjNGfGpcxBi4lhbQ8eSCksqRLmmG/CvI/75LRCv++ImAKzmeSq+YsTLt
	Q81Qcs/Z/24WhcUzBsZjdONe12Ey4vvUIPWJ707WDGhvEgTyocBDn3sVhUMdzM2jFHQ==
X-Gm-Gg: AR+sD10et9udROZ4EkWhxi3ttRK0jo2KAQvgKpZA1FbvlWKkVNZzQC1EHOxQrO9Kedr
	WJO23jb9XaQ/fIkTfREmU4BvYQEYOd/wchhJ7fswPXj3lu/Vgp7S4v4iN+22Jm4xSAip87mQceA
	FDUcZNqUVQg6L8Daq945e3Q6oNCZaH7ncRB7MqkqzctD5aCH5vzvk+5tvkrp6wdsrDbokAVFLhP
	53dlm2aoTI/bYLCgKSCx+X+yb1/F8A0xrw6oGjZtxugPrzU2I7gh7ESNKiJT8lSp9iX1ut4FEVi
	dBwXJDUB7x32SU/i0DkLKlYQs//QReluPUwAj1KggsMcC/KGzx7IsdZmc36c4tivVdxvxRRFyCs
	vm37cvS0Ry+jSM8wKO/eTscGbb3HOiEmh6jAfsGc/JkaOUVRlfXWyfKqXGMVzlar2gIgbMA7yTt
	pFg9/5lZ4kBjTn5w==
X-Received: by 2002:a05:622a:5888:b0:51a:8c97:9389 with SMTP id d75a77b69052e-52b386b597fmr53956101cf.64.1785455326106;
        Thu, 30 Jul 2026 16:48:46 -0700 (PDT)
X-Received: by 2002:a05:622a:5888:b0:51a:8c97:9389 with SMTP id d75a77b69052e-52b386b597fmr53955881cf.64.1785455325631;
        Thu, 30 Jul 2026 16:48:45 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:44 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:28 +0300
Subject: [PATCH v9 07/19] media: iris: Introduce interrupt_init as a vpu_op
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-7-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4931;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7Dbo3Pf/QK/63owqGZ1NO1kT389qxHGUCVTVhtY9Mcg=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKPms//l5F+EEFGefMemOsO6O4QNbl3InQ6
 2Yll94A27mJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1eopB/wNOg5Mw2Cibf6K13520CjRtafYBDP5LMjwpCUpl41jjuVOkpMh3dQbaJutQE+gU8sLexT
 OHRWSZyYQabf8BkxuTksDgc0Ss8XDHk1oMq5Ima+0sab42qM/Vm5wQY1MwX6/r2VORweZxO3VZw
 F29gcoC2gdJQmpfS76hJkryRqxZlyFI70BmteP7dk2yl2vhohjX9aGf1Myqk/a743z1EXxB7zSm
 3skhaRK0xVTyZmRBlWHJP1sTiW9F9oz+p2yGpq4+GMH16UrBUrwF7clR8PEgDy4dyNojz1bTzF5
 hz1U4rbrXBLJFnOfFeF8i320lmv+LfiXhN2YteyMlSIV1Ovu
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 0WnEdNM4lgYYYm0ZDERK9N_RNNbstJ-1
X-Proofpoint-ORIG-GUID: 0WnEdNM4lgYYYm0ZDERK9N_RNNbstJ-1
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfXzRvehxIR0gUb
 b2ks0skkN12nx5Lzub0UES2nkaXHIjwbTabWG3gkVisluYYco24D4IlmaO8PkQlOVXF15YGjibv
 /PAg0VGHL/NJB/EaLlpaGc20UBuW9Bg=
X-Authority-Analysis: v=2.4 cv=eo3vCIpX c=1 sm=1 tr=0 ts=6a6be2de cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=2EYiHOum3YQmkHKk0wkA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX0iY7JtYXNESj
 D9rjBjpuislLG93dgK0Pg8iVDN72a2aDAk5MzwMWeJJzSqYmArf61Bnfsm8dZ/f/8IaVDmTrLUr
 G01lsgho/C8V3p6Pch/VxqOzBLCCT1rq1iK/hiDKPG8EnDH+b6EUGYALycvTSbp4r2wMtAzOSDZ
 GzTyz2CHeukI5GTH38rHdLfgDnCE8G0XIXulPmO3Bh5Nt8TpFPXfhpZ9ZDXqJLb1lqfTcudKb0j
 CRyOGf5bwgbKy6+c8eZSUiVY9AXuE+xGRirh0RNagC7JnL+lpWXpSk0E1IRrV7FDapAr6P4oTA6
 9+9PYKff8BAMw4TWnrfSrtR5T/rCTfa1lSjRtQYPS6P4Drn2CtD5+ZhK3EeVUmf63MzjfsupQDP
 /1hBkfXWlvsrukW9x6a/rw9x8tA+jhu5PyZ5QV7vjBl9KIpOx4Q3ktpoOq4yPb8HuC3IDBPl0ij
 b/NdbsiV32z2UtHgByw==
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

The interrupt_init sequence is currently shared across all supported
devices. Starting with Qualcomm QCM2290 (AR50LT), the register
programming would differ.

Move interrupt_init into a vpu_op to allow per-device customization.

This change prepares the driver for upcoming hardware variants.
No functional change so far for existing devices.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu2.c       | 1 +
 drivers/media/platform/qcom/iris/iris_vpu3x.c      | 3 +++
 drivers/media/platform/qcom/iris/iris_vpu4x.c      | 1 +
 drivers/media/platform/qcom/iris/iris_vpu_common.c | 4 ++--
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 2 ++
 5 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu2.c b/drivers/media/platform/qcom/iris/iris_vpu2.c
index 2dc121a3f5e8..dd2eeae0d9eb 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu2.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu2.c
@@ -46,4 +46,5 @@ const struct vpu_ops iris_vpu2_ops = {
 	.calc_freq = iris_vpu2_calc_freq,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index dc02ced1b931..c3b760730c98 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -262,6 +262,7 @@ const struct vpu_ops iris_vpu3_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -272,6 +273,7 @@ const struct vpu_ops iris_vpu33_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
 
 const struct vpu_ops iris_vpu35_ops = {
@@ -283,4 +285,5 @@ const struct vpu_ops iris_vpu35_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu4x.c b/drivers/media/platform/qcom/iris/iris_vpu4x.c
index f608a297d4a3..90ccdc0d2a07 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu4x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu4x.c
@@ -369,4 +369,5 @@ const struct vpu_ops iris_vpu4x_ops = {
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu4x_set_hwmode,
 	.set_preset_registers = iris_vpu_set_preset_registers,
+	.interrupt_init = iris_vpu_interrupt_init,
 };
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.c b/drivers/media/platform/qcom/iris/iris_vpu_common.c
index 39adf8aa91a7..9a89e8ae06ce 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.c
@@ -31,7 +31,7 @@
 #define UC_REGION_ADDR				(CPU_CS_BASE_OFFS + 0x64)
 #define UC_REGION_SIZE				(CPU_CS_BASE_OFFS + 0x68)
 
-static void iris_vpu_interrupt_init(struct iris_core *core)
+void iris_vpu_interrupt_init(struct iris_core *core)
 {
 	u32 mask_val;
 
@@ -485,7 +485,7 @@ int iris_vpu_power_on(struct iris_core *core)
 
 	core->iris_platform_data->vpu_ops->set_preset_registers(core);
 
-	iris_vpu_interrupt_init(core);
+	core->iris_platform_data->vpu_ops->interrupt_init(core);
 	core->intr_status = 0;
 	enable_irq(core->irq);
 
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 21ed4c9bd5e3..9151545065cd 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -23,6 +23,7 @@ struct vpu_ops {
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
+	void (*interrupt_init)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);
@@ -44,5 +45,6 @@ void iris_vpu35_vpu4x_program_bootup_registers(struct iris_core *core);
 u64 iris_vpu3x_vpu4x_calculate_frequency(struct iris_inst *inst, size_t data_size);
 
 void iris_vpu_set_preset_registers(struct iris_core *core);
+void iris_vpu_interrupt_init(struct iris_core *core);
 
 #endif

-- 
2.47.3

