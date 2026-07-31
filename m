Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0639F46F4A1
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785522226; cv=none; b=D7te8DjEiHQTmIGTZajPLG0ArARx0AQy8jGB0Hz0NzSdtO4nKqDFnj+S8EGWk9tsVYCPJRv6pmcVMu7w5xtUTKgH/Rv70t6x4sYq6xmFk2kcz4/FeeGVZ1lkDOSZj2+t8eSmqDtnIWU95vL/qNR2mNMcjiaZFWHqXrtZDtsNw7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785522226; c=relaxed/simple;
	bh=FJb/Id4PuWdTFV5z2pClpqcZ5YDKvcU6rsY+dr2+FJs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tYwUQrBlsBIvSBMR2mrIGfkRCSh/aXOXvC9zIa+YihSIno58W8Eh3fDWgknN8XhWTaaCU0HLnYua44NkKoEBGiJLSSaFkaZ+PEMjQNRrUmAcZnihXZbWJmbmBxOVyhdesAy0kkTudhC/vxLcqZtzOrGzl2VU1dOwTMNDQ3+wkBk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Ek6jPxnC; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TOwNvrww; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Ek6jPxnC";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TOwNvrww"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66VFO6ho019901
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AiZMji/Cmie6rbkuz/REtHx9yzWuZPib9vzcWO+cklk=; b=Ek6jPxnCa4VaOuL/
	6AbfKvWhVUunPA1rkUBLOh5Eb8zSzAj/UP86bphK4s331in4oWZO+HlKBcFQZ9dd
	uR9zrjUC6CPlzOmfr0ATcJaPo5hNNv5btPEYEXnvxDRTk9epfaxbhGxh3bw5gqHv
	gfusFoTMlafkiUVyu0LemVDBvcUKbx6pfPCMXVaXenHcNHVuxPn4SjCY/KRvvxA6
	25AucVzFCh60A1M6a8LHM01vAOTk87LyQ98eS0sHf1cBvbSwthaCXxje12ky9esw
	QkXybCL7DGbEsx9eab6M9RGUKVOU+UzwXgbCOEuAWYYmrblYZtsi/B8ptggL+zvh
	vJukVQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frugh1q5x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 18:23:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ce8a76df2dso20208965ad.2
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 11:23:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785522223; x=1786127023; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AiZMji/Cmie6rbkuz/REtHx9yzWuZPib9vzcWO+cklk=;
        b=TOwNvrwwDuMLojWkbu7F5hhmPVYHHWdkm1ZL9mybIpcatgmszFO0kOYRm/qKR/GyE4
         2IbR7k0VCKXYKmqvDdz1/OJ4efL3NKJRsHduHZfu9D16IRq3a+y/EcM7+GkLJUWMtI9a
         mST1xXTNyaTFty9GWlt3EKT3hxvyfMD6bRI+N91p2a+YqMdM3LbME3b8HpfrXiPQyLG5
         5c3rGJqzLz03J3Fnd0cLqYbL7ZTNTi2Xnsdaqs0Y+0eiE0tCrFbAnYc9KqnieZKy/yn7
         u2RJogC9eeV3aTNUBQxv+tmKPTM6hqmYWHaZ9OzurtGyNhDBVkBFeliDNbaOIVxpjpml
         V8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785522223; x=1786127023;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AiZMji/Cmie6rbkuz/REtHx9yzWuZPib9vzcWO+cklk=;
        b=pCr2NZ8BiVGWLiAmNk8yIXif+g5evs3dTqFX28qJn7IBJwMNVJW89NaJ1I+1zzfAFC
         fB3obGBh/7RFLV5cDs3cz2jx/6hXgNJzL3fdA46Qoz4YhFhZ7lfRi2euIp8kxTIWdLYs
         ShlI9exd2QRdSp+XEKpXlhs1rGnD9laLW+SWb4ZIYM8sZYVTS5sNPLVe1pWPb0NguLEw
         tgtbf6/rb3mVYf6wSzs6zBntqbPGTGWpSmj84TiupVUB3cuEO879mVo6RmRtw3WWLOoa
         mVC77lz/mSsAeeNLkvlOfdLld1we777HxmKZ5iYHT5pSoWhP0unB5GQ9QQT+S51HNJcj
         KQ3A==
X-Gm-Message-State: AOJu0YwVO6O19YDvkYJyZHogQUtP+z/qpgowcNqdMIz3avo8FbD/U4QR
	YpJcK0Z70GMLZ/t+HZ/riQl9kqD3dwPZvjffjYHTAVcCzbe7lHdoyYX2Q+sezyFlxQrURhl613g
	kDPG09p8ErzREpkYqrSNL9NJOFcCKoxYcxC4v57L1lggNgUXNFVq5ZY44RaXI+YnK2Q==
X-Gm-Gg: AR+sD10jFxxIEJMnSr0tee9jp/gIbnR9S7rB4wbIeUaIKC16qIXCV/RCAHgHPysaNKt
	HXHGme8Hi8DT9hqpwrSUB7B5ZMFoh3uRbCipPCKFIk4bNcqN2pW3RwC8M21QSDYLi1opn3tWaM+
	/XiGGbMAtj4Fj0LcWSmo49AdX5bKcgYRnR8oGWuuZvNl6fy2yTb1wRFB5E5poVsyhxvCHlqiwFC
	Wf4EI5vOHX8+hCdUd2xPdD/DmfOKTO3HJ2zsYpflRac/rx99H9Rdk6/yht2X87Pgi7w/yuL95/f
	ryKeRs9Ig5SFVednISd/g3bFgabXtIjBstlhOsWTKVjDXnBr/ZfGmOtOcrWW/4Xdw7x9MDVEC6P
	HQrlrmzjiBxc27KJdfDYziLsT4z6ZtQzW7Kg=
X-Received: by 2002:a17:902:e849:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0522340damr8876335ad.19.1785522222701;
        Fri, 31 Jul 2026 11:23:42 -0700 (PDT)
X-Received: by 2002:a17:902:e849:b0:2d0:3412:a3f0 with SMTP id d9443c01a7336-2d0522340damr8876045ad.19.1785522222271;
        Fri, 31 Jul 2026 11:23:42 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e04456dsm7203089eec.14.2026.07.31.11.23.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 11:23:41 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 23:52:26 +0530
Subject: [PATCH v2 11/12] arm64: dts: qcom: monaco: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-vpu_iommu_iova_handling-v2-11-da52b5228dbd@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785522138; l=3581;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=FJb/Id4PuWdTFV5z2pClpqcZ5YDKvcU6rsY+dr2+FJs=;
 b=GzwtIxyM9HQbdagnC94r3JzLi0sWbX8M/LxOnMtO/5sTqEXOmY0k32Utf5VZLjqUj941qBdj/
 gqhhLp83rqzD+L5xDK6CBhWU4DKHrbKryqPxjUW49JTtRr0wxJz2kI5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfXz88UgWUvL5mq
 SelW8ZWO4b9CC9pUeoXqJf6Xme2kmnjpOCvp/fESPfj6RId0aneiLsdoyzRf2SFWl0mEEFFXYZQ
 s2g+/ViQsNYuL7OSQ1CuhqwFpXfOsD+zV1FgoEsIddv77gIoObeHnK/PV/fDVaVupOSBsovwmQ0
 6gTfHLVAFk3vLv+lOhz0GHmtbkx4Wg6NFAVssDeYh+NLMpB/q3RsUMhNDalDM9TSrKPesyikgBt
 muFw4V/Md8L4YOK/y6KEQZMrZ7AhlCAXCmdcntjWsGFwN6nki3Z6DOE/bpvecHMLyclC14ue76L
 DxASGzQoo52GTzOVV9eidiyOcAAC/sgdjmh65+ThN0Oe1c7RyACaEQ0v2chHZHJ1cD3I5s6I2OF
 q27FtCsUpRYGB75v6XMKdmntk43Apxa08DJb+YZxFOwXNQXfqwJ7zP4Ss1KxckLgZPv5uPuYUzj
 C4zYYUtky6yCXoPnSvw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDE0MSBTYWx0ZWRfX9szSYjlxufH8
 hfvhTs2RZY1fJdZme1Q/jwYr5dXu4hDo4qisuDFsGvSRXgrSp1a38slQ/+SwXdrevXD0IYkIwgI
 tZTdAhx1kcCUTp7b/paid6WwTYCBB1A=
X-Authority-Analysis: v=2.4 cv=U+iiy+ru c=1 sm=1 tr=0 ts=6a6ce82f cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=t9ty7G3lAAAA:8
 a=v0Z7u7uCyoCEKL_A5NIA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=Vxmtnl_E_bksehYqCbjh:22 a=CsAS6f0m0zARWR-uHzm3:22
X-Proofpoint-ORIG-GUID: wJilg5r_sSIN3rsKu-Qk7bMs-KqIqB51
X-Proofpoint-GUID: wJilg5r_sSIN3rsKu-Qk7bMs-KqIqB51
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_05,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0 adultscore=0
 impostorscore=0 suspectscore=0 bulkscore=0 clxscore=1015 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310141

The VPU issues DMA through several SMMU streams, and the hardware does
not give every stream the same addressable range. The non-pixel stream
is restricted to use 0-600MB of IOVA space, while the pixel stream can
address the full range:
    +-----------------------------------------------------------+
    | non-pixel stream addressable range (600 MB - 3.5 GB)      |
    | 0x25800000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
    | pixel stream addressable range (0 - 3.5 GB)               |
    | 0x00000000 - 0xe0000000                                   |
    +-----------------------------------------------------------+
A single "iommus" property on the video-codec node puts every stream in
one IOMMU domain sharing one IOVA allocator, so nothing keeps a
non-pixel buffer above 600 MB. Once an allocation lands below that
boundary the hardware faults, which shows up as unhandled SMMU page
faults and spontaneous reboots:
https://gitlab.freedesktop.org/drm/msm/-/work_items/100

Describe the two streams as "non-pixel" and "pixel" subnodes so each gets
its own IOMMU domain, with stream 0x0880 becoming non-pixel and 0x0887
becoming pixel. Point the non-pixel subnode at a reserved-memory node
whose "iommu-addresses" covers [0, 0x25800000), which excludes the low
600 MB from that domain's IOVA allocator and keeps its allocations above
the boundary the stream can address. The reservation node carries no
"reg", so it is a pure IOVA carve-out rather than a memory mapping. The
pixel stream is left free to use the whole range.

The video-codec node also gains '#address-cells' and '#size-cells' of 2,
which set the cell widths used to parse the "iommu-addresses" entry that
refers to the non-pixel subnode, and an empty "dma-ranges" declaring the
1:1 DMA translation into the parent. Both are described in the common
schema change.

Fixes: bf6ec39c3f36 ("arm64: dts: qcom: qcs8300: add video node")
Cc: stable@vger.kernel.org
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Tested-by: Daniel J Blueman <daniel@quora.org>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/monaco.dtsi | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco.dtsi b/arch/arm64/boot/dts/qcom/monaco.dtsi
index 64fc0d592282cbe303efd81491cf93708cfb75e8..ec482258d03a3b2ecc1124a3b0971f16404f6096 100644
--- a/arch/arm64/boot/dts/qcom/monaco.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco.dtsi
@@ -811,6 +811,10 @@ video_mem: video-region@9be82000 {
 			reg = <0x0 0x9be82000 0x0 0x700000>;
 			no-map;
 		};
+
+		iris_resv: reservation-iris {
+			iommu-addresses = <&iris_non_pixel 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -5403,12 +5407,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <2>;
+			#size-cells = <2>;
+			dma-ranges;
+
 			status = "disabled";
 
+			iris_non_pixel: non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				memory-region = <&iris_resv>;
+			};
+
+			iris_pixel: pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

