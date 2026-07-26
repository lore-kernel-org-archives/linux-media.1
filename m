Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3B434165B
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785045057; cv=none; b=TDgEkj8lkhSImMsr49PcCmT3SgmsuDN0C5CY9qKKbYZgXpvulcUbMS5pZgkls8gqzwPB2RMAcsylQaS4A1VXb0FVa8zIAi1mztW0pMeE/td+QkXXrWL3F346uPNIPI/fDVjWobTJm6eM/2Vi4Ibi3m4x0uS+XRBwyfpXR6Xcq+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785045057; c=relaxed/simple;
	bh=Z7a+KeKlfsd6hODeCUGUk5GwLjPusVx49RSzZ6ytvIQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxUzplGmYcXRfMBGBzPVYGrF2jTxEQ6h4XZJbTdLWaGllNy1FpcglOGR03aII0n0aY3vSkYM1yez2lt/++MnSesVdjFmDrc/JgbRAhdT+LeZX8Yv1PxZzivYyaPXHC72smhRpxhkd1183eGMFVy7T4Vcw9onO4a+QmQXLHTe2ZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mcajeMbL; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gP64qqJ8; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mcajeMbL";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gP64qqJ8"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66Q5Rwcx3857997
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=; b=mcajeMbLXptZM7Y6
	Eik9TsmaAXR4NxoKtPL70Yd/+mz49v9Nm4XdLqOpY4QnWlgKDBZtjfym/D9n6rn7
	nDA14Tnj+p56QojG2qM3c7TB3/mH4MocrhSrIiBD/Bz1JHww0syvicOy3cW6Asyy
	tV90RhxBbffKK7KrVqVL3eEwUZXzinaYalo8MyRnHPN8j4DUyS+vspwne+3EhAtz
	v/bOCKJZpDIYk9FgnpDjvExXFMlgCguAvr+9kmPbvsCORFFMXsxSnRsQWtbXOGhm
	TvfmjGZqqSZCqGD6MQckGs2o0WMFRxiLThSIiXgNy2t9jr4UnUOf/880DMTAB7xQ
	VK9yvQ==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com [209.85.215.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fmnh7t95g-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 26 Jul 2026 05:50:54 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id 41be03b00d2f7-cbb92868263so2164974a12.2
        for <linux-media@vger.kernel.org>; Sat, 25 Jul 2026 22:50:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785045053; x=1785649853; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=gP64qqJ8jFIWSgHViiFudgxZiOjJu9ht4sog7RqOc5z6w/i/DtROsbs6GjdEK4LEbJ
         /+B51/BURtCUtzkEAdC43IlHB1XkPIkm26FAgI2JAL16UkL4TMYvDYCRqs/6v5ZjZ0ir
         Vpr7ceELNgDkYD1/VZC0HvWLU+Chh+55CtcZQucu4KLsmZAjChO2J8X+HKz/+x94E4FF
         6oK8jYh2BGeo4+5lIcfFM2D6Moo0GTMJ5aybVZ+VMeUUD6sMOKg6MTqCNqjawEFwQcj0
         ThniTJpUxkh3YjBzm4t4m+EgOFGFGReFVPFSMZaWjST2ha5/rg5KEioCn0JsBFj5CcoD
         86Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785045053; x=1785649853;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rccCrQapLXpGKmzhslQnhMFu7V0TczQtmSRgtHbcpXA=;
        b=RndK6q79WF6BXlqjGMKJ/rUWDO+PV1cv43HtYUmN13isSFv6DRkGahZOq82RJsCA3T
         /UTTHNuHD1U+w2hLtZYGUlA6fpw80S6XCfy7v/3dtbpwjABxhffgZe3YdyItlVZAzRrR
         KiZDtKLKLmzzqawD1pKJNcY5fYdJdcNEFpz95HDQxXkW/qy1uAcNZgt10+9ogol9g27c
         jbyMmZyUWj4bIDXfzyuzkdIAQe+Vhe3AGaWf2pAY0BxSrjlkOXPg1wS2DuLzLz7nqWqC
         jgAJoTGUCJTSGPAikm1ZXPLwjTaiCGtZ2gOaxfzmCHqHNK9MNSzcT6Zb4m4nfLZre/U5
         0nZA==
X-Forwarded-Encrypted: i=1; AHgh+RoYCUA03UsyjC5chRbLCwXJRnpSNcCjAFMeJ4YfxB1iSFWD+1ZQDseUmZihitPdPAJBMi8Dt1ych2S4qg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsAZLqmfV0s2ICyJxSKS4YaEmoH0tuZqlBYB964Mh1wMM6oH0A
	CO5SCPxQYyvZrBhuQ5/g6VcVViMZqVsvoh5qwLqya8isDNzED7pNArAVqoj4WA2U1vb7gAVzE+N
	3ZbirBzHFrBtkWcpf0LaK7lUl81nfMg1c/F2gPZUlMUdJ+1ZqXjoOlVWCGd7w1/xwrQ==
X-Gm-Gg: AR+sD12oLxGo+QUzewivHTYQcF0wfEdLFBpvtZ4yKy8L1JWquB8o0xQiuURnS3fMwUb
	V6Bi9SiCsFCSTSD9ZVEahr36t0pisGV1Cwn4zkG7YDtnWUwJbvIamIkhU1wtVZCeblYriNd4ytr
	E1wHv8/Io3iwJ56cLd7uLvKQWrS96mR3oJMn4mQBATU7/yWu2d6S1dv7ABViAbMJ2wXeIN0LE0g
	ulhole6UqX06koFpHsQOsQc6dhM4AxmjjRPsbHfSVrqOKSehHmhAv+SpHsQ5iMaovGo8bBsiM5U
	zAW8Dxmn/HlH82URbpxCJf8dhNMDT9ic6OVlHpCclDhGupf625joSe3vVXWwLP9lLWEtRe0j6z5
	k0t1pkMpEp8wx6ABA+mpCnPQbQ53lDdjOwg==
X-Received: by 2002:a05:6a21:1b85:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c67d9b3996mr4129002637.3.1785045053554;
        Sat, 25 Jul 2026 22:50:53 -0700 (PDT)
X-Received: by 2002:a05:6a21:1b85:b0:3c0:b943:f984 with SMTP id adf61e73a8af0-3c67d9b3996mr4128987637.3.1785045053125;
        Sat, 25 Jul 2026 22:50:53 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13d130f55c6sm67106334c88.15.2026.07.25.22.50.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Jul 2026 22:50:52 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Sun, 26 Jul 2026 11:19:33 +0530
Subject: [PATCH v10 03/14] media: iris: Add helper to create a context bank
 device
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260726-glymur-v10-3-de451559e88b@oss.qualcomm.com>
References: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
In-Reply-To: <20260726-glymur-v10-0-de451559e88b@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
        devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>,
        Daniel J Blueman <daniel@quora.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785045023; l=2769;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=YR+PjYPX5zksaKJC/NvxWsdFNoGva+12VxA4G3rAknc=;
 b=1WKoEGXdpkaOLMFx2u8nhiqOuD2Ea0z9ysfgEhptyWVHCZPgU9u03S4S0ZfRDKDxT4d41X68h
 W4mMKZnyk1sAvkMEZSt0Kf+ZZidcB3Zl0v90e++Ng+36MVTxbRS6iC1
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-ORIG-GUID: CyuflJcPuBdwPXoPcWAXd6PWiEbhJN5f
X-Proofpoint-GUID: CyuflJcPuBdwPXoPcWAXd6PWiEbhJN5f
X-Authority-Analysis: v=2.4 cv=f/54wuyM c=1 sm=1 tr=0 ts=6a65a03e cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=11-_c5lL_m6SPrwGrosA:9 a=QEXdDO2ut3YA:10
 a=x9snwWr2DeNwDh03kgHS:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfXzlvjtXALI9FY
 tSWKE3m4pRf2+yzqddNMn/nRPRPcEA0ykTbxi/7jayhhKj6o4QCZ7kQ0OI+v/OV6ot5ZOeGzkln
 QreePm8VjruOiSYp2TeK+McD8VBj6ZRUv7gRLxkbG0AjOWyubGvjoleCnNNZjAJZlvfiG2RfXTB
 SlSwKJzn5hRDlCUj0B746Bb49dUzqvT3IjDPbG1oIcasdKn/38RzcLEVGDczR94WBKMzbPK/sLx
 nBW9e8UzXFc5A1Rdu2/k56Po0SpOhu58lJwgsw3HzlXbM8sapc7BlwAAfW6yR1B2NklcG/DzEUI
 tiHGPGCspfFoEHk9v8y3xoCBV4zgwB9xCZ3P0CdVs/lNep2i1sA1sVj43O/Cvr+oqfC2a5lvahW
 6ovcb+NyW+VJL8sRzAJZY18Co7j1YJOygrc+6tS10A02mHh9qLqLq7VPjn4mxS8bZLiqiw8TFI9
 zyvw5MvOPiqVrVsU4mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI2MDA1NCBTYWx0ZWRfX+h2TV/Q54g0P
 JvQTxjpb0p999oBs+HXd5aJorkyw7Owv2iIYRxSEQfmZqEjulqvCLmF1kzmV0WkcI1X80p/GsnV
 F9Q74OMQUYJmQLgesMwMtqI3s67IT6E=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-26_01,2026-07-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 priorityscore=1501 suspectscore=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607260054

From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>

The subnode in the device tree is registered as a separate device so
that it gets its own IOMMU context. Pixel/non-pixel buffers are mapped
into these iommu domain, to ensure they are within the addressable range.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
---
 drivers/media/platform/qcom/iris/iris_resources.c | 28 +++++++++++++++++++++++
 drivers/media/platform/qcom/iris/iris_resources.h |  1 +
 2 files changed, 29 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/iris_resources.c b/drivers/media/platform/qcom/iris/iris_resources.c
index 773f6548370a..a685915a19e9 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.c
+++ b/drivers/media/platform/qcom/iris/iris_resources.c
@@ -5,6 +5,7 @@
 
 #include <linux/clk.h>
 #include <linux/devfreq.h>
+#include <linux/dma-mapping.h>
 #include <linux/interconnect.h>
 #include <linux/pm_domain.h>
 #include <linux/pm_opp.h>
@@ -141,3 +142,30 @@ int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type
 
 	return 0;
 }
+
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name)
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
diff --git a/drivers/media/platform/qcom/iris/iris_resources.h b/drivers/media/platform/qcom/iris/iris_resources.h
index 6bfbd2dc6db0..ca53c01f60ae 100644
--- a/drivers/media/platform/qcom/iris/iris_resources.h
+++ b/drivers/media/platform/qcom/iris/iris_resources.h
@@ -15,5 +15,6 @@ int iris_unset_icc_bw(struct iris_core *core);
 int iris_set_icc_bw(struct iris_core *core, unsigned long icc_bw);
 int iris_disable_unprepare_clock(struct iris_core *core, enum platform_clk_type clk_type);
 int iris_prepare_enable_clock(struct iris_core *core, enum platform_clk_type clk_type);
+struct device *iris_create_cb_dev(struct iris_core *core, const char *name);
 
 #endif

-- 
2.34.1

