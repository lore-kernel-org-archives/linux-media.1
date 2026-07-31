Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 132E446F4A3
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522190; cv=none; b=i3+K/qv+gdA7xlN8p3GOupc1kdWkknH4BCY1s+mSZk1Ks81XKkS5+ubcWsyFgKzgwLPk1Hcz4aONZlgy/X6D8yJqaKszUJi8q7ka3GY6QGCpIhPryygRLbTeaqATIIPW6gwwPxlUT8N9t2b6UKqbJVismEafWJFK/tRMrXf9SrQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522190; c=relaxed/simple;
	bh=ABWnGsy9J/aBpR3bz2vspwGz7dNQEU9mA02+SM6zBCk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Mh/DURVlgOnfsvzYAoswDVinQVVpr9tUQvk96ORJHtilcAWZsZZwLg8rdNjEpFSAzPR1HpUL8hXXr81JsvLlCniFvwYJqPY34/cqGITSAMUR/z/ppWf4QPLEVxRG2ftc9dJrApa+LYmUay18cyvNxo+pNGrXvWoDr2e2Y84YB7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LhxLBs9W; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=easArrJm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LhxLBs9W";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="easArrJm"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFOFQY107588
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=; b=LhxLBs9WJnlSuGS0
	uk/cmOeGQ1McHr3PHiu3Se2jsuayO8eVU1ejQ95m6wqr49nNIc/HkGvxOwBuwmb8
	mdYle8x6mvIuvWylhFX9vi+1ZIKv/fXe5SUbAc2kQ/B3lLnOrpbtXJIQpCb5w+MJ
	IphlJlJgpwXBrCVMsAlnq94mfQ1y3QOpGzRXg1nPB66pAtFwgc600HjqhKPezknu
	hkOi0N/lmtc45YbaYeJerk1WJkcp47xGwuTSW6gMKawzS5LnLYOFvVaLm5+XzDj4
	xO3MO6fzJbk1A91b/QC0YYPDAfrLLvpwnkRkfEZbR6rX8l9hrEmvYAtRZqoL4F+e
	LIBopA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fru2u1u9e-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:08 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbb6433e9d4so1535325a12.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522187; x=1786126987; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=;
        b=easArrJmmhOZIgeoW0K3EIsarpwxqqHyG41X0izIl2uwEF+f9nBOTg6ao8OEwcSafX
         VYlMuDKBgLf7ykLQn9TWTllQFRwStSokZV3xrkGfHC7+ZVj7bieptafFIIe2CUAkq6Mg
         y14YhVL/Di8pj3OvSh2ciPpWEDx8RzIlC/rbl3Ebgv7KPjtFT0ykZTRV2VqnVqU5ENBM
         Iyf62rTomyiBpngtAUclacbCbhM0DdgIIC+N46SyD2PmNElDOeVlHRX1gxPreiUg0wRv
         1BIWOg/9BfA5slZ0w5r30c0SdIyLBEN9HiXzHO9I3GeE8ajeXCF7jVUqVQtRDhusFft8
         0iRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522187; x=1786126987;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gyNScZIZF6mo/dgFtciHSO1E8I13BJdXx0ih4EmXKGs=;
        b=lc3S4j8/x8su78sG7eOfkRLm45Cuj9maPCFWouBxKiTDiW4FE9+10IroYuHwix3ZzH
         oc9lrgY5dAzIbNBPYFWhesySFLZj+6T5UGIE9ao0KpBcwBSyVCpKxRToM9f5QONdH02o
         LfZ0+fz6I3A5EQASgUWUdBhxUGiytKBP9OBm0kdc1st/eB/owjbNmN95uSxpFII3Zfel
         5INco+lWwSccPjkjMjg1SNTYjgsWxj8T8zbOdk6X2zHh8IrIFjQrTmCgQb0lvmgJeXoJ
         jhzmAR1gppENbF3EWQFcKM0xFMVbemeS10hOoAmLLAaenKr+zic5wx2hQcsvaT0n4uza
         r/5Q==
X-Gm-Message-State: AOJu0Yx5dZQwZl8yvU6zTCtVamxNzCTVxEGfGJbF3Bckk11u7lBYl2vg
	S3p8rchUDysMMARwC2r5qeJYmZ5frcClA0KDUj02UIL5geZwgs8E1jmeXQjBJwLBIi5nTyIGdYt
	87uxkABVLaIpo/4s3Z3TB8lOz8B2zeMt8k7XAjfVPCDdbg+QBxij0HzNjkWRPDmw4qicorfcK/A
	==
X-Gm-Gg: AR+sD11MtLUI2jsf/s2h7xMhAgEm2ESENZRvkEmXUSFtfSMUpF6m0DjIOTlHnfTDFK0
	goYiSXVltUdTz7Nqb+KDeiFhXNnyuHFfUWiINONluJxjOWD8hSE7iiOf2uSZBkhfGR17hHwfGF+
	Yp1mznzcoYao4kzd7lTle9YbJaqAmDBq3Qq0eIxvRVnCEJ0FocZAK9s6R2J/yF1nWkkHinDHa9B
	nrYjfIU+jYPgRQ2BZ+NYtMEp+rPvnArLbdDxrXWDcEQGKgleHzTqTRJXjM3nbXv9UP4jdGbVhro
	1MM0rZ5IfhajVo4FGvGcqsNBZim6CAERgaIX1ZI4gs5+CSv1DDooSimaYF7JE/ftAe7pI++tkWi
	fxpXdhllzA/R2to5JfOdaPp4mt7zRi0T58dk=
X-Received: by 2002:a05:6a21:998c:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c92a7bb473mr770791637.36.1785522187567;
        Fri, 31 Jul 2026 11:23:07 -0700 (PDT)
X-Received: by 2002:a05:6a21:998c:b0:3b4:b276:a789 with SMTP id adf61e73a8af0-3c92a7bb473mr770767637.36.1785522187182;
        Fri, 31 Jul 2026 11:23:07 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:06 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:21 +0530
Subject: [PATCH v2 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-6-da52b5228dbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=2020;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=ABWnGsy9J/aBpR3bz2vspwGz7dNQEU9mA02+SM6zBCk=;
 b=BBD6R3QsRS6fozOLoKfFWE3T5NkFM1rlNqFYFJdcwqrSf2O+PaAs8EACW74TtFdD48K/MoISu
 8Z2GdTXWrYAAihSsbVdpgZG5wgdUIfHxNeDWpDYE992i0IdCOwIf9mY
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: GrzEmmNuuKWI6net3ifYHhwYGPG46CN4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXy8/vdU/eZA4V
 XvADXGSs8u+U6tg8nAwWj+vt51TiVExr3oWNT7xQQqgkUo+FzhM144pV4IyoSqGsthVHIF1Onzs
 00zMQFDW8fUsXWnZSFFHLSqClS1Ckxs4zhYUnYsBmTCnFA5OGVnpqEonxmWdw/YiDkpwCDfbfgm
 ixnvI6RiihDDRmLQjepCA2Ndkj0RMtsSR1P8TBT/EYJq77iUwG3wYdaY/MTn1KfzvI5VS86/NQm
 fbjpGe3R2hTWJLr48apMgdGa1x79IvJQ3ISX4Trv3gpl+F67Od6KWeAeL68Cc48qroZNhfW/phX
 tCdGiE3CkLvyYFn6r9ZilwuVMiPFERK9ogx3lMgP/NzZ+KFN1PK7jhYJjQXIF4/kXzvZY5cQ5KF
 DrKQPiK9f7cQa4QIguNuyaDmP8eCHfGt/fZhGQxsT89Ee7NRkfZVzjPKJ4L2EpYrQt79bkIaF+Q
 P2UO7emqzVbs/qmXf9w==
X-Proofpoint-GUID: GrzEmmNuuKWI6net3ifYHhwYGPG46CN4
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX6BWdb3BO5GHW
 HZPSZTqi6I3cAmbOVwwq88GgLScl+pz1gGqpY2FfF1A5cwxUDvkUDSsPIA5hwNfYUDy+i0xWaLr
 Zsvwi+guT4xOTyT6NSQoQr8UgAdcPiI=
X-Authority-Analysis: v=2.4 cv=b+uCJNGx c=1 sm=1 tr=0 ts=6a6ce80c cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8 a=rujDjMnGqJPd5R0KWf4A:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 bulkscore=0 adultscore=0 priorityscore=1501 impostorscore=0
 lowpriorityscore=0 malwarescore=0 phishscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

Once the streams are described as context bank subnodes, the "iommus"
property no longer sits on the parent iris node. That device then has no
IOMMU domain of its own and never performs DMA directly, so calling
dma_set_mask_and_coherent() on it is meaningless, and on a device with no
IOMMU it can fail and abort probe.

Set the DMA mask only when device_iommu_mapped() reports an IOMMU on the
core device. Platforms that have not been converted still carry "iommus"
on the parent node and keep the existing setup. For converted platforms
the mask is applied to each context bank device instead, in
iris_create_cb_dev().

Backports are intended since the first DTS of 8550 binding schema.

Fixes: 41661853ae8e ("arm64: dts: qcom: sm8550: add iris DT node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 2594f5a67378af9a547f23dec2d2c057506dda65..c40c4ec44e83e4aa212b58a19b64d46a3d9f16ce 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -310,9 +310,11 @@ static int iris_probe(struct platform_device *pdev)
 
 	dma_mask = core->iris_platform_data->dma_mask;
 
-	ret = dma_set_mask_and_coherent(dev, dma_mask);
-	if (ret)
-		goto err_vdev_unreg_enc;
+	if (device_iommu_mapped(dev)) {
+		ret = dma_set_mask_and_coherent(dev, dma_mask);
+		if (ret)
+			goto err_vdev_unreg_enc;
+	}
 
 	dma_set_max_seg_size(&pdev->dev, DMA_BIT_MASK(32));
 	dma_set_seg_boundary(&pdev->dev, DMA_BIT_MASK(32));

-- 
2.34.1

