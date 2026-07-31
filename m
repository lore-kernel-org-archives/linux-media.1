Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4694B43D4EC
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:22:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522171; cv=none; b=W2/V8nmrMBb8FEEIMgUAX/jbpdQ78YAt830LHbr170czwwgkcXHPtwu68XZYhxvB4LZ+JX7tfWjQ3US8Ouk2QltrmDUG0uPJcaiAyxzivQSwRVbh+F12C8JhSMGEqP7tet4KGvhve/Gf89WaXrV/0x6bCzcjRw91E1RwetpNU4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522171; c=relaxed/simple;
	bh=K28T/dgvFzniwuN4xZmnAeRZ+wHTEI7cZkTPLPpftOg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T6IHv65KDX+eGiXoBJKlFrg25L1Pdb3MdHvycjt6h8GOt1B54k2xkmPR2qTPmbdB7YbNRGdcBO+pPQLJZm39UIO16HaBBMJqNH6jVn8l5EBiyxtYE011W4qYHqrh/DSfPqYR9FUCF+h/I700RgGJNh/YxRftfP5TD6gCR0oQSOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=SofT7UWJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SCYuu3uc; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="SofT7UWJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SCYuu3uc"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOGK53879527
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:22:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VVLLnm3Jpp3q0/b3PSKYr4jKj3HUj3OaJXlTQq4nAqQ=; b=SofT7UWJWQcEkWQD
	cMGTQYXmWQSXBbY1meVjuFBq+Guh0lov8nbkUInpMtDF2Yq+40wEji7Nug3kND0l
	giqgDAPKZSLJ0EFp/InBgLkzoiY8jpYRcTZdNEYAWD+5VuKCoP0iisPyZ5sXB+qy
	MCcBF2dZDlGF192CZXs5VM9BAEqieqTkF4Huav7+fbxanlpjcY41zueIii0QnWkQ
	XC1I3oQVS+gtoEOZpq49+SkPuo3Ueu5Hck8o9Up1uHdJNPY08n/csRDpcvaKmWTt
	isSJWELE1TUJLZgMmYilQTFvX5QXUHbIFrxCRh8wb1jQtUaCcavFPZwqRjAUNfaj
	UVBuhg==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru0y1tq2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:22:47 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ccb687f82eso17780105ad.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522167; x=1786126967; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VVLLnm3Jpp3q0/b3PSKYr4jKj3HUj3OaJXlTQq4nAqQ=;
        b=SCYuu3uccOwg32hm5KkCx/PgM2zPf0nl1QjXXlKqf9FQTB8QJ0ZunYlHAUa/5vwBAs
         x0YndE48eSJG+N2g5Do0FpwN+cwbwujt1DZad4vyDJtl6N9SJ0Tu0IkfEX79Lo++x5K2
         ioLWNokOe+Eau3NTmS43ETMY/8WETw+naEWEFqB6ovoouS6jAbgQP19e75DqloqGqYxL
         G17lN9H3PBmLZXd0jVEv8Jd6in831BrnmJKrc2r8+t6i82rbTiRJ//aqvZX487Ny0nZS
         HSM+eMDPA6mVCwJlyZ5qTfpbu7jvPPndGjXde8+QZ3H2XKFvkN0d1R/oxTbEh0LpLTJw
         3SJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522167; x=1786126967;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VVLLnm3Jpp3q0/b3PSKYr4jKj3HUj3OaJXlTQq4nAqQ=;
        b=MIeQXz29v0O38IUNPnbymb6IXHmMP6iIWLoUHYeg5FCMGZX7Jf90q7UzPCvdUqgK9/
         21vkVYvt/Z0h6+PrFUDbIHl6/MLViVmJV4ZARmM+FcAWO2d3FlFXDgr9F3ngfW/5ExoP
         9BkyTfqZ/XcsNxPnQE19MySDtjBvN9c8sEf6Xt8eZg2buYG70R6ZgcDfAWjYGJ9zKpW0
         g1T8MLSLPEwJLjhEWco2Look1vUSda02mLb8Cw7cyq1uJFX8mMfY2QgHuheHVt3kT+aE
         EyhJdSbHgiNXVLO5XA4VBC43J2HeYwuwIAhPNxPOpVjI8B2konjSVxnrPXNA9fERn2SA
         PwZw==
X-Gm-Message-State: AOJu0Yy1YulCb1gOdHjtQjedl+E7nCVOmkoMMHT+vxAdpZldol3bWC11
	ZZTI2TxfO/voqpyZG4y9UC0Nk2XgGWeuAuXpZqZ4R6+fai4D9BvCSbmnYt/cbgc/heJoxfccTAi
	8ilCSCZQNJJAtGQvkgFoHXNizu30UJrAs6HNMo/TGCrK0h41PArQolhri2ew9b3FwBw==
X-Gm-Gg: AR+sD10otqpJSg+f5+Si78Ravlw9mwHU7mT/iSpp4dDXMczTqBdScFAvSgXfgdgVKoW
	WtmZoD7ssKEF49GQn5RFaaEzDl1dA1jyZ6bF7HvPqnNpJmgA3itN85/DkPWXJZEPFpbINJcQMnU
	mEV/NUoKocgKONNC97hI22eQZUrhkUnPXIAfY3m0RrgK3a3+/vk/z4zE6O8Hg8sxHuDV8nAYPuH
	GTO/ytPwSBeNI1E2r8oeP7YLadL4BmBzeTcD206fX252HAgNxBNog1K0jjI2Oqg0kGzLQguqYo6
	mW36IHuj2EZj63tN4RoFDJrJ1SRgXLMFB7lJs4PmZcyiW8EDgZMM3Hvi07MvLLFF5D97gIJtfNz
	JSk9QtTZDYX4KvrIbXIN5Ty53WAnVjElkTSM=
X-Received: by 2002:a05:6a21:60c3:b0:3c4:1916:9d46 with SMTP id adf61e73a8af0-3c92a5d79ddmr802494637.27.1785522166739;
        Fri, 31 Jul 2026 11:22:46 -0700 (PDT)
X-Received: by 2002:a05:6a21:60c3:b0:3c4:1916:9d46 with SMTP id adf61e73a8af0-3c92a5d79ddmr802458637.27.1785522166156;
        Fri, 31 Jul 2026 11:22:46 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.22.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:22:45 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:18 +0530
Subject: [PATCH v2 03/12] media: iris: Add platform hooks for context bank
 device setup
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-3-da52b5228dbd@oss.qualcomm.com>
References: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
In-Reply-To: <20260731-vpu_iommu_iova_handling-v2-0-da52b5228dbd@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Stephan Gerhold <stephan.gerhold@linaro.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org, Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=4340;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=K28T/dgvFzniwuN4xZmnAeRZ+wHTEI7cZkTPLPpftOg=;
 b=/cDXVs5LQb5hpto8iVj19aVmJcEU8eVqKWw7t3HD1W9lgRfGicaoZ7Sp2yAD7YkOgyWXa1nIa
 DJYm17fHMo6CL8D0pWp9l+CAAHzGL4Hq0pxaXdKRNJ8vKoMcbWm9+e3
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX/GjXeYKVf8qJ
 8lNqirAGJ7K2cwozs0VTB78uHvxNkYhdT9hWdT0278lrEGavzatM0xwjB74kD4ZQuvjsoRanZJS
 sWeyiHf7kuKoafesU2CIQ2Blx3Fv2SI=
X-Authority-Analysis: v=2.4 cv=TcamcxQh c=1 sm=1 tr=0 ts=6a6ce7f7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=dye_ZhmbRBr0AdBEf-cA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX1AvHVEaHuTvC
 kzLRYuGO8xf3vXNhHU9GyplSIWWQ61pSaXmsXA5MA61XZ+zebMDwgUn281Q/K8tc3HItPwDl+w3
 PNPA4bZ0qd2XOojU1bHKi9KnFbN0djxH5su/pKjnWO2gtmOhVQohKCZQv1pNthB3VJxVjmSpdgw
 FgslK4qKkA3GXgNmR0sUg7+35bMSrGY3VhLpxRW6SH9ezZHgThqdQc7RV5JcFlKiLWl+kj4i47d
 9FvFLk1HrSuURiZmCHO5mbluA15cyK1ZnahZLPS9Bh4HjzdoqxJdXsa8vpe7S6fpIDbB3c3ELaO
 Vj0dx+I8zoKtaheIMwakw3lKV6W6Y8qAMgnPNzbiPZqPmUWj6s/iHI8SHBLJZaEF+xNIkIdO0Ln
 Gq75enm5BZMnakuXrMP7Jhmp475scgxvoOO2ZAOkjHOAeotTSSd2k/OplM3XCl9kEPDKRC0xTCa
 bdMAvKeO1lQC436uhUw==
X-Proofpoint-ORIG-GUID: 0hCQojbj2CQ7TFmHVx2BDANn8ywux-eD
X-Proofpoint-GUID: 0hCQojbj2CQ7TFmHVx2BDANn8ywux-eD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 suspectscore=0 spamscore=0 adultscore=0 clxscore=1015 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range. Keeping each stream inside its own range needs a
separate IOMMU domain per stream, which in turn needs a separate struct
device per stream, since the IOMMU core attaches a domain per device.

Which streams exist, and therefore which context bank devices have to be
created, differs between VPU generations. Add init_cb_devs() and
deinit_cb_devs() to struct vpu_ops so platform data can supply the right
setup, and call them from probe and remove. Both hooks are optional, so
platforms that do not implement them keep the existing behaviour of
performing DMA through the parent device.

Set the context banks up before v4l2_device_register() so the DMA
plumbing is in place before any video device is visible to userspace,
and tear them down on the probe error path and in iris_remove().

No functional change yet, as no platform implements the hooks.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c      | 25 +++++++++++++++++++++-
 drivers/media/platform/qcom/iris/iris_vpu_common.h |  2 ++
 2 files changed, 26 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index c2dcb50a27824d45d5fbc8b9e22591decbe2a23b..2594f5a67378af9a547f23dec2d2c057506dda65 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -15,6 +15,7 @@
 #include "iris_core.h"
 #include "iris_ctrls.h"
 #include "iris_vidc.h"
+#include "iris_vpu_common.h"
 
 static int iris_init_icc(struct iris_core *core)
 {
@@ -150,6 +151,20 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->init_cb_devs)
+		return core->iris_platform_data->vpu_ops->init_cb_devs(core);
+
+	return 0;
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->iris_platform_data->vpu_ops->deinit_cb_devs)
+		core->iris_platform_data->vpu_ops->deinit_cb_devs(core);
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +222,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -273,10 +290,14 @@ static int iris_probe(struct platform_device *pdev)
 
 	iris_session_init_caps(core);
 
-	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	ret = iris_init_cb_devs(core);
 	if (ret)
 		return ret;
 
+	ret = v4l2_device_register(dev, &core->v4l2_dev);
+	if (ret)
+		goto err_cb_deinit;
+
 	ret = iris_register_video_device(core, DECODER);
 	if (ret)
 		goto err_v4l2_unreg;
@@ -310,6 +331,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }
diff --git a/drivers/media/platform/qcom/iris/iris_vpu_common.h b/drivers/media/platform/qcom/iris/iris_vpu_common.h
index 09799a375c1426d808ab5ea4fdfcac3a203e15b3..a8df9af0d3da407b59d2d2c5f2b8a08c75e93192 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu_common.h
+++ b/drivers/media/platform/qcom/iris/iris_vpu_common.h
@@ -22,6 +22,8 @@ struct vpu_ops {
 	void (*program_bootup_registers)(struct iris_core *core);
 	u64 (*calc_freq)(struct iris_inst *inst, size_t data_size);
 	int (*set_hwmode)(struct iris_core *core);
+	int (*init_cb_devs)(struct iris_core *core);
+	void (*deinit_cb_devs)(struct iris_core *core);
 };
 
 int iris_vpu_boot_firmware(struct iris_core *core);

-- 
2.34.1

