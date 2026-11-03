Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720511;
	b=PHf7I0c8I4a/JrNjBNIJ9hFffi3ccLry9M7epY0FlmC5I++walLBt0Vj/So+QNbaVBfV
	 5wtQS2EK23iZu+7nH5MpTmIvMVjAzErWMYpxTqNJoJ2fNwhv+jb3gRZUZoyTI4s3ESKqs
	 IJjnXj0Hn8CIFO8GdM+wH5D2MqPNVVhETbhmCqXJqT8aAHoE4GFTf8QD7s4U2RYhVcNUX
	 wPNhZA31M40ECxHy/YQk8c/+PBHy152ZdqbGMSKhARCy74eogJ1Rl7IFVqTq4+1K+dOPF
	 JeODDSygugbqMEIkJuf0AiMhVjrZjMMl4/bNB1BB9eAHXuzT9sleIY/W7QU3Bdqxa+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720511;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
	b=mpUhn3VBhrvIvQplW3ukatn6PiF9sYf9cDcY/yj/QuCeZqWZWRfWx7vOfhV7a5VHdwyo
	 vAHwnSoqP8/DAzgHBh8l0slFL77hoPm0+352hzfqwvttHbwrCcQ+eOj7KlV5gaccNIIqA
	 IVevtqqmk3sMqWuvSdbMWwDl4i1CFYJbfqk+B7G9566VOarPT60CVoxcSlB2thl1tS7CO
	 jT6PpeMTBYlNjzi/rdMY4lQ6NEFZJVk3oiga28BG4zq/pI9QuEAaP4glNCWSSMD0+rR//
	 mu7h85sGTPJOCnLTpsXj1LOaH0Pjpz8VroNsxoCPHfFGci+5pmF1UKfrQObR4zxo0MQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="OjFr8S/0";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C34EA606D818
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:41:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C34EA606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=F9wSG5dE;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OjFr8S/0
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EA0Zq2526978
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 15:41:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=; b=F9wSG5dEKpdIEth2
	C3tUd3vEnog5iHrY4gF2B3HiMgYO1091yUEnHUHigtwqphzY4Qd4QeZysOymMxDr
	mIlEnjQ2xOPUBvZ4rl3krErQqLahX3WjiWdKo71YGSePS3WAkyIsZinepM3gBeq/
	W+Gb6mn1Xhdp2iifkulbF3I2CO1C6TdO8xGVhXOr4OKjWz2dVMVs0r3NumQdUsx4
	qzM/yWjVpOue6j7+ikyTEyNuKRvvrho6OWnGlFuDjlpKy9W+sZOvcs83qzB0nN62
	6SABKFaLXR9LZPicFuWEGymkuXeuF6AblPLqZHq5c7BvFP9MIaEP8cPtmOQm209X
	ahuieA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq7ycts7q-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 15:41:49 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1b0d864826cso7814735c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720509; x=1794325309; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=OjFr8S/01DXfQRQRVc3jhScnCTXheXTndxQ1KBkbXTnXETGr8reGNC8WI6OsRCQ0TR
         yaeYVcoVV8LB9abdUkTYSHHZ4yoj8S55n+o8Z0i7+33rwq6hiGcXEcoLz+itvD7tPQin
         zVPGMZ3T1bOMDD3eKGUfDTLLME9tysRrnXttitpD+bFMKMHQDQTI4+18UxIhgTu/TaEj
         h5m1i0k9NX91UltuUlNqWiZKw7fFD6I7qgHuFddvzi0KitqvEQ8YNkaFMeU4yW+34aLr
         ci8zb+hWUUWRjMcBPv6fNI+Gso+5zVB4VaPMenBmQwrVNNjRmkdgpuQ584k6b1m33dhF
         h7NQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720509; x=1794325309;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3ia+VFa9NMumrt7e1zs403nDUUizJyxMYhZDrStYchg=;
        b=w+g2OacepE8WKvtBD/aNfc/xm5cCo1WwgWcXrufK17t9qc8T/RiJBCMZL2jaG0p1bZ
         m5WTS5Z+14OP6IN6bE9kNP9Uj5OR8W5zp7mu4GDh9xyiSTenmi+KLmO48+l+im9miV1f
         4WfNrXPvZRPEchvnXp7YBneBDgYuXLVSntzipF/++qc0+sfNXGJgFLRlm3GuvvGm6qPz
         6RL6tgNtYvcx2DhHHBMWIXDjeKyQ17+njIQfUtqiJyWn6B6PSS33FYYuz6NXt0HBrb00
         SSAxLIHrVhx8apSe2S7sPzAPx1tLh9Hy7y1jL+3v60fyrXXoGOKyZUTa86Va6IXhV0Ca
         D1PQ==
X-Gm-Message-State: APuU4Z+t+Xq2W3OVw0qsb2dFNB7DCS1iK0CyI9UBN7Ns2ryBoxFJgc+N
	6h4YoQb5jkArFcOMW4r076Q55biFO0ZJwKGVruXvPkTw8ydO8/Za9dDdCoTOMzwuXrvk3LYA5w3
	Gu2RcBHdAOPNd+jtWSklVT1vRP7rVedjKwqrG2dej+N0IKBuQG2MhH6NBIhpy/EUMiQ==
X-Gm-Gg: AYBFou2H0Z9/OuAxt1kWdFt1kPJ3+xTkppRdSdyIxOwqwcXJBxwjZYiQXenswXqNyJR
	snOS8iUGX4x11lAVbJ69a5aSXjl1ZGC+Wy+hfaO2aTBSz/FNjLMbq8wT3ywIaTcO8Al8c7FWPTj
	OFkvi5+JTZ8X7AyqjrQKgT7cGDnJ1/OG3DpvyALzZltViNK+Jci3QNFcRVGeS3qMCdbm1CVJdEa
	FJo2QEa+W22YX5+42oAiaz7n2ST9I9ENaZ+LarDSKlhgU3h7CjVw7S4z4Hlj8WiDrLvJLTo/jXN
	x5TEzEY04YavlYi1jNxoMmAZrWUEbmG4zIKp+wo6EutAW2+Gz97dTnC5xFIJBL51r0xwKOFzw7u
	3YytHxBmyu6ocDGb9JpbfhEdDWwjqakHNkJplmlYU1L2IuotjkBDw4wDBYtsNEnQJu6ryvaA4YD
	DzLqRenYl+
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398066c88.46.1793720509201;
        Tue, 03 Nov 2026 07:41:49 -0800 (PST)
X-Received: by 2002:a05:701b:4589:b0:187:eb7f:bb4 with SMTP id a92af1059eb24-1ac5d88c4e4mr20398036c88.46.1793720508692;
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:41:48 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:37 +0530
Subject: [PATCH v6 06/12] media: iris: Skip DMA mask setup when the core
 device has no IOMMU
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-6-e4b6ad864f8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=2411;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W0ox0/dWEidqny/Abb5ZwObY8tZBEzErRhhIXnuHgYA=;
 b=9TO+AdFMbYzDAVdq+1BpxAN3ilpFQ74ocuffGj1Zul+ebvVRZs0O4uA2lZHUacaOP1R2FAP+f
 KlGURXMhJMGCqLfj4NNS/i+tr4A9RtfEdMjLESn57C7f1NeaTbBejAp
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=V7foQuni c=1 sm=1 tr=0 ts=6aea00be cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=sXzWO4cmMkpvoY5_b44A:9 a=QEXdDO2ut3YA:10
 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-ORIG-GUID: EPyw9UYKAV5jghtlHNF3RLWD2J1g9HK0
X-Proofpoint-GUID: EPyw9UYKAV5jghtlHNF3RLWD2J1g9HK0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX321tCaDrMYKd
 yvG8+NWr9mWFVY2BFjk2RultpTpV4oEfDkFtSFNRyCfo2l7nEnRyDm7hlnPep5nEe88dD2l4MR0
 u9K149gjtKQ4S1D8pFwsGBuX+m+TmT8+lquyGG0VRQ6GqOULkwCJnPfG8GQxCSzKctVgR49AInR
 Fncr1hkgaFhQ19UTEjshmgDKHGvGjeMpxo7e+Tlj79Zjv9LyLFZN+3XNqOdDusBf4vJIQRm34AX
 Pin4ZqNa10E5RmR1OAbAi+HM67TOVzLC+O0ngDdFLyrXHqqasTTrCLLHSU4HnJJhIrKycmV/9jg
 cjl/1G5F/nVb3p2Cp5WGxJgTJHKOoXLYSbCRvEfQA9UR+fH3hWlZBvL6kKQVsCcnol5B14yyUfX
 AHTdKcrH6NZ8XQkoDjQT2RJjSBUWegsecM97Wu85AuepXxNOq5jihzx80caDzMn2aQvtlEOAcjs
 55QuNd+pJSrkQ8k0MTQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXysLNbCcwINhE
 lZmhBwj83e2CnG4mgjgKU5GDV6JBoq42J3fkEKO9pJ+sPh0sx/5KpK7j3dPFHUTsr/OLcudzvsd
 C86ysrjRQ8BQuV1Om9htTXFcb5nYm1Q=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 spamscore=0 clxscore=1015 bulkscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030062

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

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/iris_probe.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index e659461716ba46c84d616b41f477b6250d46bd81..6d7147d73d40b08cbcd55ea5a19ec57d0738abf0 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -154,6 +154,9 @@ static void iris_unreserve_iova_region(struct device *dev, struct dma_iova_state
 {
 	unsigned int i;
 
+	if (!device_iommu_mapped(dev))
+		return;
+
 	for (i = 0; dma_iova_size(&iova_state[i]); i++)
 		dma_iova_free(dev, &iova_state[i]);
 }
@@ -167,6 +170,9 @@ static int iris_reserve_iova_region(struct device *dev, struct dma_iova_state **
 	unsigned int count = 0;
 	int ret = -ENOMEM;
 
+	if (!device_iommu_mapped(dev))
+		return 0;
+
 	state = devm_kcalloc(dev, BITS_PER_TYPE(dma_addr_t) + 1, sizeof(*state), GFP_KERNEL);
 	if (!state)
 		return ret;
@@ -433,9 +439,11 @@ static int iris_probe(struct platform_device *pdev)
 
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

