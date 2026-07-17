Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810C142A156
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298037; cv=none; b=lH8elvv+dF+WLTByEWbD8x4G+FtGy76knSLM6R6GWlb+Ugj0z50kdWk9dWvWwa3+J7M+pu9FVrAfUih1JW0ByQrAGqZegIfS5/qkipoGWbjJlynV36px3yGPA96NHYkQS3lMFNDdZ3jA1I2mvIgZudn/DZz4VNK6Llt3MaoSz+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298037; c=relaxed/simple;
	bh=vggIaXAmA6Yss7kpMdyZh6DKjf4YMAva6nFLoLd4Bvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CGbD+Y1PJUFmnQavR5QeXW+REKtFu7XxfywkkhxFS8hDyGTwWUvZL4hx6zW24JCu3vB2Wxx7q303QsArigGkihFgUUzfdP71EBT5TP3rYZYK72OMeAe4MbNzGtxIfL4GOWDE+4xyVfPUy5AlK2cGmZwb7s7svdm9vjDBhwlFni8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CX8t7QQF; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=T/RQkfhm; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CX8t7QQF";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="T/RQkfhm"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66HE7v0p2106293
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=; b=CX8t7QQFjO9yCB64
	8P//mDiFQ6TottsEzHAcld7cEcF8HtYJSZ9Hc8cggJ7o8LWKm+Ml0dISEF7uqGXI
	qeOL+QHBMuz+UQTE2dG2A6vH+p6BgAiZtAk3sOSL3eJEpQAMaUGQyAxZyAZG+JoR
	EcPJ794toDlWZP6D2568l7Yh6GlwaWaNHQjwJg/cMoE98gsPyWDc3V8iWu097lCw
	27EthXCK97mLOMtIIFdsGw0O/2LuE+vJipWh181tbEmNUDxDA++0pm5YezFrIZK4
	C/NzSsXP+Pzhl4pRUHulYkgjUj8c5fKKzlm3rVYA0f4GiHT4FoRX7975vh6JtcXX
	RkRPEw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ffhpfh36n-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 14:20:29 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c083f1818so83880541cf.0
        for <linux-media@vger.kernel.org>; Fri, 17 Jul 2026 07:20:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784298029; x=1784902829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=;
        b=T/RQkfhmJfsZenRxM06g6shgfuCEuWpy822Eim4I1bOk7Grsjc/OLcMIaA2agHL2Mc
         rpSLx3wgWz0eKydbWcRb/PVEtHk3fyvNPAy80Hpq+KVvSxPfGz7l8B1opOClBPgqvMVr
         pYkVVbOI8ydFOxHUWfxUKirhAhJ+QFQfmxG5Pwg/qfQHLbk4df+g+LxYqLSNd1iuasOq
         euZ0aqMGGb8vgPqOiR/LPq/Uxha44Eu3t6KucZewtstsJbRQHMkednMmf2zlyMsh2glb
         LV6QvQ7qaFzRhQcKd2XgsH48792p65b+tBQTAqFqNC8VMslzBndgK4sKJsOWsC4dilD2
         zHmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298029; x=1784902829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=edfRtFYLwk8Fu9IUOWe8WQs2lIrGUdbWJQc9Z2N4zog=;
        b=BAjXmueqVnJBjsrzrwXZDMWR3HnxK2dk/So/y1klHelEsZRe2UGlsvpOAHHxR8g/n4
         rYKRPKFoG6U9BMq+0zh0D9Fi0xsSmC6PwZN1yQ1GJTVXV8shfhOWhIYFg0MWWvH25PGj
         WXE6HlYySaCHUGXWQ/h19PDavvJpQPfsDB5JvMKD+oVyREJVkPruivknFonbpyhk1NkT
         AEfjWMUqbQb/2TrXkU60+iEowfHW5TPy+FDdFYG+wog7tBMFLOnTX7vQrNugj5qes95G
         Fom/SUVBdcQxEBRwDPmf+QkIzeqsUKOHVQz52ch3AE1tTgQVyI12EsuJpfqhDFLTfTP6
         8X6w==
X-Gm-Message-State: AOJu0YzF7sws6OI2QO5DPlGtgcZa31HaP0tEQ03H7BBOSzlBfusWZjAU
	5Hpn7+ColHUHAzHovclLa2FCFF1wFvj2ki/X757vZ23THB8F/jaD+XBJ/HsxjyPApoKLqNEAiSF
	I4lzggKrSdeygLoCxPoGXDU+kDWH3M/Sx76l3JVoGJlv5a6QOm3YxWeH0bONsSal/2A==
X-Gm-Gg: AfdE7cmXQpTzCT/Q4BYTMZvNZccEX0gCiI2Op8Uca2ubKxHd/5HLYBWGA+VUEzFyb95
	HeEnLKe3w+Ib2otqWKYlhysKYxeBocq/sbwEVc39dlhSlO0tcAveAi4QfUNCMEoiwS754sU6yRj
	Xmt6zvtAsHGhZLMeP9XnsbWdttmcsgmvBnlcUwJ6SwEZAfkKjDHHvAkM3A2qoZpD6jKO6ZLqf4k
	bFcJZuVr1ZolDBQaCWbkX/QdX5TqwnLBuLaS0sGzWPY2Ee3d+wwV8KHA5z4Xc6LCD+1wL/h4Hv7
	iDOdy4bI4N806LWvTtbjjGLqO5Dkrf85w5y19iwEoSmbJgnGHrwMMq12BrLH/XZ6qazRkbAOIAR
	TOTLFpvtJ+b3C0sPEKjsA4piLEuJg6UQXzLOi2MN8PyPRtr1u+Alj6kW7ck8SjGAwoU6/ZsPOW3
	4AMGcJrXqiCkZVOhrxf3hVidyz6PLpf4qKXw6PIE9b3KJpZaZI6Fs=
X-Received: by 2002:a05:622a:154:b0:51a:8c9b:6496 with SMTP id d75a77b69052e-5213d0c181bmr26465001cf.58.1784298029178;
        Fri, 17 Jul 2026 07:20:29 -0700 (PDT)
X-Received: by 2002:a05:622a:154:b0:51a:8c9b:6496 with SMTP id d75a77b69052e-5213d0c181bmr26464401cf.58.1784298028607;
        Fri, 17 Jul 2026 07:20:28 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:751c:d61c:c91:60dd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1740bf91bdsm79085966b.63.2026.07.17.07.20.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Jul 2026 07:20:27 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 17 Jul 2026 16:20:22 +0200
Subject: [PATCH 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from QCM2290
 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-camss-version-v1-3-7ed71fea95e8@oss.qualcomm.com>
References: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
In-Reply-To: <20260717-camss-version-v1-0-7ed71fea95e8@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX+Wvi+mYM1Uj/
 eE4kI7LfJf6vFA6/aKlYGViZmD1En5OdV+EfrVf4hkTuU6UUN4MkDTp/kLWTjHbqm57UAGR4AE2
 fYw26UIAjbPuTSQia5OKg9ugnbYZk4DwuGzVudnxBn2QYp4OUDeWJ/dMkBO2vYCP6P8y1INu3CJ
 bk2CiI2gbyEXHAQus+sJYWhWKNRkuIxi6fSKSn6u8x5nu69fsEwpkrCkWKwOIW8BUxRoGAuyfaH
 gTL+zQ/t0Eaim5iUZD2OgHt1gpqLsi7Wkn++eWDI1Fm7YKQX16Vyd4CC1rUhWs/sIp/nvddFI8k
 YXTUgm7/rbfwWvDGKnY02IvESehgMH+8atXtHR14pG8fY9cPHtF5v1prms3ojZdh2xEG/69W2EB
 LQ2pYI5zF9yhJhrWKj9RGyGkX96RVmWVvklltU2QV1wC1ZPbwqNjoRZ4iQcX4lw88ZHnDPpU7kH
 r9g4N7DwsSzX1A5ro+w==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE3MDE0NiBTYWx0ZWRfX0exxj4ZSDJyz
 0JHgrhgueT7BintUaF69mrYEkpBzvjfzmLPIOGN3ssuLAn/iIt3Mu5BNUmZC3OBk4Fhlveny1ix
 8xZk7a3d51ycfy7kNY9hWtuF2jqBSJ0=
X-Authority-Analysis: v=2.4 cv=YeWNIQRf c=1 sm=1 tr=0 ts=6a5a3a2d cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=jcYsRx50IvbP8YDAZZQA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: BG67KN3Suv2CER9j7OMWuVjxKf2jnYs7
X-Proofpoint-ORIG-GUID: BG67KN3Suv2CER9j7OMWuVjxKf2jnYs7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-17_04,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501 clxscore=1015
 spamscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607170146

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 04b5601eb0b53110ce1b94248323dad1c08da9ca..1e97b0b7ec463f1fa2615704d09ce465a8964176 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -688,10 +688,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy0", "csiphy0_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy0", "csiphy0_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy0" },
 		.interrupt = { "csiphy0" },
@@ -708,10 +706,8 @@ static const struct camss_subdev_resources csiphy_res_2290[] = {
 			{ .supply = "vdd-csiphy-1p2", .init_load_uA = 26700 },
 			{ .supply = "vdd-csiphy-1p8", .init_load_uA = 2600 }
 		},
-		.clock = { "top_ahb", "ahb", "csiphy1", "csiphy1_timer" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 240000000, 341330000, 384000000 },
+		.clock = { "csiphy1", "csiphy1_timer" },
+		.clock_rate = { { 240000000, 341330000, 384000000 },
 				{ 100000000, 200000000, 268800000 }  },
 		.reg = { "csiphy1" },
 		.interrupt = { "csiphy1" },
@@ -727,10 +723,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi0", "vfe0_cphy_rx", "vfe0" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi0", "vfe0_cphy_rx", "vfe0" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -745,10 +739,8 @@ static const struct camss_subdev_resources csid_res_2290[] = {
 	/* CSID1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "csi1", "vfe1_cphy_rx", "vfe1" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 192000000, 240000000, 384000000, 426400000 },
+		.clock = { "csi1", "vfe1_cphy_rx", "vfe1" },
+		.clock_rate = { { 192000000, 240000000, 384000000, 426400000 },
 				{ 0 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -765,11 +757,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE0 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe0", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe0" },
@@ -785,11 +774,8 @@ static const struct camss_subdev_resources vfe_res_2290[] = {
 	/* VFE1 */
 	{
 		.regulators = {},
-		.clock = { "top_ahb", "ahb", "axi", "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
-		.clock_rate = { { 0 },
-				{ 0 },
-				{ 0 },
-				{ 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
+		.clock = { "vfe1", "camnoc_rt_axi", "camnoc_nrt_axi" },
+		.clock_rate = { { 19200000, 153600000, 192000000, 256000000, 384000000, 460800000 },
 				{ 0 },
 				{ 0 }, },
 		.reg = { "vfe1" },

-- 
2.34.1

