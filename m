Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4780446C85C
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:28:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091295; cv=none; b=eLl3U8RgHEDRBYU3q5MLSfhzNPt6HjXgzw/uRUckmmW4dWXV72sIlSh7WRLdPmzKsfMJktj8uEQKa0wXgypEAdLirm2nG1+Z3BM5srb5axBfk3TurkgUqAEIR0+HN0OUP1IWtc5GbJ7PpWQof4SxGaJU0zP+wsC+iXMSrVAfSfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091295; c=relaxed/simple;
	bh=8/6xFOoS2iSYAo1lVZcmStYqyqoxabKr3P1TAAAAbJ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QTOlsuCan0xm29sCgMmrQiICsV3GhRW2suo3FPrbElxXftUav7cPucOO9DAYcj2AFFj3kbE2xUj99EoDuRJCgCMrWaaVm71MobXBZeJ61b1Q1VE8KqgjyTbWVqU1qQeH7aF8PIha2HKr+pJjSJUp+uKlc87krKmdenSQ3AycWeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MxXKU5oJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YGqpg35Z; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MxXKU5oJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YGqpg35Z"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6778FmhR3251811
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:28:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=; b=MxXKU5oJDJf2rIKT
	NAIGY76WiRtC/IrXya4aJa+51Ivli4ESNq0NaNU1REZl7g40BppyABwG7oQ0mSdT
	SEBTZ19Ez2KZKCl0pipxxXjSFNQQN6TOrfYGumuhsi+lXQQ5KQLXcVFeiwCA5Adg
	fhKs/vFLbm6WHiUVl2cTuoWdkgnnuPVZhFEN2arxGe2AbW4fraElCts5H92PJhoE
	PyfYvbETArFJ89Q+VLwzn7TbMxuu63gZ5nJ0fCpk1+Zda7JmC4CRfJGHxExkMkPX
	t6qE3Av7xL1sirBPOgzsGs4cYm1Dl6V+9VB1uw2WRtW3HC0IuIBDgYM228OjS2qZ
	6smiPA==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com [209.85.214.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6k32cu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:28:11 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id d9443c01a7336-2cd01a14e81so44363075ad.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:28:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091291; x=1786696091; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=;
        b=YGqpg35Z/sxVHBqI1jUu5WSTIvOdZfUGSXG/3IW9M+VOp7t8Bw1prDGvdrjYRUm5Wa
         7GscGFg624xGwqXFBsfmeD1cn9/1Vmk83fn9qdt1NIyYE8DZu4r2RWEQQIKA4iC3pGd7
         I+8Q89lY8g5ZTmTH93LY9jATXdh2vWWVE9YF3xn+8tPFl5prjnF+p8p1gLOkSu5j+TyK
         B2MRwFngRqCKAXeu72dOpJ+YwQvzUqqPGpmZB6LG4xVzk6VdFlLXkNvGDpUvT+siQFXd
         Gp+GmcTh5TtIq2yuuFmHk5JXOR7E5uJjOuqgrhaOYrUkfCEyby8t4zkydf818rl6RHaJ
         g5cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091291; x=1786696091;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=6kJaeOKTMGGqkbiKRfd/DVlD7jfmrG06f+sxa9jau9c=;
        b=KWfGgNdK8yVvYxC2FP0VH/yqwdOgF+5q1FlbOiDU6buhFRLb3DLYLq8n7M0Shs3s+N
         VRE6UO2gIimVFkPM0LtAAJRfO5hM+KbOfVeh0ViVXXzaK/+X28bubnpYtSgNbSwjGUWD
         FnGKiQ/LczIDe/Yt50Fw3tks+k0XXaschsjzft4We/6SgFETOE2oPUpEUyVaFRNngh08
         quAC5rXdJrJC7mC56DJrG3xwlg4ZHR0l8vG7T4/4WOfjdqWfHrm40wpummcihfKa4168
         jVDqwZWWetZ1S5KwHIv+V64YKEg/ikVDxumE+pFc9Nargv1JPpNB8rEKW1qk4YGwOjJi
         uIrA==
X-Forwarded-Encrypted: i=1; AHgh+Roxtyi+6Yx4mw5b2SYh6q5hJaNMCvA384dKQC8JSJd9gXdHK8XEMHMA014dzmGnbY//q918fwHLpWQl4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOtpXIVQgz3UQNHLuF3Osqufra44VSPoqCFWNGmsqpiFujLhVO
	XAjvXpsjuLnGDIMIq8S+a4b5Fx1aqZpww9tdqSEPvKDQ2cbFaG7xm8UvigNBtYbg6cFW++mpk3Q
	Dl25c6KzahPnLXBkGmbOXEhzpZzWfI3NZEBB71f9R2auklULOIQc4EuoSHjWVEY5taA==
X-Gm-Gg: AR+sD12saDDGtQeUC5/rwjevuZDTP6Wss+1mEdb7BAR41UwXn1MUU9JrOPR3zKRCYxD
	LICZfdp71mXdi+u443pz0v5Yf8IlhWzYjAXa+wTuZhhXWg2ik9kpOQ9quPNVcD7ysvNGG7uqRAI
	Ne0odpPGiYUVCVO6AT2N+vOqeX72tcLKmF40kHw0OcqCwYx99OCgpwpKP8qxF8AGc7sTuszbQEU
	E31KbBrEogeBxR5CD2yvvYeyNk4GXTWzNHFH3Z5F502C+K1FWm3B1+i8Fj3bJpcEFLW4YJAIkxt
	1EDxXUrOKcJQoYRiKvrW9UyWwmoStEaa4l9GH70cDI4AnrgcarBWkSGrdWD3lbo/75OZWWPkssd
	bgxwRl1iOZ8+L/rkxAT82cn+rS6Ie21uZGQo=
X-Received: by 2002:a05:6a21:1f89:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3cb85e9924emr25383733637.10.1786091290983;
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
X-Received: by 2002:a05:6a21:1f89:b0:3ba:f5c7:6bc3 with SMTP id adf61e73a8af0-3cb85e9924emr25383687637.10.1786091290540;
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:10 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:57 +0530
Subject: [PATCH 13/22] arm64: dts: qcom: kodiak: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-13-3996f67e33f9@oss.qualcomm.com>
References: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
In-Reply-To: <20260807-iris_iova_600mb_fix-v1-0-3996f67e33f9@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Stephan Gerhold <stephan.gerhold@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Stanimir Varbanov <stanimir.varbanov@linaro.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Johan Hovold <johan+linaro@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Mansur Alisha Shaik <mansur@codeaurora.org>,
        Andy Gross <andy.gross@linaro.org>,
        Rob Clark <robin.clark@oss.qualcomm.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Pierre-Hugues Husson <phhusson@freebox.fr>,
        Marc Gonzalez <mgonzalez@freebox.fr>,
        cros-qcom-dts-watchers@chromium.org,
        Matthias Kaehlcke <mka@chromium.org>,
        Douglas Anderson <dianders@chromium.org>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Aniket Masule <amasule@codeaurora.org>,
        Malathi Gottam <quic_mgottam@quicinc.com>,
        Rajendra Nayak <quic_rjendra@quicinc.com>,
        Jonathan Marek <jonathan@marek.ca>,
        Dikshita Agarwal <dikshita@qti.qualcomm.com>,
        Renjiang Han <quic_renjiang@quicinc.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab+huawei@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1897;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=8/6xFOoS2iSYAo1lVZcmStYqyqoxabKr3P1TAAAAbJ8=;
 b=p6oNxPNJjeYzPb6Tfc6iaEKXXtE9dzonykPnzz0nse7vJHhJbrKhk/AUjwF/Sm0Y1GUyvAKSR
 LbsO9IX3bHkAjglM6QliIYkk+WoouAklgcJdD5L/SQVHoepBN769ZGG
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=RpX16imK c=1 sm=1 tr=0 ts=6a75971b cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-ORIG-GUID: 0Ah9hmYmcbjpPIqmqQ0ru414_InYdXFn
X-Proofpoint-GUID: 0Ah9hmYmcbjpPIqmqQ0ru414_InYdXFn
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX7vKlJ+wvcJya
 0Dxl1UK6/SFmYqKYzngr0Vb9xGOWXI8d542XFVY8nmn6wQrZ6UsnOwe7KLA3CC8mf/2EfL81PZ1
 f76htpb020ItyN91xYg5Y62apM/Pc4N5uUEuVY1kFFw/8C45nYXBAn+iaKXCJfAxBfUFeSaR+lM
 l6Z30eWOeUlJ1NaiqiM+RcRa+MAjiCJz0xBtf0Qol9Q/J6zUr+ilkp5p8I7F5xt+vY7iZwnn6kY
 MwrZ4BRC3MDlt17bD9/aQrEIWuNZome64pDXz23MMUn/ZZlQErKcHoA5k3KlF8/KS8p0eFl+F4j
 kz/fj6BR254J3C3Sqq/SkUueecAM3hK5HAK96/5VNgremX+Gf+xLPM0kMxFzujIUXbdLHn3BdHA
 QlDU/sKpDXhaYyjrH56a4ye59kn9hBgMDppbcysSgXC+sleT6KJNvUDg7QhiJsw3vAZDx96LCms
 ByK4vSX/8UEESLtW+4A==
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXwfwxeRxCRx9w
 7arf5Q3/A3L+PAxXxHH0aPw/ommxM2ZmzUeS6LAg+YeUZY8KHFTXDpfuLFEX8GVmVITH60rzzGh
 J6X4AJ/++OzzT3p/gBq/8JwSuflNVmA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 clxscore=1015 impostorscore=0
 suspectscore=0 spamscore=0 adultscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 37613aee2179 ("arm64: dts: qcom: sc7280: Add venus DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/kodiak.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/kodiak.dtsi b/arch/arm64/boot/dts/qcom/kodiak.dtsi
index f2da3706d5c887e36a55dc5e2f63dc21e940191c..8894149a3d4e238dcb996e25379892949f7302e8 100644
--- a/arch/arm64/boot/dts/qcom/kodiak.dtsi
+++ b/arch/arm64/boot/dts/qcom/kodiak.dtsi
@@ -198,6 +198,17 @@ adsp_rpc_remote_heap_mem: adsp-rpc-remote-heap {
 			alignment = <0x0 0x400000>;
 			size = <0x0 0x800000>;
 		};
+
+		/*
+		 * The Venus VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		venus_iova: venus-iova {
+			iommu-addresses = <&venus 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	cpus {
@@ -5026,7 +5037,7 @@ venus: video-codec@aa00000 {
 			interconnect-names = "cpu-cfg", "video-mem";
 
 			iommus = <&apps_smmu 0x2180 0x20>;
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&venus_iova>;
 
 			status = "disabled";
 

-- 
2.34.1

