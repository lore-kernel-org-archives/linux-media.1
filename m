Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD72B3D647C
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:26:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091193; cv=none; b=UpOLofDiitpmuZiRu5PtLFa1KV57BvssPWavjQbtJahYfGbFqtsU/SN8SvW/2EkA0GOGFNIO8MDUwZhKhEtLjoejbR2alwm+QGzNfvo9bwoGE+zdVRx7hUT1oUODoWNcuYvcimRqXMWpGKYD+lR4m1bed8syZqpJEebex7st/hw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091193; c=relaxed/simple;
	bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MPGMqH+mdVAUsIzleNJnsvNnDHSBpDeVfgBgvehLVz1pvsn2djGZyk8MA14QmoYpDrvETZGos/NwgSCElLaHPl/MnxEA/p4YKSljSmER3CldUGBg9rWC769VrFhVbyV8dWMyfL0jsrc/RWvg1MmnEcX5zz2MtBaARDDkf+jZ6Pk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=PDJd/eH7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Ckpg4b5o; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="PDJd/eH7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Ckpg4b5o"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6776C1lh3576090
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:26:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=; b=PDJd/eH7F0gki3zf
	3qX4R2W/Z06K6LplI6Lj4dfsd/npfJX+0LgMhi67iLr9eLBmXIHaXdtNWJ6tGcHe
	keVNSAOocVSArcE4U2s0HjPgU4OLKkU8ZiFNPqdfu4fj8PwBAiQr2RNMKb1KIJAW
	+rkedsE9JsbTNFE0hTEHsSzAd4w2v3m9HOeqyWVgHwfLCk7YcS6KK46ucl29a5Jj
	vn3neUth4YYk748EzZcOVvISn+yQllKTT6n38ghxGJ5SX8/f+KLnvchZuC3wqkUp
	jy9Ax9/RBW8jhd/CEoNwM8m5gdthBw39kmWKsAQGeRiyBQd6ZLUy9uB6jxektR6s
	rpY47A==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fw9vu0fhy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:26:31 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-cb4bd11ddf8so3350524a12.3
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:26:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091190; x=1786695990; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=Ckpg4b5oyd0bF5SilJ+/9Tpk6XXxekJXkw0i8wWKXrWa4hVURViEkRRtlXO7dLG87c
         nfkbf6GlYgeOxQT6Qi6dlujSkY66FkM0YxG9+cBt2852t4GMmblYSGCyCUv1WAbdTkBo
         ghHoP6BLHdjMF5bozwDUSUfDL4e0CgkJAKlzAxSvG7B2hxFWFj7TOtfh1Hyvyff+VSMX
         i96Qz9mqvUB2eXUruQfltmueh6GkZPtHQwGCHmQG6bQYD4LfzYit8uo/XSEI6vhKLDCc
         LAqmwGZkdNb8ezXRf+RHAMFt6Bko39gC4R7bYg2UzisTXvBLAoqVU0mG9mh8m73FoeQZ
         1hAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091190; x=1786695990;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7j/zIsZ+9bVC1qTPvzBPq6Ov3hCUQZH6E82uuV16mCg=;
        b=XqhPGsNDByBfBXBaYcaIuR+zRFxqEgyOvMfXRsYbA6xEzrZvju+dv8NcOewI5fHvhD
         VzjC26M5YKQ1P6KGXpktQdWK/SGPA3rZGB0yeBP2ZCOT5RQtbQshaJMkWciImZXTW4iR
         6k4tkSb1HYhM2vRf8Md4m8VFD2UiKBdS/AicNiPk9rE2fkcaU6Eho3ahOpOg/qimlQi6
         yBqr9scaNtE3w/giHwWw/YsdJEmO9Lo7LFRxpWx+qQ57zEp9AMHCzuRz7+RJDqqxxep5
         43ZSX4N6S3RSYgIyngbvfP/UNG8oPEYe7nEa/gX0hXVlo4BgfzshkrzpmXP+UeK55Z10
         nASA==
X-Forwarded-Encrypted: i=1; AHgh+RrgZqRH1EsY3AFI/8A0nDY5UliGEjpqTnDTb2yKTNPtnfHc1QRXZwkiseiT3Jyvd1LeL7RhIBmYpYjK4A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7hl7j26icuHLYOyTN61NsDb97i+fIsfln7QX/brwZ86o1DTBJ
	R+FYcGmN5o7FRA7uvFfLzGkTNqU9zjCw1h80NL0xHPqNWTz4FHkWrduu3wY/tCMuVyCVk8VytpV
	Ff4uK+LEbhwXwr38/aool1CnwnYjLNUTxeTGRLIUcvAQkMlrcciebwUWCeBYG5VoX3w==
X-Gm-Gg: AR+sD11KsKGhzg69jEdVKIa5twH8dChF2lwSNDMgtWx398V0//ViYKk+TzfOVVuRW9m
	MStDlysBRnYxsTQWtLRaalRbds7zw6P4QdrEkyzlB99qRFu6E2AC0D4taSn96MHePMo35ZF/nf9
	GMCiXubsI4nTItE+d9Ej7IsI6/cSNSQqzDf12UGbPHwMsejkQFtkC+RXpS2KZfMR228fE1Q2k08
	dx32qbl3VyjEi0tRjq3syctt+bpRN3H5nBDR1N0Ft29TNchWsSCDHd4xnydO37qS0ZJSzdi2BC+
	CgO0zsEmMK2oYxtOUBi0U/efizEfrGsODXxOuXGSCpxiHcibgN2SHBgcpLkSDSAumHUsZA3RMV/
	b71g/pn2+PoBFxsRuyV8E4XQstV1mAxeI8ik=
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403345637.13.1786091190528;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
X-Received: by 2002:a05:6a21:4c0c:b0:3cb:853e:850e with SMTP id adf61e73a8af0-3cb85dbd1f2mr26403288637.13.1786091190097;
        Fri, 07 Aug 2026 01:26:30 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.26.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:26:29 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:49 +0530
Subject: [PATCH 05/22] arm64: dts: qcom: lemans: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-5-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1934;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=YMI3vkw8hmiKF6TeqHv14c9+YFV1N/QsGGgnxq8OIyY=;
 b=nlhEf9NlcAAHsMhV8gipliTwfBY+PUK9FEDOlMy9KhfsAoyYLeWc1J0uhItzpqcotydC/Mw0u
 jx1MioKYMpcCtUXFjWvbS+mcmeRgtYZEfZ9wAUajYAl17i5NYREvD9t
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: VhRajjhCss-lxICbGbObEd93E6Jqww1o
X-Authority-Analysis: v=2.4 cv=SYbHsPRu c=1 sm=1 tr=0 ts=6a7596b7 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX6gXUI58veK8s
 KLyT47zBJkM3XXjPmZ1OsBUR3kwt4wGzWYStpgEUKbHPEmnW56SrqXdJkgfjU3ZVy7byS4WTsvR
 04W++S9znVIECuiDXCBdZ5oPD+0UQMQ=
X-Proofpoint-GUID: VhRajjhCss-lxICbGbObEd93E6Jqww1o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXyR8g8Inp/puE
 Fl59Ju5uRr7BpDCdaJREPULOpnenfRIwRuQyWmwoAxN5q6vqNRQ5BKSxVS8NqRS5/AOgig8ZQYJ
 7aVJt57dx1HvTUC2ZGBuMU45gB/nMUbb1aDZcT1Gon4e6cuiITcBbocBQoyIdF4SvqM7LHXTHyc
 qEFJo9E6SdCRqSxDAwUEOGLus6uYjLjo6+GQPz1EEsS/aSEMfpv2j4kTg5jm5oo5R/j1GyBVPt5
 UTQPL9grIj/ROz5hdCzUyS5diXmvTo3BhiLeErQhhossvYpMnvTu3QxSl9/N8V7zEikfn1G0KTW
 itj/LmaT4Z5N+u91dCZUr0iHoTr7ONqxmJBRh0wPUVN8+ZX9CHBQ2KVh2GxltF2Sjtm7UniNZ5y
 19xzxAxJlL3yRJbkLlkRT7G0PR/mAR7mhQTF+aHaYgRNKVutTyKSrF1xKAGJ7sF1yuPU+M+orbZ
 7CMt6uKK3QRgwh4klFw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0 spamscore=0
 impostorscore=0 suspectscore=0 priorityscore=1501 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Iris VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the Iris node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 7bc95052c64f ("arm64: dts: qcom: sa8775p: add support for video node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/lemans.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
index 695eae1b7256911e656ab1ecdd92aca135d92f39..da0326fe244850f92e080e648722b4aa0037da7b 100644
--- a/arch/arm64/boot/dts/qcom/lemans.dtsi
+++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
@@ -862,6 +862,17 @@ cpucp_fw_mem: cpucp-fw@db200000 {
 			reg = <0x0 0xdb200000 0x0 0x100000>;
 			no-map;
 		};
+
+		/*
+		 * The Iris VPU reserves IOVA below 0x25800000 (600MB),
+		 * primarily for non-pixel buffers using different Stream IDs.
+		 * DMA into that range triggers unhandled SMMU faults and
+		 * spontaneous reboots, so reserve it to keep IOMMU
+		 * allocations above this boundary.
+		 */
+		iris_iova: iris-iova {
+			iommu-addresses = <&iris 0x0 0x0 0x0 0x25800000>;
+		};
 	};
 
 	smp2p-adsp {
@@ -4957,7 +4968,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>;
 			reset-names = "bus";

-- 
2.34.1

