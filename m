Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F0EF3DBD41
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785488084; cv=none; b=CrwB0HFad5ulL0Zey8Rqk6k1D6EGCk3DR8GzjbrZtoZbssajtHzcUM1s5fPPmZILit84l0UCfIvZ1kCVu9QCeYML2/LGDgoAeCTJ+kfNID4VBnBHl4/Y1ZltTAMBbJx5E+ZpFnZx/LDf0azBHfWQqYIa6sLvxgQ9HmqozEplzrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785488084; c=relaxed/simple;
	bh=ZIRGxYfXWkcpuRtUnQqXZRtOwcse9mChCO9Impj2vAE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=gCNPJDPfQiLaGBOsluKv+DUkk3dxGYusAUUlTYsEg6pRbqvKBF3wBDj0VEpiUKtJYxU1GnYb+bjZFEsu981hFKW6sV3D3DvE6S8gYm9O10iXuKWx3A2+Qu4xo4IqS1bu4Na5od9eJ/eZYhE07YpjNsypIker8Sg6hw+NPaureC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=cBJGqd8q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NTw8fzfC; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="cBJGqd8q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NTw8fzfC"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66V8mq6v3993380
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jseqfSkyOnuxBj/hRu4rDPk0962s+kzbk8ZBCngwnu8=; b=cBJGqd8qzms/NkUt
	AK8fYDmZNiFJpdbneIRqOhFEOP2yCDXJp3Plsmsn96Z2ieLKSzXntZDy1lt4joAt
	vpx7wdTd9NnIrcAuIBgRCRdxa42+bfgcYmd6hJxZjifKo4QaadKPQ/tFwpeUVIzC
	z2MNXn8lzOhMzH0Ju5rFrXJG/EYswlJH7CPfH4imJUEvVozr3oQ17zW+SNbLZcO3
	uTtzhGAiBDPDeRcsID78EUYKbOC2YIc+5ZiojF49MC2ZjMVX49aUjKc2LWl3IFPC
	fW0Qk0nqlWR1DbvYByI+AgYtzTy2tG8037SLOWlrByBotlH55WMtCBobF+LOF2YH
	GNTqTg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4frrhar0uc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 08:54:42 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-930edb4362dso58461485a.3
        for <linux-media@vger.kernel.org>; Fri, 31 Jul 2026 01:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785488081; x=1786092881; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jseqfSkyOnuxBj/hRu4rDPk0962s+kzbk8ZBCngwnu8=;
        b=NTw8fzfC4cIvhVQQ9s1fCG1OeziE1l6q+XN2DXoCuDXbUfeJ47xbk5RPWZviLY/JF4
         L6CnIsRxoNEDvw/b92xN+ohH7n0jbsBBzuWi8EWIawklAgE8i16iGVq6uSnmD35SsIk3
         TOFduK/qcHXfWGfyaOYzUnlGTnahoFGbz/7HKSjD2sc3MpMgvU3RCcppivWqir8wPbxi
         6wKMkDATizGl3t1269UlhBrMRHZ133PSL0t7rXbDwLe37GIb0LfWkbC6K+LCVUaL/Imy
         EBNJMxEUn56eS+VycTOj2kkiJKlio6O0EDqY24n/sS7PZVVJb6a1wbh2+TXsd+rLyTgy
         88OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785488081; x=1786092881;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jseqfSkyOnuxBj/hRu4rDPk0962s+kzbk8ZBCngwnu8=;
        b=fWUpIU71+8J/BwMjGwr51ai+T4RWuTSFjkW+2fvpc9CNWBf6qIphOJE3N7d8jKuly9
         5oqdn0df3Rhy1g/hMzr4Iynrs+fW++xC5xJsKcvpwdiddhSivs/eSqwrDocbZ7N39FM0
         /QIpesJmMDYBWx3Uso+8uGRUarQaHKTLhjaTcjvbxl2Zr/T5EM/P5psvVBzB9kaqU521
         hMA78PzPWV66wzlgfmL9/vS8Wwmueywv5q3DnhZqb+pR0zuE/Bfs3tAcJa22qm4IrAkD
         IFrEiyuSCGieweZJ62oFRJd+BxW6kdOHwG/SnjlIxblfNM2QIleVQngXU97FqzDGVEjE
         m6SQ==
X-Gm-Message-State: AOJu0Yx7k1XHu7iEBme0m83SsJ9++U2B0olj7ffzRObOcLJvsfxokeHp
	3lvbO++HUhcwywNzIjAKIGG1jhxHFqo80sR5AWzCgkNntg8tlYw17lXKLT+9o43XBALUrQ5zSy7
	PMDIXrvi8EurRukbACx66eGj9quK8qWvruftgZO+zjzBohep89c6fRl+VgjywPp9KOA==
X-Gm-Gg: AR+sD13zvjXKfWNB7DSdMFgWAYDOFht9Pq+1U4kLhuTNvYOiL1ir0ZxO1Z0JAYliYYz
	5rx9B92esSblhA2YNk6Zane3vp24eujco+rKOSlr+W4wsbYgmsVxKI5kQVwGnwVOXH0EtNwl7P9
	LAwSb35vlPYQHHUDS2RffiGUlFqd3ShadZicZ9ITgXpQf4lKrBIQwruJllS7GoVW43aVhD7zUWK
	bbhPycZcGhq6B+ZL96cWuAOExJt1tStC98B3YTf5C2kYsfbTTfoFamljmuhOuLChYwnwJCbEiAF
	97sPu76Q20MMkVFOgffWrjPKfz4VnZc9XTu5o+kGUTqFFWi7fW8NByJySlGl6SKUsxMq22a4iph
	kvI346u6BKvvUUtISUXYK5rW+vs+F7peQbBoF4n9D9oWp6EN8kreoqX143aVTQPSQtOIjnPGGQI
	BU1ztWLP+EUj76CIl0nN0AXYdlxqyz9jy+rX/5KXyCCZvfAGDdZDSa
X-Received: by 2002:a05:620a:8388:b0:92e:8734:b721 with SMTP id af79cd13be357-93499aadc9emr93220785a.29.1785488081498;
        Fri, 31 Jul 2026 01:54:41 -0700 (PDT)
X-Received: by 2002:a05:620a:8388:b0:92e:8734:b721 with SMTP id af79cd13be357-93499aadc9emr93219385a.29.1785488081087;
        Fri, 31 Jul 2026 01:54:41 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c1fd44e9f0bsm61899366b.43.2026.07.31.01.54.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Jul 2026 01:54:40 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 31 Jul 2026 10:54:36 +0200
Subject: [PATCH v4 3/4] media: qcom: camss: Drop top_ahb/ahb/axi from
 QCM2290 subdevice clocks
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260731-camss-version-v4-3-be8b716a8c4d@oss.qualcomm.com>
References: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
In-Reply-To: <20260731-camss-version-v4-0-be8b716a8c4d@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-ORIG-GUID: Q8eJsknBDgsNEo1An5GW4pfLo5q6iys9
X-Proofpoint-GUID: Q8eJsknBDgsNEo1An5GW4pfLo5q6iys9
X-Authority-Analysis: v=2.4 cv=DvdmPm/+ c=1 sm=1 tr=0 ts=6a6c62d2 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=RNuhJxbiNEtIex8kAdYA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX3xpPbtO7m953
 iwBhROWR8Pmr1DKZi88Wd4djR1nhmuXfk/3vVPr5CMSisd6ZkGjyAF9auzP9AOWpM6ZfhsxGFVG
 bvZDwmeO20U2f+umV6hJ1dpd9IOCglXltbcnUm3/vCvm73TBjxCmFNhvbrYR3g8mNyvQvHmcFax
 yZA65opSkteZ9/3GoVdZa15goCocH6d/CifmglVMRKqVgFHGbiDzcRvbKqtz532aFzsbN8WEbV8
 6CBkadh3gFZFki73BROJDntAkwtwknS1D0bFkTBDu2KbaNkKf/21wuaM87bU0YW/1DOeGgRnqRX
 tljN20R67HP/pB5xsa7YgSUdWWOgkUefmpUVcKCoAWzd1qLMR/dOFxMljCSI/Axy0zQOM+mwMPG
 upfFmqIAHA8aOroly408kfvwbxgzc7P845dtipOA3Y7VVAjedjirDpVZQGtrTQWsiwqO7PelqDB
 WNiopVeH6T3SrL48+mw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMxMDA2MyBTYWx0ZWRfX2aO+5WbzLjwO
 el1G9H5UaaAbf+KGB/lxZFnzWP1MtT3Uv3vROrQ6bnjBxuTOGg4jim86Cf7+8V2x6sf3UIJl+N3
 1rQVolQIHkC+Bg7NOHQ4PN9nICrEUK4=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-31_03,2026-07-30_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 clxscore=1015 malwarescore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607310063

Remove the top_ahb, ahb and axi clocks from QCM2290 subdevice clock
lists. These clocks are now handled centrally as global CAMSS PM clocks
and are automatically enabled when CAMSS is runtime resumed.

This avoids redundant clock references in individual subdevices and
ensures consistent clock management across the CAMSS pipeline.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 38 ++++++++++---------------------
 1 file changed, 12 insertions(+), 26 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 8827613d34fc77d43d865e1bd05aa0cc14a4cfca..f688d11990a71aa6d745db1fdcebefe5a5119ca3 100644
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

