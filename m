Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0129C244692
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:27:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091257; cv=none; b=n5VXFe6s/+UuWsKQ4ovMZKSzYB5e77TTrXuqHlu96G859Ch3DGROTJNoth5kd5x0eKH6dwxAOrzCCYp4Uk1h932WZvrOnMaBACsQTRKUVIarCUpOP6pmm7pbIVSN3cFIaCtIK5kBuumqWWzWOpfVv0CtE6ZCln+ff/B0RgrGinQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091257; c=relaxed/simple;
	bh=0TG04ZRgKMRBQkdHc44evj+G+ofeKaR/uujdqn3UGAM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u0VRnSVzTuRZOetizcGpF3Q5U45PbfdBmwcaInlriVkHeW8lSYsm9ATidQ0X2GE4zI8vcRlD5br5rLr/12rYZmVnHwl8bIy1/HwD8E78E8be7FqReY1J5lB6RZj9WhTxQBBZ+qI/2tWZ/orjRucWVz3K01vfJhQUQ173OHUkfVI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ZdRFjbyo; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Bj0I9oaW; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZdRFjbyo";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Bj0I9oaW"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67781G7u4063439
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:27:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=; b=ZdRFjbyoBCXM7kY0
	xoMX6pQTRB+Tl92TqYjw7rZlDmVs69+sZenO/Y2l8HiT2Rci7KvTfRacAROQZ2Wy
	KiazftIu+jpLBD9UWcGoXGiSrxKpqLx0YAXyvg8iydeXcnKao8ciwArtqGolmGzu
	S5/GLLGim5vlyw21cDHjFchJ9FAFEGRQE75twISdT1GfZKS4rbN3Ffp0GP3wfRFF
	CPKO0GIW5ZFZ2xGhNEloiEiNXJrZDdZra2TNXr8uklunt+8YSqQ5WXNCuwyWMz40
	p48AYWmQohAfMcwXPJA5R5lWAmG4bc6uuzuPVzJf9abRTy1sv+T7ZTRR4t31QYB8
	Lld1Aw==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com [209.85.215.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6hawxd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:27:33 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id 41be03b00d2f7-cab041eced3so4614929a12.1
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:27:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091253; x=1786696053; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=;
        b=Bj0I9oaWsDAVOQ87MVpJvwbc+uArYgaj33/3lME0aYhtC//4eEkB2truAsCe/AILlA
         pYdss6NN0gUukxOddwEsc8vzbZs06racWZ2UXKUnHUVqcBwftdgmHAk+X43O2V3oMyFN
         KL8ufxlT1vTxUAO6iIbUTZ7z9XN+tPo3dYOr3FL6kpLNslCKY+HPGSKpu3qtNGm4HUR/
         AeBKFTqLZIm8bX82jz8pO/WOZn0LgwIqeJAUSmGGZCigBWpyBcqXGODYspENOBNazgkE
         WLfzAp+ovYRKQCXvs/bzAd0pzaq6YuuCkrczFNqxzZGt3JyrYGYz1jJL+A06m/oQXMCb
         atyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091253; x=1786696053;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bZYjfboQnw+LlvV48srSW9E5sxGPsF571xvYrF1+7m4=;
        b=K/NmNLbeqd8XskORva1jz3gFrLKmWLI12J0ncxS++sMUdUrZKGNrVOS1gmK0AM2dJI
         kE0K/K9LrbDC6Vx0e4sRfQ33vwPVSW8Qwum2DQfLVZMClQVTrdnxiLKnNUJFIbUoRPNf
         7tk0kwyUb/DXPKpxWfwdpsIYv7ZliGDd1jizVWsbiZLvxAb+PkINgCgFjd4LogNnHb89
         6advSeluKqBOrrDMgjq0cMyB6ZkRZRQrgYaF2VL9FEEJodCXwfTbQ9GcdKfiaVH6vpWY
         bkbjh3v4C/B/hHLSYvaKaYXoHB/dQy+/AEoIV5A87LiBi6lGvPgS6IRxk7Ob+/LOADWI
         +Y3g==
X-Forwarded-Encrypted: i=1; AHgh+Roib9cAk258cwKzYmBwWtsLWy/nLnLukfwWLuo1snQl7M2ikhYQBO7CjJ9esxGkFrBipkLGajqB/r/oyA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKS1YIwiT8TIqN0lMZgiJpnPWYAWLyXqLdLXSJPFYLcmTmF6Bq
	BPXw7PFx1ndjnky4Iv59BNBlDwp/INaZ7FS07CFi+CKls11PKMhh97P1s7RYtwemtWo8zehttZ7
	cyxapm+SosOfnHexzlyS2NRG7lptq8hjDxEjJpkpNvQ+krDOtZ53YaCqa1+W4SpFMZQ==
X-Gm-Gg: AR+sD13YgBkFU+ImShZl8Y7fdG3IHVAuAM/H2rukIsl1Tj21ASQIJzHs2e4diPZtT0n
	EZArxaLfYX+IjQioXN0lv/q1CGoX7E9inMHVTuetUHRZZGL6gYIvowyOXnryfM1gIZ+wDPClH7P
	fyhTPRnAVCOnbc6W94VgQidui0Y8F89pP3fqzDMQCkAGJiBEWtjOC8+MQ5gLLa4rbkJVrsdhhN6
	wQVOK+lSrUWelLBg2oalMKILtyRwwNLC5r7Ts1KnQFFskbuGIRiRYbEBZUxFgoUjA082dIBHRO/
	KtBUUmDGs6xt43jDxrhxiCHb5CV6JwntmDL38JgSdaSSR0a7CjlZ5bx5QECeGNWtH2S1Fvv5l3s
	Dg+ESDPkAUXmQHrlCAmd+l3qvyljT9+E2tAE=
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cb85df2790mr27438888637.13.1786091253187;
        Fri, 07 Aug 2026 01:27:33 -0700 (PDT)
X-Received: by 2002:a05:6a21:6013:b0:3c3:7ac4:dac0 with SMTP id adf61e73a8af0-3cb85df2790mr27438798637.13.1786091252681;
        Fri, 07 Aug 2026 01:27:32 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.27.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:27:32 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:54:54 +0530
Subject: [PATCH 10/22] arm64: dts: qcom: sm8650: Reserve low IOVA range for
 Iris
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-10-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1927;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=0TG04ZRgKMRBQkdHc44evj+G+ofeKaR/uujdqn3UGAM=;
 b=mv/WEh9g+HIBWc2VWXta4wat7ppC+ripqriLmt+TH2wITfZTTCEmYJtivoRh4ZbxeFSl/pBgh
 Kn5GDLxjpyCDlpMB92zUCajtt1gmIwqv2xboV/e2o1Voco61NMOQIjv
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=G60s1dk5 c=1 sm=1 tr=0 ts=6a7596f5 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-GUID: oFmcUEkqk56-FtkDuaNCu_1ciQMFDi_5
X-Proofpoint-ORIG-GUID: oFmcUEkqk56-FtkDuaNCu_1ciQMFDi_5
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX3aatyNmofTpe
 RW+dkj0GB7ODmoIHNu6D9KpUUeryfRR1pSjC1OT/DAJJfiFWchaZM+bK+dfmn8LpvDr2upphUbc
 IEkG/g7tQlcMUbAM6rmKLRgEmaN5G8E=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX3hs6xQNtD0Vm
 cW7aGKHl12i8bAZu6gCVaUyH9Wt4N5wuCWUNukSD35d580cstNlc8THC3LQTvDW05ohnSjQnr+d
 PZZjZfKqrz3WFhgZeW9kPEtdRfttWoX70JMVpkqhgcrGYQBxiLZKRAgLw4OTrJUA4C3bMXojorR
 Ssazfac5+r5zQFQAW0VgIX3AM2NtQ70PoG0M+KfOyTRjsGNfnbu/728SBSV+Fz+2Il3x8wmDHJo
 9ypMhQYOw2GDwYpvt5OuywkNDAhvX1bQVCYtcYl//5HduPpB6l3Qn3jhjYgmPsL+3Djz7bW72gP
 bgQ42Q+t8FiPtaaEzUCGm+HWyFStjCibVZOalaEh7xt+SwOLDzF0K0AXv1ABAH9sptbPBUdZLa0
 VrOoEFCdSDKOFPbTi/PbOtjIz4yffXl8mbQfQSOs3cpeBktKGMwq12xvDOwb53lfq8GFXe+ETPd
 lprrmcN+auI9eCz0pvg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-07_01,2026-08-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 adultscore=0
 spamscore=0 clxscore=1015 phishscore=0 suspectscore=0 impostorscore=0
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

Fixes: 56cf5ad39a55 ("arm64: dts: qcom: sm8650: add iris DT node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/sm8650.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
index b679fd8afb7d533f2ca42316cea6fb34997feb75..97bc56bb61caed0547fa377406f4dc3180bb22d2 100644
--- a/arch/arm64/boot/dts/qcom/sm8650.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8650.dtsi
@@ -1905,6 +1905,17 @@ llcc_lpi_mem: llcc-lpi@ff800000 {
 			reg = <0 0xff800000 0 0x600000>;
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
@@ -5266,7 +5277,7 @@ &config_noc SLAVE_VENUS_CFG QCOM_ICC_TAG_ACTIVE_ONLY>,
 			interconnect-names = "cpu-cfg",
 					     "video-mem";
 
-			memory-region = <&video_mem>;
+			memory-region = <&video_mem>, <&iris_iova>;
 
 			resets = <&gcc GCC_VIDEO_AXI0_CLK_ARES>,
 				 <&videocc VIDEO_CC_XO_CLK_ARES>,

-- 
2.34.1

