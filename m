Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793021864;
	b=3wuj1LNMx2lmy35eT4vknsDSgKHNxO/ftDOuJhJQJ/vwY8k+8cmR3O/mP7kf7vD5CVaF
	 EBdU56TBuO6DoFS2JhyrS6LMV0JQjbInxA7kfgb8M0kJMXSvOIn/a2QtpK+bSQa7UkGyX
	 kOeIPtM59lYrht/APm/flvBbUUIouvtFN2abWXmpxLFsFL2xaP2rIpC1Howmhy08V7IO/
	 9AARBqWzC5HCQ1dnQsYiHxcLQTe4uB5ZviQdsR0UiEi8CmL8nXiF0Ltx76MzWODPpwIee
	 uteissFmCmbOh89ZGw/c4p+xH4NcBXFS4AaVTMJv4/tc+u+k+d6FEHwKac2r8SIWt9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793021864;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
	b=S+fX71xhtyqdkNONh6nwfyBRwkWDWFnOh0ZHAr4b9UoVyAJgBGC7dr569bR1QBiLrlAc
	 UHOAQYRTVSybRCU1v7n9uNFohtHdTHLePn60tYaiWyPFNL3HMKAKsckjKusDIX4rrhX6I
	 A+RtJcBpWi4lD0LN+8X0M3L97cyqG0Sgsdwq+gZuiQ23tPAYPFlQ4K2N4i50H8av0jaO2
	 gG37XJLp5P3/KyX+f4Y4d1A2RY33FzWp38JYiiAKm6B6lCIR2SC/KwxA+cDM26Z010oQG
	 Ow6kgCui6VhOtvKRPKA4f2jxLCIM5W00uGzes+duWw5dZHp8lnuEl71gPHKue9WOzVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8208460A6F61
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8208460A6F61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=To+5xErF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=bSAnt6cM
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAspeZ4131387
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=8NVtysIHAb2
	aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=; b=To+5xErFOlemyI2j53B+tCU3jyT
	Xq1t0PR/Ydkznmzbri8snC6h7Kr/QRuHhjjSs+9ZRutlIzgDtjgqW/wPDNDEZUz9
	Xey+tQQIRvNgbenmUND4vvLkRj3H8rIFKpN5w5bje3xZkE4bP4DXl51iokpcwGZE
	WS7os9MM7kn0pjoELYs5DKmc/mkR4oRqppe7pIG72cxHsT2GHwCN7x+yXyJ3fvxp
	X1HmZrKEG1tnpEbU6gVY39YngJcI9R0P6nUDmh1JGxmdAcI6i22fPFVALTqAchhc
	ARQDsv9a+jyunGkiAMWGgAgonoTRz8K80UeuYv6JoSCeuzVH5YvtDCcQ7dw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hj53q0nsm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:37:43 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93e49a1d3b1so396171885a.2
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:37:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793021863; x=1793626663; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=bSAnt6cMZW7KcRLSIeJAzPv2oCaHlcXgaQgkn0WN2UemwkTlyQ+vXzlPr25Wq6GryN
         ZJyuQX8mTu0Aq9zAR48+56nweMAdOqPpyPK0dmcLJMpaeFem6NYOn71uMeVKvHenXais
         yPAnlHFBrPILCKf4FnzJy+xdy/aQtt3s/wKlLiZ/5akqMF+PZeIv1NdsY5LdEMIflC9T
         HgM4R/TP6q4G4lmOHOUfLIDRlY2G5TKMjJqkjOmD+FY3RX+H5NNnYOA6VjgNFOHrC9oR
         qpZ7BT2vfI3yo4l3/0eN2fdh3NAe4uxXpYZyrmWL4XunPpPrLQEdEfJon+Wl/g59o2//
         IK1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021863; x=1793626663;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8NVtysIHAb2aw6KysRyb98OnPA6mo3D+Nkw0IkOczVk=;
        b=vVCD8f8JH0GvY8otParoyH8ZovQ24pzdnn0hYMzbDtRxGEJm/OjslAaoN7vVI0u+Vh
         B2MY/YYU7kmA4rAElJWCWXKaiSfTLzhxX+Qpr4kEo6uxX47lqmnjDGwjR6i5OZ2ABFfW
         0QuiHA18vwpqC4KKniaak/awewSIMtG+6wbm0fcpgNFJAul85NDHM4+pzBJArV1F17WB
         eypeEjd5FWenJkPzyz79Ho7ckvkrK3iuaP++vPYICZDhmtUYKAlWmCtfiFF7siEdo85I
         Bm4HnwLHy6NMUneR8At+0LZGq0nNde4sqY20fZalq1wrc6POPY542tJCsRWzQe1au8z4
         WB7A==
X-Forwarded-Encrypted: i=1; AKwUvBxJq/E97gXjGjig6V+U77y/RWKNfPpTGZ5xHNpRTHC/IOPEeSW0Hm0pwJoefGF8ogvEpMkkHiJx5iPIAA==@vger.kernel.org
X-Gm-Message-State: AFq9FYL95hMh32aeI60WkShAAFcAzgAr7kM6uGalMmQur/RPl2uJFUl9
	kL9LwHA8HO4dAB+DRNtKU1XWvGFhcmTohBg9EUkVoig5nOS5ps/oOPp6H3WepoVcONViKSSUlbp
	W9jvM+ZZuMpTw/oA/FVWO8h6ZgxijYVuzq8GXsnu01Jx3Vxxue7TMwA8N/t6vzHUMdA==
X-Gm-Gg: AYBFou0PaHErAff+cG9RQAyLAhK6/zYq1lj0RgPm6HwsO093swGD76QqYEeymiAjq9E
	0SBSlX+ltWRiD5WTuZfjxIp8sxpsF/Risdp476a9+OVuPPJ3zvgmOd7IaxwuxCAoXZtTv1miNlo
	cbhGXObFr6adkPjUC2EeqFyiMtVPL2sz6H0gKlQbimBSUiGoX5XMV8izYqfgxyRQlcrHfil/u+N
	pQ/E79BSvsqpIZKCiW5SEqL7eEpFzgI9fJVlOpD0KV/MAT1pEbjPAL68cnvIt12P+cP1Elu+XER
	0FnIc0Is5zK2HcufE9MD+58ovsvqm90yoN20i+1qZZX8oikJYdhqPVHU7BH2WaGbN1Uf8Zs421Z
	VPfFb6p/1EjeeqGLP3hq86WC0
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021019485a.71.1793021862810;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
X-Received: by 2002:a05:620a:294a:b0:93e:c12c:f13d with SMTP id af79cd13be357-940ef93d216mr1021014585a.71.1793021862215;
        Mon, 26 Oct 2026 06:37:42 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3eb8f305sm15376512f8f.3.2026.10.26.06.37.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:41 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v3 6/6] media: qcom: camss: sm8250: set the camera NoC AXI rate from the VFE
Date: Mon, 26 Oct 2026 15:37:26 +0200
Message-Id: <20261026133726.3249235-7-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
References: <20261026133726.3249235-1-atanas.filipov@oss.qualcomm.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX3ZFpj8lNlx1h
 mq2gPMHXi6el3U/2LoMQ+KSC8TV87fbI92qQ/6EKB7wH1wPBno7/FqKP0j7FXGZGNJpzVVB4Dah
 cC5B5I1Difmp8i0pPIJAWWeufJln/QI=
X-Proofpoint-ORIG-GUID: _Dt97Ejd0sJZDVr_eHj_VVVnIve9jZN7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1NCBTYWx0ZWRfX1j59VYpmoC/g
 B9lE1EMPO5YYMEIhlQn8HSI73+vH9UO8FrSLzBFnW2b59s6Tww35oMzmLRd8FF1ekz5ssh0jxOT
 CWEqQ8XBDnTngl0g/tYIfDJbYD7+sM+HeKoZcp296MK0ZtvkkNnW+FuSQMXqUhhL9FESzT/faxm
 ndzaH6U1WQ+MTTMfsu6vfCyAknwwRtqpsZ0355NjTFJ2XERERoyFCWDh3NJy1nXYS+YBKGjby1P
 p/uzJcjyhBtLLQ8SzPiEMn29Kak11ktUdmlyv9cyL0bl2a5kTeQ2stvOy483Jlgx6lpcD34HPb+
 8XkC4VfhuII6/iy4//3A6oveb5Jpx3rrj69p+93K9Isan24IjvzvtmFvW+C6sScCbnO+Is4Mrw9
 LyBPusv0c05hZGe8r2c4R/PNCXg86pieRca0F9P/RkyaDmEPnz6EKBcSuJa3kPoO04SDlvmXJnm
 Xge20i5e08UsC6eOG/A==
X-Authority-Analysis: v=2.4 cv=D93SufRj c=1 sm=1 tr=0 ts=6adf57a7 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=FiRPRoyJa4ALD98OXUAA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: _Dt97Ejd0sJZDVr_eHj_VVVnIve9jZN7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 lowpriorityscore=0 impostorscore=0
 phishscore=0 suspectscore=0 malwarescore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260054

The SM8250 VFE resources list both the camera NoC AXI RCG,
camnoc_axi_src, and its camnoc_axi branch. The camnoc_axi_src levels
are never applied, since vfe_match_clock_names() does not match that
name, and they list 480 MHz, which the RCG does not support. The
camnoc_axi branch has no rates, so the camera NoC runs from XO and two
concurrent streams stall.

Drop camnoc_axi_src, as the camnoc_axi branch keeps it enabled through
its parent, and list the 300 and 400 MHz camera NoC AXI rates for the
camnoc_axi branch, whose rate the VFE sets through the parent. The four
VFEs share the camnoc_axi clock, so it runs at the highest rate
requested by the running VFEs.

Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 28 ++++++++++-------------
 1 file changed, 12 insertions(+), 16 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 911ceb7202ab..8ffe02d97dbb 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2120,13 +2120,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe0_ahb", "vfe0_areg", "vfe0",
 			   "vfe0_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2146,13 +2145,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe1_ahb", "vfe1_areg", "vfe1",
 			   "vfe1_axi", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 400000000 },
 				{ 350000000, 475000000, 576000000, 720000000 },
@@ -2172,13 +2170,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE2 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
@@ -2196,13 +2193,12 @@ static const struct camss_subdev_resources vfe_res_8250[] = {
 	/* VFE3 (lite) */
 	{
 		.regulators = {},
-		.clock = { "camnoc_axi_src", "slow_ahb_src", "cpas_ahb",
+		.clock = { "slow_ahb_src", "cpas_ahb",
 			   "camnoc_axi", "vfe_lite_ahb", "vfe_lite_axi",
 			   "vfe_lite", "cam_hf_axi" },
-		.clock_rate = { { 19200000, 300000000, 400000000, 480000000 },
-				{ 19200000, 80000000 },
+		.clock_rate = { { 19200000, 80000000 },
 				{ 19200000 },
-				{ 0 },
+				{ 300000000, 400000000 },
 				{ 0 },
 				{ 0 },
 				{ 400000000, 480000000 },
-- 
2.34.1

