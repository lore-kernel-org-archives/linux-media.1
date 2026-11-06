Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973359;
	b=FcfmX05NZbeFuHeByBQloZU6FgaNUDj8LZGXsHRMGB3IUYvEcFjxB0npu6htgTRpHlZS
	 uxsARBwE1bbOfjqGdL2xyMgZBm84adiX3LWC6uKCng0W3HpAAZgAXf0YXH4GUOHAinwd3
	 cV62y06qSxQ76ICRhe5vPLY6FV5VwyqF4WiobBYM+XOr9A8IOvCKpH6ETFK25Kg+BWEpu
	 Bq8VTMjoIEsBRvhDvrC2qHh1hKqjTKH4Lc59BTcgm3BezUF6g4NMcBLby8JBzTugpMpJf
	 IZ0HhVvyYXbq+ejcZ5iJUMNBJKeMw2zpPhHuku5dtYnDXzo8vENb0/6ImB/4xjnt5rQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
	b=B4car4cgnGNZEFN7sqkEhvnSIJUx9FGHwJ2nwCGO0bA8wO6eMiK792iwsyiFCdn1OiBP
	 St611OgTgf1HVWWOVkJzXQrporz/f7KFA3EGUHoFycfZIMCfDR6RFEi/4JiCtCdwiovR5
	 9iD2JWJZI5WjpOGJ9J8nztaF8i44uckMn4GsoFHOgl3mHaGeO84KZSTJ1mIkIB/P0bVCr
	 Hd27uID43K+Da0ckk/Qmqv/h8WO8bcTJ8ZHpFAY7vCzIHRlGIJByjhFBLlRuDauIj+vRK
	 Opgw5Yua4gHMI36Bx9GxIMazxNmJ+PHDV1y0nuUmQ2MjDByyzwmHgEmnqZqODpwdJtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA41606A332
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 13:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BAA41606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=US2nmvah;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=L8KV8Xf6
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6DoUkY4128443
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 13:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=; b=US2nmvah1yJQhPOR
	tKx9LUKcM/vHdZzQt0Phcfi/T3pbV+zRYzwXi0q5dvCA6MAKy3DETyd/S9viuPZk
	idcXvg2enG5VSWdwNK22WeaSi28jLTvsDVjQZRt2v+A6MCAswGiBOkHqP6UH42Tk
	+3eFXZxFY6mKE9lPUd9sn2e9h5kymEf2vpIq/H0H51rU1sStrMoWxaOHYVYDa+1D
	PvmniTx2gfwR2m/ueGBBxGrs+kKWxSk37d6Z7rq7xkWcOrJLFZ4YjNJ7mceLaum0
	qvoYnQaEETRqARToLchkLRUUtFrvQxRNQxkqQ/e2oSYK2pFbJUF813x0hcHRANpI
	RqShGg==
Received: from mail-ua1-f71.google.com (mail-ua1-f71.google.com [209.85.222.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3pa319j-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 13:55:57 +0000 (GMT)
Received: by mail-ua1-f71.google.com with SMTP id a1e0cc1a2514c-980b637ed69so107530241.1
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 05:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793973357; x=1794578157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=L8KV8Xf6To1qNWXhKLDVWSBrHCkj02pnREegQV/Z3bNQAT3/bmWN2E5HtwogiE+2PK
         cwNueCDlPrb+eFWTJiG0u9REle69greJajGEL0uTlg9sdEH05NnwRvMuXOK4WHc8iZC8
         cpEHl/9da8Iq2miRu5XxmiilR6iviYKmtTokJOtk6OZ9JwOXBzKlOjn9KCOrV7oI41ae
         tAU43Folq/FrhNbXlE/OGgnGIa6iuyS+CvDeJS4vMJD81L6lPVaFyYkRn1ILrJbgWkX0
         svzBykZxOdDDKfC1Vm1OHmuZ5oN/z4zZPJhgK6qOaQHoNU3m5Ij6cIUvDWuIBWn3kq/N
         ysfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793973357; x=1794578157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zZrkiifivvXgKAhzIe+nSCf+/l9FZzZvEX7NTROoNwU=;
        b=FJYkd2E83BTubz0nPmNkJxQQHsUc+LYeMyEaSH/NIxZfw824y3f57X9zHKbRyD2OGD
         s3ZgCg9sEKcVrVlTHcOx+8kgIcDNHvolpH8Swd76hYeABnem8E45hnSzcZ30Jgop6PKY
         8Z5ui/jAen2RTv0/w/xw3BEBxH0ffw0o47C/TmVin8UsC6dujT0caFgYdP5g+KbEQKMj
         HuA6cxzy3WlSHZ4qYV4i6eLXgK0V+IAFS5U62Th70FG6NO9QBDi1Id+FN4po66euuxdo
         wIpA6FOdFg9BUyirPcxQvOPWjxia2Y4U8NsKAQmAJojJnLPreWcdvpvoOrKGAB1WfqPh
         y4hw==
X-Gm-Message-State: APuU4Z/+wPzsZBMSTJ7b5F1jdY5XVdLk5Brh7RUXUoz6bOlQhXQY26vl
	cCH7NGe62/CBmAl3+mK9dFLLVG7XuI0Er8iMgWH04kTdM/cHMpy4KQkyNeT+4itqlmiTHsvSxnX
	07GQeWdQA9D3UvtM98Fo9RmMeWDufE1JiAHjVFM2NoVIV5WcFRHufd7Ls5t/bz4vTjg==
X-Gm-Gg: AYBFou19vPdftik6/WbinXkbLjGgpMRb+LEH/3nvrp+o2ecndZcbdUZrvjZwExLMNm3
	XBHeSt9XP5ftSeX0nY/mbW1E9VgiItZtEw3Cvrh/7xZtzNNWCzBwitqRAJrNuO+faVCMb/pfHjm
	NkcVMfTRme6jyEwRJVo4YA9MNzDPJBiiRr3bVLfppUhay7dLQaB0ruQQwUZzQP+oFs+7PcvuEPT
	cR/TN29rYpXNEdJNMEXnrf+Gby/tOT1+Li0xJHqnZYmbX7HSBn/MKUfnSiFJ0AI0Bxng8H0E54I
	Jdf6EvIyBDwydaxLBS3M4QmclehrI4vh12wIKwZ3ZnWwiwlAfT6FkBWvfn3ESk0zKjQMfYbx2Gq
	1y6RXfujc5ZWm9d6ZSSAK/sNwH/N2AOhEaJL5Vgb4XTWs1eY+cQFk6l2KLc+sMy50DfnkQv3Qh+
	iQcxdlYJAuecG+VwOYU2f21lQhPBYFiVMmtFCfZ95afE7fSKKIBd4GyJjXwSgWOt6584JA0L+6b
	4u5GpMPZb5343F+mb5t6sBpC8ji
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297850137.9.1793973357098;
        Fri, 06 Nov 2026 05:55:57 -0800 (PST)
X-Received: by 2002:a05:6102:390e:b0:7a8:2a34:432e with SMTP id ada2fe7eead31-7d2a151678emr1297841137.9.1793973356609;
        Fri, 06 Nov 2026 05:55:56 -0800 (PST)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:f048:3e89:c517:10cd])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d809df2dsm3963256f8f.51.2026.11.06.05.55.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 05:55:53 -0800 (PST)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 06 Nov 2026 14:55:25 +0100
Subject: [PATCH v14 9/9] arm64: defconfig: Enable Qualcomm CAMSS OPE driver
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
Message-Id: <20261106-camss-isp-ope-v14-9-49c426cd2715@oss.qualcomm.com>
References: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
In-Reply-To: <20261106-camss-isp-ope-v14-0-49c426cd2715@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Bryan O'Donoghue <bod@kernel.org>, Abel Vesa <abelvesa@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: UDMyMiSgnzgPdMRkcLtUVX9XlLeScXpK
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfXzhsirRhS77Ne
 47dS+c3hOAMPSBthTDXBvGqif7ubapNlbnag6zoDrk3wJbpL2FONbZBlAptZVkvgMs0HTSY02qM
 2/EWsIR1p3vw7qQzwDOtdIZlOcJw5Uc=
X-Authority-Analysis: v=2.4 cv=e7WT2qp/ c=1 sm=1 tr=0 ts=6aeddc6d cx=c_pps
 a=KB4UBwrhAZV1kjiGHFQexw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=NEAV23lmAAAA:8
 a=EUspDBNiAAAA:8 a=MWvNLhr-pL88feDBzY0A:9 a=QEXdDO2ut3YA:10
 a=o1xkdb1NAhiiM49bd1HK:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1NSBTYWx0ZWRfX1Qi4jq16N9l7
 vcmtCTA78QvKKcK7VAopVaq4Z6/yKd41NJC8ylB7JU7zGP/QOWVlS0udkt3FlCvENtickptX85s
 M6wTueoOpS2X7qsIAL28+0HJdWjXX3R0qxi3UN6LGM8bfCOZ+FeRlT+EHVxgR8/lYh3irx2TVFt
 34rl90CznDbnaLez2b01EsWvpaUm+q045lNIaZkb8BM6LmAYtA1L7YfdYU3M1vQyUcvP8s10z/N
 XY+NGlZXb72qbL32jQy3+F5tCeMpeBFjrHzNAw6rpABkIBgMBV8e5NG+9eYI9OD9GUI95F4nHJC
 IV/jwdmUrt8ltn4DA2dreEvHEZWmk6VIq+Qx3CjEvpXVwJwTamMwHq22IBi+gA6STduFK1TFQ8g
 AqjZU2WonattjCoUivBgtpAuwOQ20qGpsI6UmnXKfEtEghXXX01MMtFLXfsfgByUNH7aTMGNXW2
 caFugcRgFI74FvpM1fA==
X-Proofpoint-ORIG-GUID: UDMyMiSgnzgPdMRkcLtUVX9XlLeScXpK
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060055

From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Add CONFIG_VIDEO_QCOM_CAMSS_OPE=m to enable the Qualcomm Offline Processing
Engine (OPE) driver, an image processing block available on Qualcomm Agatti
and Shikra based platforms such as the Arduino UNO Q.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Link: https://github.com/jwrdegoede/libcamera/commits/camss_pipeline_v2.1/
Link: https://github.com/loicpoulain/camss-isp-m2m-test
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 arch/arm64/configs/defconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
index 7b4985b29b21c440c7912f0a24665bdb7010d9e4..6ce0907bfa8eedccd05c91dca45ad7c18fdb37cb 100644
--- a/arch/arm64/configs/defconfig
+++ b/arch/arm64/configs/defconfig
@@ -942,6 +942,7 @@ CONFIG_VIDEO_IMX8_ISI=m
 CONFIG_VIDEO_IMX8_ISI_M2M=y
 CONFIG_VIDEO_IMX8_JPEG=m
 CONFIG_VIDEO_QCOM_CAMSS=m
+CONFIG_VIDEO_QCOM_CAMSS_OPE=m
 CONFIG_VIDEO_QCOM_IRIS=m
 CONFIG_VIDEO_QCOM_VENUS=m
 CONFIG_VIDEO_RCAR_CSI2=m

-- 
2.34.1

