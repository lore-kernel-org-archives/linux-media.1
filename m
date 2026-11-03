Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720499;
	b=xpFaZOIlKfgbPZlmNXV0giEmeRVYHmGZKHX8iJTynAakpNIpcQm6gCe5ttk9+psaQ+83
	 tmdfgHHBCZCYsWAdj9EJ8/6wXv7JkHe9ml5GArGOoFG7el3gTRq7+PfBwcUnK89QL12xe
	 TWq+KfEM4TYSHGHT4SN6JALIYAFmC92uhhMVVEr5dF+eZq0ml3ffLW4UkXxdMt9f8ceZX
	 EuIIEVXfehi4MDuw4hFJ3B/V9iOylQTALuNXFzxRxCtNDdErG9xKeTNqG0+rvZRBqtz/2
	 WuH+jE3IZ2DzNkKXSWFqEY3okTwpU3DnG+sIz4tfGm7X8+nl8s5K7L/YqNMQN2Tff7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720499;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
	b=DZc/OdOh9IXhVYvII0gr2iJIiZg+w6+hHKR+teZoqyFVZ7DqsXetYfBYQ/r4JWTlhWPI
	 eY7fsF9edo0aoZWT9pcA9TADc7FOsievgqYMR2j/auqKUZn97L2qlJ3KV3nKPgmIk5KAP
	 JiyGZnTCq3J9qoVK1dVm1uT5KTOlVe4JZ4tLA517+NYT59h9GkW0jBdP0K2eFIeidoqHo
	 EUfYmEjTMA8P2HPTaWWXIiv/ZHZVuN89YU8EcwtZ3zPqD1hTwdvWkKf/HYyNqr8EjvoJD
	 FopKL8TF10o+72skIlze4k2wlT2hkwnLeiMjii+jZGEPUFjK2o9y013ADjW7cc6h5bQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VzgvX4zd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bth6zxMS;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 997A9606A338
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:41:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 997A9606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VzgvX4zd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Bth6zxMS
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3E9vud2001337
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 15:41:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=; b=VzgvX4zdxFM3t12w
	D0D7EKS5e+tBo/A4kyqnnJP2nYgUtp1AWEOEFJmPmihfTv6/wzyHhezWeYvv1XNS
	+Z6J6LO1rTXCsW8C5RUVmQY213aokslJfOfUp1VtUxx4TzaW7JzrA2sgW4sz24ZJ
	a5FOqH2+kojRpr6c1qVy8WmMLobsU/a4RzPl3Er4Qh/eRl8jz/WUEvJmomQ6H2My
	it8IE8i9Dbodacbguigdj4TPeJkqPEnIpg2xYVFmxizcxTl4l+9sMaKSA4fc58w3
	zem5sI40CNG+acBpOfefwyViMNR/K4j8Xc1bl3n7+aHZvUiWUSZCcrUM63+sLpFu
	2DijnQ==
Received: from mail-dl1-f71.google.com (mail-dl1-f71.google.com [74.125.82.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq8u5jhd6-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 15:41:37 +0000 (GMT)
Received: by mail-dl1-f71.google.com with SMTP id a92af1059eb24-1a5005fd0f8so4070159c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720497; x=1794325297; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
        b=Bth6zxMSqizhwcBjUDw8Ph0Hou1DdBwyIjsJLYEASUV9ZsgiJRGOlAg2/C364zpb/6
         GsSHEtxyWfvV0uW38b/TtPe853b26EGn1PWKuL+VGAQRlGjtMUdMsRqX8g37Viowg8k7
         2do5HpOUi/hnYaMUnDzt3lEw7A3fC7dhYV1OxG2yCn7fGNuSrFgwe/knqaje3e1K9Yuc
         +K5IHgICk5YOv1+nIRK6K+K3+tIB3YI2KqPCek0K7SmRmR6JhkS2bGTOd9F46/TNXuak
         Q6A7uP9OV0ee8/4Hln2zZjOSlY94W5jJQ2TzPMb+AwVLrFdSdJ7T2K8Jjrm2L3D/+DvB
         I7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720497; x=1794325297;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fBYaimw2G3W1oorhLO1ay3uPHjszKa+u/YOPI7uQA9w=;
        b=e9YT76/bqB/OFtCwGtiw2rQ/7+cwSjBjgVGJBU2GR/W5/fkoF0nTkbXYfekrWuwHXd
         805WfmOMQuWIv6Yu3PujRQMQi4qH7kCFZHTpr6aU63msdwJk07mDXBXmqk1utxpU7i9H
         ksUoSnlERNtrJZPk/utYdBF6U0vfFm7bqzdpL5ARhu6SHtUguH0Hb+kUJDZ3ePA6J5tE
         Kqr4NH+6FCpM7KXz7+EIyWdVEfX4HYMFDE01OUfIm6EjOI6ZUn2ark4edV6vGEr4bBd2
         u4i8X+8A+D+P6cU7Hmjcyfw7rdx8FNal6CnsGBBFos2avZ8XFWqtoT2dud0zG21OI4ny
         bgDg==
X-Gm-Message-State: APuU4Z+g6Ak5o4GQzzGeVcypOqllKsm/EoAYxw58HOa19VVTyWf19PjN
	uVfAoWV7sAGAivSL0b6g+cq4JONhjeZfPOhAOeHIYNHJ2KAhYsp1e2cpe+22AOcclgZH9GiAjeU
	Yjld3hYc0u6kemiCkBtGcX2TPuKSoaj5oi2ERFFngN6ZsPbNvFYV37GGgGn2ObmRK1g==
X-Gm-Gg: AYBFou1q3Du2fYZfAD7Jk+3ALsmCbow3uKSdW0u/TAF666cVcnYFOI+smd+E77J25HE
	ySS7dr/UJHcIdJPlbnd9t56FA7uhbfzCM0m5weJaRkA8zOyjXA1qeu80QYGaTMWgCPr9bzFrqH5
	cD9JGQlpAgZ5jTk+nKUpBicRB90+hHpZyui7wx76BOoJXucCaeQF2Jy8yK4S9H7hWmKIhw3Sfcv
	n0bPeZ1uqIMs1AouuIfzeAEqkosYPtDi+yiwT5iLTW5/4yd9go1edqeRYFrFEvdIWOVz8Fycy5V
	FguYmwwKvUUt/z4VPWL7z7ljLUYIZ+FAB9QmlvwHh4OcdITHrRO2vkLxPmQw0Zdly8/1DSPYM1k
	e/SWOoxdpGwCUGVNFaMPKL5G23bcDqlandhpTSDyTAzZhWuWCDDxszUperA9IcEYwIZ1xiH+279
	IfQ3hrI3Pr
X-Received: by 2002:a05:7022:eb55:10b0:168:3243:c90c with SMTP id a92af1059eb24-1ac59dd356cmr21583412c88.15.1793720496419;
        Tue, 03 Nov 2026 07:41:36 -0800 (PST)
X-Received: by 2002:a05:7022:eb55:10b0:168:3243:c90c with SMTP id a92af1059eb24-1ac59dd356cmr21583346c88.15.1793720495744;
        Tue, 03 Nov 2026 07:41:35 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:35 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:35 +0530
Subject: [PATCH v6 04/12] media: iris: Add non-pixel and pixel context bank
 devices
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261103-vpu_iommu_iova_handling-v6-4-e4b6ad864f8f@oss.qualcomm.com>
References: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
In-Reply-To: <20261103-vpu_iommu_iova_handling-v6-0-e4b6ad864f8f@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=5699;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=PdoRGd1QM+T1q4UwRSS6CzpQGx+PNAIoeUckk4ow7rw=;
 b=Up3/bFrCEEtJNkBFbO5sUOu/bdyZblDZX6Hm/8rFVZwQ3XDG1AsibxXyJCv5vvISPo5X3aCZk
 d6f9ZTLIId+AJXpxsD0GyCUmiv2sPNCl4vrrtNuFtm2Z8Gytesu1gjA
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: 49AOPolYCRxjA3uj5t9WQNay-pyr6jei
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXxcOjExtd3I6s
 ZUP4uyr+S9xRbth5EN/L1Or9rwqSr/59QuhfrxOOr7gOFM4uxR/NJoXv+yfMcXaZtdS0tcYuc76
 4XpCvP8KD+8emigfmG0GC/fU2OnTid8=
X-Authority-Analysis: v=2.4 cv=RZ0FmFtv c=1 sm=1 tr=0 ts=6aea00b1 cx=c_pps
 a=JYo30EpNSr/tUYqK9jHPoA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=e5mUnYsNAAAA:8 a=EUspDBNiAAAA:8 a=tKxYv9Er3uJaL0Xx8MgA:9 a=QEXdDO2ut3YA:10
 a=Fk4IpSoW4aLDllm1B1p-:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-ORIG-GUID: 49AOPolYCRxjA3uj5t9WQNay-pyr6jei
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXwj7XIVf05l5w
 bWZbJFaPbxZ4tqxAy8Sez3tNXPe+ZddJ7BFJUHpQmsVKcbqGUZzOPXJGpqkVELMNl/DKTEL6Bh6
 llC/NcXZyCiU+Wrouwnd6v9t87XmvYfcNk/kwIJ5VPPriMW17d73BPmoyR1UMi9nChYHCCPfgGp
 UgDkeGLDUHa+SbcfZob73fyEhlxK9InKqm7Gyo4B+RoM5YI3uo3CvAScTznm5f2OW6xEOb597AH
 z6p6lzSSfO+lOWFFyc4y/PQ7WM743prwqKDzAgsjRMkY9h3murRy77LD2ZUAymzvzdROPCD63gm
 ABIMs0QcSSZQnjfOXQ36KSckTBYOKEmy97HqZSKtSI6p7mnQwQn5dcFmfDnrOzN08BiCCz6uoDi
 1aOMclS6ipQT+cYKhl1EgUCzpZAxGxLkYgG5+8ONVPr9EStEWr1IW7lJiwVY2pnSTN2EOmYKYNt
 i9N8REzKSrDHlJRUjZw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 impostorscore=0 phishscore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

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
 drivers/media/platform/qcom/iris/iris_probe.c | 66 +++++++++++++++++++++++++++
 2 files changed, 70 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index 3e4cf652bf39a7ef44f5c94ce91d0ba9c109e178..2f14d80d25899244028cad1e6c16e595edcb1493 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -40,6 +40,8 @@ struct qcom_ubwc_cfg_data;
  * struct iris_core - holds core parameters valid for all instances
  *
  * @dev: reference to device structure
+ * @np_dev: reference to non-pixel device structure
+ * @p_dev: reference to pixel device structure
  * @reg_base: IO memory base address
  * @irq: iris irq
  * @v4l2_dev: a holder for v4l2 device structure
@@ -86,6 +88,8 @@ struct qcom_ubwc_cfg_data;
 
 struct iris_core {
 	struct device				*dev;
+	struct device				*np_dev;
+	struct device				*p_dev;
 	void __iomem				*reg_base;
 	int					irq;
 	struct v4l2_device			v4l2_dev;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 25876957381b97f7ebf141bc87a7895cacff84b5..e659461716ba46c84d616b41f477b6250d46bd81 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -201,6 +201,67 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	return ret;
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
@@ -247,6 +308,7 @@ static void iris_core_release(struct v4l2_device *v4l2_dev)
 {
 	struct iris_core *core = container_of(v4l2_dev, struct iris_core, v4l2_dev);
 
+	iris_deinit_cb_devs(core);
 	mutex_destroy(&core->lock);
 	put_device(core->dev);
 	kfree(core);
@@ -351,6 +413,10 @@ static int iris_probe(struct platform_device *pdev)
 	if (ret)
 		goto err_put_core;
 
+	ret = iris_init_cb_devs(core);
+	if (ret)
+		goto err_put_core;
+
 	ret = v4l2_device_register(dev, &core->v4l2_dev);
 	if (ret)
 		goto err_unresv_iova_region;

-- 
2.34.1

