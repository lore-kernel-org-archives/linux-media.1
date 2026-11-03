Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793720524;
	b=wXfLtoWXKfJBTkNsXaJS1Kkcp7dd88q3iAnqVtrxF4vWwmDR96A0VRZnW3a4PylODzkz
	 2rTu1pUvotgzTiPKzUbeySMjfcCTq+tTxuSfzmY1Y3PrQkevvHNh/U3yR3BrTjxqdNkW+
	 tibR24hhsb8D/tA/bV+f2LLmz/XaGtMhv2xsv1zPUAgTv33YJ7sof2hrjMCXyocORKyjG
	 eQTdoZ5tHqMHmigyEPcX2N0ZF7qyvmk12vy5i5n8g2+eywf2+MVEg4LcSUuf9rT5U+cqf
	 rxIUUpItCiCQ9pAIXlvHPWmTfRikGb4z9eT9em8XnL3YgxWkSVk7NGaHj4YgVkuXe+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793720524;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
	b=V0kc/Zy/Q1iCNadeLuiA0ArLnMHMQ+6sBMFxoO6Z+v2WILsC0H9PBsUbMA9vcrPXNPPn
	 3DxLCIPJJOWEMl8Usq7+4RKz4UquW0Fg2NwBvs2O2CZ3QFd5VVWElgVkQJe6ewpIArZZw
	 cxjIUTEFe3qU699nmBIAEEfsEf/7HQjlOAO7V0RMnybMzagpoayGlkbPc3fw7IEY7blUY
	 /Ix8jfDPriA2j+/83uQYMES2pG6y3XvdmJfh++zZ7tl/hVYIcXF64KUwW0XI3Nrvlzxgt
	 FpO5xSKMaKO7ifKJEFmShrWtTP77BHn9WSAX8WMdDXeSs7RnewcCcYRW5PEyQOmk/kg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6214D606A331
	for <linux-media@vger.kernel.org>; Tue,  3 Nov 2026 15:42:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6214D606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TYWtzdo5;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j7JwNDxX
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A3F6Yks1576832
	for <linux-media@vger.kernel.org>; Tue, 3 Nov 2026 15:42:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=; b=TYWtzdo5m+Wkafbd
	r7iRuI11kwmGXIeLRy0fD/CRCOkdOVI7KXngxO1AufAbA/yR+zURtnu8KW+bjNoY
	iblGYKm2zIlYWuochRQ0COJO7Yg14pJOgUu/9Y8GkwCGhnYMZj/N6oeeAIT9M3ki
	dLIgqZyL/mp0wNmvqd7z9bed/02qj0/7RXSWNnN7hdQT9sEGF3jD+QwKWSqAoDJ2
	WiEMmIQrWzp/LHrPoCKgs2Yu0KP5J99ULsPvPjDKDhr1PpLnXtXqn8h0YAD1IRhH
	bDQllzgTaPbxv5sdqTKHKPun7gOlokyVtg4FagsaL/9bo2WCYqyFd0SGsAO5fnL9
	51POXg==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hqhyd04qb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 15:42:03 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-15c16792146so2685455c88.1
        for <linux-media@vger.kernel.org>; Tue, 03 Nov 2026 07:42:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793720523; x=1794325323; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=j7JwNDxXNF+NQK7scVnvtXde63D/5vGblM5TQMjgp9EpLEIJtcGFXK+9xROQE6A638
         4gF/ubXHQNF02K6z4jS3EBgMiOYHFlNf+1T6uSp1tKNeZI7gGQnQHvE4mNrMGJBCmlt4
         ld/snuYlbQsZXzRDOKl6Nd/8NjNMOKL36kHf/PSavLR3P9s9XMaKDf3+S4oPoH+Eq95h
         T5eMDq6W47gVgaqoNPq7ntK7v7xBikxbDvrt0oDV2MQQFHHnh5LAdrhWNJLLV6BNL1Sb
         MznKZRW5Bm8Kn0TUVkioeXeZt6s3pGSlX6g93Z842aC0H62c0Y/5ZiZCFO0oWyut1KU0
         g1fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793720523; x=1794325323;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nnVOw/x5YV91u8unTsR596OBJwiX/qQSqGeQ8Irfukw=;
        b=w9GMAjWdRtQb2xSE7OFTrgy0hTgVNKRUz/l8HB0jvaHzozQ+avqzyLC2Ip5kNPNEWH
         cGPDxnjsI96HR3/GhlXBYJAmvgJZ8v1P3oPPI6xsFegMzmHeccME7/Mb0pbrAGcvjGOV
         1cATvKf0SJHsO7EzenxrcAR1QvrrhRT9b4TSoSG558iQ0xEI2dA4Bjlka5uXjsD/yjE/
         qBqauuQ5Kbfu1LocgMpLpzOhAjbWYnwojGMGB+ew8BmdqPLNPyP0GlvVp9cnx0aAD6RN
         53uhyqaQIiaBznzeISGK6mngtI5KQQMY4zIM3BAlJBGWNtQPqZU/T4fpXYia4ZSA+uvP
         CsUw==
X-Gm-Message-State: APuU4Z/lWH3PRrJS09rQCev15GyJT4Su9HaCvS+xXgx10SqSm+33ZNjd
	ijnBylsetsF4rf0U5rImbjHaDH+cnUbXcLZMahTMwOjrdU+kd9AVZFKi0yM4aDd43mesBi1VLbt
	t+dKHFRWBFx7EJiOeWvsq5Q8gYh0ImV/gtBMabJo/H5h4XQKdmqPKwHK2+sN0JIJL5Q==
X-Gm-Gg: AYBFou3ChlnOCd8rN4PQHOXOHINgY7B8nx4RtLCKKAw5pVRvqiCarC+vgPZa25j0aMW
	ZjL5z+Ze/EPWiSCoMNasMN67VPxMT7X16Z8LL+LuLVJ6AR/d76Y2MV5Cw61qQDO5jwBWpq83PC/
	wuMC6UOmWc2aagnMOaJhXkeYZA7MWmdKlVm8mD01+2LWcCtMrL5+KUI4v2/YPcvY2gFvR6gwj9f
	CeZYFj9gX1oduh/Z81CMlOERAAgeKZSC8GXnCU9J4Ev8pdyuT1qVr/+YTKdfO3tzlW7keCLIqek
	qUuAo2BAPi9lZ7kSnT0ziFeX7I+TyM9gDurxXuw/1qjv6AdWskG7FxpKeF6PgoZ4l4PUobxqUUs
	K9Jxs/hUY81wNNQEydDBM8j56UyoDy9wr40oNOgtWPDbkKp/jnp68XGkcIMPGvg0JIriKoy+gzh
	/nvz2JRTLG
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968984c88.26.1793720522862;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
X-Received: by 2002:a05:701b:4349:b0:1a9:d04f:1b55 with SMTP id a92af1059eb24-1ac5d0da4acmr18968954c88.26.1793720522366;
        Tue, 03 Nov 2026 07:42:02 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1ac19f4b08bsm50072823c88.16.2026.11.03.07.41.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:42:01 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 03 Nov 2026 21:10:39 +0530
Subject: [PATCH v6 08/12] arm64: dts: qcom: sm8550: Add Iris context bank
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
Message-Id: <20261103-vpu_iommu_iova_handling-v6-8-e4b6ad864f8f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793720462; l=3423;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=TvEDrATTFZXUolN4JLbo1FGUxxzhhCTU57S+Iqt+3XY=;
 b=muFvx6SokZrG9kmmwt+swXlq6Pep9sBfIm6Gi1ogj72KnIwO+GykcNHOcHvSEVqOAMjXT4aoX
 5Uicd+B20epCY24mY45OXKuoyScn5B5KHddSxmm1oTUiusm1jt5oCAk
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=bp/Zl0ai c=1 sm=1 tr=0 ts=6aea00cb cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-GUID: ZMsht1Jz0k057RtfczlNHed2kV77uewu
X-Proofpoint-ORIG-GUID: ZMsht1Jz0k057RtfczlNHed2kV77uewu
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfX8Frgd3ijcdOQ
 Zu4O6x6PExsrWvmQ2ey8vZ3CbpL+ne8U8Yj4zG5Vsiev9sCCDrzRQkNpONrM65CMOP2my/p36+z
 qHBpBsUbf18Z/l3whaykT9OP3YrJHsY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDA2MiBTYWx0ZWRfXxGUIwM+FXfZr
 5eULcWjrqtDQA/dFX5p2Swvpevg1GNQP47BZpzHthB2Ki5bOWiwTRvNQ1rVhpvK4cRfCHmh35hH
 p01XpYc8EOUPvNmS4tfwz09lGL0EJsHT0rr2L1g1sSDTFhaFJpjo6yCs78k3c0wki8MzEgQ2iAV
 aM/x6m7haRxpoGkLPERoW0Z42eXnKWrq1LrKWq4BHNMlT6Dspy9wqFCELXqOsbSNIX2T+bWiRVg
 lpvuMx2avL58HDAxAJxJvAR6lyr04uomIkbR5ZBNgO6Yf/bJrVEkgXgJ4eWzXMwWGbhBF/VbUNw
 xB47zQUcLGqSjcw2jCEZHpLq8FaqT11DtMNAhvaogsO2lQVQHIF0c27x0gEfPWSLSy1VikCcD8C
 kJrHgqXmOgXhnBSjMDUzTrfA0KUQu3mOGSw8pM/p70k/7oNA+cXiXNg2mb5ufH4I5h0d2mb2mdk
 GymR20hg9UInXQsiO1A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_03,2026-11-03_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611030062

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
 arch/arm64/boot/dts/qcom/sm8550.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8550.dtsi b/arch/arm64/boot/dts/qcom/sm8550.dtsi
index 03f6d40edea71821bd763ade144707bf8971b65b..f98f1c705fb3380f1d5f94ade217c0c0538ead0f 100644
--- a/arch/arm64/boot/dts/qcom/sm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8550.dtsi
@@ -3707,8 +3707,6 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x1940 0>,
-				 <&apps_smmu 0x1947 0>;
 			dma-coherent;
 
 			/*
@@ -3718,6 +3716,19 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			 */
 			status = "disabled";
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
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

