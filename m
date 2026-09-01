Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 940EE46AA75
	for <linux-media@vger.kernel.org>; Tue,  1 Sep 2026 07:31:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788247901; cv=none; b=uli6bj32p9ouj+BSBbSHn3rD7NGAtl7uglIGctYYrgL2cXVzT1TTYQgOh3Ei1pPIhEk9Yl43aaMqeeSRwqPjNb7M8m5fOKfD8RaeQvymHKnWLTr0676RAo6A8YGhBitSQpY3FDepGmuwXADU43Jv3dkaYFKKm+gBmZarbA8aD04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788247901; c=relaxed/simple;
	bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seWIkNEDptg4qw9O12VIyHtJM9J/4eQa8sACmJihu07x89Eb1llKEE05gFkFTfPahHo1AFZHD/N0n664RtTCMGR1E5iqwSACyf+4sG5NX47B+8fOLH0okcNACbaG25/mjFiNKbIh2JZUba6TfmCAbEENS4ZDCwjw9EgPtSnHd2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=lqbLSOqY; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Towon0+2; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="lqbLSOqY";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Towon0+2"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68179JF92562037
	for <linux-media@vger.kernel.org>; Tue, 1 Sep 2026 07:31:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=; b=lqbLSOqYAexpgYaW
	NmIFEarmQEXrLcAFN0PG+O6UUUsaT7Qyr5Hw2ikzisNHF3E5mz8lOZI9LwnYuOkK
	k793p0AdR731+oV+Ggor4F97VL3is94sLTa6ctKCij8Gyv+e1X9kajKHwW6tpOlK
	ZsnMEfLa2eC06AEa2nQveLqPhL5eyEHB7ztybVRIBjKhpo+mSLfPPH5t3Azvl/zk
	OB34FVTTjbMgysIHtG9c5B8dFnWykZhp8TJ+pQQeyRmI0aVevrQTcxraOHUXgTDX
	DIP9tVeygf9H6lriQFkQLWKsm9sZRvuCx+hokLQVz+vdPsXpEkkg+obFS0XzAqn2
	CyyQmw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gdeg3b34x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 07:31:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-52fbe82672eso11821831cf.1
        for <linux-media@vger.kernel.org>; Tue, 01 Sep 2026 00:31:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788247897; x=1788852697; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=Towon0+2Q9xt7Tn9j/cfT7ZblzSUDnitSQPvBQuFeAs+toqYWieSDZ3igQkL01Zz07
         169ZZYA4nXenoLcJZTqFgLz+tJQjfGp26QT7OpC/PUEfKd8MlPxyq6K7P9+lHfUxHC0Y
         1ybfq+4MFzBlsuSAqCPEzsrxlkSqnjsEjx5/BZAuL2gJTYIKsWhHJkTOnidK1VqEr1yY
         kfkfqVYDyFMhyqtYIe7IokncmqyfXpVKYgVA6Slv2/x8pTuvLfN8sRF+TQcmSRlS94z0
         pb7RvAZAbhcFIpMQHLIzAvIykJZudpf+MHRSUKWxy//kh1heY6ZrtK+6cnr9DyPMJVr3
         VJUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788247897; x=1788852697;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oEX3ve3HSx05suSaJfa1Byw2nUsa5ubBf9KhTj7eXdc=;
        b=SAkqp9zXirYdT7Qr59r9EY9myq7cWp5MSSnzpLiBZxIcve47eyqbqN+i2sC1qy/3BU
         46qKQ6bbqysp60f7uJ+z/tzOjMAOuQLV5kAewQjW2WtLiEYeTuw5uUD25viXS4xtl1kE
         KxAVd8lrQgK+9v0BY+wTseWJnwffCBm8pI7lVHfebYWiJ5xhLbSc1fn4GmDkVjfDhuzk
         e+j2S5r91EjNZ/XWSnDAo93K2+JB869O7vK+zWFE1Pr87eRGeKi7sbZGeCsuDbc6l44U
         v8NPt/ikZr2RGprCuN9+3gQGjYIfb19naBFFza1MGCWRZ6mlAsQb/fFvYjeLuZnWnHlo
         9EZA==
X-Gm-Message-State: AFuF++mGbECmK0RP6S1QYaHwwOBKbHqfZFXLzbWrLQjvEs6PdI4O/n6H
	baIgFo+Q5G3IhBROxr6WDSXP2wTUiAyKkGzU80R+qslQTyXMZAwLXmf9jOxLAXjWpgeemnylMho
	HDdZpPrTY6b3tYGplRtLmQ1liQAR49WRVuCG6rZJc7UnFwukGBZhbMTj1NUqewAKY4w==
X-Gm-Gg: AR+sD109aVc7EnY8Zyys0hanq2udQU2P6fLlFW6fGqOb2H19TB28PkRneJF2Wf2pMow
	EuMfgPHXvPURyC1rEv0PE2Zu1xjaAy79r3xfP1bkOAD2j3N/hlzgQNJFi6xgfARUqDG5XzjTI2q
	HqKHDnn0g2+vv5XIYfqBpfgQncsWN92Lr6SoUhv7mf6bV8QwefIEdEQ4bp0iuVBykMbDOK1JmxK
	XcqKftSTBrGu0P/nyJV66STWFTL2L7U7g7N4dx1QrUIA/kiQA0+BFPbYPT9XGNGWYPfzZ8PUDwv
	8ZoED3pBfnE08WGaeSqzirAjcl1T5B4K0bEaHxq53tEupPAi/MzJwfgtDLDbAeCraqFYlFgwBrs
	4XhIJ84UlnSHcH7tiVX+AliaAuB8rd+PlBa6OZaTGEwgBArYG1u1dBtmHUnAQv2pLkjmN
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297858385a.37.1788247895847;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
X-Received: by 2002:a05:620a:7101:b0:936:ca57:25da with SMTP id af79cd13be357-9391396bbf1mr3297854385a.37.1788247895352;
        Tue, 01 Sep 2026 00:31:35 -0700 (PDT)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-93918b0f825sm946766785a.40.2026.09.01.00.31.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 00:31:34 -0700 (PDT)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Tue, 01 Sep 2026 15:31:05 +0800
Subject: [PATCH RESEND v5 2/4] media: i2c: og0ve1b: Use
 monochrome-appropriate test pattern name
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-og0va1b-v5-2-b0400a9bac01@oss.qualcomm.com>
References: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
In-Reply-To: <20260901-og0va1b-v5-0-b0400a9bac01@oss.qualcomm.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788247879; l=842;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=SlQ5VdwZvVStQeZ2eNH8zzR3a+C3sg3kvTYpgF54crQ=;
 b=iO6+Xl2Bs5MIFb+zyzdwJ5KnH2bH94waL30vJH91jONK5TBQF1w4COF/EQjWi/dnCRlXRFhDV
 jR4JUzDt+J3DWWO6X7wojOdX7Bffg/iVIKNzMlYyoeJLAi8jHeU4UwJ
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX9Nd08exbHr/C
 pzCdj3qwkekOxZizBGQ/TpIMoNgcUv4zjictUUjEvufqtwnA+6jXL7VemC3q3nDopMQdpa0E/z6
 MyoXo90GG2nlxxBUfmdGjjfRbtC0QbJJx9lqWIUYw+JmdB2XSCM7JrTECd2iOlnl6Bx9Gmgnu0m
 jIAqStU/PtmJ75yWK8ZPazw0vnzC3PLA6kgmOLuRx0+G4ajWJ9RhR4QdPju4JNVwlwbipL4TO52
 4Mtetg7kAOrwys+YZZJS/zBkZIpT8PA4YrczDKqF63pmtNhfrSrkUUkuCrTkjFAmocPfeysB/IG
 X7EUA7osaXL3ctsRzdXjYPc8+4VQ45xP1AGVyOjykdi91SpjyFkKFEsr/W8UvtaHMZSMwxBGdff
 uv/rW6no1lgtjWU+djShLRIVtUxpIOHs1Vt3h+73OyV2kQBUCN21+voZhoNIp89d3amhhqXM+p/
 axKgyu6lE7DLm6R4uIQ==
X-Proofpoint-GUID: SJs1ZJNaaje2IHDuP_TkhkgD5mf8ob3r
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAxMDA2NiBTYWx0ZWRfX96rokJVDOQ7X
 O5BsompvBPRuVEpHheJIseiy2+lQfa8W8Fkde+xvLYauxtHA/q5p0TqaoCrkTJu5d7uFs8lJtxs
 tp9UFdRIu3BNApi+JCbrvaX6uDLG1Oo=
X-Authority-Analysis: v=2.4 cv=NZnWEWD4 c=1 sm=1 tr=0 ts=6a967f59 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=ni8zlDty7YU4e_isgz4A:9 a=QEXdDO2ut3YA:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-ORIG-GUID: SJs1ZJNaaje2IHDuP_TkhkgD5mf8ob3r
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-01_02,2026-08-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 priorityscore=1501 bulkscore=0
 malwarescore=0 adultscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609010066

OG0VE1B is a monochrome sensor and cannot produce coloured test
patterns, so the "Vertical Colour Bars" test pattern name is misleading.
Rename it to "Standard Test Bar" to match the OG0VA1B naming.

Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/i2c/og0ve1b.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/media/i2c/og0ve1b.c b/drivers/media/i2c/og0ve1b.c
index 84a28cdcade10f8fbcf945999e88f84641b9bc0d..da5c8e49d4a811f55736bd89c6922856f2e7391c 100644
--- a/drivers/media/i2c/og0ve1b.c
+++ b/drivers/media/i2c/og0ve1b.c
@@ -72,7 +72,7 @@ struct og0ve1b_mode {
 
 static const char * const og0ve1b_test_pattern_menu[] = {
 	"Disabled",
-	"Vertical Colour Bars",
+	"Standard Test Bar",
 };
 
 static const char * const og0ve1b_supply_names[] = {

-- 
2.34.1

