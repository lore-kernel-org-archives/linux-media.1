Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4FA338AC8A
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:42:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790131332; cv=none; b=dUrjUq+ehNzdlAR0nAQK4gAL9cMR01u3fja+kqp4kI/oSojILi4uIVgt5MhhdNq78B2GY7/avJHlX8MHYUpwHwty4ai9sj36VxEVrM/jppBOl53VXKXzV/SJ+4h/1ct2tqfCvdv/lC4LGqKxjpUKE93/wN5OItihiVyr95P2ORc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790131332; c=relaxed/simple;
	bh=NIhNVuVEby05+ttPZxNAlBHKKYzqjKUQzmxJtSYqNIA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qAJxq9ZBflNQ5gHC4umvwgMoAiNx3gL+I2Pyl8m9Y+Kt05n/LC0BcpDjVBLVuWBUYE7Rv4YNyFmlmaLXN+lHD6KHB8UyVS6z6l9s0Qk9mYdcrZjUXvJJQ1WzZn9yzuB7HLOWqccfB3xX4hHl7pl+6IS5MQXXrm5Nbwpj0c4vjGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0NbSzgp; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=QWN7sBiN; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0NbSzgp";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QWN7sBiN"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68MI7FEJ368089
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:42:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=; b=Y0NbSzgp2pj4tK3Y
	qHXS3CYhp0ak1Ph8qCsMekrwI9HvS8NDedSmubGdGs4bPcCZiRp+Of9MSfPjf74e
	mgL15cwmga28YSC0hZPKk+Lo0PYbWEbawR2SpGaH2lxy7jCNpk/AW2GvLugr4ukx
	DCQ5diAKifq5tv1MqJl8c8C3CcdtedjBhHTX6BvrLtsCy9oYr0r6c8T4bfRovDlX
	Ur/kQPhW82fw2wwR3fdnw/jdbbkbGWq61QxvIBBcgg4bySql1sumbtvUux3Wmv+D
	fuILK+3SqbHf3MHIketGkp1g9GrmwWkxdU5+Abry0Au0vpXekThGtliZIL/2vIOP
	5SXf6w==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gurntc1hc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 23 Sep 2026 02:42:09 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-39e3c10ac70so835577a91.2
        for <linux-media@vger.kernel.org>; Tue, 22 Sep 2026 19:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790131329; x=1790736129; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=;
        b=QWN7sBiNvkS7O3f2CRKqFzS86EhTJk3BoWIU4BcKwIiaNtxwtvbkTHL2fPZ6cLuWlJ
         B6S+jEk2V+kbKkzur7wb26VzfHFd+AP9CfSN8TiJLFA+fQdtjw/oZjfezURSgpmLq+CU
         oTDXmU4ihdxtfYNwPPKC506RtVDGj8vdjjfBOTKO1ugysfIqDO2HgbOvnRaJiPyUjfwe
         X28erIiY7avN7wzFs1i5mhIo9IgNzT1tHT0b19xGzv3bmCcJLMRDiWDPILJrWIDyMy5L
         ruzzQ7cSt6Ujt8hPpivoKy1a/dJacc4JFtrDgkHcLPGXx0L7sGxJ1y81bWrdpLQBWR54
         xRkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790131329; x=1790736129;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JDCg0tf0ecoYoF2837PPfGTHEgxmlnU2xZXRZ38KHSk=;
        b=2cLMvrsqAWF3PL6/sYDYaNX6A/qRK485ykFt/KXNimKp8uy+4nf13rpfhoghYWyJs7
         EX4kCiMQB+V9c+inQgVfTOCCuhK+G7OTrvTqG+eeezo3P8PVWupeJBmO9/jR+q5C5IQ6
         y8swMgCyRKiycuwkOCns3qguy1vL89Lamh9vgXG4Cicj8KUId3U2TFwBhW8IYHue60+y
         frh6d3nVU7lOuLV3GhiJjghuXZ9NZIdmPBqfRUAQnXnh5VA57PvWkmo8NlkQmut0Zjqo
         jLonNcSizs69lKn1nDxCOeUhK820F0g8jQYftxLlxnSEEEbKvd750HLAuYaHSyTWU8WG
         DEVQ==
X-Gm-Message-State: AFuF++l12LAAbi38XOkdYGoyDSxfB20gBRBFG8JKAgvfAhxrCL2Orvo+
	Chtt827nlVJIoMQHP4SLllnW3AjjKEGU0MWgfGCVAKxGQu8HyKbqmrSVafLzpYNa8h7AQ5yBBC1
	Ibf9jz9WwVT4++fUlK0h9MV0n6f6fbbQeKHVqHmFMhmRdRIuwMYdz654EiUtrUQKpiw==
X-Gm-Gg: AYBFou0gXoA+qWaSGqpbEEXAyDOOtvpHSxck1N/mXZ1miibGbwn16NKrocH2PPgZuUm
	SlL+4XuEh1zHp1rlOv5xrJWeVuJhsvMqWMgPxnBqEt1GDmH8yxAHCHZp/oUr4+oVkgAE06gpnhg
	W8tezRsE8mXvcubHvHUmLxTCTbmctS8VqZbUKlZcX0+4ayM83IQpXJn9WRy1JWPih+gwtVS585O
	CP/f1WadAsX17Czen2qadhqfskIXLfOIg8dH2U5uGRWNJvLYx3wbFQiRoqxHNpnCPAlibE7hsXr
	0Dk8VoVQZqNv0ymyS4j78q+v0zVJk3zu/YOERdXGRXOKox4ncZtDlcSlZTDdjDfEjweIji2bcWm
	Lz4g6silvPWGs2bBUO5UkUF3wPHrRzNLepd6ZQ9v9od4NtJafDMoL4JxMMYpdCJDwOn9aIAR4jo
	8Sj8TvOYi/
X-Received: by 2002:a17:90a:d60e:b0:3a0:4444:ef1e with SMTP id 98e67ed59e1d1-3a07e567098mr1177568a91.29.1790131329208;
        Tue, 22 Sep 2026 19:42:09 -0700 (PDT)
X-Received: by 2002:a17:90a:d60e:b0:3a0:4444:ef1e with SMTP id 98e67ed59e1d1-3a07e567098mr1177531a91.29.1790131328795;
        Tue, 22 Sep 2026 19:42:08 -0700 (PDT)
Received: from WANGAOW-LAB01.ap.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a07ddaf4f5sm2102026a91.4.2026.09.22.19.42.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Sep 2026 19:42:08 -0700 (PDT)
From: Wangao Wang <wangao.wang@oss.qualcomm.com>
Date: Wed, 23 Sep 2026 10:41:16 +0800
Subject: [PATCH v2 6/6] arm64: dts: qcom: maili: enable iris on mtp board
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260923-add_iris_for_maili-v2-6-7223738e330d@oss.qualcomm.com>
References: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
In-Reply-To: <20260923-add_iris_for_maili-v2-0-7223738e330d@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Hans Verkuil <hverkuil+cisco@kernel.org>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Wangao Wang <wangao.wang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790131292; l=644;
 i=wangao.wang@oss.qualcomm.com; s=20251021; h=from:subject:message-id;
 bh=NIhNVuVEby05+ttPZxNAlBHKKYzqjKUQzmxJtSYqNIA=;
 b=8/EFS69F1tqXVU1ZtSteZJh7gbva4OFxGkVdb9rJGsoIxjNhY53t/WOJdVvpRqp6kM0A+qLA9
 VRcEaK06/fVC6gDNToxw6WydifR5TUoBQ2mQc5+ivy8ahFXMvEFxXG+
X-Developer-Key: i=wangao.wang@oss.qualcomm.com; a=ed25519;
 pk=bUPgYblBUAsoPyGfssbNR7ZXUSGF8v1VF4FJzSO6/aA=
X-Proofpoint-ORIG-GUID: GmgFzj3OJWMtm0TP8uOEm7X0pGkMgRcH
X-Authority-Analysis: v=2.4 cv=eauo7LEH c=1 sm=1 tr=0 ts=6ab33c81 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=1_ts_jfFenCfOmJzNDUA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfXwhG1b7KQaJYO
 zTRCrCGF9eAHHy9v6ht/qnHJ8fc/PJ3fuKD1Y9X+K3DbgnMjeIw3wPLt0dd0TwfqzMQ5fX/0Gc4
 jzkPNoanMT1W95SzFuDsyAQcURkm6XrUKd4i0iIE5KugEALOA/x8dRbNZjTnDG0abQP03FboxgJ
 IQm26LuLLLfhWb8HadvtNIvxdbLZMKuVrQTG2kDYVXRehKZj0MUxX3C6FOXKy5fYnMXigwcRn4T
 DxtT9aRyLdSwdKv8jjEZYhGef+9bi06V+awUXWMGOBWNjPR2KOpcfQWp7GbZLOG+P4rvIUFqHIX
 CwxJPaXKkxSKjig5GyhpRgCbDJNeKXmlcq9vpDmiP68Sr15m74pEF+J0mq1dHT2G0nrcSax01d/
 i3PtDJXtGjfiwsR5I8QhkcD1STN6dx/FnVytJg/GL9y4unXf+OIWG5soFjigSFyzp+jy10v/UKs
 RAKgOUJxp20XukjN5Qg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTIzMDAxMCBTYWx0ZWRfX5MJNffu2f5CN
 VMwPc5x7Z12PyAB/NDYDKoXVRS8SNVJOSyCMZHLbkFwquGbBPvKMeRDXIpcfQMlZdOeJqN3K80U
 EvffYdUTV90VtwePneYOPpwaygju/nY=
X-Proofpoint-GUID: GmgFzj3OJWMtm0TP8uOEm7X0pGkMgRcH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-22_03,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 lowpriorityscore=0 impostorscore=0 clxscore=1015
 spamscore=0 malwarescore=0 bulkscore=0 adultscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609230010

Enable the iris video codec on the maili MTP reference board.

Signed-off-by: Wangao Wang <wangao.wang@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/maili-mtp.dts | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/maili-mtp.dts b/arch/arm64/boot/dts/qcom/maili-mtp.dts
index 1fdc91e03271c40640910b57f3187311b6077ea9..88b452ec7e985dc1f1b87a56a16aa2e5dddf96b4 100644
--- a/arch/arm64/boot/dts/qcom/maili-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/maili-mtp.dts
@@ -743,6 +743,10 @@ vreg_l7n_3p3: ldo7 {
 	};
 };
 
+&iris {
+	status = "okay";
+};
+
 &pcie0 {
 	status = "okay";
 };

-- 
2.43.0

