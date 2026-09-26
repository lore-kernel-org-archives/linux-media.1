Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53F01394E80
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790404552; cv=none; b=dXKptTs4lZSxqd4BXtOWAUwSKh6YguVpZoLw27rQVArVTAwqsOTYCvmnp9N83O8fQlmwywUUPTLAP+aYqIrXghUNYEBG2/IlrSKWUVMA34CS3UcMSgPhesIcKgqsn+WHHZJ89SMDfEVMcozDog91bR2S3NsC7BLT4TQ3haRvvf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790404552; c=relaxed/simple;
	bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cdIwNMCpMbQucaiyHST8HjXoZn4ttt543CPnWh5bhtDghnm0buRwf2EjhIda6abio7+wc0IqPYG9vmUvgvUA8EQ5sTbfUbnYz0+jkfbNEyrY/Br1C+sJtdQ/2ZeTvSfmHZCsFFOBJdY+LB3mlV82jAUUjA0iYXOQQIzhkdfB3xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=D8Zkqp55; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gnfO18Jd; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="D8Zkqp55";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gnfO18Jd"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68Q6PJ2B110865
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=; b=D8Zkqp55X40IFFct
	dFpBIewr+h7DeVIkGxRyPkogFdY5d4uJEbn0cj/iVonNFnRGEpEpxFzmjX4gS9yr
	aZ069128yjestE4TlcRd506/Lrq1V7mBDCQALcuRne9YUyRchVssPMkfKdYVbj5O
	SWdUORnIrAEElc2GBVqt24niixLzgM5vNZhO6MhpdtG/j5jYicEp901uq9tdjpd/
	fPaIlvcjoyRHS266CxXr+rimUymk8HeIK13ksrjvyPMyQSfqFCp9M6U++J5C6Oh9
	jUA9V8WNDyeAFlWuivNiKKpwH3PqfEdf2xkDdXf4AOH5UwePTUn01Ioqp7JJiKWR
	l5yJvA==
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com [74.125.82.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gx50s8epe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 26 Sep 2026 06:35:47 +0000 (GMT)
Received: by mail-dl1-f69.google.com with SMTP id a92af1059eb24-1438492fb40so2374180c88.1
        for <linux-media@vger.kernel.org>; Fri, 25 Sep 2026 23:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790404547; x=1791009347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=gnfO18JdkmJL7VnpaRJEq653ANHeMgSWlEDR2qBliFVFpNwwpjhM9dzu0xa5iwg+LU
         ozRjSvc+4NjW9eGYarxyDrHEpamoOKgCizkGEmwLJbVuLqC2ZLQ4mUJcNsI55tzWMEJW
         YgkIy80fcWAPbSx6U9Agn4ghBxgJ2hGDEfVfb/X8A3MBUZ8xWeRwqkiDeq5R9w11NGsp
         5Dq5PecYsDxzwUOXmMb+aGvoAkqkMMg21U/6KzEd8ONg8P2j6+ZmhoeqBtzWsruTyqnv
         VXyW2Fs78aknJSYp5hJIx/oy4evFVcjNl3wkpgol1gBpaQSUQIizYQB9eMqwqg5O+ncg
         Vavg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790404547; x=1791009347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JAqVWluA7QrGCFj1n7kbIXyDpI8LEcOYb0AIJAcvUOA=;
        b=euLRfXL5gahb3+1KUjQHpLnyK5KR73s6jo4uekFCYuSswu3Xk42i3Wa3psb+XxiaEy
         WYNKngEt5ZKd/3XFc9GQ63opS5UlXc+mruRN/uZLy5jWyVJNdYPmCs4jbF0rGO0atgB/
         +nTQNGX0U9b+gzVLhaKDoti/Y2rMXjZCneA3HF3rNUISZUrggXvqPAoOHVWu132+votE
         qADy1MSounThcUs5NMebCF5XY0e5QTYO0f9Jf3ew1vnB2GfL0vMxd/P+EH8/sQ/THmtK
         OyUFI/4B4RkBfji65z8716oYxdPaOywd8TYJHvxdVwOohgXPl3EgROne9H+wImdINjvG
         +RUw==
X-Gm-Message-State: AFuF++lygh3PwcEfsL2GrcSsTq3xIEjTHSOzT3Wn65WAFGnS3hKgklUX
	zbWPpNB/X62vvpp8Iz9S34vbRiQrCCSp5MT+Cxy19DXLUnAZbaNyxD0kncn6DB8/PaFhsGHJE/Y
	WWQi1eFxzoJgZ3c1OpAaD0gvPqp8PPzJS4VemqgvMIA5Ic7p5gZBBUr3sRGIMHromUg==
X-Gm-Gg: AYBFou0IrG8TkXO4eOt5jyUHrgDO/bP6s9q/rbe1GWT8deuXgL8/N+9zUSrUChoknnF
	fg2LaJmHCGeBwajNDARHnqAOZbJmwrQn9bkHcBtt1784kFUBZKzgLka9IusBRFgcUCTyii0G4Fv
	WE0PULkTrpYV57WY+K2It+8nrTnj8thDp827DcvrI5kSAQWHrhEQxKqpbOyJxlqpwMlo98W0kKF
	pVcF0Ps7Tii5M+n5sDOQh/Y2w2oa7l+zcV5nVJh1+GOiRR938Gurk2jBmT0+wDTSuvU5SssZiCr
	4noHYzoXa5XibBcAJkZTcTnq0y3FShR2Vk7W2Wd9vX2UgFt6+GouxfhRc/lW7+Rb1YspC5Ac1EJ
	5mIvbEP7mWx/70p5EDgeOwD3mMZ7cH8ib1A==
X-Received: by 2002:a05:701b:2908:b0:144:f86c:e330 with SMTP id a92af1059eb24-146cdeb8e14mr1590655c88.3.1790404546702;
        Fri, 25 Sep 2026 23:35:46 -0700 (PDT)
X-Received: by 2002:a05:701b:2908:b0:144:f86c:e330 with SMTP id a92af1059eb24-146cdeb8e14mr1590630c88.3.1790404546158;
        Fri, 25 Sep 2026 23:35:46 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-145acc45f03sm9700691c88.7.2026.09.25.23.35.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 23:35:45 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Sat, 26 Sep 2026 12:04:09 +0530
Subject: [PATCH v5 10/13] arm64: dts: qcom: lemans: Add Iris context bank
 subnodes
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260926-vpu_iommu_iova_handling-v5-10-0322ca5dc10c@oss.qualcomm.com>
References: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
In-Reply-To: <20260926-vpu_iommu_iova_handling-v5-0-0322ca5dc10c@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790404457; l=3217;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=hSjOhcc48OJghLc+5hynLFQU9EGrwxyIHApwVUWJDT4=;
 b=MrmYr4ovkLag/zy7FO0UZIAZGnf0/eg6+YP2YbFG6ktdB8Z6hZQow0/qb5ZzhSzuM2Qieem4c
 GBVZrg9BXUYD6i5awMJC14hvy1d0FcEyV5Pv80roo5JOgoVbmvlMP1a
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX+Ih/yDo7PfuJ
 SP7yiuf12rVYsG4i06XQuLz7o8Fh6e5f26Myv4e/kPRYv2jObOdwoA4ueb9Kaepv8hzbD/69BW4
 Y10aoq2CZvPgliu1PoVljn3bx6yOr/I=
X-Proofpoint-ORIG-GUID: RXq201R-cqNkEHWV_6vSCYJDI7dLDCoz
X-Authority-Analysis: v=2.4 cv=WuK+otfv c=1 sm=1 tr=0 ts=6ab767c3 cx=c_pps
 a=kVLUcbK0zfr7ocalXnG1qA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=w7pRem5UOBajBC5HA0sA:9
 a=QEXdDO2ut3YA:10 a=vr4QvYf-bLy2KjpDp97w:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI2MDAyNiBTYWx0ZWRfX8o9Gvt8y4hCV
 y8nh2da1llm1A+OSbOWanG4S1/4YG6XbqJQQ3UoIMRvWrumVhd9LWg17w/SKiX3zzRrGJxOBadB
 AbAxM8eNIH3HtXWZ55Rg0jZxwi5MQyCK4Emn84PFk0ByqVfeAWO8k0DHJDhyiVvCAMHal8elsgL
 ZFiOmdHPK+G4naXgHPFwqtr/aG5wfA8r7wzJHbSo+6JHJOF4wvQIDMapdGdNddmZO/hIKEdioxb
 2uFbKHnfGuSiUIJphjwZAtgsCqJh09bBUdAw3yEzIyVL0Oy3KBYXVZHH8wT60igbeXfdp54egkZ
 l/Vigv9NdCitGfNNFkGAFfgasMJVUkmOTc2//DFTnVPlZggL2cybBB1v36Cn16+A40chUd93P5n
 GY/hT4AS7LJ7vD6il0+qGAOWmILOrtrRmJLjWNskoYFlNgCSlRqCQk194j9zb4KjdquMyN/ku6j
 aiBoANEcbw4OFIRQa5g==
X-Proofpoint-GUID: RXq201R-cqNkEHWV_6vSCYJDI7dLDCoz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-26_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609260026

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

Co-developed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..afed5e43b4fcda8b8400e815d24c5094834677f3 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -4962,12 +4962,23 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";
 
-			iommus = <&apps_smmu 0x0880 0x0400>,
-				 <&apps_smmu 0x0887 0x0400>;
 			dma-coherent;
 
+			#address-cells = <1>;
+			#size-cells = <1>;
+			dma-ranges = <0x0 0x0 0x0 0xe0000000>;
+
 			status = "disabled";
 
+			non-pixel {
+				iommus = <&apps_smmu 0x0880 0x0400>;
+				iommu-ranges = <0x25800000 0xba800000>;
+			};
+
+			pixel {
+				iommus = <&apps_smmu 0x0887 0x0400>;
+			};
+
 			iris_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.34.1

