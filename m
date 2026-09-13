Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DE443FFFA7
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325429; cv=none; b=ngIY/9jSmEsypu9xGrzxWdROFXhp8dweq/7BnWG6uXkzNJ/r1uGRGr3rO2DoHjApn0YRpF4w/yzUKQnqYljYW5O30tuZGBUXe7YsdclNojeIPUVNCpKmpBoyByXWu5j01QX4inDp8zx5L4yaV/K1yTHR0MqGSufdgsO5GfS3tMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325429; c=relaxed/simple;
	bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=r54SLCs+oVFz+0pTdyRhXP2oKAbCMcVaJAjrUMLn1R0eG0iNBpj3sH1XH8J7hbfp5G11wP/tK0bSQyMXYbpNjTgArfuJBnSyy6+Ohk+lFxKMdFrFlANXUTxGKgjEBxCX+x8fQV0BdWeFaDxAZIx+3q9OEyxP24/cS22N7kscjjs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MGBdtJNP; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=jXJgLkMx; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MGBdtJNP";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="jXJgLkMx"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2fsY1693467
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=; b=MGBdtJNPFvOe1AtS
	12hXAUcOzZBXY4Qyc1T/pshHpIljnYwW7/AWZ2OF/9UEKWzLFzmkBQn4FILS9QiM
	SUc4QnkKc37RGyJKKIKtSPDmZlrHkaQlydodVi7pNt6+4L4D12ehiFV+2atxC1gb
	p9YqRZH29zyrNtDZKabbLy++r/S/obfxFBINh/QIoeSkdOx16/VEb43RibLzAzS4
	mH38pAdz9WuacmhcWXT4M6Nkmdv7unvBxXowcgWeaEGWP3TYvpTkQVAL7ft5JSVF
	eM8/P9KNb/N9MfuPudYSDh2d8r3fCfoH78+2CBhfz+JbCe+J8FwBFH7f7T/XK/GQ
	E6FqDA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gn018kt37-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:26 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb48f41343aso3184311a12.1
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325426; x=1789930226; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=jXJgLkMxbXwO+RinDSzrbOinYnXmcJIQKK90r9CB878ph6r48/kPLZ7I5PVq9ex13n
         54nUQG/xK25zAjVdrl4HDUJPn/36h36zlCHhRg3/zWqX5ZCnlj/xPTz8t4pqeuvi1dS4
         fBlv1odeY7jQkAEE7ViY1fVVKQaHjCcQ1mXqpaC5aAazEUN+qB3l/iC9PjjBnaghpm7R
         H8LG6gjynkPSQSRp7g8hPYBojOOAm64zCtcvNC7rb3Cc9tAlPkU2j3ZlRfW2TYVaFHLR
         ymY4yPw33rVf0WXX6vsr6L/2z28iuz6JA6ILrBYRMel1eE6SLXlm32s2SsAlezkVgJ/2
         KcNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325426; x=1789930226;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dbz2UkA+ppLqVOobr/nxngPFs17FSqKR9v4iZOMb5x0=;
        b=k9ZITW4jBAPOeDTnX+GMbgdKnjwCnyO74+R/TRLHD98n0AUn0SCTEdDfocuMkCyqkM
         vMaD/PbQc0xt81JPuCeztLGMkzmrQf5fZcV9wXvttm3eWwDnoMPD7LxSwdaIBIi17xxV
         usT3hrTk/0gPk4g9ZMK79Cc/qZKO/0DsyI6eb2bs/YUbILMoTWXgM0xvfa8kOsAd9p35
         BOUJi0wRD8IHYtRTGqCgSyQuMlGIsTFqmAwIWXtvKs3rDxk6/zdocz2S3jnclyjmY+tQ
         Af8BcR29bLaGOCy4EsaIFY7CbvNICdNjHEpaQvP38wkS9o7l2d+bcYF7uKqbr7TJcYEq
         wfIg==
X-Gm-Message-State: AFuF++mA02zSaGDe8M7f65Q/ntGVuNxGBJ2vHfpWbMoIMuryu9CT/fDs
	L/KSioEjEXlGmMzF9TOFFpbK2vfsKTeomk3+CmQnZNHaIgOLim3CEIzmU0NorAi1jEcnOye05TT
	KJ4iVJEt22GM5ugWKhINCFQ2gatiQBNcdxCTS+i3HxtqxnZ9yOckbZTtEaNoAbuUYXw==
X-Gm-Gg: AYBFou18dVX6JdO/a5OqrPEKfGot4UJCYhDyxjAEBwWE7KgNFUJZHn+8x4+UiCWK3or
	N41weh8ldeGea6zqhNVOxowaaz7yXotz5tDpeH6lgOKx58qAIm2BXj82JHto7WXuSdBrN6l8oJw
	00ZVjbHxiPwcxEI+LQARfF7wR9D0pmzWaGfXr/D1S2X2zfvHhIe9YZZnR++evMvtfgal6A4hj3l
	CGq9kVl0qSpG4KzpIcZywl0MePstSsLxobSXLypLZmPtixRyiAVWi3+5pRc97eP6lTmn7Tv4xVK
	WxsBG0+ZsCtlMZ/D5FTS/TxqBzNCb8kuBAryfDB2W2ztbleYtwVA3hO+Z/rRss5YXtFbQPgOptE
	QiVWZ2FZAYOI0DymhthnMS+5EifGlJF04VFM=
X-Received: by 2002:a05:6372:a703:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3db26e544f2mr3652652637.17.1789325425520;
        Sun, 13 Sep 2026 11:50:25 -0700 (PDT)
X-Received: by 2002:a05:6372:a703:b0:3bf:8a0e:dd99 with SMTP id adf61e73a8af0-3db26e544f2mr3652619637.17.1789325425071;
        Sun, 13 Sep 2026 11:50:25 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.50.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:24 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:22 +0530
Subject: [PATCH v4 05/13] media: iris: Add non-pixel and pixel context bank
 devices
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-5-9b9074a73c41@oss.qualcomm.com>
References: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
In-Reply-To: <20260914-vpu_iommu_iova_handling-v4-0-9b9074a73c41@oss.qualcomm.com>
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
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzk@kernel.org>, iommu@lists.linux.dev,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=6003;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=foRnImGSZ75lU1r/edBBVgqmVHY1e0szEa/Z/AKAvQU=;
 b=7iP01YumWQ4RTSsHPLURYioMXAP6EhN2fZAqMRwVLVthIFnByJuGbB8kd6k8z/kAZ2LKZBP2D
 ir4fISCg+DDB251umHmR4xQxe0w8RSlJlZbbEg1YxtrQGe6VkofSTlw
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=c4g+0h9l c=1 sm=1 tr=0 ts=6aa6f072 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=UWePQM47DRlDhC0KtsoA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX26jxaJP4/1kL
 pLmv3E4QTM9E4w4QPOSCf7lmX7vqd0/KWkK36ssRNM65U/X5LQjYA4Vd0Jhbwqs9I9xnvpa2WK/
 qnaCFcNR+VrP3pbgs/Kn6xtLEEkULys=
X-Proofpoint-GUID: DErgpadJK5CPldRMLKygFOVGd5Hbt2vL
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX3dnS6mrHku/i
 45Yj0DxpOc4x2OWtsLAD9bZJeAGrLjrG6vHZDCSbT3geIqb7hEfPyEdWl+4E+Frg8UdNNIJB3fQ
 OmAbK+nqzX/DHldCoSCxKMu66GnYrKpBMFxmdIOC5HH4Kz1i1zSVX2kg49YdxpRo0dLCAIn5a05
 jLpIb2LRHvdtfeXiYZyGDQdkGtDMaZrJbZuItGhZl3EOrX4mK1pFr+ixAYBi54fESyT3UxYuzxP
 MLhOhi/1uy8sSNiwVfMTbj5aoHdS37tD9wH8Zh7mnT0+KHAsm7Id/IumNpGh6IEvliUv/ZHgmiy
 LzCdsSzIK5oBQQ/ToCsVTrpAnWIet3PzbXdiDw8190d81WDrDnsLA3re4vvWz+Z5NoW/fKHETwM
 DSYLzbK5j6qQlKUZXCQ9iWpz69q02qF5YUQxVYkDVnWkjIo8Qr2khCaeAdcCXuuMbhxXgVUrZ1+
 cPpjQWyNq3MvU8WGptQ==
X-Proofpoint-ORIG-GUID: DErgpadJK5CPldRMLKygFOVGd5Hbt2vL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 phishscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609130267

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
cannot address the low 600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing restricts a
non-pixel buffer to avoid 0 to 600MB. Once an allocation lands below
that boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Now the device tree describes "non-pixel" and "pixel" as separate
context bank subnodes, each carrying its own "iommus" stream IDs.

Add helper functions to create and clean up devices from these DT
subnodes, and call them from iris_probe() and iris_remove(). This
applies to the common probe path as it is required for all platforms.

Set the context banks before v4l2_device_register() so the DMA plumbing
is in place before any video device is visible to userspace, and tear
them down on the probe error path and in iris_remove().

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_core.h  |  4 ++
 drivers/media/platform/qcom/iris/iris_probe.c | 71 ++++++++++++++++++++++++++-
 2 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 24da60448cf24820af7947b85eb7208555ab7786..3c96f46cf567b2802148b2a7cedb8488b6b9468b 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -36,6 +36,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -81,6 +83,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e4acf4a74f944bcae83089ef5489f204d4b0078e..debd1f0e57038d7abf463e82fd80f887b67750e8 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -150,6 +150,67 @@ static int iris_init_resources(struct iris_core *core)
 	return iris_init_resets(core);
 }
 
+static struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
+{
+	struct platform_device_info plat_dev_info = {};
+	struct device_node *child_of_node;
+	struct platform_device *pdev;
+
+	child_of_node = of_get_child_by_name(core->dev->of_node, name);
+	if (!child_of_node)
+		return NULL;
+
+	plat_dev_info.dma_mask = core->iris_platform_data->dma_mask;
+	plat_dev_info.fwnode = &child_of_node->fwnode;
+	plat_dev_info.name = child_of_node->name;
+	plat_dev_info.id = PLATFORM_DEVID_AUTO;
+	plat_dev_info.parent = core->dev;
+
+	pdev = platform_device_register_full(&plat_dev_info);
+	of_node_put(child_of_node);
+	if (IS_ERR(pdev))
+		return ERR_CAST(pdev);
+
+	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
+	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));
+
+	return &pdev->dev;
+}
+
+static int iris_init_cb_devs(struct iris_core *core)
+{
+	struct device *dev;
+
+	dev = iris_create_cb_dev(core, "non-pixel");
+	if (IS_ERR(dev))
+		return PTR_ERR(dev);
+
+	core->np_dev = dev;
+
+	dev = iris_create_cb_dev(core, "pixel");
+	if (IS_ERR(dev))
+		goto unreg_np_dev;
+
+	core->p_dev = dev;
+
+	return 0;
+
+unreg_np_dev:
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+	core->np_dev = NULL;
+
+	return PTR_ERR(dev);
+}
+
+static void iris_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 static int iris_register_video_device(struct iris_core *core, enum domain_type type)
 {
 	struct video_device *vdev;
@@ -207,6 +268,8 @@ static void iris_remove(struct platform_device *pdev)
 
 	v4l2_device_unregister(&core->v4l2_dev);
 
+	iris_deinit_cb_devs(core);
+
 	mutex_destroy(&core->lock);
 }
 
@@ -269,10 +332,14 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
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
@@ -306,6 +373,8 @@ static int iris_probe(struct platform_device *pdev)
 	video_unregister_device(core->vdev_dec);
 err_v4l2_unreg:
 	v4l2_device_unregister(&core->v4l2_dev);
+err_cb_deinit:
+	iris_deinit_cb_devs(core);
 
 	return ret;
 }

-- 
2.34.1

