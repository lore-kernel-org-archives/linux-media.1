Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6870346D2BA
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091369; cv=none; b=vDBbcP4G540ZFmi9GMvhAau1VASYD7ltRiYkNUkorfaPZkoPBlstgx9aebCPUs75xBaBGgQ9dAmfX/Uz7djLpCW9g/5O61NFxP7eC61DLF123zt0Y4Pv6nw9V3C1nRnvkv4QIKmohtqUVVz7FUnPqzdCocbI6M/Gn6917PTTEv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091369; c=relaxed/simple;
	bh=2Ta7SYii7UbdsaXt3oAKqMeVVnuG/pODzCp+tQz2+M4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CBTxSZ4m4Fe0IfeqxPypsgTQDQhCSqbxby+d9UWkXkgNY/NJAPXkV4ADpjVD0ew+0OVJ9ghmdGbc5mgLWdtifWVY+Tgh6HtISMfFXGSEzv0V8hnF5ImwRQqttmImcxr0BOztI1EU7VEcgeGjqkKYcESNws6HZVpf6198a8yNgDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=k+/AA6O1; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Mpv9Xe0g; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="k+/AA6O1";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Mpv9Xe0g"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777u22d3822004
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:29:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZenggdqjvqXCJDHAMgGpE+rdTYFCZrZH8wQwXj1QToo=; b=k+/AA6O1oCpFHoX4
	/uPrkreD5OMCyRwpNAdkGY6z+T1GXaLpiuMNJ55NMnt8AY8w/TcLJZ3VFWbn7TBs
	o2hMkNV53oB4D85QixC/sAwmRo6lot9afhbYfWdQpLzrsiVDIQpRJ9P4aBuKMh8j
	+VCXCgJ4d9nd7isrfnIwfrBDKoHNJ28nxM+ApiNzHVxstJn2lBrKdvk6UjTs1G8s
	+1EG5zD+K1AaerK2uc8oBR/Rulqaxq6/OJl5qaqVw6S+V7eg2vYhko4/OHbbAVa/
	H+wlDn1BSictF3YUbTi1W5sR7I2noxDnWSp+U45O1z1ZphTmyRHHrCtzSCcOFWY1
	DuXtDw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu26x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:29:27 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-c89704da8c7so4557643a12.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:29:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091366; x=1786696166; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZenggdqjvqXCJDHAMgGpE+rdTYFCZrZH8wQwXj1QToo=;
        b=Mpv9Xe0g56z8aXp+LiYnHQFGi7Y9FKkKegAmfBXMC8Yo8fUGN9XI/WwQzrG2wven6l
         jnweAgNGK1hKTj4NXDtTK9gD9XrVOoW0NAK0K69rt7/k5ybLg+FpKJUxcfXBexEuy8ff
         DWKK0OUKTEma1eWhXN1gXwrIJDCILCx8iSogjgv2oNWkLxdpzCKt+KCMNIt9L1C5NU2x
         1p828XMLCNN8spfHCg/2aAVhBQ9mqZ17oTrwJ7Mg2/feoTp856c7GHWclaCljZJQDU1z
         /rkvcUFKfWFgoegFN4xy8YWePIoapQCkS0YvYn3bKaTHbPIm0SBBCiD313XjO7CPHrEZ
         Wj4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091366; x=1786696166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZenggdqjvqXCJDHAMgGpE+rdTYFCZrZH8wQwXj1QToo=;
        b=kGdxPEptuSl3cxD3QEy4hGTjrNFhUwnhK6c7hE+6LDBgE/UHm1YnbA1KOleF/8UcSh
         flYK0YiyAf7uKFE/eZ3TDUDymur4A7MN5f2V3nQxezpbu50P0OqZCNw4YA5qMlVK8GjR
         xr/sDCRriUgGOfKKSFD0HdYQOERSZQnQ0weqapgE4hcCme+sDp66e2JZddjK4bbElo4z
         VHi7lxmCi2HpXAZgFTfoyv1Q0yGZrRqYHEUboCea0AHM88G0Si53sA9VHCW3Gsm7ho8b
         OfNdhSBOuEc6O7bXPqTTdj45c1ljVLebnFJE87S3kHdgfSjcxuEjsjjUiipuRR0R3wUx
         X8Vg==
X-Forwarded-Encrypted: i=1; AHgh+RqVInACg+oqgE6d49buTQnkLJxiRwYwpQfXg2lP28Z96oBwj3J1vKYAn0cPEH8zQvvQVsLyse/tUMCNnA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5HJwk2BmEUC1I+mhbfzYcnJ7JHldyDHynTjlcKqtIM8LhUyQg
	Cxg0uRJNyuBSGJlHpAxo0f5RiaungxDfNFbv0xmJAHkTMM1/csGosOddgKEWpnp2Zml04Km5p7d
	Dv9Sy1gv46iZr1w4mUltUAUevhcSZHEAV4e4Cc/1Wq4Adzle1PfE5APzLTuTgBVbsLA==
X-Gm-Gg: AR+sD11qHYx2DGP0aSiOZ4YejDOL06yYMaAu5nF8G2UMDEYfyVb5Rf776c22uQ6RKbE
	fayxaAQIzTPxgKAx32LhtE5Wi8qVLJSpfNVKAnM9hGuKmBzi0jTWpKy8wAcOHQQm8iJRuyXjDKR
	yqqntEeMpNUH/zcYMwfSv5ba9CfUIiwUBhE5nERfQR1E+qGbGhbXsYZYfTB+LJo1iT+vXJ67msP
	MchUPepv3Q6ivnm54/nq56UKzlTgG06rAa5xQKW0L0g/9kECoHp5GrM6rZskGNQC2k6/p+gnV+i
	Uad6pql32gL/hVrqIhv3pEnME+WyMvsYYQxJ6X+8pimQcHpDFqCEKdG8t6C9z8TX8d9v1WYn1BK
	2//b+hj1kxY9jqdrbEF3c2dF6g2Kt6VY4C28=
X-Received: by 2002:a05:6a20:7344:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3cb85df0a1bmr23661493637.11.1786091366179;
        Fri, 07 Aug 2026 01:29:26 -0700 (PDT)
X-Received: by 2002:a05:6a20:7344:b0:3bf:6acf:2940 with SMTP id adf61e73a8af0-3cb85df0a1bmr23661464637.11.1786091365791;
        Fri, 07 Aug 2026 01:29:25 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.29.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:29:25 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:03 +0530
Subject: [PATCH 19/22] arm64: dts: qcom: sdm845: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-19-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=2055;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=2Ta7SYii7UbdsaXt3oAKqMeVVnuG/pODzCp+tQz2+M4=;
 b=QCFhMWAchRgn4KgbwLEhf74mmibB2pU9J8LWoTUrTjSlA+eyldJ/UsdFbx/8SKYfxOhC0c6pS
 ZmG/rN+DD8vDIuK4lVM0py0fmC5WcfSfX1PbTLwDjzHf8F9hempd8fM
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a759767 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=iB3bJDkhKBw2G02gjNQA:9
 a=Ul03GRaUMT3W8rxV:21 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-ORIG-GUID: uC9PZCCBhATBjDFJaD2_2j0reohJFmKi
X-Proofpoint-GUID: uC9PZCCBhATBjDFJaD2_2j0reohJFmKi
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX4yd3KLDT6KvP
 SN7n0L0pgjHnPhYHawExdMW9GrryY4yLoiJyp4hcLgt5L341PrFp+XOowwyxyms1FMtfNESotMF
 UJgno3ZGd727WW9fAuVuDBcyc3fOs54=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX7ZRbICq3zDe2
 bCPZdG2F/PRx5mjAxQikba4/QqD5TMv9sJR593/nfhv4Oh7ObdStlFdFhy6V77dNGdMg7ps3Rnb
 mWjejqAYp7ctuaxt62C/N3Ej9jk4PyK7KYOSeOoiblvAKKFtt+p6JNjT9EiGx5uSr4O697Otl1L
 DFrHLnabIiTGbTADm6HMyzN2Vvfx2ph9PkENYnRbTvtRYR5DWMXuNFGaWz9YrT/9C79AzZ4TOt2
 pX8U29edPNkMCj2O1nHtSwGWI0q/KWoGQnGKvRlfYFCTdUYdIUwoLfUqmqAe0EvphsleVD1cYYU
 LeyMkeT6qg5W3CsAdwXviNkWXdWKJof36yTC4B7MUinFskicAdhwS4dz9x6F2auBTvG6VQ9FhXc
 xsdveTW3FpwgTY4viOeO2HFruaKUg05hrpj4l7iimvRkinjrCHWHRnoODpYsRRJGpuBRYrCiCX5
 aEmY5/zeJEUaD3aZsjQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0
 clxscore=1015 malwarescore=0 bulkscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608070062

Venus VPU reserves IOVA addresses below 0x25800000 (600MB), primarily for
secure non-pixel buffers. DMA into that range, from any other stream id
would triggers unhandled SMMU page faults that cause spontaneous device
reboots. This is readily reproduced with one or more browser tabs
driving multiple concurrent video decode streams.

Add a reserved-memory IOVA reservation node covering [0, 0x25800000]
and reference it from the venus node so the IOMMU layer keeps DMA
allocations above that boundary.

Fixes: 36a80df44b6f ("arm64: dts: sdm845: Add video nodes")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sdm845.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index b1f6782a3ad9faf16e083d63cb8a6ea1507d4131..442834f394e6412386917b93f12f22069c4633f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -898,6 +898,17 @@ fastrpc_mem: fastrpc {
 			size = <0x0 0x1000000>;
 			reusable;
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
 
 	adsp_pas: remoteproc-adsp {
@@ -4346,7 +4357,7 @@ venus: video-codec@aa00000 {
 				      "vcodec1_core", "vcodec1_bus";
 			iommus = <&apps_smmu 0x10a0 0x8>,
 				 <&apps_smmu 0x10b0 0x0>;
-			memory-region = <&venus_mem>;
+			memory-region = <&venus_mem>, <&venus_iova>;
 			interconnects = <&mmss_noc MASTER_VIDEO_P0 0 &mem_noc SLAVE_EBI1 0>,
 					<&gladiator_noc MASTER_APPSS_PROC 0 &config_noc SLAVE_VENUS_CFG 0>;
 			interconnect-names = "video-mem", "cpu-cfg";

-- 
2.34.1

