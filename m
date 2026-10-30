Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793353157;
	b=Uw/ikWDbWbHAGAvGE9TWPhFRgxCzdZpRgtVWsHySJy+rrcpWZ4pIbPvSJLfUvZLpIq6F
	 xQluDJ6dRhIr+3LpPE+Tog9a6vMD1kdO2pg2T11psurL6EeHjK8FYtcw79xKPRGfMJyjq
	 OjniaDFOVmJttnnbCq1i2sBoJ80/Hx5ZR97LZx/uhuTIYtnCaR5Al+6IXfTBn7i4kF2HS
	 Pbu+HV1BkwL81YTIjzOiPCk3zFkeXcQL5mmunl8DiTTd4I6pVsOZP4Y/ofZv3asZDzVh9
	 gmrTfDHA9ePB7zn7ewIryAbyw+lGU/jpCW6+y0sr1fnbgwORvfLmwTQ7OEpaKcHJjGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793353157;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
	b=kx7cjNU6FU9TKajewxilXRa//PZW76iaydyHbak0zR45c1+1MsTLpN1ioB4ii1Helc6A
	 0afwRfw4wVYgxfTJMbD45GK3oFMAwaW+2hpLZ/I7TfGXD8affe7VpT9y64MgbJiON5fbA
	 uYeN7OMduyTEcfnr/M+gziHZ48w9VCqj6HAMRRJUSOchTTTlsagYdMExCAieU5xV7ijbq
	 ezbGleFk5pzmtipX2CuzfvUIk7BnATgEA62u7cchXNHe0+Lz+Ng/GoqrLiAxCmpxsP3Lc
	 fHbQbuKNn+kNyhqLvsp6nuKpxjQ1oAlaNRJopAA/9VNerrWYK+WXPS0CpyxS7Az72Bg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKM6Hf+O;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmW2QZu+;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95A0606A321
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:39:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A95A0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=fKM6Hf+O;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UmW2QZu+
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8FTuZ1663390
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:39:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=wat7q1UYgkEGaTTWcudFAF
	VB2otd83omGVIbYCT/JIc=; b=fKM6Hf+O6j/LL7fINVr8cE27HKhBmPwBZkM6MN
	bAPoK/O5oGkwoWwmMNRSZJpfk0wlCptMMIkTooPDqcaO6iFqTMXfel4KZAdjBuHA
	qqeR2voCdJN4i1zIJ28QdCI8m6k1/4Dach9cl9Y9BayIJtCgK2u6MHZQIQgwjstj
	0yfKIxaVpGZEhZB0FvvKxx//yUU93H1yRU5OZ3+RJA3kB4lLG2P4qZq4inq2+wFv
	9Q3XoLP3Jim0cnTqG22whZl+EB7KnjDsWa6taPjFExPkL4POFwUL4bhqhPQ39UEx
	dSzazljrBUxwCrSMFx+/eM26NFTCsbsCM8DzaXtEf1fj01dA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p2ave-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 09:39:15 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so88514685a.0
        for <linux-media@vger.kernel.org>; Fri, 30 Oct 2026 02:39:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793353155; x=1793957955; darn=vger.kernel.org;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
        b=UmW2QZu+Tyl6X1wK5EhC0O4uWFl8CE32UoGXlszMEkMhIln7MDKviUtx3g8QamJlrG
         qSC81a7dSEWNgCuOA2LYtjzMHcyJPhejo/6XZ3ug96Lubj+hIU5ghlQMNa3ea7aT8tby
         j0Fn1picg+ZXmm5ZWXCfA6jic6mVXBdFR2X+EPFKXuPdZetDPAdTcKdMMOWgY0qMf6o+
         85PB/m2peI7WwGum7jVHWqIUKYMFzh9ubvKFqJ0A9l73bPkA6uqhy6naxGFYp3cTqzUk
         68HPiZJkcn0mLCqNA0oJWWKrfJDY+UGSn9flmFKkz4SiOZ+4pJRnrQtSQ/LrCjQ1sYYU
         Vhpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793353155; x=1793957955;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=wat7q1UYgkEGaTTWcudFAFVB2otd83omGVIbYCT/JIc=;
        b=DhptoIVuD7O5UfQCUEIT0OQoooY6A7sq50/267Hgs1T4P6QSKdmLw17dkJqcEqqjDY
         pVQ3KxTpLCNA4jcC8IGHkvdBkCXkNn1wWKs9v9mSvumHTANNInqdzn2StA+IDw9QKavL
         v2lzuzgP1ep9+ZW91BRqJ+K/nJXYTcV9DvEH3jt/A2jnirh0mYVZoHFy5Hmp9lZgZMTt
         1wHRjUW3l+LjSXtyXA/VD+HjfB6GMzKhh2kvJzKWezV1eswWlNqBoIeTrIRGkdh+bShA
         gCbKt3SiKwjAOX9kSLkyxuQvuH+JkO2RWeVxPyJx8/rHE7J4C7BE4lLNLJBkGMHxyPDJ
         4cgA==
X-Forwarded-Encrypted: i=1; AKwUvBz6NXckAHzo21sThjhs7gOMSzf4R9pWrclPE/28SsIHg0yv/IX8sczf8ZT+Zp1h1S0kAZYzePoBaLcSNg==@vger.kernel.org
X-Gm-Message-State: AFq9FYL5DEZmBJJtKXi+29Hxa6hP8mI8zgTiVP2o84+XxlIvMbgneghi
	Gj4eUhu1PimBR4gj7BjHJDP4B1d+UmQfTd1FoP+IvPw5gC8qm++x1L1QtJeeEEgkKkrXFyxhSTY
	W38Dg/cnJSWl+OQDvrST/DirNS/Tg43wLS+rLyueYJhguCZrOu1jkgtqNmC6UwcWI+Q==
X-Gm-Gg: AYBFou1UAFjn3DuEGQM+hLfsO8LqUeKbu7ZJNVtTJJcbdy9IrixVGBJ3oyM5zSDyCSi
	i5IkjdjdiiIqpHzQlxp4C0C9GLnLGtaz3FT7vI9PHrGFp9TRe0P9jJkOa+ot0hLSPjLqUFwg5so
	RS5TtQvqlV+7RIYEVc5raT1tJJVk+mDagXkWNHvAKSxtm9MC+6orU0NlByV+p/31kchjvJ5dWPL
	ByfpQzgnBu3lMH3YxYpabZOONyNCOpTXmY4FF0D8A7uMACKUhZxcmskqx9bbhr+3q4rmlKC/O/y
	RkZvnLb/+dwcJ6gP4HUmiq0K1u5+lXXRy24Rd/9AjG8/13P1gy74VY0vAFhr2bxa/PZ+jFA2ZC7
	hNgHiCP29LuXMcN7e2axVzNXJjbUGIavJk3J68BgeqxwTYjuu+FT3dMGJqkCrQDekDf7Ft008Qa
	HwW9/1hkdkh+QIoHdv6UL/hYQK3tWWpHsmB8O8qcD+/yoq47krDAIFFN4jrN4Zykyfiuoj1b0rN
	PZ2ACwX6MDBNJMutPnQrM3GVkn7
X-Received: by 2002:a05:620a:6603:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-94421744ef3mr263254385a.26.1793353154681;
        Fri, 30 Oct 2026 02:39:14 -0700 (PDT)
X-Received: by 2002:a05:620a:6603:b0:93f:25c7:a4e1 with SMTP id af79cd13be357-94421744ef3mr263249785a.26.1793353154159;
        Fri, 30 Oct 2026 02:39:14 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4aa813d295csm126785025e9.7.2026.10.30.02.39.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 02:39:13 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 10:39:11 +0100
Subject: [PATCH] media: qcom: camss: vfe: Clear active buffer pointers
 after flushing
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
Message-Id: <20261030-camss-fix-v1-1-ecc170342d0d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAL5l5GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3eTE3OJi3bTMCl0TS3MjM0vz1DRLg1QloPqColSgMNis6NjaWgD
 dsvDnWwAAAA==
X-Change-ID: 20261030-camss-fix-4972697ef90e
To: Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Todor Tomov <todor.too@gmail.com>, Hans Verkuil <hverkuil@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
        Sashiko <sashiko-bot@kernel.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfX4G12XlPBwt0D
 0hb+DRhc/qwANQqznDp/sjP9l6Bmaoqfa8Mo0gWGZR2bYzAh5ooUR4nKG5E7dQz80V9LfVVFNv2
 xMLKLj9YzKzhDUMi1gKQaSKzNPsrLMIVfgdo7EBMezJ2tYwBh1kFR7xEQ8ygrXFwkyd6Dx86+o0
 4X0rjtARwno/VbSJAxTQX3QIBh/Ilu5hf6wUWYReCZZ38EBjd3akAxxLGNiANNoXWKkDM5y9j9d
 89DkLmEejvKLROAkOTwbvJwnQfBbAaoABqcdP11wfwYwZUPwEDjsszlWknfWUT23KRPpzxGyftM
 T6ekSaNPe5F1WvRBXERPtG1DDZWjX1fDmIz90aUgUooHEPVe/aYgPE7D9ePsCIwV3ea+2jKLGAl
 eB15vTuSVFT155MV4Er3+RI/5X3XfZ6MVqbHYNq9mBGLtFcIQH9xRSb15Bjg+R7GlBD/xsNv6mC
 QR+qHutqakeL41o//kw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzOCBTYWx0ZWRfXyOiZ5oncuxib
 q0LxdZI8wqFDRmsWse6qkx0CluYuDoCLy0BcFUI1w7RXcDvMGUA/zQCf+wIibce1sRPSgg1BJzt
 F2KxUALnm3NGQz7Fg5feXkriZ/Jj5ZY=
X-Proofpoint-ORIG-GUID: Rxd-gHZ5STOFBSYajzBedDnWCOAsJ3_s
X-Proofpoint-GUID: Rxd-gHZ5STOFBSYajzBedDnWCOAsJ3_s
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae465c3 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=c92rfblmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=SZjMrJynLI06Tb3JO1YA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=GvGzcOZaWPEFPQC_NcjD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300038

vfe_flush_buffers() returns all active buffers to vb2 but it leaves
output->buf[0] and output->buf[1] pointing to the completed buffers
despite the lost of ownership.

This can lead to subsequent flush or completion paths operating on
stale state and potentially completing the same buffer more than once.

Clear the buffer pointers explicitly.

Note: vfe_enable_output_v2 is supposed to overwrite those pointers with
pending buffers when streaming is restarted, but nothing guarantees that
enough pending buffers will be available to overwrite all entries.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://sashiko.dev/#/bug/linux-e617a776-3d96-47cb-8d60-a769340c25a7
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
Fixes: 4c98a5f57f90 ("media: camss: Add VFE files")
---
 arch/arm64/boot/dts/qcom/monaco-pmics.dtsi    | 2 ++
 drivers/media/platform/qcom/camss/camss-vfe.c | 8 ++++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
index 361f5163b6d91eef794d3bf86b374d4dcbc6d60f..1ed4de00b1a3e23e1ef0f1c412a2e29bf840c870 100644
--- a/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/monaco-pmics.dtsi
@@ -58,6 +58,7 @@ pmm8620au_0_adc: adc@8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@3 {
 				reg = <ADC5_GEN3_DIE_TEMP(0)>;
@@ -112,6 +113,7 @@ pmm8650au_1_adc: adc@8000 {
 			#address-cells = <1>;
 			#size-cells = <0>;
 			#io-channel-cells = <1>;
+			#thermal-sensor-cells = <1>;
 
 			channel@203 {
 				reg = <ADC5_GEN3_DIE_TEMP(2)>;
diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/media/platform/qcom/camss/camss-vfe.c
index 2680a9914765fa2c8f3c2b38a5f4f0e0bcf4d873..8e297e2bcafcbf30b09fc2ad6e57f484a4e41898 100644
--- a/drivers/media/platform/qcom/camss/camss-vfe.c
+++ b/drivers/media/platform/qcom/camss/camss-vfe.c
@@ -1187,11 +1187,15 @@ int vfe_flush_buffers(struct camss_video *vid,
 
 	vfe_buf_flush_pending(output, state);
 
-	if (output->buf[0])
+	if (output->buf[0]) {
 		vb2_buffer_done(&output->buf[0]->vb.vb2_buf, state);
+		output->buf[0] = NULL;
+	}
 
-	if (output->buf[1])
+	if (output->buf[1]) {
 		vb2_buffer_done(&output->buf[1]->vb.vb2_buf, state);
+		output->buf[1] = NULL;
+	}
 
 	if (output->last_buffer) {
 		vb2_buffer_done(&output->last_buffer->vb.vb2_buf, state);

---
base-commit: f1ac44c32cba88ad65dcecd4a279661d14e93651
change-id: 20261030-camss-fix-4972697ef90e

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

