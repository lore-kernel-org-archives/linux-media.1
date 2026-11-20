Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795173137;
	b=KKIGUhGK0lmrzqlxjSPKPhDJrdaVACyc3mbPhUTREI/kRr/nK5F3tHfuOp930O+lKerR
	 XEq92+W0I7ADoz2UeCvachnqCw0kqVTRg1arWxmMu5FxN4adwN19Cc7/SFnE7487q7QfI
	 gmDOH5zSoTeggv10S6zSHf6t799hNu1u4N9zRnc9IP3fvQPYp33vpjRXevPd8j/p6pNbh
	 e++HgJ/+a+ZvUMl9nqIqWUeUXRlGgRxeun8F36Ldr6MgkH6my2MYDoGRvfdh+8R/ED48s
	 7k+NQNnNP1HB5G3nK1cu26y8ysfVRoRZ+foAWklNEBMiEfLg33Jw77t6Iks50+NbjzQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795173137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
	b=1yzZYH9SyphoTcqBVI9an9Y4wZHiUhGVy4F1kqDM6nK6mfjoTVfssxFNx5x42htvJpN1
	 CEH048zT1jZKScUSQ6Ldn9l3/N4jVtg8c3Q3GEeOIRkzJ8brD7OazzJguH3yq6dLZO/lJ
	 WDSPTKcvi81gXzRvyZT3ZVmc9roGNSpsnow4tkYpa5KvycZLHPsttAXR70c7rLg+znapz
	 tjjqlbxLlm5VZZiW5WxoHjIfuuJhEy9+F6JFYXmS1EB9OkQsVJPLOrBz5Z74Qlc0gD6K+
	 yKaeOgXTvsZu6mopU85bz9X+2CRDi9kH61au8GfEdwwe73Fah/aZbarhDzcLzclNeEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROV291V7;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C802460A3820
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C802460A3820
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Yyql6JnG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ROV291V7
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKAk46H1169017
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=; b=Yyql6JnGQHI6xssC
	DQLHvNyMp+GG0Oh9uCAvImC0qdy90u8OMXsuPSnyuIHMZlxzZKAQSyYcZH/yRbXi
	9ycxC2tXBWwK1Y2jc7elF978CJ/4hkbGnbbeuyFFoedggkEgb4NZlcLgGspnzawo
	dHT60EoDjYugKXOxypk55UqVZjiad7JaW253kF/AAvAT+KvmGBL3VxCT82uc+uhf
	fuEw4DS9XD8QE0Y/eZiwNz8JGlFBdL5twza3wR0koH1DkSHr0aIyn4FAvDaeLW8Y
	C0UlkKG2UnFtCw0YiOAHNwORG2gZBu4fJhy8dYHJcT3vkRTQDsqk2SF53114k9Cd
	JEjb0Q==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j27b5udhs-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:12:15 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-1a71dd190b0so2392676c88.1
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 03:12:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795173135; x=1795777935; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=ROV291V7ecwKaPetyCULndyNowP1fLuNOEunxd50Gh+FyBPRrcZiOvbUu4K4cSaaL0
         wwAqbKRiaNO9y9CPCwtISghPZk+m9lUPfuBl85GOsB6BPrPZamzTvZWR3+BF0fgi9ry2
         EK+1IAfDvphhYCY/VDjjyNlXWAo6S2WApNVWXyJl82vpz14mdkoJDDEHhKiqocljvMsi
         CciVu/WGojhiWApDNaBMXEUHE9OZVW3CwVeVPCLvqe4/EneGzyvfwuzToC37XidbWvCM
         nCwyUvDpEdl5fIovjxu1vAVJthaTjNcf8b3Q8RUEASHY3Nb3lvs9xVqGtHWKgux//kz/
         BoKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795173135; x=1795777935;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ztkFIPaIXJGHL1mP2JskZ4SRuaMUJ+mxptqDiviV1do=;
        b=rXK9Cq5ywxoRYr9ZdxdgdqcGRjmC9921Z+ZRjX2qmH4g2+W5QCTga7qc4EneVozbcu
         8WnFJPSeloL6d9cJkyckDl/H455gz3a30ZbgFnE1gJIzxzJzn1iereCzSGc/lCFsacN+
         Bxx/Vz08GzdZ/HM8f2iYBmN2jztgbl7vDpVHnS15MTPZ1Pr7s2epRgqM45BF9bYvMfxj
         Th4g4Gz5JQ6Oz4q6UfqRZu5HHki/Ma82E4TSTqgpORsS1X2GBgeuEpZBrFXHhu4SICdF
         YICNJAMhh4pybQbA2gOp4JNDM8Ev36tXFHUbmugtM2GeK+CQ2/nTN+WXkAhhKWzL0zSP
         MSZA==
X-Gm-Message-State: APuU4Z/mYLzbyah0zkUlyYKsB3hQoHkhe+ISY0vkjpXH4ToXPdFSXVCZ
	8P9n5SltslN35O95/tzceHWUa1g3WkcyTDl/Gt3iKSshFIxMBM//s2XL9IxSyEQRDFVsZJadEQv
	UKd72/aCIfWb9lHZwGott8AP9KzLci5IDkKnHH/WPr1k4WDqbloFCJ8E5UvOzm9XFLQ==
X-Gm-Gg: AYBFou1giLbAZutbezQzS2aitxtNe0WrpztQTiUjsNLYMUqBh6DWWP3Ingq6nwfWLCX
	cKwvSVk7otkohI46/2gV0T/mvy5WfEco6dP1F2C9FR5SlxW/fJTOyjX66gi4nGACDyKHQKnV+hF
	P9K7sCBJfbEDk3J5Gm3fDqn6eHzePQe7CYQzAR3lRGhZUSgkgw4O7HFEl0g/Nx4xYH/Qdg4YYsd
	t1SZgnWfMevQ0jUoAkPNcrUKbh611S1HJQsg78FGEAJwBsna068+MOeCLfxMF3s7dB/gkdCK66F
	NE3PvZXP83Hr449ifUHQvseJd2en8Del20DMxl8guPGuWs2dWGhol+SBHWtfPvTbWiYGMGjYd5H
	y4hxnKMKrvtk3SaCKJY2ggUazWoz9WjZTqN4H31JCVbEo1JF014jnGFXLt2X+AOjSq23gw3cxrt
	DYOVDZLheS
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781713c88.40.1795173134492;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
X-Received: by 2002:a05:7022:e80e:b0:1ab:de8b:5f0f with SMTP id a92af1059eb24-1b556924b07mr2781681c88.40.1795173134004;
        Fri, 20 Nov 2026 03:12:14 -0800 (PST)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b556847fdasm7254229c88.13.2026.11.20.03.12.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2026 03:12:13 -0800 (PST)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 16:41:01 +0530
Subject: [PATCH v7 11/12] arm64: dts: qcom: sm8650: Add Iris context bank
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
Message-Id: <20261120-vpu_iommu_iova_handling-v7-11-25a771235a7f@oss.qualcomm.com>
References: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
In-Reply-To: <20261120-vpu_iommu_iova_handling-v7-0-25a771235a7f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795173061; l=3502;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=W4XxK+uUtwa6RFdkeL/rZGVqVGU3B0sS4/gBlQHEJ5U=;
 b=1IS2OiI2FOtb91uQ+P4MxcszNruZNbEsaRR0QoCPwgjV4gyrVV2HChI/RK7aUl93QvtO3A0Si
 f4Wwp6drd5NDjOC3dQg0CTgjmSp1x4eU1waA4Q1fTKaQRwx3OMh7sfH
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX+A0eLlz/TrSq
 aKE5c1m3tspWxZWOCM2ozWAJgqj714xBd8XbQdMeaxIGCFkMZohCHVD0YvEI5fz1lhj9GdWSavT
 sSpixmAHezreYsnaHrWu1FCWutd40C0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA0NCBTYWx0ZWRfX76SxiUgNgS1Y
 8GTk1exo7mpH82yEeXc62M3F+0RW7CvcWBeXpL44wUVzkP7d2dQK8qEIFMyKoWKbgEKQyM74Hdb
 iurLVY8whTpNp0++Tja0CAiVWy6GGvoajm0PhT/scA53P8NtIBlb/wW1teY7NRrrDgU4CgvN6uW
 QXTTcHs6zbCGnRfj57ToYIMYdThVPR3Io8Z8YlyM7JBK2lbvd0PeAw8d40GpeBT4jYP9YiW4TcH
 JgVc0gGdv9OyGoriewrvxOasuYElYKpzlf7EwS6Zj7/jzMgqofO2aabVQuATxhmIwYpfkHIt95W
 ZbF/bjnePzzp6dNEAcaGTxoZGwQdoswoxnSsmo3sLe38ymWU4fRKTzJPfxwwOCsu1IIP6cf0WY2
 eaJQm+6XjT5slj0rdLLLXunsD8wutQGbTBsFFT+VRN9sPvSAnk9V/poATzsivlmy0TMy2Oq0sJ6
 z1MhQQUMjC1oHRqt6GQ==
X-Proofpoint-GUID: CZVY4AjpYOpAeYus62fMn3Z9TNdILrOC
X-Proofpoint-ORIG-GUID: CZVY4AjpYOpAeYus62fMn3Z9TNdILrOC
X-Authority-Analysis: v=2.4 cv=LPTz05W9 c=1 sm=1 tr=0 ts=6b002b0f cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vBUdepa8ALXHeOFLBtFW:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_04,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 clxscore=1015 priorityscore=1501 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200044

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
index 5a030f9646c878675f82138ba99ab5889eeb0854..b68859c6a893aa452af2d7d273c7f3d97811a737 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -5275,11 +5275,12 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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
@@ -5287,6 +5288,15 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
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

