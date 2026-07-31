Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E024446F4AC
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522198; cv=none; b=ujqEJT+k7XExlpbSjUH6PaRAQBlMqDOdlFstFRSFcOne+3GN5Zo3ZKDs/v8jsXnPqqbUFpknCTVgn6sOGXUfcc25ken926EzgBV6S7t2u/dr/M+681WBJYezRFMLtxn1wWhfA9TViXxidm+8RUlFXGJ/10p1G6QKXzgcj+FVXm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522198; c=relaxed/simple;
	bh=RGTIQ+EkKAwvbuWT1JSlLR0/n48W+JBU7qKtrCaPp1k=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FtY30x8o6Fq0UMa8Av2WEv2dP8uhs5fWRKjoQoCIuBDB9ng06UfHq+ra+mdQh3NS6kQwLvRmdNGca6PAe2/fqWLy8grE108cLSGLBqPEcxGTajCeNVcCVakns9Cejq2I9orRc3Y0EZfnG04LGKVooK/ls+1ps0cyUVAPWBlEkak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=G0iOBeWz; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=bOnRcQwl; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="G0iOBeWz";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bOnRcQwl"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFNrvw700496
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	TFGjkvD83Z1gX1LMlkQippx2OwmX3N8h5/9DHjEVQFo=; b=G0iOBeWznQNdKIkJ
	+G1ZysmDQSUzo0rlf/AtBJjv7vqXLI7hncqLeo1oe6EmRLXRFFxMFSMSyjGKvJlO
	BYOfuoRCblv5f/euIEMTvBqqsxxsc517KU1S1f0b577d8ZohXXG8KyctVg0WmBEb
	u4y9o845NILRkoJoNteDcD5MONKnqQS0ueJERkDIbZt9t+cbNlSVmuLAM1BnTnYm
	awYtuik2jDZypXZBgEM36PBZUtWdkqenq9RmmXn5/Hvsbx9U7vn8eY8DHUImVr3p
	JUa9+xlXSZjjsEa1intmFQd5Bg0tzx2zQtvAvtUVff0YWxn08yzzuUiC+B5wbVOe
	TD2HWg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru1u1u8j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:15 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb4cdf95b5aso2195969a12.1
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522195; x=1786126995; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TFGjkvD83Z1gX1LMlkQippx2OwmX3N8h5/9DHjEVQFo=;
        b=bOnRcQwlkL99tIuR2jDVKOH/LQRj6XlFjh7DbaqxGX9Wayp4Dw4J30KYPjNKPnABG8
         FTi7EiAqmBNMh5wejmPs6hBmH+ZAS0YkxDhG9mxkMXa/ZkJ7IN7XFuUyPVANx70okxZF
         L8kEs/Aq1xB0prXGzvu3ZxgnnmyaS/KJkal12kqghgR4xbfMjcP1pt5krflq9GKOJloi
         hoogX60Xv4n12Dz1+Gpe9VoKqJqTKy8efzwROwKpGuCYGaG63o9DvsHKoK/qZiSIciN1
         0aao0iok2c1tBHCiJT84NZgLzcR0wAaquvkJB2tngfB30ulAKoyh+lnPBRTVxXsdyQvl
         Iysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522195; x=1786126995;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TFGjkvD83Z1gX1LMlkQippx2OwmX3N8h5/9DHjEVQFo=;
        b=n8JSyHaqXfLwH3mt1WS/VxdIVu3HXnOtOW0eqR09XGcoVoSqzjdddIIukN8YGx9AW1
         ynCrmLB6ozp0e+EhrTf59hUHrMTs0q97jKEduRjcIQtbVSSNvsWKkYpebONH+isDrdxL
         LitaWQ53GvkyilknoXXG9FjzK4/AdmXCu5I73kmh6JRR9bdaW7gMu71078xH+EpGRu5U
         0TfK4pODBNwJjqRVMjxGwHsELwvqqMlxWc6GGK/MSjZTquTKRDGCFfEhTPOUZrJnTD9a
         Yf5hyeLGZewJYA0GiSMbfo6fOrMZUPQ2ktpZ5o1004MiioeCyrBE8u1pmJuQEn1pO3FP
         rSnA==
X-Gm-Message-State: AOJu0YxAsVkERuUHulW6CeMwMEesuyKxQiYJ4sHgP/8s1ct8EdwO3i7z
	ShbpL+TZbyHFvci6AUi3kwOWHeFVojiQ+TDQEIr8NucU/IhrEIqJof/iCkSjLe/AVMSytz3ejsl
	HMC3so8qmeclz7daFfby8dPXAPGFmy3vhBnYdk08bTK1qjfy+kdR/LgBDerWjSH4yVg==
X-Gm-Gg: AR+sD128DqAIp0Y6zDQQvDyeLSeT8dro7vliy+eZ4j08E0J64PEDhwyl9btvLtZDLoN
	sQ452MzYMI379P0WvVTaWUzzi24Z0Hg+WH1MqIxaN8s/GTT+HPMyqVb3ZqCWnZWEuxkXvRk6Spk
	ebaZXZvHK3qXZpa8XSASVLTCYgxOK3QxF9qxtxuSqWM4gEK45wXMmSkKp/Q06L0ZiasSTl+V40A
	hwdgCZheOUM7gqaumNg/Wasgnw2t5tMR+ZtlwqIhmWss8LZmwDFx9USglhV/5qb+iriCFe1+C4a
	evB48WPvyr2B0EEy1DVUzY8+K54zhLIgaUZBQEIPU+SAvtCe4ek43DZwmfabyDHOrxy5I7RdHQL
	W94lnf1kVypti0FQ6Kyf1ydkdhXGYvupizVk=
X-Received: by 2002:a05:6a21:6b0f:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3c92a5d6d28mr787357637.21.1785522194697;
        Fri, 31 Jul 2026 11:23:14 -0700 (PDT)
X-Received: by 2002:a05:6a21:6b0f:b0:39c:126c:93b5 with SMTP id adf61e73a8af0-3c92a5d6d28mr787325637.21.1785522194176;
        Fri, 31 Jul 2026 11:23:14 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:13 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:22 +0530
Subject: [PATCH v2 07/12] media: iris: Create pixel and non-pixel context
 banks on VPU3x
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-7-da52b5228dbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3503;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=RGTIQ+EkKAwvbuWT1JSlLR0/n48W+JBU7qKtrCaPp1k=;
 b=4D+inkuCsQ4brG1HvaWIVgq2VQcr8M7tu6Cw6rAFjqj3Bu1oOO9t+552xWUItuEtz5TI2C6fi
 KD7FEZaRHNJBsKCrE2JgUV7tVrr3HCOyIkHbRMBVjXYd5A+FRGUs8vP
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=H5vrBeYi c=1 sm=1 tr=0 ts=6a6ce813 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=v0Z7u7uCyoCEKL_A5NIA:9
 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX2Xeb6VsZ4cMV
 OCaLBm0pgxWrH/ZgY6pyvqUtyHEqFGHlcd0Kv5YQ6NOjnSgSvq4pB9sO6YXcMBmo/9YJ4E4dl1/
 x0xLkvFav0pwAE/VbOhAWZF5AEmuib15AKq5DEjdp5fkmgFKE6WEiG7mP/IvpXywwVeB9EdTD54
 X52I8w4Ku3OOalhahwlbewfUmVwvxJ6Wgz+XF4+ce+W9WQkgVAjsEAlaIUBG5S1VpvL84Sg8Ve2
 XqoRiJOO0LZCiIpbsWCyW3rZDgIlQfDkGv9X1TY/4PBuewkb6+zK0+UPANn3A9FB6BClch2yOPt
 LvIx5ofDzVdl9KgYkLH2u1JJli/L1rbDTQfjoBdavECJATNUcqGdTcASfmml9MpqdI34rA1HOPC
 BBXtTM0TCeFlT/zLTo8jYGkz6tG8LheuN8tb4KZlU3MGeF/9h5rO+kcctB6PJeo/3ezxDbbtVHS
 qy3xOIX/HBDlzYQDFoA==
X-Proofpoint-GUID: zvBEP6VBnD2UIZ4EVmHscKnOBBuq2eTQ
X-Proofpoint-ORIG-GUID: zvBEP6VBnD2UIZ4EVmHscKnOBBuq2eTQ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX/g+y98UW6S3g
 IlzZMhimfYaAxt9ohPbxLaYu8IEpdpoFNTY7LFsJsqbC9Ba1cNyc+MCIDLHd2xCSIzP/JgGdaHL
 /2clQnIxIY6ivJnKExLUVKa8RnvK3KY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 impostorscore=0 malwarescore=0 phishscore=0
 adultscore=0 bulkscore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range.

Implement the context bank hooks for VPU3x. iris_vpu3x_init_cb_devs()
creates the "non-pixel" and "pixel" devices from the matching device tree
subnodes, and iris_vpu3x_deinit_cb_devs() unregisters them. If creating
the pixel device fails, the non-pixel device is unregistered and its
pointer cleared before the error is returned.

Wire the hooks into iris_vpu3_ops and iris_vpu33_ops, which cover the
platforms whose device trees are converted to context bank subnodes.
iris_vpu35_ops is left unchanged, as sm8750 still describes its streams
with "iommus" on the parent node, and the fallback in iris_get_cb_dev()
keeps it working until its device tree is converted.

Backports are intended since the first DTS of 8550 binding schema.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_vpu3x.c | 38 +++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_vpu3x.c b/drivers/media/platform/qcom/iris/iris_vpu3x.c
index 3dad47be78b58f6cd5ed6f333b3376571a04dbf0..623a0f8a7982c0b5c2e3741a34c1367e9aaf4e27 100644
--- a/drivers/media/platform/qcom/iris/iris_vpu3x.c
+++ b/drivers/media/platform/qcom/iris/iris_vpu3x.c
@@ -254,6 +254,40 @@ static void iris_vpu35_power_off_hw(struct iris_core *core)
 	iris_disable_unprepare_clock(core, IRIS_AXI_CLK);
 }
 
+static int iris_vpu3x_init_cb_devs(struct iris_core *core)
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
+static void iris_vpu3x_deinit_cb_devs(struct iris_core *core)
+{
+	if (core->p_dev)
+		platform_device_unregister(to_platform_device(core->p_dev));
+	if (core->np_dev)
+		platform_device_unregister(to_platform_device(core->np_dev));
+}
+
 const struct vpu_ops iris_vpu3_ops = {
 	.power_off_hw = iris_vpu3_power_off_hardware,
 	.power_on_hw = iris_vpu_power_on_hw,
@@ -261,6 +295,8 @@ const struct vpu_ops iris_vpu3_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.init_cb_devs = iris_vpu3x_init_cb_devs,
+	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
 };
 
 const struct vpu_ops iris_vpu33_ops = {
@@ -270,6 +306,8 @@ const struct vpu_ops iris_vpu33_ops = {
 	.power_on_controller = iris_vpu_power_on_controller,
 	.calc_freq = iris_vpu3x_vpu4x_calculate_frequency,
 	.set_hwmode = iris_vpu_set_hwmode,
+	.init_cb_devs = iris_vpu3x_init_cb_devs,
+	.deinit_cb_devs = iris_vpu3x_deinit_cb_devs,
 };
 
 const struct vpu_ops iris_vpu35_ops = {

-- 
2.34.1

