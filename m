Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794994944;
	b=IB18Sb14ceM8/rrZEzZbqXNJvVPPgcDsgCl7ODb1T33PWCP7BW7U8RYwVA5aUAQmWrgR
	 yzYgpTNW1chN1olIz1SWjcVGNVsG3uWOTBC2VrtEDMnXxb4NC2nHcLGQA+CE6FsdoWs+e
	 LV/NHL57jcKtD6LXDpnGdWndQaFHbr+dfoJzxk0IgUOy01/y3zTrek57IXNb+raRbGvlN
	 odmuK5++tAanTjRwoLjAo6eHianvsML73ZFJBu0rsU4Nd6y99pKwMc/B5K6L3yEEezdIq
	 lliAQLXRaj6DG4Dvac200da8QIFMxt3gBkHAfLu2s3E82EpSjg2Se95K6tSGzVz0CqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794994944;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
	b=dkoAj0d1ROPp3jXGDAZrTCKV7JfDvUOE3LS3FqbJGKpN4KWatyIQkOd+rXBU3Dg1g+TQ
	 YocxWuXdYS/rd8cpAWrjCEN7B5JbY6E2epv65XGqmXTVu9Jf0fCKJnEz2NnGoDrGhhMOX
	 Bndfcd9HJYJZpDE4HjEjoSYIas7NgQiYEfo3u+acGRURu4rPHAkYwGKI2ULQKgWRxlr+j
	 WlMwF4cG5XOFDKLP5Kx/3HKnwjo2tqrW6Zv+7KK5Fk2xCgs1EAo++JMEAcUSm96r7TE+4
	 yYdF6agyQpZjefqcAYBw4ANmy1kGJMLALlawQDfBjtAwci7Cz4VcmAavH5ye0KXXO8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8170F606A888
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8170F606A888
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Q5eJlKO2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UfOhZUb+
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AI8X3bL3121892
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=; b=Q5eJlKO28//l07wZ
	b3nWG/PG1RdmwVGoK8S3TG6A954ySkiowyrb7zwe4PTjL7X1cziTjApUVpdo6wPt
	B7XPLvkSUEyY3I8d39P4YbBUbGq8vx7ksD8t1ZC6NF+8lNYnuV3h/NLJOo15ruwX
	u52tyiMiUdJEWMP9UFiFq9r8EjYWcbpS8M0QmCXHXM5yNPxB+qRc4LS1KK0QA+KV
	q4S4GonJlx07XGCScxtxpisNffdm8SICERR7WQJXtVGL8/N88heLscFy92S60WWv
	PLVbwpEhRmOTXjFZvJKI+zYEJOqy1YL1K+AqZBxXW7yCqJrtv9gVWYN6XwA+fztL
	mYAAkg==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com [209.85.214.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j0yv9jaqf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 09:42:22 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id d9443c01a7336-2eb5375cd68so8587325ad.0
        for <linux-media@vger.kernel.org>; Wed, 18 Nov 2026 01:42:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794994941; x=1795599741; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=UfOhZUb+KWI7i6HdYBRl+Cds7oyirooK1EKGbTp2FSh3QnUyanIDx5erShuYNKpSL8
         w1howFFlfWmK3LiX2aLU07upg07RfzA/pJFumx/vcDWY6sLA7NNZOdYng6gNmkts2cOo
         iPN5vcJLuQpbtY1tEBj01vZnZy2PeD8d4+hzxO9Ao3ZIFybVDk33rfBkKNVqN2LtLRUP
         Z1QxajGWN49NdA9OeK/hJ/Q2YLbiEQJjuwKcK8te3kBcVPviZnfdq9lJZ4tBsjtvIZye
         PysDSa9IKoNzQewAF7bOjob1EZJFPJ5RRnIUMSZXdPypxSKKzLQvD4DZS39rsuuVF86S
         AaXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794994941; x=1795599741;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Cz8Vu1lcKLvo4TrnFHhZwshiSmCqL0xd7AQ2CUYl2t0=;
        b=FrDh2YERxuRDPwthTlaX3SsqzOAxJX7f4Z5FZ2XSax9CuxRiE+qpBAmKFa4Npk32BC
         Ne9WV7vhfGSg0jVlc2IzOjbFTNen/nIF/BjSN0ATX4aXI44dKLZ+C13lpqPBCNawwL0d
         dODv0h46wspbGTasqCV8rt1cz8lwYitQWB5Z69IXX8eaAIUvNWOuT+VILgWs400P4TiQ
         acQhk6CXqiz9ODAmNsXZEKeo9lEJxO0u2nx3k2WkvNmj81SqV+2vlE0pp8Qhn0AlFyqu
         2pEeWOHVriSVkLwWy1hfLVw14i9gGf1OzZ7zvtr7Ux6IkW/qK0VL7H/YD1Qt2CV3txp0
         QQFg==
X-Forwarded-Encrypted: i=1; AL+hErFX4tRjz2zszOfv8P0aiCbWOLKuEohsLX9wmHmjLtRbZFI21cMn2x4pqhibzb8AECd6V4iEZX6kLYHUvw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+d53rk3eU/bxfVejx3qrsGfW1Imqm/8Cv/HI1ju+G/6lpFu7FN
	Ahekgp6FAhicxsYtyI2fRpG9tKDvyOmKafCet1MhuCqu9937A9fzQfw/rBhPDsUz1okxjKPkEFV
	L8UdImXtG2mTDaB7vfd17VIKQwnoN3ShF0ELFnhR+YoWdS2kSjjtnqVoNN+fmo4G6eUBIr9UsmK
	My
X-Gm-Gg: AZFdTZdezj1GHaomAQkkrqOqgAA3egxT93wUPwf5do9spUp9Sp1Bsu/b3ccu0er5naY
	x17TIB7jXZRmYljUO00u/Rs4CST5cAP3wUC1PxGAQG3QOOrp7jIhuy9D6nBCV0LzlRvFWhVvZUB
	ixgvw6MdjE74VUJsOpuQdBZ8GpKtGG2HCBM9jj3onQsEoSj/PitVXwCRLzD3BXCddbdh6lLgbDN
	ddEnO7nQijsNvEHOlM0BFX8kho5uw8nSTyxQpE17LKqqyfi21pUpEQTbFaT+glbU9jFpxHRLLzk
	IIDv/L7XfoMtNbAafR6p7lYh0W+W6WaLY0MRzTHHOcTr1QwoR/Y0op+2Aj3y7aJHSHKvVJwV8Ho
	phyKuDmADjxD+trVQBxaaEijFF+DcR+lvSAKA3TDw+NOyCBtJ0CUuWcwzZtHW+DaWBLJk1vYGTo
	fNX2Q/CH1mP9k5pr4OYs7y90zfpk0gPBCVjgHpWD0lPfKGjH9k
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417485ad.47.1794994941351;
        Wed, 18 Nov 2026 01:42:21 -0800 (PST)
X-Received: by 2002:a17:903:186:b0:2ef:d89d:b5ec with SMTP id d9443c01a7336-2eff7530c05mr19417155ad.47.1794994940856;
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2f008044f26sm2947575ad.70.2026.11.18.01.42.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 01:42:20 -0800 (PST)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 18 Nov 2026 17:41:47 +0800
Subject: [PATCH v3 8/8] arm64: dts: qcom: hawi: enable iris on mtp board
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261118-add_iris_for_hawi-v3-8-51786f6d4057@oss.qualcomm.com>
References: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
In-Reply-To: <20261118-add_iris_for_hawi-v3-0-51786f6d4057@oss.qualcomm.com>
To: Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794994903; l=751;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=hi0+kT+lr/HaEbt7fM61FG/66VSUjQmHQXby413mJ/M=;
 b=qjHYftw8gx0GgWh5AIpLAwCHCx8oongqALIKBEULzF7IBonNqGmb1T4u6QO3VGhPcoInHcOMa
 Um8GqkHQqzDBtPJgDSeWe29qPjaZJuF8hsb3vLvvDtzzTBg/ZoxAKHa
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-GUID: VLlyZiik6vEzIePtg0R5pqALC9Q8t3pq
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX47PR5vtMqeGy
 3BlynYwJbp9FH7WqF/16MzZ9w8jU3Z/Mm7e7J09sBmEGzc5JJZhiFYwPGLvpTzqYZmgsd8vIx/q
 YWhhK2VrBehA36SppB6Ax9Ldxhx4C/U=
X-Proofpoint-ORIG-GUID: VLlyZiik6vEzIePtg0R5pqALC9Q8t3pq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE4MDAzOCBTYWx0ZWRfX79gRG1U36Xp1
 WX4l80zj70EgRL3AzWrESFoGFUF9uRtMiO0rSn/KuOZNdCTMyWrKrgNpzIJhRnufxYwvpuzeGCv
 T92fGds+cwFVpa2WercDVBN0jQJTkSwimvgXq7SPTBTmW0XrtRX6SdXO4FCMPESjx4VdR18R8n7
 iC8kHyK/z5Z1pZ/QxaCHdrQ/fLqWOZtux7Rt7+nOSi0JL3J29HbFwrUDdjMZTCqOpm0X8ok29xy
 +pl7s/ILVfPgyzDkz9yqjTOydZ4ooMqceZAlia+x4Ml56up+Mu58b2aQY35B/HawhkaC6Qm0CKG
 T0JpEEnvNN26Otd87q1XxqeRZgYkk18RobemroiGq6tVXwWAtqhpyckspoLe8w9aJ+KSWq8yuQf
 gxNdp0NBbMpzNK1V6d3cILjX1pMZdiaIYccx++klX685BGJb3yhv/3B04LBNrk7d7Md8Xt7h9Vd
 xkQrnX9TXsk9W/dDgFQ==
X-Authority-Analysis: v=2.4 cv=RYIFmFtv c=1 sm=1 tr=0 ts=6afd72fe cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=xxM_nQ0a0dx36OX2A9kA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-18_01,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 adultscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611180038

Enable the iris video codec on the hawi MTP reference board.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hawi-mtp.dts | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hawi-mtp.dts b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
index c38e5fab7a2cb29e9237c634d75c6a687a988ac1..a8bdf53bcb5d6cce089f069cc8e91ab544c05d8b 100644
--- a/arch/arm64/boot/dts/qcom/hawi-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/hawi-mtp.dts
@@ -780,6 +780,12 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	firmware-name = "qcom/vpu/vpu50_p2_s8.mbn";
+
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

