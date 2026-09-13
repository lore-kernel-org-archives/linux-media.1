Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B4213F58F7
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789325405; cv=none; b=JncCLQir1THcTA0gnF2s2lzfr0P91cuw8EJzf5AdjwZIp4On9+R4V7QmpYVoh7UPs6nSybk4RerU3vsTa3MstaR8aj80hTzNSyYJOEQ7CWnTUbDvw++5/FpjK167yhlg0jmn6n9fC3COhDsp5QhbknEDp6EL88vf16wUzKj2f9w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789325405; c=relaxed/simple;
	bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QbU4xXJTvdh1j9MynUgR0UnjTYSlXXNPzmWEpcXjlGQ3Z0HBkTrxI7Ss01/oQfBzI51vUVKkjY8GCfrlM7QExzq5qVn/8T1Y92Kk8sRSHF9XERILYgYpGKhK1qN9aQLcBFgPp/SbupZAStfLClJcfXY+Y2HqAJEmjcFAuTk9lcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=m2UDWIFh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=HZw7FVN0; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="m2UDWIFh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HZw7FVN0"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68DI2hvu2979809
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=; b=m2UDWIFhOjm+Id5+
	2aKWySIYLUdIGILBkxQu9OVYcryJbSWq2gLhzcCWIzgkFo7qz2OQxmg39wn/u4Xg
	V0gpbpSmC1ov/qeiM+Ih1g5Y+deCzCcw4TD+5dF8S9s8FUB2BnxkhCIU4vqnp/Rk
	Ife+WiOTstQFzn+yHv1W82kJuzejZvhqP/PvtMg6AsJxJ1ElA5Wjl98zlHiHGUJn
	YnDc4T4FNsZRbpGmZuvUQnb02QPVG6/MkuaO/tKA1Gos2S+sZj5qW4sXjeYwveuf
	+Kz53DzdBUvhQekUvPoMnh+iRje8zDhsq81bBCS4APoJTLEgH2VAECY2Ds1xC8wz
	5cbFiw==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gmy9dkxed-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 18:50:02 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-396901263b6so5438224a91.2
        for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 11:50:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789325401; x=1789930201; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=HZw7FVN0bXZT5gDH32aOS/c6sScRYPJ1toyyG7++ZcH8gdi7HAf5K61w5yfPUSpH+s
         ebDuTSrhPD1XegaLgfgZ7mSiLEPpX16BYaXLRRqgVxU/SUcP2agG+ZTqQmO66OChzzfV
         X+7OtMhzZNbhx+SRFQDsozXA8HlwR/8Y8J7UTZt9hH9RCQcyKVvzLb+7RLs5IeXSh7Bn
         67kd9d0ZSuoXjtPFWP+tWwP5c3MMgZPkUhVFI3RVMptXpOaOcIUXlrGcoXnpyaiRLvyS
         ovq8e4KZUjotf45J2e7H6d1a8HsObnUIwd/Bh1n1CtFFEzb6sBdPc2WdCYkDUrEy/rfb
         utuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789325401; x=1789930201;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=782d8vA5qKhzXjsmtq848zNPg/gGyTeOCElg/IKXtGs=;
        b=eJSwMPb9aYLPRie1cqoFGiW2Kj6InkLEodwP3rlUWgQu3EajmMFJiSOnrqjz02CqeW
         nghJIQq4L7nXJt68aEvBwiJRi/+uBO6we7L2oIToHvqyNhd8se3drHiG3PIKLjEpihkN
         5QUtboze32iZvq0q0eutaId35gI3mXdKXqZeFkTCuYEoZGJ5mdENoTaDDC07BzdCW51i
         lLOmNvqqLqLtFNkxasbYzk2YypTocBbMv2w6KUTcKOpQ2c0I4NiKtzWlZJQOltSoqHlq
         8LI/qlL30KiSo+d0r87GVLMubPN5YIFSEXyDsLr/+7DizTNRqFXhxwIamqMPmxI3gN2n
         V2cA==
X-Gm-Message-State: AFuF++mWQLt7pMp3GjkGLnRhEAx2JO1avb4otScVu3xV2Q+AlVUEfkZI
	UmkNYqKBGxIOuTXsTXUVVv1trEu6R96sav6jlas5uoSxBkn+jHEBAh8Y80idTVsGjLpOPmONBsk
	eYoJifaLQdgE6ZSq0j5ICNJyzRheHcMQa/Q0hFNYzVR5UsEfcq0S9wswhfIJZxvXevw==
X-Gm-Gg: AYBFou3t/m6wq/G7muV8aF7ie4DAtrHyg5+qgY8qaOk8WD2B3b/G2pkgfs+FrV9BlM/
	QUSNgWNtE4lVqYHal8eAc+bF11diZEQFw1GNdSRXYXpQEaFO8DCgwujLjWS4TlX9ZDsV4abMmiG
	EyY0aZQE0TjEe3/ZMCRuWsBM3o9PhaJ0ytrsE68/8Y9Rf38Bl8isXNXfg1mLduzOFknRDeQ04gM
	PuhYlB7MrrqTORExu2b7aajRKBfy45jRq37NnrQ/9IWekHMnFGM98k1HvgskDDmwBRhFx56EC2A
	ihXOlJ48ixhRj/kYt4KKpU2ZU9UT6AIRBofbcu3BXA4fGGebrMg+c3SO2M8gOkFFfR1vUsS6MNZ
	ecNAyE+EbnYfVruUNgkr3VIrepgzdEH44GZk=
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007912a91.20.1789325401464;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
X-Received: by 2002:a17:90b:57e8:b0:398:dcfe:968e with SMTP id 98e67ed59e1d1-39d9c22762emr29007860a91.20.1789325401043;
        Sun, 13 Sep 2026 11:50:01 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-33ba4f55735sm22473130eec.24.2026.09.13.11.49.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Sep 2026 11:50:00 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Mon, 14 Sep 2026 00:19:19 +0530
Subject: [PATCH v4 02/13] dt-bindings: media: qcom,sm8550-iris: Add context
 bank subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-vpu_iommu_iova_handling-v4-2-9b9074a73c41@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789325376; l=3706;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=qp0eeFSkW9qr12mPAr9R15JuDe58PZTGuiwGGGcfu88=;
 b=e3q/gARLkobKSIVL8IEYb1/H4SLP6nioe3uupeM+r9vAHJmujI9Vmw1i4Pn5seRY2EcbvlGKO
 0wrG7qrDmuoCw/T0vRWi1Szt39vWGCTfHJi+9qp4upYz8V7+goTvEiN
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-GUID: CpuEaQ6b9DxB_JRdUiKblxsP4Uu8G6DD
X-Proofpoint-ORIG-GUID: CpuEaQ6b9DxB_JRdUiKblxsP4Uu8G6DD
X-Authority-Analysis: v=2.4 cv=NelzRGD4 c=1 sm=1 tr=0 ts=6aa6f05a cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfX2YszO536XeDv
 2w6jJ+IAO/BufXaO8HqrSicMlTtVS44+r3XkCjdGeViGsXYsuISkM1AbuhF6Er3/J4lPItf3h9R
 Fc8hemtcubT2LmQZzpvpIz72raYKq90=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTEzMDI2NyBTYWx0ZWRfXwPJaHrEUEoN+
 UISAsYwom5BdgLVWtkqKL9YalfHniCyGvxnseQFgbaZgfWx9bJIWl+EYpFcx2kgJyxUIraYRlJN
 ofS4Wype4kaIoMUs6gTw1Ptv6mhNivI5+8K2ghRq3o/jAZk5ahO5HtOLXoB/9K6CmKxYGBiWlAW
 ak6w2Lrq6Y1qCO5689Aw+dPIiKf5eiDMKv4YlCBBB0x6gRP4v0VzFL799IpfzntyLRCrEI/Dy8T
 TxPiHsxypXd5SWPDiCFc7BVCtDjvNwLkmVYhtrC3xvZ6igz4DTjy+heRpGEMiGMaXw7DtyH+V5o
 FfoDncbMA5GNdKGQypcVwf4SDCsUXsG9lGQ7uOuboorbLIqi0bYsQqR/EgudhghwIfSlfrf9RXs
 0Ob8L1/oD9KaVL3jqZ+OTGn7kg2fmu9ph8NiR4UtbqO3aY/BUDWzWp/X2gqbLvtf4VUQQLsknIq
 hbxkPQG2bWQkEhutB1w==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-13_06,2026-09-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 impostorscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 malwarescore=0 suspectscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609130267

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

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was
discussed and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach was
later concluded to be a hack to avoid having subnodes, and was NAKed by
the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

Update example to the subnode form. Doing so, it picks up the supporting
properties needed on the video-codec node, address-cells, size-cells and
dma-ranges to declare 1:1 DMA translation into the parent.

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 .../devicetree/bindings/media/qcom,sm8550-iris.yaml     | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
index 0400ca1bff05dcef6b742c3fbf77e38adca9f280..6ee9d23554cffb30c92017ef99de15c2493455ac 100644
--- a/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sm8550-iris.yaml
@@ -98,10 +98,10 @@ required:
   - interconnect-names
   - resets
   - reset-names
-  - iommus
   - dma-coherent
 
 allOf:
+  - $ref: qcom,venus-common.yaml#
   - if:
       properties:
         compatible:
@@ -177,12 +177,23 @@ examples:
         resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
         reset-names = "bus";
 
-        iommus = <&apps_smmu 0x1940 0x0000>,
-                 <&apps_smmu 0x1947 0x0000>;
         dma-coherent;
 
         operating-points-v2 = <&iris_opp_table>;
 
+        #address-cells = <1>;
+        #size-cells = <1>;
+        dma-ranges = <0x0 0x0 0xe0000000>;
+
+        non-pixel {
+            iommus = <&apps_smmu 0x1940 0x0>;
+            iommu-ranges = <0x25800000 0xba800000>;
+        };
+
+        pixel {
+            iommus = <&apps_smmu 0x1947 0x0>;
+        };
+
         iris_opp_table: opp-table {
             compatible = "operating-points-v2";
 

-- 
2.34.1

