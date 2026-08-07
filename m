Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46B83B8409
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091282; cv=none; b=qyrDEo2i/dru11TaK6cfU7IjAdr9dW5U+vuyfTJnaAyaSrrQdKHl8wCNAfiNxyg2Fp9Vm/1Th1oIBsz5BiSYm/vPmimCFEd2P8uLLGu4PVgE/eCYvlchK5F8KSgv3LtCdEFBQlyRvcMEy77xBFUGBissUgFQjRELKwFJAuyYyK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091282; c=relaxed/simple;
	bh=KqGUHd3qFik/3HYQ+hBPtHvoV8YV+aNNOJstuZvGbAo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=aaA+P+Qi6Tb/XjdnHd83DQnKT/bo/nWkQ+GWN46wmkCdeaN6QfVaUZRjpG6s39Kos/AAgPoahinsf/MUNJMc0KMxknXITHO8RtVsHliOjUTed4wMFQMW5RRGIXpQnyg5NGEOCGR9rZdtmMrVxELIAk7OIu7ZnNxf316yWN4I6ik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Z4AsWTVf; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Wh0XZsL4; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z4AsWTVf";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Wh0XZsL4"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67780paD3829628
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:27:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	yncoaJbBZ1/xcSu1pOWqjeOKdyOuKp868TeAmEloDjA=; b=Z4AsWTVfb3o1sp37
	whOy3CFxOcJZRMxmsPuK24cTT00xXCt0KeABvVgl5++XcJvC4Ju8GL51nUZD74db
	tjUMpGcGEdOppfMxFXDDidETkVc01ea/xodJaQEbN1J9Rr7LNplvyP9aJzjPeY96
	KLDHlDUUWaWwORca4J83fYJg9XNHDk/79aAAbH+nrrRH0Jt3nfJyx7WQn5ks/NTa
	CjpTh9k/2DuVhe433zKPHsSdVDvD/sMJm6DMVlNBl0dXevAU6SpMm6LlR8VlYMw4
	2v4WJPfV+l+r2OvtnRnD1qLFndZExbNwJobs5r1u56z86zsqoHgcBfN0ONOmpOn7
	apydAA==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu42h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:27:59 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cab3e9cd922so2045086a12.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091278; x=1786696078; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yncoaJbBZ1/xcSu1pOWqjeOKdyOuKp868TeAmEloDjA=;
        b=Wh0XZsL4HeyVaXoGA3VkDf3lHSnEdoV5wWhDvade4qHjJNuRQ0BgUgYVnfuTyR9Cxq
         sEHyVafwMfr0EbazHRV8dKGgPHuaMOmjO4+zKZMKa777ptAaRdnjkwLMdgznEDD1F/bD
         XN9od7zdXNHAI64Jy/v1uFs51umGhEt/N0HnSQBL1ZufjszYMQHdXr5RkOdU35Tt1x57
         Z2Cadp0YvkoCmbKK+IbqWmMlK9MVtHzGgmdXQRyndoobWPEMUCUhproBdHkD/P3SeDBl
         S7zYN7gZcFDZIPesib95k3qpWcKoSX1hHJ8Sjj8OtfjElZAhaHSIkNjlPg6jC6ps75m4
         5pcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091278; x=1786696078;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yncoaJbBZ1/xcSu1pOWqjeOKdyOuKp868TeAmEloDjA=;
        b=ZL7MzBnfgLuDNfI88NF8YYh2SkUAfCgq3caXRTB1WAAbLN2c+bdIm5IIXLl0jRyjTY
         tQCiqja7JfpmxS7Kw6oI/ptPdl8wjlZSvdeuEUYtRxDUadhq9OaOGeXHm5CvxWZm9dqL
         llhAgIISKMxNT2ji0tSl05aP02H8Add6AaCBS+2+CkcDhOPZ5dMtLJgbwBr5wX765WcW
         K6lS7YDcVmFv7oqaHFlqou8R0HURkoxDlwhMty0Xb29JFa7h2QZHrzG8Ua4s5z3qWXoA
         UZnkeG1x5u3izAzc2i/4tzvaEVt5K/FnVCxC0kCWt9W3q3RHnyg0hHBbuoyLA0ree1t0
         FycQ==
X-Forwarded-Encrypted: i=1; AHgh+RqYacNJTzS0fDXwvG90cG3+97j4iBgCnSWGwT0OQ5laH31COMuC/EJi95JHLE7g8uDAsefGjktlY3EvDw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+O5kch258P5f40zJQy9jVkWSZceJ1S0+7EpWzQpwwp14+HTSQ
	D+Mo+T6laGa8WS28Se9AYwr8VWUSxGU9NEFTtWCb3n12G2BH5lJNtrMn5iho3t18xVeKgWmR590
	NCXGFQeUcw9lgVPiY06UcDfFKuT3K2gB74lIuXj2b7YAbeEjOQ/W9caFa90LPF3lCqA==
X-Gm-Gg: AR+sD10sheHbit7XSsZkEkeIzy00NGWBkEge/7M/46Xr+D7ewZsNzbECqKf7T9vYC4m
	xfDC/4D286LYB/sC44sqFoIGH0ilep0r6qHGG/u+HSvBlfamVlk/uMAUI6K+uTnTc57PO5rByNb
	blbbDUI5XX0n3dmT5wXnbsUI/DLovkRko+E3dFeDvJV4v3TbN/4rlQ9gLN2qfXzCK2pZRHDAVBg
	PGQZvHpm6t2eAoUfm8ILCd48o6g0zH/qruSkSn6WKIcCtcqWkWtgl4sKODCpcHC5plSJO01SZG1
	qpBW0O+6hwgrxkQs9LSQVa4+u9INKkejqKbVJ5jcAkxDkBoXYeFfgRoYx6ES5daccpk+DB6bZCz
	ZpCHeONp3sgEk1j46AtMRWWPJOWZdokxvx/4=
X-Received: by 2002:a05:6372:a70f:b0:3cb:9594:91b8 with SMTP id adf61e73a8af0-3cb9594bf77mr18102323637.35.1786091278100;
        Fri, 07 Aug 2026 01:27:58 -0700 (PDT)
X-Received: by 2002:a05:6372:a70f:b0:3cb:9594:91b8 with SMTP id adf61e73a8af0-3cb9594bf77mr18102282637.35.1786091277699;
        Fri, 07 Aug 2026 01:27:57 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:57 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:56 +0530
Subject: [PATCH 12/22] arm64: dts: qcom: agatti: Reserve low IOVA range for
 Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-12-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1926;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=KqGUHd3qFik/3HYQ+hBPtHvoV8YV+aNNOJstuZvGbAo=;
 b=d9t38wsrwD1u2MRMTYxZgoEWFvw3lBqcDUx6RtJ/7BILMhKRyt+TFWAaAYdBnWnDZuNEs3Kx9
 alsZV1UVRyGDesW2laOnhPUL1eEi6W+OFMH84VGmzdnd1uOs27rWcvL
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=frDsol4f c=1 sm=1 tr=0 ts=6a75970f cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=GHpYZHFKExNjpo6qA40A:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: j7jH6NRwgbWgyaDqfCSkUltp-0LPj3H4
X-Proofpoint-ORIG-GUID: j7jH6NRwgbWgyaDqfCSkUltp-0LPj3H4
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX/pT1615RKhgl
 zCJpZb/oIpW0AmT7dq2Q3fFudM6MIq2Gx0mkiOTD6qubeXubiOpmT+w6TQqNOD7R+sT07+bXDWy
 17o9q78jJFiDbsHHzFiau4+wVdXGEgk=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX+FB/WVWUiwcM
 /c7QQtC4N2va2v/+Zs1QITZUPAsjN0xchLIZcZM9SUJ/1aw2SNBG+k3dadNMAl1XBHSlgQeE7Fv
 9voPEezeLnIjur4DUFnOEp3GiuDs9EcDIWKzLagudmp5MHXhL+QOHQvtF9mi9xo5nYAu08RQjSz
 2bkx+4FCnYD4JAeywvob3946gzw44BuAKL0gQH1WSb6O9CL4TDm6okQLpFgRWAEE7c56zGP2R8r
 GXmqoJGLtyuTsbjo7itlfd8uS4Oky6z2eID7gBCjtygpRVOuzSwu4VIoBW8obdzdJZfFLXXwP7T
 4dwNyOi0HLQxUjnNAbGhqH/uaHNEABepyxR6P1lIGvXMwRAnTCaG1QFSxi21xZ675O9f2SGAsNe
 pZNzcxalan51YQdHUPqgu/ynu5Ln8zJKOyLdcRWR9xkWAsl9/UXT/z11Hu+BUJMBFBvSXwrOq6N
 X51WQbEGT6nsW0q6zwg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 priorityscore=1501 clxscore=1015 suspectscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0
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

Fixes: 7a37bf31e3a7 ("arm64: dts: qcom: qcm2290: Add Venus video node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/agatti.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/agatti.dtsi b/arch/arm64/boot/dts/qcom/agatti.dtsi
index 590bd2432d85ba80891ed42df8afa317c869daa2..6ae66ef882363a2b5b529a23429dc1f2820b2086 100644
--- a/arch/arm64/boot/dts/qcom/agatti.dtsi
+++ b/arch/arm64/boot/dts/qcom/agatti.dtsi
@@ -381,6 +381,17 @@ rmtfs_mem: memory@89b01000 {
 			qcom,client-id = <1>;
 			qcom,vmid = <QCOM_SCM_VMID_MSS_MSA QCOM_SCM_VMID_NAV>;
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
 
 	smp2p-adsp {
@@ -2486,7 +2497,7 @@ venus: video-codec@5a00000 {
 				      "vcodec0_core",
 				      "vcodec0_bus";
 
-			memory-region = <&pil_video_mem>;
+			memory-region = <&pil_video_mem>, <&venus_iova>;
 			iommus = <&apps_smmu 0x860 0x0>,
 				 <&apps_smmu 0x880 0x0>;
 

-- 
2.34.1

