Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793193855;
	b=tehDyi284NAGpkMULC+owMdudaJLLIYBGGlsVgZBZCI2nhiJ/x9vvQRWnOULf8X8dly4
	 bo7yXOtWnve1KW86G9ElUCF9S7wZVpP71594FihvtxCOKp+jj472VBO8aNbkCmZ8MOPej
	 3Y2oVXVRmtiFVXaEV122I9F1iGEBh2omsACuaO+Pp55s5rooGTSRcdC37HTt9U7EFVzOq
	 4TTBZJ28h2ytPUPy8Vg9KQfvfL6+0k1zitoEdZYOqOlwQBWh/qFQS10k9ZjltGMB61Aa/
	 WYJfc0tC2Z3Vyo+tCReB/1NK5Wglorw/JqCMjzbMuQx5gS8frS2fp57J9H+EKc3QwrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793193855;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
	b=Ol2529Qh7GJX+kuDsn1cR4XyYc/q9A37Tni3FwbckYkd9JERwUgB8yjJeopfJMYij6Ll
	 DK8kZMhk6envNsG1zQD4DTweHdH+MuOi1yD6s59AK2EM5isSikcGz1klVmunBkZczzkIz
	 LMKnaGBSYt+wyAr7wkBNyYKLgFyiZ0V7AaS7Eb9vl3Rp9D54gs7Cbwp3iLvT4XuOSbOZ4
	 McGV0IMxyUHpyt5q3+rQlMaDE7InBB81kTiAtT5Ar1ZpiJ66yKYhUy4t2b8mLLz2NBGGB
	 rKM1Skxv22v0Eibr/IcI+JM1Pckh5M5Qmd3awtq9wSFMUm0NmpV220pP+gAtImDzDRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="kO95/ZO3";
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8EB2606A32E
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E8EB2606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=IW73soAF;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=kO95/ZO3
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBdx0u4154553
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=lqqwgC5/0Kh
	ExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=; b=IW73soAFUpAnN/CSPcKsM70fmxf
	lGA4SMy0oQDD4qy7Of1DN01miTzw3Ljr5Lq2HW+QxA2IevRCSQ7T9CC9w84wX2DW
	Jt20DxrtbrpdAs23FjS+MPgQyviPlDEiDCLLBP7oE0Qhhb+4SkbCUzpVw/aleB0+
	qLslwunjknDCSE0zGETNdtpIZF00K8JB6/DwiUFoHxMfwO95a2ztERHWSTUzyNWR
	K69yfyVi7SSX03VeHzxQrZsrMHgs2ef0xZ7iqV2Ih+kap0wQlY5OKtaQkkYBOf54
	JYv/JAzOMSD+yZglSymMvItzoEj2GbyRaz+w+eU0uMGqWV0S0tAD+9Qwltw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp0yp5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 13:24:13 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f62934ef6so200704885a.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793193853; x=1793798653; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=kO95/ZO3Zz7h17nx2F3f9rKsFE/MQSpIYnIg7vNuKVwe2oZLKpKy997NNE5PNm9RyM
         bi17QBMfdbDpM6gPHA/CD7lrBtdM7J+A8yK/jNyzBRRAs113cdG6p6U+pPte+trB2zvd
         Q/pdxjbD8NZoGDZn1ll+WCq6TENjzCMhC6e/lrZpTBatUs+K5PNtiUcqKGgE4ta3jK0q
         xB0vvxrNjoBfGmir50aPG7AjWUI+kY4xutUmc9LxWPQ9egdjYIhzbFvXojqXBIDdjVVh
         xijVDi47AUUVxqWJRq9tZDsh5bPq3Iub64LJJimAVzpUKmepwHuUbeatWDJU6KgnD4FM
         CbYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793193853; x=1793798653;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=lqqwgC5/0KhExGOAHtY1KTfOuh5wGUdsX0Lp3kmGb0s=;
        b=uiQ7TJ3LdKh2QTN+GWkQ14d65LfhEmHPvS8tkLyXaYlWYw2+Ye4xpQx8Hd68X1QVHu
         QLo5Y1pzwfF4Eyl4DSc9PW4u2GM6OeVlaXZhbCHDNmlp/O7pK8wwajhXvL7lIn1wibXc
         Q9qNrw66VpH5/W7kDLwjoLDDh6bBYK+nnowawxwpwMfpAZC5u7rSEXLI6qYsDvPXq/E2
         E03ZyW1DA38B0D/uCzmtz7VChQyYQ3q+R4EBTPjM6iCBqccmQ+kQwpL29lsvoYxpxeWm
         86hKDCRy2+GDeGcogbLRctpDo2e+FjMPuWgNIgMU+OD9N5FVqE80wxSE4/ctru4hajVA
         /oSw==
X-Forwarded-Encrypted: i=1; AKwUvByKZvZL6re/mu84BNNHCxTJgVUP/otmm3Y08uIFdVhLXOgHbIkejOU2inJtQhkSK6u7qnQWOpgJquskhw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLmW1Uv02SCvAPfQE+dxvm3S36hEQjRPTfeNauJt7eHRzxgTl/m
	jKcgO9EhBROSSaSYXXYtqnezkpQnBTZMrZ5c8fpqhU3hTHLVVr+s9K1bdvLfhZ7ASsvsMEY8shI
	0ksdw7eSgDv1DDPoZ78RQWIwmLl+uOLuIChB4ReE/KfnSwkgOqZ9LLrbmvJ3+eaH1CDNFUAEBeB
	It
X-Gm-Gg: AYBFou2At5InYizrNNommM5iKobc0t4Wb8rLH0/l/NpOvz9gJKVJsU2Z3zYzfEdcpNP
	z13U0azpV7jI1+jalRu8DgTU2Yt9rEQwXyo3hkqIB6Z3bKkXKw2owYg9u3/tMEcKbaoXPq02pUF
	fWgefzU+EuAlA0T4zHaYYrTJdt+k9bY8q77ewEVEXTk80wyb0iQS9b5asCJotDKdGWsFEsM2RU+
	LR0dYhDTrhCUh88Y2EDC68NOZ81P7t348SsQip3ACurLXnGKMtB3928owHkyEYJ14YTN2cOs/vw
	Enucgx2boC54w/t28Rcs7w9oFQZRK4nbF2nDDgwEaxKt4kHttybU2ZDCAALzynWWMjgA+7PxJ2+
	+7chCwtmwQcfizSg1otR6422vLlGBY/9GUi91fut8tB1H+kXlt7ahAVOqCJzyuxlAKAudYGSQ9Q
	==
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305277785a.34.1793193853214;
        Wed, 28 Oct 2026 06:24:13 -0700 (PDT)
X-Received: by 2002:a05:620a:1a1b:b0:93f:2f48:c9e5 with SMTP id af79cd13be357-94408d3d2ebmr305272785a.34.1793193852723;
        Wed, 28 Oct 2026 06:24:12 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b496435c7esm1457824a12.29.2026.10.28.06.24.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 06:24:11 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v4 3/6] media: qcom: camss: sm8250: do not set VFE core clock rates from CSID
Date: Wed, 28 Oct 2026 15:24:00 +0200
Message-Id: <20261028132403.3505037-4-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com>
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
X-Proofpoint-GUID: _RZFA2SSgAsGVb3R2yjKo2xkyGG8fYmp
X-Proofpoint-ORIG-GUID: _RZFA2SSgAsGVb3R2yjKo2xkyGG8fYmp
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae1f77d cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=rPRfP_fVeLzQRQyiyREA:9 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX+F+MTVcnoEok
 wQXKOXGSFiEkpAEf7JT/qyhlQNuscUFIKwJ6giA68Su/+Mv+p0BRe1TFW1u2nI1RJfc62AUeOlz
 sTinlNiUqmx3zlEsisDQ00V5EDQaDpCP7cAaobnBTraX3eu+3mt6mk/zRQ2ptTQoctijA5+oNQV
 PGxNyQ1VFnqXZruZkVXIKMrLMho3QEQErsN4YR2GnH8mgXwmWh+3bvtdpnk2dVFtPa3+7fX7aoC
 Lwm0bRRTyJPqp3AYTHhxj1MCPiPwgRTRL8dTuIIy9BxmO6aILJlH0hgN0haM5X0W6St/pwCG8ED
 /dZ78f6iqNvOAPYHqETX/EM3kJjxWsIUqyeUug+f3udutZdUKtFuNOdwv7oOLFFBAuxZRqECQth
 VtJlAg7KhuUnHTKClw66TPK+hGE3JF+O4S1XWLyMGoV1LO6UA3+DGiAo/Z5MfU6jPh8gqofiwZp
 hACMVYJM0lu9P+Eqxog==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1MyBTYWx0ZWRfX9/2LGG15dL02
 2Y5s1dknw9wXGMlOD+sZikWEln4Mk9455YY3cm+2roo5tRkpB7cPd9WE0QXjE6cTRSsP6n0bgOh
 L6n+EbjtNjWF2cHgpgVTipuqKf0BQ+s=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280053

The SM8250 CSID resources list clock levels for the VFE core clocks and
for the shared VFE Lite core clock. CSID power on runs after the VFE is
powered on and sets these clocks to their lowest level, overriding the
rate selected by the VFE from the pixel rate and lowering the shared
VFE Lite clock under a running VFE Lite.

The VFE core clocks are set by the VFE. Drop their levels from the CSID
resources so that CSID only enables them.

Fixes: b4436a18eedb ("media: camss: add support for SM8250 camss")
Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
---
 drivers/media/platform/qcom/camss/camss.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index c54185c93a8a..7fe12049b78a 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_areg", "vfe0_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid0" },
@@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_areg", "vfe1_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 350000000, 475000000, 576000000, 720000000 },
+				{ 0 },
 				{ 100000000, 200000000, 300000000, 400000000 },
 				{ 0 } },
 		.reg = { "csid1" },
@@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid2" },
 		.interrupt = { "csid2" },
@@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res_8250[] = {
 		.clock = { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_lite",  "vfe_lite_ahb" },
 		.clock_rate = { { 400000000 },
 				{ 400000000 },
-				{ 400000000, 480000000 },
+				{ 0 },
 				{ 0 } },
 		.reg = { "csid3" },
 		.interrupt = { "csid3" },
-- 
2.34.1

