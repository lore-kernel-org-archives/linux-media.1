Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD6473F823F
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785403459; cv=none; b=EmsCpBx73KOtmrT2cJZ+thi7KCeEEWvd45F8moSljvE5aEB/TtNuSymFeYXtj1CRgFzNQs2Kj3E5C/gPCS4UbmubYF6YbaoRyYGQwzlskOgLnKcn7cFHTXa+A1IKBsvQlCQM+zBG4Sej6bcC+E3q6HZ3QbpP4doRXbvrRw6bft8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785403459; c=relaxed/simple;
	bh=dMQuuMF13jlkNE3LLv4DTmki07zvQOlpD+SevEtzyLI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rbQItKe9z09VTs6TzBjq4hlMNCfd0pHqgqZPNo60/Lvfvm44c/GrnIQuWbs+pMzd7HeAPAwMtwBwX7Wj5D668dZbtFj2+vSnU8qJNS33wJ7MZJvBZH/3WFlgezgJaaz0a6leHBlJoq6eZx1JGbg6HyDfRLys4we4rA3aS/U7ed0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GkCz17Yd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=CI/h55C+; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GkCz17Yd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CI/h55C+"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66U8u55o263798
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=; b=GkCz17YdylkTLSDR
	lAJYAaMi10VPjGf3PgCGlKcE9wHQu2JZKUJ6KTlFKYdSvQaqQde12cGTG5ynbJL5
	i3FXmEiD8LZjGyuMOpRFoXpgNkMeiQIDVwqz4QXdy0/6iY3ADcbuQjRRlZ78iHlq
	8X6IKa2/HAGw5NTtd+LaTx9++5yB+R/DjgNselAtZFfczXWa/ie7De7/lJ/FLSYE
	+BjzHcVAESwxHxq/c5U1bUbvsp/x4iVCxuDDg3UB1/m6TWZHEpjeYTV02s8usvKW
	BoegRgEDfzwqbzAguJXhkt8cciXIry/ZWlF3tDkmY0BC+eW+TC9fJDiczmhdFbij
	L83JOQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fr3hrg4g9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 09:24:16 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-51c0e702df8so19946651cf.2
        for <linux-media@vger.kernel.org>; Thu, 30 Jul 2026 02:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785403455; x=1786008255; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=;
        b=CI/h55C+dH/95XMfIHCSYVkVZKOQy2xuEj033E7quJclpmXA0ABSc+OJq6iXT9QmLq
         IAFF3fCBhtBOxEcut/mIqrCZSH43B4jmGXfl08yrzxIasro24s5C0i/UlRtMpR88iXLg
         HORYFTR+mk5fH9Xajj3ye7XDyXiAMep399gbQsVWkMNufwAiEZqwA+UzLSMeK13jNMUk
         tCAiY716Qa0nKGDs6rZ60cfJWYe0rDUMdlvG+myKqChOjrUxy88jlXN0uQhBXDm7JhPr
         NaZQos532oUPOfv6QvsRXhrkYoL/2lBlryHIxty++P5hF8PaMoW7oq00OlPH0Kez33xg
         rDdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785403455; x=1786008255;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S+eui17j8M9KyyJwBM7yXqtZFr9R2dq4YhRTKIrsqiM=;
        b=jpkG1AMo4JmKulu1GuynA2Y7fVscVcIWuvM1PvZ9AqYJUsJf13AQhF75YoLlS4R1oJ
         HwxImyqxqU8yYJAkGSd+Oz6dCYxTD7A0tS6DYpETDbKyZuHy/pOjzbN5lWbAyyZ8DPGe
         ZNqavk/aFjWUj2ZMgcSL9s8uC5MMjigkdLoEk2oeBl0v1XSD0/kKFPvgWmIVQ0HG/4nU
         iMErLoa3YxbSFLGIwrBRxJBUrhzl+Boou5l63ycBo9+J5rtONDa2bVppzowglc/1AsB/
         faKTBq1e4TWKdDsZYb/N+fqqkqY+P4dFgFV+eO2qgyesBGvRBnbEW8yuPB6eswhJmdRF
         j6wQ==
X-Gm-Message-State: AOJu0YwqRflFSjHjD0vZbirYnOTpIqCKyOi6wKiEzkw24eWf+76tz4/y
	XXkXIYrKUADajXqOEC5UyeQ0jXeDQF1K59c2dsSvSZZIsVN4Im8kVesXwQRoJ7rWXculzJzYpb5
	SnApDoPyrtJUKUbXGp7S2zw/wh+KWPEO4iu7GAIwWGjJ3rvO/tb8tQv0teu/YXMICYg==
X-Gm-Gg: AR+sD10a7rj9hx/up4us07X0Q6fFUJw5j91PvzI8iZ1/L7PegIX3yjlycc3MBAznE3w
	jEJpL8UFnHHcpeKq7x2A5SHiB3Kgl93tM9qmKBcJ9TAgHAFU+em2ddxr5LCynWU5AiwGEI5Gw0S
	cDVyK/ZDGV6NWZ7pSLw5GqzYTs6oUCX6+JS5pKKq7eSQtL774bgUkzQkJbtQQzjEdcofEqbkhI1
	KCqQdxY1LU5UihEAaMJBwTKkwZ+lhkWYY1MX5+jFPJGV4ZOkdALZSFdv5ze+AyyUFE55HAksbyy
	8lLBsv7Zv8fVdMhXMY+ij4FbVmMxiBtUkswV+ATLapOXT4fQrDA/o8+9YJj5pSzFlLJ7liYfkJQ
	D/ZWWFD35cs6+KLrtNyZKDIGY1XezEnpZHxfPLzyTsGfHaXfUPU/LrnqAmqcmm0FdCfz7KpTt4k
	/WjA9+ol2ulFffjxa6IJJI/wJBDA1fJqZKbUNzp01fOB53vWcWgNtq
X-Received: by 2002:a05:622a:60c:b0:51c:1529:2c0 with SMTP id d75a77b69052e-52b3866e5a5mr18894581cf.43.1785403455586;
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
X-Received: by 2002:a05:622a:60c:b0:51c:1529:2c0 with SMTP id d75a77b69052e-52b3866e5a5mr18894441cf.43.1785403455166;
        Thu, 30 Jul 2026 02:24:15 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:61cd:dcd3:c61a:ac3c])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6a07d3831basm411483a12.15.2026.07.30.02.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 02:24:14 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 30 Jul 2026 11:24:10 +0200
Subject: [PATCH v3 2/4] media: qcom: camss: Add PM clock definitions for
 QCM2290
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260730-camss-version-v3-2-74a87302dd9f@oss.qualcomm.com>
References: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
In-Reply-To: <20260730-camss-version-v3-0-74a87302dd9f@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Frank Li <Frank.Li@nxp.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: wbtqX3ZC6M3cUGWW-UCRqg52e4zu25UZ
X-Proofpoint-ORIG-GUID: wbtqX3ZC6M3cUGWW-UCRqg52e4zu25UZ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX6Dx66NMN4uMR
 y7PK3+vEw9zdeW9k4Rp4ZEVLp16vL48/Fd3iC2b3FlVXG8wFfBej/v9W0Lms2g5Hu9pcqu9GQkR
 qocpgcoTYdza7O7yxvc5nhLBgilYGmWNSDjopYHziTjhBm1zns/YHDbeUQ/BTYGg92VMjvU4U7h
 gRKzMS9ViXxIH/eD6ECo6lbwJ6bxgwXuV09MO+j6EbUHUJABxxCxjrilGU0CW/aqFHN7Az1Cz5j
 gN0Fa/0bu/Ep7mkLNQm4zGMZK7hV1+U2oXUAori4MOoUA4dYcIeOxczCTGVF1RwdaPvh2qd6XSS
 bhUS29eqf3EBznw9v+xvX7fcz5A0JLaL2r0wBCJKCa04a2Uhv7KSeWUOepHoR4MhoDzHA5ms6pW
 29v5Qv6ZMMaLXz0Fufgpl8U3A3n/xSNw50rdYfENMJgwb3HU/yUTA3SWv3sTWidXWIedwlFJby+
 7OX79Rkh5XsuOZApdvg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzMwMDA2OSBTYWx0ZWRfX3LxH5Hmt7Ulb
 0TyLN3SOUHQ7pbjZzSc11chmRND6Xpg+YGyspqNFiMWNE0XiMhXOxKHXhSBsImmS7JLSJAbK8bn
 0UtSPWF28A2MrO9q8NGWiIloew0ZZD4=
X-Authority-Analysis: v=2.4 cv=a7QAM0SF c=1 sm=1 tr=0 ts=6a6b1840 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8
 a=8AirrxEcAAAA:8 a=EUspDBNiAAAA:8 a=AlTZOvFHHOWiQJBrp14A:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-30_02,2026-07-29_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 phishscore=0 priorityscore=1501 lowpriorityscore=0
 adultscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607300069

Provide the required CAMSS PM clock descriptors for the QCM2290
platform. Register the top_ahb, ahb and axi clocks so they can be
managed automatically through the PM clock framework (they are part
of the camss-top group).

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 36534f5b496cf30f02464cf2268f0cba5896501f..7e755184b3c67573752c9d6f21d4436143b3701c 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -5591,6 +5591,7 @@ static const struct camss_resources msm8996_resources = {
 
 static const struct camss_resources qcm2290_resources = {
 	.version = CAMSS_2290,
+	.pm_clks = { "top_ahb", "ahb", "axi" },
 	.csiphy_res = csiphy_res_2290,
 	.csid_res = csid_res_2290,
 	.vfe_res = vfe_res_2290,

-- 
2.34.1

