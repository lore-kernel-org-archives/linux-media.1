Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A2B647A899
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785455331; cv=none; b=qNxPUmcqdPncdlgLRTjUpjsG3NtzWrBeagPdd+xp8MUbOMwFBujBbrJp16Dl2zzv0zLqey9xY+UuZdic11fEGlTbI99IQnHG5UdCGoRRXx4vkqPfG4L4MoNweN5mgbZeNOQWHAJWzqFkM2YJ7aHw/gAStUuPTnS7BB933PGst50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785455331; c=relaxed/simple;
	bh=waXKDNxXFFDGJZwXXUOyEjCtu46GMLF2lKLnyW56kTE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cV5zBgmhhLaz52ijMj5m5ZPhtRyY0hGkyatSMJMGv+O/hf2i4erAPjWdXVX6VNFmZlsYSRFj9JkyDz14gJHS7yuTXxIC91dLt086DKa4nHaWseVaWVrJp+O12WE5J/XJw/R3qRkYQjOm/vdZr1EIdQrSkE2xiUioXqWEryr6jDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=C41A6yk/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f/qkaiTl; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="C41A6yk/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f/qkaiTl"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66UMqv552453684
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=; b=C41A6yk/0dHgDtuG
	xiANdNSQkQ7EQGSEKM8HSxup9zWalhZucJmP4jSdfgAYjWOnFmsjpXVF47UYm4e+
	9CT6HgKjkyO64Drzx5wIvvFyycvn9hNnFOI8guxuq8iKns+4ICwftm6qwTX/fO23
	RQVHXnupDjW0hgu3DcxrepWpxcjg8spiCAS6Y7Z+hKAUr2RAwQNZzQRNxss1k2hn
	C7kOvcSXF4RfpASbhAir1byEMdExurWtDr3DxjbVs5An7LtyiAuAOfi3AB2c1aEG
	MoWqNyV5I5frY+zWdI8pgUUlPUI2qEp9UVHZretvSxX2FXAwrSodtxt4XPQmUBZN
	fWUPjA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frf0wg8s1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 23:48:48 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5276aa86d00so3852041cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 16:48:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785455328; x=1786060128; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=f/qkaiTlf/TFQkoSh8R/6/+WHiOGSRY2Lb+GjGRmvWr9vn3dsM221snJs7gQ0iF6zs
         VLl/4QCuruUWJmOt/xVtHoHGOW50gJYmz/fQT+JJGX/mg4JRLSpzgcNdGpnweEMJqvGM
         aPFsgVTqByinZoavqQHI3s3B6woTzy90XZxpavv+bfbmDNuri6uMPUl3UpMCJao4nKaV
         kA2Ae8nDO+V9z9NqxFfTa6a1uN4JVXF5Gm4q/OpApsCkcYeO4rz+bGf2fV/8LCsk24BJ
         bMDAnuKip+lmAQhGP8FfGUQ5J4o9Xb2CjrQamVE0C/Z0FHTN0Mnyjw3JZBHtEd3l92WC
         zM4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785455328; x=1786060128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3A70gNGbqmKpi+ELn3nL+yw7ZT7umZ8GcDY+U0kOmdM=;
        b=Fsw+4P71YxCPq/sYkTGpUThsru5ACUkHzNdC91AN46J+imxCYphCwmFyR8QPw+5XnE
         aIQdph8b7/0g3ipU8RypsOJvukZA+TsNirelHY2NwQ7Ucod18VAsvFHRgFTWn7TNcSCF
         A1+aPShLDt3HMIc81jELPtII+jiFVCgFmzCkPZ40aVNv4tsGcm8E7zAGRceYMbS/InIB
         pMJi4oYPzcUPXefa54En5eH2GqwJkekTWRXkTnHbn99H1XpikmlFMJEYRsxOOpuwJ/gq
         J+OoAKLnWbqzCtWDj8ZqB7pQe77N1mKw7amSYL72pk/PpPBk4NMmhNEezWZsFahuoHcO
         OxAA==
X-Gm-Message-State: AOJu0Yz8C+B/wnJYAs52SMwvvIMcggfD/zMPPtyYSA92eD3VQSKAmMou
	9AQcWFeCA0Dr9alqDNRp42/p/DY6tmRQjLVu0u3bIjJq8JDEkeX5HJd4QiTqH2KbR9LQx+v3Szz
	i/SDxyGpGW0gwkNC/Md/lpjZ7cnqVnvlGbz60FyfiZUlksYz56s/JvQHeHkwzWks73RJiAK7VzA
	==
X-Gm-Gg: AR+sD12lTn3Si/9m4dPLPYnPPzj/NnHl0fxF+4BINYm2IRVJV5776LphN7hkqvIEB6U
	Se26J0VTZzheq0cPlVZTbzH7dcCQWze/725VrCW2TNUDDQp0fGOHarlKigSjwZa84YMh5J+wm7o
	kbPWNh8/Z8Yx4jQQSXFcrXY1MwpxuFseMB/ue1ixg2mV0XLUHlkCwhk6zeqdW+fQd4RCvrf6/Tu
	5KCGKSy0yBJnwuQBTA4gIIn9QYCR1/9kV2K4K/hLgvkYnmhSJkeS3ND9fTsJUd+0PG5ivFWbBT+
	DUoDjvZnpTeJntGOeMCcOhtTTa7TNFKDORmrr0/lPYIjKEMFz/ohYA2hizpdw2GeIYxXbdKZAi/
	znUubj7HLM5S4iIM6P2ZIlPzM/wJk+XU3LUXk3YYkZ4fZzZ0iraLJenjWyjZFKFYdwXruxutu6/
	Yckrw+10slgPY/jw==
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322831cf.86.1785455327764;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
X-Received: by 2002:ac8:7c48:0:b0:51c:7b12:5ffa with SMTP id d75a77b69052e-52b387c930dmr49322661cf.86.1785455327333;
        Thu, 30 Jul 2026 16:48:47 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5b2db9ba724sm634487e87.45.2026.07.30.16.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 16:48:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 02:48:29 +0300
Subject: [PATCH v9 08/19] media: iris: add vpu op hook to disable ARP
 buffer
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-iris-ar50lt-v9-8-d71a782001c0@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3062;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=gAZGcXI5Qu3MHvApOhouY0oNKw2Obip0DwkWx+cqYbI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBqa+LKNZ11zB2ttARj3jPxQLU7BZ5dMCpNncZVg
 PKZKhEgpa+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCamviygAKCRCLPIo+Aiko
 1Xz1B/9MuLT0/hm9RarxnBl5aAraBXkRIIVjRtp19mSM/saiFZOg0Zihwqt3sfSVj92soTjz0kL
 89SWQbensvVTaEbt1p0e93WKkkhr14nR84FstN7jYhQWSoZY/Y8RWjiBo4Kwg5Y4CaDVTEvatoI
 XZDTY/zGfTjBk4q2k0Ygwcj1dJyOcmk9YN1y6n764acvo/+I8eCb72UznkWkowNul7PgibZQARe
 Dn9auSuMJlq2QLVJb33xKSkUAZotb+Vnd8CbPrlhq/lz3xjtDAIAW5v0qTCBnAD8M86qHwhqbEP
 if18mnSuQBKQmUXKKnytF+TMaUUBkjKJph1ZHyomXMNfKYkB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX2/yMihv7rMZF
 MCz9lMgsRgmwxSMJ/kQUYfBV03+if57As5iSI2z7SQRjUAJIJ1gycZvoP+D8oBsC8qGpAG+dyZr
 2vtWFCSMoMUyrOCyNe8fU98RoX94L/k=
X-Authority-Analysis: v=2.4 cv=T928ifKQ c=1 sm=1 tr=0 ts=6a6be2e0 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=vdBeo_PM3xCM7oyOFJQA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: lcB5W4QCMleHNxOz9IO7vXjLYU_bh1lp
X-Proofpoint-ORIG-GUID: lcB5W4QCMleHNxOz9IO7vXjLYU_bh1lp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDE2OCBTYWx0ZWRfX6RsvGmQivHXp
 2clb6VVmBqPgaEXmKfXNGtxMpEYeYSMCOloEJzOe383yEjGxTT/u/nwl77Miu2v4SwzZpX4Ch5U
 CypYmdnhJrC1Y5vuJJ7yqrlyOuQaqyl4Zm+u4I3Tfkz7OzoZIu9UtiqqQ5xBafcmkf4/gSg/BnE
 +meg9Lrz2mqyOreItIkwppIXKCYQNUNeNWKXrdhQn0v/DQxYr+NBD5cBrUJxOl88x9sYDPmzVOg
 w+tPrei7PInDRO1H+NpcwUms7fxyys8ewH4qNOfbB9i/PyZrmTiKsI363w1HVTqGm2by336bdk8
 q9idAWHv+vKDcA/Nz2tEnANYT+8g47YzKnHfoehJNwuaLQCnsd/KzWepiWaRMOKqa79eMf27bpi
 omdQhoFf8lDZ2AM3Mxhg3ovD3mJ/HO5PwcFfRToFa1D97WModUD44PPJAedFnlldZc9dKC7cixY
 V6TaM0pjgFGRQMCiqag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_07,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 spamscore=0 malwarescore=0 impostorscore=0
 priorityscore=1501 adultscore=0 bulkscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607300168

From: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>

On AR50LT platforms AbsolutelyPerfectRouting (ARP) needs to be disabled
so firmware can configure the ARP internal buffer as non-secure for
encoder usage. In preparation of adding support for AR50LT platforms,
add an optional disable_arp callback to the VPU ops and invoke it from
core init and resume paths.

No functional change for existing platforms.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.c       | 4 ++++
 drivers/media/platform/qcom/iris/iris_hfi_common.c | 4 ++++
 drivers/media/platform/qcom/iris/iris_vpu_common.h | 1 +
 3 files changed, 9 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.c b/drivers/media/platform/qcom/iris/iris_core.c
index 676baa8087a8..d558475986ff 100644
--- a/drivers/media/platform/qcom/iris/iris_core.c
+++ b/drivers/media/platform/qcom/iris/iris_core.c
@@ -52,6 +52,7 @@ static int iris_wait_for_system_response(struct iris_core *core)
 
 int iris_core_init(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	int ret;
 
 	mutex_lock(&core->lock);
@@ -85,6 +86,9 @@ int iris_core_init(struct iris_core *core)
 	if (ret)
 		goto error_unload_fw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	core->iris_firmware_data->init_hfi_ops(core);
 	iris_session_init_caps(core);
 
diff --git a/drivers/media/platform/qcom/iris/iris_hfi_common.c b/drivers/media/platform/qcom/iris/iris_hfi_common.c
index 8769ec61f117..8f04f3793d9a 100644
--- a/drivers/media/platform/qcom/iris/iris_hfi_common.c
+++ b/drivers/media/platform/qcom/iris/iris_hfi_common.c
@@ -144,6 +144,7 @@ int iris_hfi_pm_suspend(struct iris_core *core)
 
 int iris_hfi_pm_resume(struct iris_core *core)
 {
+	const struct vpu_ops *vpu_ops = core->iris_platform_data->vpu_ops;
 	const struct iris_hfi_sys_ops *ops = core->hfi_sys_ops;
 	int ret;
 
@@ -163,6 +164,9 @@ int iris_hfi_pm_resume(struct iris_core *core)
 	if (ret)
 		goto err_suspend_hw;
 
+	if (vpu_ops->disable_arp)
+		vpu_ops->disable_arp(core);
+
 	ret = ops->sys_interframe_powercollapse(core);
 	if (ret)
 		goto err_suspend_hw;
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 9151545065cd..71d96921ed37 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -24,6 +24,7 @@ struct vpu_ops {
 	int (*set_hwmode)(struct iris_core *core);
 	void (*set_preset_registers)(struct iris_core *core);
 	void (*interrupt_init)(struct iris_core *core);
+	void (*disable_arp)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.47.3

