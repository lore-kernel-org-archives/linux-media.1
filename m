Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720545;
	b=tSK6A6BanhRO6Ls47Rtru2OV0XA3ABmFd/H7BsjMvJv+hQX05cUs+gkA1kExGpZyeSaM
	 jx6KLQrCWa7B3E86jtWt+7ZryF5GKoulDR2ARLIhvY/QXOJSQ1dHM5TOpRmb7Ky35i8S9
	 Nhd2T8QIRVzMRKhZ25n/hHEAcAHBhi8fhvrBYPSTS31B+0t0ILm8UmvJQjpwTangeXdNG
	 2vjKktKp70c4yXKp5QrGTC5UFIJj5RrGwz3mA2DLcWZmQnp7i5fXNvEGKUHhrYcb6oFgz
	 kK8kMehYw03nOZKjgQi51H2XX+oefMgFq9/ANk0+1ZCD9JTVlcEt4tVcrsEzD980Ifg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720545;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
	b=oQb4S0nqsu5RgRTf8R1CJG+NMD2C1OB3ZeHzsTh+yj7r6hmwmyqp3tfz3zFca5rcnKyU
	 mygjMRuwKZOdyfMEH1YkTFa6TYXUPJVbQ6Tw9r9VDo4g7ZgPZjq1claoOQtFNae71Wc/c
	 a+FBl/fcbSn1Nl8YtsQM1dQMwkEEMd9/hoc9DZACQsuF/14lf9MeRHLpatwAVKObFMIFp
	 fSJonn/hnaRo6oeK8x9HqyQJTcmdlzVHYPDiwsEHs3TSp49bV6rAs+dIOESerf8aPRfIk
	 UyqEiApLtRMoyAEfm96VS8SNoOn5aN+DTxZG2JvdUiaOwK8ek9sNOfJdKB6SAByLvDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9ktrlQ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gl+Fb5MA;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CEA4606A32D
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:42:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9CEA4606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hl9ktrlQ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gl+Fb5MA
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3EAL2V3049176
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 15:42:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=; b=hl9ktrlQhclOT/P9
	TydcD+xgfIcw1EmQTPkrj5MKsewytIU+HB2aQnVvyTKo5wri2v4kc4z+9GfEgQWu
	aVu/9g/+zo+Ht0ED5FCpRlcIWMzbcKMzRZnDrGwd+ephat3VUk5vBsiw7PJceBFv
	db/cxgouH0QJYHeKSxmtyS6nUObLRsnVKVtZV70NzVgFY2W6hPgD20rXG/DlkxWE
	4Wy4KNFewqLj6tMyW9puzFe89lUEH3bQojcwa1P4K4CXxfUc0qaC1m4h5jDHmE1b
	V1xU8VE6veH7n2fbat38CUiiiz7oKunIa6kf3wsivWp+ve+5PHhkmx1AmAcS3PhJ
	Sfozvw==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hq4v5ke32-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 15:42:23 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1aa0fb7f157so6601981c88.0
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:42:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720543; x=1794325343; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
        b=gl+Fb5MAcoK09QwqafIvifmXuQLFH/4+lRtD3mRLkZsfQhCk9IrGHiQeXC4PTzERNq
         dxZaXtymYKkX7sGtC/2pFE8V0iWXMndgl4Lx1iOFJqKyxlpIGJMK9V6aea7W62JmhAoP
         fsBfqaOfrm8uz0Nks1AMufUwQEqgg963SiohWkdCEArW9YKCJL97+uho0nT9pEeW2Ggq
         1qmhc39Uy6WysVOZYuXMEQM+p5WuWeIr8UU93MdeJekFVc53bJBmc3odx6oXcy3ruiT9
         MkwOUINGANrvSKOhsTajWQLVq0kWCF+CclhH2BuDVcCqykcFCkgimSWg1eQFANZfQKuJ
         hVSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720543; x=1794325343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LYpvh5ABJXC35dVqO+qvN69PN3JpK9KG3nds++Rp5lw=;
        b=xJLb8u8tmsdz4NA8aXuol4t36/+ospWEM3t1rf1iYrrqEaKLREDGcEbzqSuW8JFzGb
         abLxWs12O7+LzE2KXhQ8pbr+NKl9LJK1OupQwSquPFxHwP6NqhpgjQfHQyTqYQ7y/Cq9
         I3/wVan4iIBxs15kHleiEwmm96w9DjSi4IE56wWHbU53YIhfGtmvJluzcVNfcjJA0DRA
         bVI4Tkq5QPlMOJzIOKQEWW4FAZqYGbBwu/joL4Gq0tybKMBXdNxy6nEwq7bcTrEOHB3C
         wt6qyoFsqOfofoYAk8HlKauozjjdcTNmn8F4QXgSkUkeGmdQEw+ljlmeO2jKOh4/1nxv
         XvRg==
X-Gm-Message-State: APuU4Z8QO8CUJi/VydjLMCoVHFSdsAPzjqvt9jvJLGArTR9dSZTEAYIS
	j7nQNidl6wbWvpWDAwy2nk/sFfLOM84G4AAzXPvv43kiMbbtITeNwPl3OQTYfQbtFPVCOQIkJtu
	C7lEjuXqEmTILVTonfJJ6sFmwE8wCtgcJwIUBeod530nb2xX714KIMqNHC8oK1EUAdA==
X-Gm-Gg: AYBFou0DV1qvYTOkUHui98bhEQ6aJxd1v3NjW856qbsUas1cXIIIS5v9epaxxChFxPD
	J8DPmgfdgcy6FU73rJh/T1o6LNcyaH9xV02Db1ycAcpsymtEuVf8+aC8xDB/KhQ1yAVr12Hc+6V
	ZXwKeN3/Pm2v2jpv9D8/tn0T+PeU+COk2T0Py2eMBC1nSqOBs2/KLB9GIvmUlpNN2sGnt10RkJc
	bMaYCUQxXyvs4Qr6fbSQzALnuv61siTvGgE9mjSTAscClwL6mRhPaWb5X5fdbShj0NmLzVb+Lt6
	mbNX1GveSVCUeZSzW0CpboSMvJSZbLOt0HZIozqvXopTlJ6nNhtY+FBvHRdYnyZ0xKU3LF4CRGD
	E1IK2oA5EQ+1dKGJ8/49MpQHzbc7c9t92+VwLucn5xQxdDJRKqSjV7KgpHlyedGsw+wrvTbvlq6
	BqVieiohJO
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25079878c88.27.1793720543105;
        Tue, 03 Nov 2026 07:42:23 -0800 (PST)
X-Received: by 2002:a05:7022:4b:b0:1a3:dbb2:478a with SMTP id a92af1059eb24-1ac5c92de5dmr25079820c88.27.1793720542303;
        Tue, 03 Nov 2026 07:42:22 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.42.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:21 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:42 +0530
Subject: [PATCH v6 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
 subnodes
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-11-e4b6ad864f8f@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720463; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=xQdivyroVlCKjvnSmI5q2zXammwafIRBL4quFXiYAQs=;
 b=FxFJaPEgGhvTqmoqeTmYZdS09TShjFSV5TK2duN+1x3jIk4/U7k/4EXx1jGdpNs9mlK9Pb+Zh
 huiAKXeOXXLDF80JTWTAFYhT96z6JxNH5sMCC9OIIfGzvbWX7KELdoa
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 3gm_3SdziE41AmZMPDPt0Ssc8JcKf94z
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX3+pt1QDvsThl
 /pXqsqedGSWQT3VETTAyYkwGYK5Ygw1xn6PanE0/0rWbmukfJftDoGBKumk4GEz9xvVd9zXjfjN
 l2XnutXTNwI0jkK5H8MR4Uh2HuvwRvSHexyaSORfCQOa5XH8rGPDN82AqqCPVG7EdnrwrCQxqvY
 3DWjKWYzUvYwPFYu/q7I6XLjnwsfWv8ZBRYWwUmNVha8r3lRVs8VUazJncxdIApc4jxl2et+o+E
 x5Sv3MqFi5W4QWEXFj3fq4CyEdM9R50FdTSF39jXoJnrSS6OxbhxuMdPCXEN7gqW0FMQIE/LP8h
 N7szC/UDqjZqMaiuGBvMUDswaSQW8LJEXNSgAD9DRYk9IZXgKcjlbiZYmP15CXjiu5qgB4CZyrq
 JLEx+RS6GWZeFb1QTs9ScPzm3wxXXcKP4NM/QsU6520yxd1aNhOKLz+5+3b22gi432939EObtvZ
 n5yXTl6BbSfk/w9Fr/w==
X-Proofpoint-GUID: 3gm_3SdziE41AmZMPDPt0Ssc8JcKf94z
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX9WzGpVk7HjlM
 RNBK8dLOId4qmVzGtsboK3DvMGkZfz5hwQRt1E+It7odRi4eHfs1h8cavUCzdJ4xxWaj1TvzU1g
 z/OD+bpleI6ho8yc9/dg5fFMFrN93l4=
X-Authority-Analysis: v=2.4 cv=NeZzRGD4 c=1 sm=1 tr=0 ts=6aea00df cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 phishscore=0 priorityscore=1501
 adultscore=0 suspectscore=0 clxscore=1015 spamscore=0 impostorscore=0
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

Given that the address range restriction is for specific VPU stream, it
should be ideally be moved to that stream. To achieve the same, a subset
of streams is now represented as subnodes, so that each can be
associated with its respective addressable range. The design was discussed
and agreed by mainatiners here
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org

In the past, this limitation was addressed with an iommu-map approach,
with the iris driver dynamically creating the devices. That approach
was later concluded to be a hack to avoid having subnodes, and was NAKed
by the iommu maintainers. It was discussed in detail here:
https://lore.kernel.org/all/c7b956a9-d3e8-4e18-b780-5d08f5cd2ca1@kernel.org/

The video-codec node includes address-cells, size-cells and dma-ranges
to declare 1:1 mapping for DMA translation to the parent.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index 86fbb0fd6472de719f5b006ba309430c32397c1c..fd82b83c228ef7b41898ce676bfeffd12c4cfd01 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5274,11 +5274,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 				      "xo",
 				      "core";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
-
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			/*
 			 * IRIS firmware is signed by vendors, only
 			 * enable on boards where the proper signed firmware
@@ -5286,6 +5287,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x1940 0x0>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x1947 0x0>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

