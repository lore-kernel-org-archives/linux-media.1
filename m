Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A79B46D0A8
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784655188; cv=none; b=BpbBxap6HwBxX9/7gbz4g3qAZaSW6Ht3fYI6zMVmBtk39eXykS6UvarkIu55VN3rl0rIdKsRJnGKWO8OtRzrOL+JJzoirp2nxIw8Qc+u+s46ewxTTmPq1ssNo9W/BrQWOI1nlYf0yoUYKr68hwb3zZRSz4MuPpW2polkh25L9jU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784655188; c=relaxed/simple;
	bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ebqH/FILwIYQTQSjsDtdJKaFkgss5dCidoN2bB8Z//lwRDpaYI9daLUWxV5fLv85Kebj8IjB17My/cQZRC+Sp0R3ydL5JZKDDHXp5f1+3y/6p5IKJ4nOSjB5qEj9yR7J/phG4KZVnF7qkPx6xz8FBRU8n/GtyuhEPbtj7gpgsXM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=FCEaAWvd; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=NQxtuyDm; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="FCEaAWvd";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="NQxtuyDm"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66LH2gKp2418318
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=; b=FCEaAWvdmqbxCxCA
	G5jHmwr225NRMj4A6zJrNiCah2aeZT1gXDGfugpBaGB6P7732dEyBbfjRvLZY/3w
	DEL+Q1zFKH4Y1lko9hhOd9HAfgqVyXNtS3W1HVE6uZt1zuwkzeeAzTTlBCymocrx
	Vlsp857v4f2wcYTX6SwBFxNIqjMYo+YUo6UpGKF4HSzrnldOTdcmh1k/XKbgtSFB
	5GtjHlZpeH6U6hiQZdcgmGkeXUKQAvyHwQGqDB/zA7oU1nYjzPoWdC6sG6rAosod
	qAkRM8T4rby8HSLt/lGXIvfBPgqxvaVTyRMr3S4dTAyFdwe2hPYrPGPm6E1OtO2V
	st40Cg==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com [209.85.215.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fj9bs9avx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 17:33:06 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id 41be03b00d2f7-cb711c88f2eso1767923a12.2
        for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 10:33:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784655186; x=1785259986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=NQxtuyDmegCtKi5t6suxj3coxfOLNrdFIdne1Jf7I08xo0U6ehd2F8qQZIG1Cs0tCY
         PnuF/B/gT8u7aO0HE+9CKcl/uWZADT7HmPfPY4g8j1HoazzwMIp0rartSOENDpVoiILi
         9ICcWE2A0G2t2hOT06FLXoRRBX6msWsrqKyZrYivSTixBZ861XkySiJS5W5oV1vBL/RF
         mvUSCnXM/r9dAMOfKeymXZx7/950tpiQEOnygdYJho1ctnHk2usbjNc/uxdjO2fo+4tA
         tHROhHB5vt34k+x4r3xZw95xKzcaofJAeS6aFX+rU24Nkgai9JoLeWlj4wYUu1HT38cM
         GC0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784655186; x=1785259986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4rOPeDp1gR6WFEaLqOQIi9Vwwi+NGwBjpXQJ2pPHGYE=;
        b=BkF+AVJ4YHqflmgWSVzahKwKXJCbQFEH0Uar5/YL39HgsDpKJDxhhik3cu7X8M4Y0f
         pbrcXrKjknD0wmdKku2MWMQ5ki1jIs9/aaCldVgji92VvXajPd8K19awcXoDAP6iYw/I
         AoVj0cYFOUkMGh0QVqLrxJWtk80bgvOB/Xlp+Z+GwMpKqWgMKwpKDrHss6obVZTHoXa0
         wH9A6yYsU1vBM667zLoSRBoq4tKwkLhEFO76rb/nVFG1u+5J///j6P7UjXjyfyFS2XQi
         c8bLoujMyyxrmsvWd0KLhGNKA15ACoAYfIrAAl8UyS8LmpNNyj7EIjBYP/qK+7d+i034
         eTyw==
X-Forwarded-Encrypted: i=1; AHgh+Rr5dk/U7gvx99WUWKQG6S7fkRS5zEpG9qZX/IG4g9BwCgZYEh46G+Gppsb/HZdEYsqfeFYqclzk5XQX0g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoFYIBwNxtRRM3oEzCzJXY4yKTyTH7V7ByDpKpz3USaxzijHjR
	Y0UhSazWBJ2Rkr9Ixkm+sBGkSmbaoSuN+t7UKlRZoMU1JiksaLJ2DF8EnRzUSmj/77I2s2Uk5zo
	bDQNbwirVfWvoZn4pDDrV05O6lhutjWP/pwAkvIlifteXaL29vuDPz3ejknwCL4QjtA==
X-Gm-Gg: AR+sD11Hm7gWrwIj6GOKDHb0VGGuBdxAeu7Bz1pIwtkKa4hEwL9volZz2PbJ09syi3l
	2+7SFVpHilfuWCyiPkVNcU3kI6cpmvy6gT9GdI8jTeJ4nQegEx5E6gl3zfkXM19YcX5qOJgRQTj
	kZmDPB+KIVAIsQ9z+eUIr2DCPs6GKwYAhcqSNi4T/ipqU1lBUQtVC3p+W2mTy0OO5Cp+IyJO19i
	WuGeychFz0IdulHgmpj1lf6JVWKVhUweiSsqFCiV3eTXWBXCOf/yDDoDmqzPOx9WyOn2AOOTn2k
	j65xj+eFEo/JI0pVS7ySeqzLuBNlj54mO/EBct9m8dSvwpYDa7kz/9q+gjcMRdlPg+abkkVvEw0
	Fm5PqrBkgNy18yiZiNVEFL4RYHi7IpmV50Ls=
X-Received: by 2002:a05:6a20:2583:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c3ad972d74mr18735742637.37.1784655185655;
        Tue, 21 Jul 2026 10:33:05 -0700 (PDT)
X-Received: by 2002:a05:6a20:2583:b0:3bf:5539:f8f with SMTP id adf61e73a8af0-3c3ad972d74mr18735713637.37.1784655185224;
        Tue, 21 Jul 2026 10:33:05 -0700 (PDT)
Received: from hu-vgarodia-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3147e1bc886sm710881eec.26.2026.07.21.10.33.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:33:04 -0700 (PDT)
From: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
Date: Tue, 21 Jul 2026 23:02:27 +0530
Subject: [PATCH v4 3/3] arm64: dts: qcom: shikra-evk: Enable Iris core
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260721-shikra_vpu-v4-3-6dc5a8999b73@oss.qualcomm.com>
References: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
In-Reply-To: <20260721-shikra_vpu-v4-0-6dc5a8999b73@oss.qualcomm.com>
To: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Bryan O'Donoghue <bod@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Jorge Ramirez-Ortiz <jorge.ramirez@oss.qualcomm.com>,
        Stanimir Varbanov <stanimir.k.varbanov@gmail.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
        Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784655163; l=900;
 i=vikash.garodia@oss.qualcomm.com; s=20241104; h=from:subject:message-id;
 bh=zD30EA8RlbclvL9YJ5yRBEJPZIL2Cuh8TMVY+3LX+dc=;
 b=u1JBDopBwxjem4sw1HBkEt6MYx+EfSBwZV59lka9bL7yubITsaPgGM5toPIkFNWG324j4adWo
 PQK4x7X1a2YBSe84EW0uop+2lS7A6ObCgq2DBuVFg6TRv+LWwTrA1D5
X-Developer-Key: i=vikash.garodia@oss.qualcomm.com; a=ed25519;
 pk=LY9Eqp4KiHWxzGNKGHbwRFEJOfRCSzG/rxQNmvZvaKE=
X-Proofpoint-ORIG-GUID: 17m5AROGCYqGgTdCY413w7vvnLJncpCy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfXyimbMknZG/qE
 6qGEuo+3RtMHe/Qrsify8sCYOuMN0hAiqxOTAgVeCCSP5pj6r9noe3nIvPAm0D2MIXwcVOKHNQL
 S0VQdeK9QZNmS34i7MjIcgJqpNSb38auo2kMNU399iM+0miXG9J0uKrAGyAQh+ply/lmwIq4Tp2
 hVW5yJs5PsgaheLYk3XSAp47zmYu8Jg4XTWZ5pkFKXkMLZHgLvpaOA3B7FRYshkp+WYClwMliUh
 3pCp/7foSIXOaHB+regKgxWsJTMNPGDUtMH4Zagvng4wPjfVQm7AUAsoIYjJ/lul3GEdY3BsMID
 XUK+ofVlBka34EYtrpM7NB3w9Td7RqB6ieaDWlhFXgb0M4lUZIJV6mg/h72ksnvtGvXDj+oPhTl
 aYqCZOtPQPWknd4YlXT8LI5h1qDKSQ7bQ1Iz3656eNwXiSufWFolyqZqXNyL/ZnR9Ev0qO7cFrH
 D2BHPHHOxCHeUTdAuPQ==
X-Proofpoint-GUID: 17m5AROGCYqGgTdCY413w7vvnLJncpCy
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIxMDE4NSBTYWx0ZWRfX7auzVNGY5jon
 8KIcm50jjTU8LEPWXpa5/ZEB06CpPkg9d5oul/FcOJMTCZQMzfIexKiuONRhCwaUQaYUnNBzOLw
 JnPtnJdXg5zbMcNYSKkWa0DD3EVqB/E=
X-Authority-Analysis: v=2.4 cv=QK1YgALL c=1 sm=1 tr=0 ts=6a5fad52 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=c0ntbg5kzuLjbw3eiskA:9 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-21_03,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 impostorscore=0 bulkscore=0
 suspectscore=0 clxscore=1015 adultscore=0 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607210185

Enable video en/decoder on the Shikra EVK board.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Vishnu Reddy <busanna.reddy@oss.qualcomm.com>
Signed-off-by: Vikash Garodia <vikash.garodia@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/shikra-evk.dtsi | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
index 6eb4184f76422d57766ba34647010c690646fdab..696df7c9a7e0f7c86955066e76df3d8fcb8bad1f 100644
--- a/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
+++ b/arch/arm64/boot/dts/qcom/shikra-evk.dtsi
@@ -3,6 +3,12 @@
  * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
  */
 
+&iris {
+	firmware-name = "qcom/vpu/ar50lt_p1_gen2_s6.mbn";
+
+	status = "okay";
+};
+
 &qupv3_0 {
 	firmware-name = "qcom/shikra/qupv3fw.elf";
 

-- 
2.34.1

