Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795631026;
	b=2ycl9pkr4mGdkB1Su0U5KUcs5ZppGbandbhByuW/MKyhBNLd1wpeyS5CMYV2jPY7yI+1
	 owyNdwWyR4NX/qeiV+6lyLFuzkJmHOUA+O+q4D+gbKeLFV9eVGGXip2vR4qSsLiOYincM
	 ST6wWL4ZY1fVg4OPY8eCSSAseMxFkc98cUMKFyvieGPPLhM39t42kvrU1j8AT7kp5bMWR
	 lgquCgk6Sr7d0wCTm+LSslo/s6wG6+9EAqWWys4QbpuWHtzcQz48jxY9jyQoXyJ+XcuPx
	 iyaFsUhzlc04PKC1SP+I/piaKZCT8vxgkIlukAOZulbfmnViCU+Pfp17xjkjCIAv6ag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795631026;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
	b=Iss437a0JXzsHL1W6p7oNAR+++B7t2VnQaNMmErVaqiTx4XtbDqki9eJZp/WPGK1Y4/M
	 VtI8foAfmO8XYrz9/QxSznd5jMyAA0o7UlrDXOT/hPIJiqRQXCD9jWcwEZsFyauT+3hRl
	 RGRWvX/S/ZACqBX/9KxcbNKT7frXOE/vVSB+ylynzCHyH3J0JjutAH3jZp5szhexSEDP8
	 7VNd+2cTjPQPbbW5otFAein+SuC5MGjxRxB1h1W9TpRJfMW+61wwljpGIxd89AIODB7by
	 RbuMzw6nb2c6+k7Tj9J4f2mxxszKtR1uuVKlmi7QLI0c3ktnZUpHs4oL8+Adg4LUy1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93D93606A32E
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93D93606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k0aY4Vg1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RL5MmXub
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6APGQTsP326990
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=zcxcyO7W33Z
	SQAndGKlwVO1qNMckslR3XsjorsVb4MM=; b=k0aY4Vg1HwiQ/gbBgycxg6aYJHC
	uJrIkohCP+S0UTSPQbOMfkZVWBYaGloG5MtsEutJLNnN76WpHsSfC+9MYAReECkz
	wKz9KA+36gbZNgs2QlLav5WXS8x5jourGZTuK1nbMDmO8AjtZwBaKdVfFaoNmWd7
	zGvBRFnRS0WojSJqv419BthJqv7TerKPzcpbX9KArrBb0ft5roQvkGuanxaTUL7E
	VaiYn/B2hfqEuIJPVgfZ9HG9X0p55fPHZulb4H4wTBOWchFijLZQ9NAxCJJaTGB0
	7oUXNroA/olP0DyvZGLvLjsC4EuCkp0J9u1+3IRjnStCUtaacaU7mY5liTg==
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com [209.85.128.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j5mc2c95j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 18:23:44 +0000 (GMT)
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-8b0d978e4faso18330607b3.0
        for <linux-media@vger.kernel.org>; Wed, 25 Nov 2026 10:23:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795631024; x=1796235824; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=RL5MmXubXji0BboE4jl/XScGiRIYKaRltxwmv9e6sCZQzSGCCM0N9gVGSuBk3O/e7m
         IhHExs6Z8fbbvXHf4kPer0r/6urg2wKYUanTSgqI1MI/QMdRCHHtQcFMyQHkUp7XXWQM
         eiC4KbRlZS4WB+1l/WPrKIgaI+oLWC0GMzGE76r4TRscVbcqD0TJJK2glj5W2TfuuWz2
         ybDy5DQwpXhW99FV3+EubPBNdkqXqUxM1E6kPAO5A7+qvREy6dHobdTeqMSiTEkXp0tp
         oF8wwQ8rKXCv4xs8IcicIYPNgx1NnAxHiBGeZ2xlzNOodXPm6pi0MmRDGPyX+7wR6wJL
         uFEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795631024; x=1796235824;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=zcxcyO7W33ZSQAndGKlwVO1qNMckslR3XsjorsVb4MM=;
        b=FfmA6N645uSX2SmeaxVyFS+WA/BQi8yFvvCa0+P8NrQc9363j7JKjDYMyeICt+WgHI
         8cF/Rnd3G3y4TJklM5nlBRC7FkGFDATh+jwlocRq8goX0x27QzOjtXpKGHgTQ9up+spY
         foTOGy5lAVXAcMZlk6M7Q6mgIs/OQdCxs80+Q+g6MHUiMqxVSnmwkHr9ZbmKPFFTJ9AL
         apRcm6KCIpjXdFGZuSeYMShE8JQ9VXkvCohmuYk9X5KHD+2tlYa02zlaExq1lAE2q51w
         8ZTEm82KRcV4ahJ8b/tFBcOfGivzv2jJ//9v/nRQwLITlO9kuGj1grJ9XEWMI64u0hPG
         9t6g==
X-Forwarded-Encrypted: i=1; AL+hErHvhoDxZBKOWPim0qBKogpOZ34GKcotMYhEMoZIzlre4dOkU84Fp7OBlQzU7ln2u1ls5RSaJg0Hc4q4Hg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/FXePKkAwbzTvV6amr6DeATZZ6VN9KYhiGd/7+Wio32W5FV8Eg
	D55mJ1NBQPCGd7FiDc8LBNyosJAvdZWy5jagFwcj2fZFditxro6aejP+HaIiaoH6qbj3t6yjLnu
	BQ3tQGW36cXaQf8Yo+9Y+3EQT+KyjRDDBGoVq5pGLgmPPrkgaYrnzkxRfwM5PlN+IiA==
X-Gm-Gg: AZFdTZdLf19B2PUnARqleBiquGYoAsUcIOJZUBqvxgxAacC5bFxcH4/GiFRfXCuf58n
	QO7u1jQtJ4m2fFOk3Ntl9S7Jkh4E7SNgDfrBsoZRcyg2c08a4m296xAyhZJ5VpJFW8Wvz8IdEUm
	7dXQfAJ2gNR5BgXsYZpyR12+5LLeFXet14zaYF+zHKPh5sVyM4LXOtb0rOLvYAP81Hvd7W6a1ro
	hc2uHIjIfXoYI9atk0a/UkKt1bbN/nTxvB9LrenwnKpJ0+BJDpOF7pO5LA1lI1hoLbY4zbA+m4F
	+WUcv1QSt35umaWhZsRZN6rUVf20Kq3ekt5K/rW5BMqKgeB1+Gfp0H1wgjJIQP99h48G5nzOeA1
	GCR4cMl0B6yu5G6hZlYqltgAHUAEwAMakPCJWwAkkfOhpXMqvC/rFLUCyDBmjhA248rbBotFhb/
	lJLAQ+
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103837b3.7.1795631023962;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
X-Received: by 2002:a05:690c:6307:b0:8b3:22c:b40c with SMTP id 00721157ae682-8b520329badmr85103667b3.7.1795631023298;
        Wed, 25 Nov 2026 10:23:43 -0800 (PST)
Received: from lin-0843.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab65cb42absm37185609f8f.1.2026.11.25.10.23.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 10:23:42 -0800 (PST)
From: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        linux-kernel@vger.kernel.org, Hitesh Patel <hitesh@ebytelogic.com>,
        Atanas Filipov <atanas.filipov@oss.qualcomm.com>,
        Jigarkumar Zala <jigarkumar.zala@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
Subject: [PATCH RESEND v2 01/12] media: qcom: camss: csid_gen3: Fix multi-VC buf-done IRQ mask
Date: Wed, 25 Nov 2026 20:23:15 +0200
Message-Id: <20261125182326.2767771-2-gjorgji.rosikopulos@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
References: <20261125182326.2767771-1-gjorgji.rosikopulos@oss.qualcomm.com>
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
X-Authority-Analysis: v=2.4 cv=aPJlOr9m c=1 sm=1 tr=0 ts=6b0727b0 cx=c_pps
 a=72HoHk1woDtn7btP4rdmlg==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=-miQo-2tu4ND6FEhOZYA:9 a=kA6IBgd4cpdPkAWqgNAz:22
X-Proofpoint-GUID: GvXtot3rVWftpkZ7Bh4H-8UESZzwcnVa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX9McXzLw0yGDE
 lNFSfhzmTqKa5YPSJWdAvI02rkuB78kBsmsJthZxAryJ+wY5dQO7gpfx9XCb8UoVS/MLuiTd47K
 OA9W2qsv7JFqW47umT//fGWzXmDSATyO5iGxf0LWMiAofIZdeyRtXnIG+YMF7UF74Nv34wHjAMd
 CQ34iGXkV9S96689RDpEpXK5coohqH61LDlUQAmG/F9LDsBzzMbNZYF3x/LmE+qNRpB1QU+OZ3n
 WB6sa/zWHZej8G1wCSekm94KmJSfehsnt7QZUKMuXtlnkwtszeHJoYA5O4ZmHjev+x8bp0Sleni
 Rv/OkkBPDRDMvQuB1TrZpL7jKa0U3xt4oetEhvKbdlENMIvLY/M8K4X1phfOi///gPi6gqqlE9l
 4HIHnTaZooBrcSLrE2cr6gw/yA3mvTZ9kPmnZA5Xtn45DtdzYsqZQIWJwnQKvqdJaB007Lypy1u
 xrEysIqUe0yXa9PM20g==
X-Proofpoint-ORIG-GUID: GvXtot3rVWftpkZ7Bh4H-8UESZzwcnVa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI1MDA3MyBTYWx0ZWRfX6zDxjaQzoRwP
 68G12MQS9t2J6K6trKVeYTTmtoWln4m6vGMARKrth1SqRhmcHfv2nqUpAGOIfX2WtYqpNO9pe6i
 M+ZA1NuxzqNculjIcpPZ4VnFLXxDlvg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-25_04,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 adultscore=0 spamscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611250073

Csid reset programs CSID_BUF_DONE_IRQ_MASK with a separate write
per enabled VC instead of accumulating the bits.
This change removes the not needed for cycle and write regs
in one pass.

Confirmed on RB8/SA8775P hardware during TPG multi-VC capture
testing.

Fixes: d96fe1808dcc ("media: qcom: camss: Add CSID 780 support")
Signed-off-by: Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>
---
 .../media/platform/qcom/camss/camss-csid-gen3.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
index 6a538d825f78..231b53d3e44e 100644
--- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
+++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
@@ -339,7 +339,6 @@ static int csid_reset(struct csid_device *csid)
 {
 	unsigned long time;
 	u32 val;
-	int i;
 
 	reinit_completion(&csid->reset_complete);
 
@@ -347,14 +346,14 @@ static int csid_reset(struct csid_device *csid)
 	writel(1, csid->base + CSID_IRQ_CMD);
 	writel(1, csid->base + CSID_TOP_IRQ_MASK);
 
-	for (i = 0; i < MSM_CSID_MAX_SRC_STREAMS; i++)
-		if (csid->phy.en_vc & BIT(i)) {
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_CLEAR);
-			writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
-			writel(BIT(BUF_DONE_IRQ_STATUS_RDI_OFFSET + i),
-			       csid->base + CSID_BUF_DONE_IRQ_MASK);
-		}
+	if (csid->phy.en_vc) {
+		u32 vc_mask = GENMASK(MSM_CSID_MAX_SRC_STREAMS - 1, 0);
+
+		val = (csid->phy.en_vc & vc_mask) << BUF_DONE_IRQ_STATUS_RDI_OFFSET;
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_CLEAR);
+		writel(IRQ_CMD_CLEAR, csid->base + CSID_IRQ_CMD);
+		writel(val, csid->base + CSID_BUF_DONE_IRQ_MASK);
+	}
 
 	/* preserve registers */
 	val = RST_LOCATION | RST_MODE;
-- 
2.34.1

