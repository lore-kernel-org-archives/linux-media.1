Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D84364B049F
	for <linux-media@vger.kernel.org>; Fri,  7 Aug 2026 08:28:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786091332; cv=none; b=WOsrrF+wodSyodfPkYEdBIt8Etg5qww/EWIW+5klFFT5Bi+7YtixbnPfb1toJW3ibSdWDPud4HOQTNCO2Q3PKRNlnmlaPrlZ03ZQzlUQfqZgNfARU0xHXWT62A2Jket9xKt6GssVgFhj++2r4Y/iMqUE33bN5h5sIIU4ljgC59Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786091332; c=relaxed/simple;
	bh=yXWuI88NcK/+k+/z1hs1yHOGnKEvJlMTXjYogyIyB88=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DhWwsSz96o3yXnSOvrG1NuK+RZJP3PDqJRkhmI021qJI1EVjST7LCp+R0HbuhIxzHgqKex1Q4pQmjzbsA6ZVyo/BP4iedJkiUCsKLzlChn8Bvh30PTDXPjOc3e399frkPZIUNXcgIfKbgcru147Px0+0KNkGRavXnP1C+g5BAKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=ppLhNqyI; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LHH0EV99; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="ppLhNqyI";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LHH0EV99"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6777gbO03822531
	for <linux-media@vger.kernel.org>; Fri, 7 Aug 2026 08:28:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NWqBAhAEDnGxuGldY11/kUaAYoik471s3TFZpVj/LMA=; b=ppLhNqyIgZgFW5L4
	iII7XtTVgtdT3DRaXWfv1iAMm3hLcuHvcToHNrDJEeeYyf6n0Y7VjoQQPWaLBTWm
	P8CPqoVgAUkkpkEmPQrY9HscQVlGLazBwDvB1BrvIk77dL0Ohg/iighy/l+BHWp7
	PxFbtRiCVdaaU684UH7AMBVcLuXJlaYodWscMPmxUaKH8y0xgN9WnmUGhNSF2Tm+
	cs+HtJxkjQmbyAJ5avAaOEwl2pjk61Ksrj1Mi6jUJyZ9G2N7yp4ETXOC35shCRwG
	iWPCgXs1uSDlLlC/NpqF6SHDKIxBdHRNTKRLnkC/gM4QsgUZZF+adlwHxgtikvt9
	+nUwwg==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fvy6gu22d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 08:28:49 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-ca124bf0189so1449963a12.0
        for <linux-media@vger.kernel.org>; Fri, 07 Aug 2026 01:28:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786091329; x=1786696129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NWqBAhAEDnGxuGldY11/kUaAYoik471s3TFZpVj/LMA=;
        b=LHH0EV99TF2I6aYPO3v4+6bGjnoljkksGwbV9hNo/db1JBGv7ctdE5GOb8wMwCPxpS
         tKvmOmtitxTqcknQllO3PQ8NXThIKFnf5f/IslwARnK7inf4Irk92Z8HZV2FemheIvTW
         UjwSFHU/pPZaOqALpP4aiDEwJDpJUbuJ5p1s3/yFaTHSQz2P+KNDH45Cm1LEY9OLoUw9
         EbWkEsQWfm4vujN+I5/I83uRt83OVjPyDezJ1kDANIYqjg9sRjQW5XZj/wuazJM19Axk
         UmB8gf/oXXO6jjmZvzbuszBB5muuB6LS9THiBRq7QaY/OcDbrfdUeMJoKN4DIu3HjFX9
         oHLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786091329; x=1786696129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NWqBAhAEDnGxuGldY11/kUaAYoik471s3TFZpVj/LMA=;
        b=PRhZ1FVVPKI2sEtBQNHOymNgShJs1n6IkB4c4D8j2jlefhkRxDWTygx4ObtzICmirR
         iU2zGSKPwoZ/MW/75QfG/Pej8ZvB0JeLbps2NPAcqCGA6LTXkt2I1cMVZs7d27KpWI83
         /TyhmhqJYOxO37g8gc0vQLJOM5gtp8PU8nj4Qm7JFr/mxclkHD6CM6b5TfZH5zkTM4Sd
         cWPLGiK3iymW0Bbs09DAQ/8EUUzNFGHvhiCsgftQ2aMVtJz8DmIHRxbEeq+Uxuvfsz+z
         s0mr9VHxLelp4Os2MX5AL608ifCfutFoXW9sJ8LaTgE4sXBGvpc5A3076Bileje+XpG8
         ufRw==
X-Forwarded-Encrypted: i=1; AHgh+RrPXe/6YfjxPfn76c580cMufcn7T5GSrKc6b4BIufEJptdHZB0AFvDaDs1GgHn4RgavRlYyMcqBgNzntQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhjjyMSyISrPTFL9mTBtBmOubWlimO1jQUVyuHPbs02ALazjmo
	CupowlETa5zoexGRyLJBB8EnUwvANiPBjLn4A0O8Q1iZde9se7C+GWS7epmoRESJs+9Jk4REzmV
	0BQHQ2mYg5P87tS1Pf8QA0aOCNA5AYHOl0jpXIVApqxdSbjGMl4lObJW3q/tKX2jVBQ==
X-Gm-Gg: AR+sD13zaelfHEhYhQOra01Li/5tt8kXVxE56hJJzmaMJtcxLzKMX5VKxlL4RRNUOqe
	BVmlyyDfOXJDGRdx1gW86MZb02F0zj/Hf7gVmQe/M8wvumJyXfvWdKNfuLpgdwEyTHb6f/IoR6z
	NnVmtOSkgFw5fYvX0dpFC72oNt3ONkSZJzBzwVf4tIc4RXTbph5wVCMtqwIs9vt0JkpF91LLc9P
	7NeaG1O+44ObjaRu7e6DH8/WgSBhsHmh6xm393AlobaahzwGp9I5AQsNvl4oqIYKgnjiWfgQXAE
	/lsNRHgwYbd5qyxCxjXWx7z6eVjRki+/XmP76QZ7GHnuv1ahPekiiEm0bjpk9rfuoowbu6YYlYI
	rAeV5UYI5HyjjQvnFqGTqmWKaKtJChRraGS0=
X-Received: by 2002:a05:6300:86:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3cb9c071e7emr17190935637.1.1786091328673;
        Fri, 07 Aug 2026 01:28:48 -0700 (PDT)
X-Received: by 2002:a05:6300:86:b0:3b3:3506:cf3f with SMTP id adf61e73a8af0-3cb9c071e7emr17190851637.1.1786091328204;
        Fri, 07 Aug 2026 01:28:48 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec2ec20sm5377977eec.28.2026.08.07.01.28.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 Aug 2026 01:28:47 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Fri, 07 Aug 2026 13:55:00 +0530
Subject: [PATCH 16/22] arm64: dts: qcom: msm8998: Reserve low IOVA range
 for Venus
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260807-iris_iova_600mb_fix-v1-16-3996f67e33f9@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786091113; l=1856;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=yXWuI88NcK/+k+/z1hs1yHOGnKEvJlMTXjYogyIyB88=;
 b=qRsjnppLMpVByhnPTDozHAqm2/zuiF1OkPKaLGMOd90CSNpZXkEt1xpwKR0vC/r66lh4XU/2v
 Iqu4BF6L5mlAgu7IXw7Ia2JROM+GEikvahpjsDvBju8qS8R5BgYuB3O
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Authority-Analysis: v=2.4 cv=EYH4hvmC c=1 sm=1 tr=0 ts=6a759741 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=oZq95A5y7fdjfYKW3kQA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-ORIG-GUID: xsizM3BsMO519abdWe233lwPv8NxWPNR
X-Proofpoint-GUID: xsizM3BsMO519abdWe233lwPv8NxWPNR
X-Proofpoint-Spam-Info: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfXz4dzRen1i3BT
 6XqijdabXE8cw+L+529zzTN5tFK76g6D4bhtzcATlPMchOqPE8HioAFg7LkMD3IlWoDIQg8PkpM
 2/bbswThUGjpzwDxqeazNKzWf4wnYLY=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODA3MDA2MiBTYWx0ZWRfX7mXx63uM4Y9h
 CZ/Z2nFGApTqJlU075pU2/CQ5ZSuKpmCm259DCD1fv1YEU8pbMdqeGb8bCHaqSn4V2+fw+GKlEx
 6UIGh5DeBIU6OwV5mM8nA9VOhD/XJTOZFllPl2PdBCqY9LcfCQP980Pt/mqfTkfdAevRL+ECxXK
 Ekshan8e1TJR4dmOZHh5J82Y7C2qIjkiU+swHo6SBu+uag0Q60tXQVmCsFluPduUPfiDTWwJiWc
 tz68GFphhO2K6RfRftMyQp3mw+p4mM/RuNEPn/hnMVo0KXbCMa9usQ9s8zFju4zFQ8UffNfDGKS
 aNu5snas6cA3BhIGv1MU+V28hcbTv7OCQzGqxg2ONar3xWliuW84cvnl71ZpJywTUMFlgGBpBvZ
 6jHwjYxpcu6mjYZDCgGECLYEblQrRqCta/j0w8GO+llG1S5Jq3Pf6gDmnqxZer1+c5PPJ2DwhjP
 xaDHSAwYdCdj33IILvA==
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

Fixes: 1c6285e10d76 ("arm64: dts: qcom: msm8998: add venus node")
Cc: stable@vger.kernel.org
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/msm8998.dtsi | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/msm8998.dtsi b/arch/arm64/boot/dts/qcom/msm8998.dtsi
index 5038d0009c1a90851af1de91925facb4117d82fc..08a9e80ad6e1a17db1ced3a1ffc0c28bb35e84ad 100644
--- a/arch/arm64/boot/dts/qcom/msm8998.dtsi
+++ b/arch/arm64/boot/dts/qcom/msm8998.dtsi
@@ -116,6 +116,17 @@ mdata_mem: mpss-metadata {
 			size = <0x0 0x4000>;
 			no-map;
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
+			iommu-addresses = <&venus 0x0 0x25800000>;
+		};
 	};
 
 	clocks {
@@ -3201,7 +3212,7 @@ venus: video-codec@cc00000 {
 				 <&mmss_smmu 0x42d>,
 				 <&mmss_smmu 0x411>,
 				 <&mmss_smmu 0x431>;
-			memory-region = <&venus_mem>;
+			memory-region = <&venus_mem>, <&venus_iova>;
 			status = "disabled";
 
 			video-decoder {

-- 
2.34.1

