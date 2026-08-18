Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0FB13AB260
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787068484; cv=none; b=O+Q2AG+g/hguH06iSm2/+tWkGXEo33u2TUokF7ippT/hygXdJk/ahjuaRinvNEBeT2Y0rchq6TYomIzqLcPrhETLJ+endT8WtRmtBMb2WZ4kD1F+SAvHyXWGtJxr0pOcwQPkdhaR+0wAkYtOHr7M2ZSpJwbIi0Zu0jlc1cfRLcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787068484; c=relaxed/simple;
	bh=0PqC6+pA+upeSdG9qohub10QOHiozDL+AqpKZ0qsSlo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XL3Hi6MLHP/EMXXbby/r7fPe5VS3CCYUusFIV9eNhn1J5kIg+BhXHI0eEdtXx9bEnwEhBN7WTY+srIPuJwMqfJsY+zrjjsHOxFNSMKVjJMRMLJpXagezeH/5lNjq8ZRNX8mJI2JsOqBqe9vLdcT2TghEKIji3BHiqYuFIwLZLdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PNFH0FyY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZqC6U9DV; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNFH0FyY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZqC6U9DV"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67IE0jxK1104031
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=; b=PNFH0FyYDp2KGwtZ
	noL4J5gY1SUl8W9K9KAI3DbwVqazMzbH7MEbGqch+zi9sBaLpa7jA1M538J9YMPn
	FWY1J0cdn/bYLFlB/6YtChV9fu6KYhiprRAEQkFO95CJ+osL2FHWrP1jTM/K7axg
	aynDkWLJE0i2Fnq5Mw2g8B+OkS94odqCiO3BTym4c8tfkWrM6Bugi63tCmstlpYr
	oeCQ6z3GIiQUBFl71/7EnUiSw21jKYLAhyJlEIYase8DE8kib4xYXEm9RagAhbUY
	ofYKiV54Hwp3Lx1iOqBasIuN7DmiRtb4V9LgmSbI/XgnNtZ5bbIqP0UeSDTZ0WxM
	4DlU2A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g4eqtu7m7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 15:54:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cbedf6e8a42so6084732a12.1
        for <linux-media@vger.kernel.org>; Tue, 18 Aug 2026 08:54:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1787068481; x=1787673281; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=;
        b=ZqC6U9DVMWSZSQKHkJ5e5nu9OMJ37KdBy4es1ypg3rzxWGWSiITok2L1iMxxGMPPHi
         AbRfYux4eU9BDlGO3mrDVe3nvf9ynUb9B/eE4T7vopB7gswUkg0LtLr8FkvpGuwzDRxK
         Z8zpZEn1YeXhiRZW31PAuzUON35GoC8z4uvfWIA1eZZFU+um2IY9S0qx/V9HQHWoDRGf
         Qx6caTiRHnHKDSPrqAeWlQ66XwhUvu/vwps5SWW0Y719wJs6RHYoIx3LAFPYh5WRpizE
         U9fETbWVz6r6lo5ldMnzjMtAy10L8n5+AdINMiQILBxBYmTPpMYNRYeHT1g2H188mX6n
         oPIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787068481; x=1787673281;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BEW+CIRrZQp0gkZZZbYGm+dB8HccqIdZMRtCd6mN3HQ=;
        b=DJDgrwq9XEmQhQQLjhw9FLCAnaNNXO0QIS1eV8JcoeY5J6ui4NC5WDQvy3VA9WNG7R
         DnSfkNCjREQWsBSkSMbHJxwhgBb8va+dcSHMGE014Fnzp/gqeudYboH+lHgbaYXTLmma
         MSTmjc3aI1fZrCrS5L5n4M+Bb8Wz7OgZG+YAE4k7Jeh+Rjg3WPcUygNLRX4TNuqYgW1L
         xogyn1Hpe5YLVNfxZMR+UGFjr30FwOr8ctMG/eZz5jb/sFlR1/40fhQevQVPqMEAHWV/
         OWMdY/uDwjXZ9G/9U7DG3dcKtIr3Zh7XyoPBpcUiMShP7rjIxi69VVlbyur1dMpviUBN
         rXiw==
X-Gm-Message-State: AOJu0YzIgjp+QvDtuoN5bB4WuMomAkbpy1EP3DCkJM38nl4KkS4GZIhr
	TCpEdi/nQ7ZpNuzRPX7asnzXE8izuHztB1TbCs4RStD3cH43FtJP65AgooxnvaTqddiPNq3G1a2
	r/6T2W4dUtjX7Gd+hagy5mYxs66wf5ZifJNvVI//Uqqn8owrXCZHsIrrUDZVneHjlxA==
X-Gm-Gg: AR+sD103Ai1/pNdsGabB9JZiHY7nV70X9tfrICVlpBv5l6vM9u+np+wfdWGJzznuTCz
	+x0TxGJFaQ291BCYH1lBr2mFCfoqORSU3AELfstChMMb7SnN5RuMsO5/n1mpCklSOZ8J4FdXckO
	JU+H7tuIBx3RDjb0mpP7gQ4LivjY1DivJaCqtGqKoVmZEB3qg8fFVsSZO4td5eMmWdoBw3LKi2v
	lopdhklJPb3+iqf0Zqtr4xk5Jw6klXUpMMQ074MkOX1ASFrumz+QPa5bbZhU6/mICptHiuAW4+l
	8yfXuDhkANlsv84kIfSwKNoMNntkbIPjCZ1P8qjHSesiN55kUpFP8uVMZd9vqLFWwhrj5Fv2f/x
	2sOPDNyjn4CzVSS/4Q3B0q7VDkTFW9EiQ6A==
X-Received: by 2002:a17:90b:5645:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3955a7f8e97mr13337468a91.16.1787068480661;
        Tue, 18 Aug 2026 08:54:40 -0700 (PDT)
X-Received: by 2002:a17:90b:5645:b0:383:5a16:bd70 with SMTP id 98e67ed59e1d1-3955a7f8e97mr13337399a91.16.1787068480246;
        Tue, 18 Aug 2026 08:54:40 -0700 (PDT)
Received: from hu-bvisredd-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39531fbb41esm8877721a91.10.2026.08.18.08.54.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 08:54:39 -0700 (PDT)
From: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Date: Tue, 18 Aug 2026 21:24:15 +0530
Subject: [PATCH v2 2/5] dt-bindings: media: qcom,sc7280-venus: Add
 dma-coherent property
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260818-iris-fixes-dma-pseq-fint-v2-2-8dc8c4b3880e@oss.qualcomm.com>
References: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
In-Reply-To: <20260818-iris-fixes-dma-pseq-fint-v2-0-8dc8c4b3880e@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Stefan Schmidt <stefan.schmidt@linaro.org>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Mansur Alisha Shaik <mansur@codeaurora.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>, stable@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787068460; l=1821;
 i=busanna.reddy@oss.qualcomm.com; s=20260216; h=from:subject:message-id;
 bh=0PqC6+pA+upeSdG9qohub10QOHiozDL+AqpKZ0qsSlo=;
 b=hCNhAws51z6kUkElVeslS+xeCq7dkznJyZ8l65o5+9B1qAZyCmMoFrHjgijblBpo/C+hjCyK7
 mxKvXtn0zTOBJtm+NnFXX8nfq5qAU6iroHVxbIOZfuMu6ghMNEg2cMV
X-Developer-Key: i=busanna.reddy@oss.qualcomm.com; a=ed25519;
 pk=9vmy9HahBKVAa+GBFj1yHVbz0ey/ucIs1hrlfx+qtok=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfXzrSM8JTbwM2o
 u3ymeM7KdHanmoaw+TqJOAHzSXBVcUTSjHJYmaEOKQ2R9SaE1Ypk6qXGpkTKmdT/Z8P36vgn1PK
 /+SQH8/7CXYWKljxGmidR5jcPwQ15Sw=
X-Proofpoint-ORIG-GUID: J0hPSqWWaJilX9KrcJJo3tRtkKoDz4Al
X-Authority-Analysis: v=2.4 cv=UfFhjqSN c=1 sm=1 tr=0 ts=6a848041 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=iEGguDXwTU0lvcBalcwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: J0hPSqWWaJilX9KrcJJo3tRtkKoDz4Al
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODE4MDExNyBTYWx0ZWRfX7X4LFtv+38ce
 UraCW5SbD1YoX4rtcmBtrNp5sSO6gGpApfQL0tYi5BWaQv8EKS+hO0ypQOcHyvTtLcLC+hZQdR1
 jtLBGV3+WLieC+h2fhl2Rt624ry+0+t2PGjwkjy9d5nBWAZycahu4CNV22QFZwR7N2Rhq412ALA
 HQwDu4vCAcllpyRkA0qc4Sk67iBBL/mYDBfBLFqACwWXlwmB6FMMYi7Ecw41Bfw6CmTaupJvoFH
 Y/2og/oUPuJcp76c5IeeMOeoQnWFIyQJpk0L2QW5ryolCju8gu7BAqx4HpzQbgS/0DjuUC6a9/P
 XPLB/1z6/VfXt3JV8zv0O2nuDSQTO/MYthbG8qLR8YTc51rCyeRoxjDYxoyx3auAz3gKysikme5
 VY7KwYB2mBvpErhIFlgIp00alZ6wS0WCZcbueoXP+kyaTUOvqmWqJuCwr7sLRLTuNB8p0Lcl8ck
 Xg76XcLfrdhXilVa9rQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-18_02,2026-08-18_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 impostorscore=0 suspectscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608180117

The venus video hardware on SC7280 is IO-coherent hardware: even though
the driver does dma_sync*() calls for the input and output buffers, the
venus node still needs to declare dma-coherent so that the DMA mapping
layer relies on this hardware level snooping to keep the CPU cache and
the DMA buffers in sync. This avoids the unnecessary cache clean or
invalidate operations performed by the dma_sync*() calls, which are not
required once hardware level snooping is enabled via dma-coherent.

Add the dma-coherent property to the venus node to describe this
hardware capability.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
index 9725fcb761dc..cc31f3ba7e7e 100644
--- a/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
+++ b/Documentation/devicetree/bindings/media/qcom,sc7280-venus.yaml
@@ -42,6 +42,8 @@ properties:
       - const: vcodec_core
       - const: vcodec_bus
 
+  dma-coherent: true
+
   iommus:
     maxItems: 1
 
@@ -85,6 +87,7 @@ properties:
 
 required:
   - compatible
+  - dma-coherent
   - power-domain-names
   - iommus
 
@@ -119,6 +122,8 @@ examples:
                         <&mmss_noc MASTER_VIDEO_P0 0 &mc_virt SLAVE_EBI1 0>;
         interconnect-names = "cpu-cfg", "video-mem";
 
+        dma-coherent;
+
         iommus = <&apps_smmu 0x2180 0x20>;
 
         memory-region = <&video_mem>;

-- 
2.34.1

