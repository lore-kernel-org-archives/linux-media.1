Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794655858;
	b=Jki1vC0L7UhIj7v0EmlxgO8OIdeIVmQwlv7qYXjtq0QZgt4RfQ+cdYbemwhhNWO708HT
	 W5nXD7oH+cILu96l07WDx0I6mcnJafU48I4jGyIIMGRycEn5tNQUz0qhVvbU+YKAI4ZWH
	 iB+3bGupOORR1vZZNY2rLudiCPejto3UTVDQOSihz2NGaQUxatVod6DKAwH3wXjAp5qLx
	 u2J7ZI02P/zbNG9duR8S9VLUkYvDxENNQbFyQ2qtwW5sldBAhIMT1TQjsDEaqnomY35Pk
	 fDs5Ub9osi0XnK+htlRYhScnbcnwDwbggUsSwCJ/j1OJGnJy6Lzi6++v+3z2KQKJ+fg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794655858;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
	b=oq2mNFprZG1W17GBzYLOHhLxF+LqfWvFxlVGqMG9uD4ry4Okh8oawSHJrXuoCGLgAIAe
	 5MZs5x5TRbl0w9UyJooMlhIakPDMkHkCMXUaJxguYxdZC+ctWAn0FradtUIHtvuMPDQLf
	 qwWitO1cUa8Cdrplo7VnDFFv7HSONaj5Ti6VmKViv8UF8lE0Hjte7qJNX2zsWhfh58a+x
	 nC4+rZzRW6hcuzwVMempNkcDIXFK9XFfYrVmZZ+xN4/4kT0GXO9R29PYxSxTaD9TR4qAp
	 q2pM7dj372p1E7PRx/XxUW4vykTA/PQpyeuQwhq10hdXnD7Fu3Sc3jkK1Bfhssmlv+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06366606A333
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 06366606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=is+jw5w3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Zo0tqJdW
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AE9wkMT1089786
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=; b=is+jw5w3FuItCwi6
	PB5nilGPbRX9RDS19eIHfUTmWjeWwtOiuzsjtMtiBzUhXYsXu0f6J9Gx5ufxZXca
	vRHBOCOydbv/BzFG1eo5U0cTLQsseAqR4CqZmJx7mkF39EYa60Yyq6bfKmWzNufl
	StTglC2ubE12WZDs3K7UGE7ahs6LhTygH7/ADGtZqe3rBfGXAzMCXP5VcWpO0Sev
	/z7b7aKFoTa/qysPoj5dyhOY7RKa+zBixU74Xfol2R4J0yZiEkbtlqUI3qjKnDpo
	fA1zU6JgKDwa59vbUE/slA0+7RslM6LNNQeV984stOJvpXWQ4zC0U4FFlRKRcdaZ
	+Ws2kA==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com [209.85.219.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hxhm8rkxe-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 11:30:56 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id 6a1803df08f44-91e9a0eae11so28266026d6.0
        for <linux-media@vger.kernel.org>; Sat, 14 Nov 2026 03:30:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794655856; x=1795260656; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=Zo0tqJdWroERepjzwpX0jDTKyvivB88pDMMdsw8Z/sR230mLN3XUHdefHLUo1pgHkV
         DPPgPsGysGhdyeTwUnpJgQUBp6Na2Sf89D1ks8y7g398828EqrmOzeuOzxQR6Iu/nleO
         pVFU/UHq40/6UHMyhE5DeFifBfvKGF0wqQ47/OYqPb79vAm/VUM9pOSbu3NwL9yhZrmo
         I9uJv+MCgxU7FYGL+5/lKfQcVO15iMeoQIbtKGM1AaKU32fCQ/4VbmvNOYWYoJvcRjjW
         w86V23gFf5jcYB/f/1tePgJQTF9qXLpcqFCoyQmTcDIUGL7JpXhkqNwJuMx1A5AjJ+a9
         aKiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794655856; x=1795260656;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HvpnDcakWRnW3PYccxcSi7pSHHqf2SzUoRHYqMjmiUg=;
        b=gWqnj63p4TGExpTruaWVcBitZ2P2rG26DgP5pK6v3nDn6wm3UVeMqG5qy8dojXJTnx
         aPa/s1+eJ1Nf1h5CkAyFhoF6KvUpw8HNVHjnNrwXOKUMZMsOVZIq+NB5vExKzXCn92kM
         zV6RIu0HHtz4b5HTdDZqLRbrCSqilr/yOJxuc/1gytw3A96Tsm9Z88lzcb+EMI+sgndv
         8Ef6p2M9jEByqy/stgY4f1DRExy4OBghxV6BBJN8/0sF7oeXmkhZwCLjohzPqB/NOt8+
         eyeFqXLUfQHEH2PVIoKtU0gP9m6UbCjRYOeDyKEPCUh6g5rxiveLwnhs7/X6gZjqP6J5
         Jmvg==
X-Forwarded-Encrypted: i=1; AL+hErHsikJTIVvZ2V8MjELoPUr6og3/6Xtlnvbc/Mf63x7OzxcycmszPYUOmKWNk/X3Dloop06cijZrwH1NTw==@vger.kernel.org
X-Gm-Message-State: APuU4Z/MO1sRTZRzlmo/3Rm/Pj/EcZ7eo0nGvnutyV8+71DMQjq8pkyK
	xpozqKwtFUtsRHFfT+n47PoF+z79E+p16eO15nIWP0Czqo9Mh26DzkPsjQYaTCz6L9ObQACVor0
	mziKaAPioSqkslweX8xm+OchORpS3+yny8+W2jNgiFQZL6cYMyKirvVW39pmSnShuTg==
X-Gm-Gg: AYBFou1qitiXmGwr6M6R7lRbnoSqwnyra0fli2rOWsCku42xHoZuNrDaPBNNjtV+VO6
	6BW8er9mBwEgATV8XAisb2CHx88vvBGMLriJAKxbKrYT+6SaFT0oAjxxJfUjTGituEQI+fh+vtd
	UXdv4ZCjbHacuQe+mm54HdtUsGqpj/rp2ZufZSx1jjNU46+51ataFvNf5AuAMvcx5vyC+okpV48
	m8UJmAIbroERmOV0P1XTCvFQmNYFdYE/CJfmr3oOXDFpkaUNvx+v3lFYiv2UR6z9o+1MqnYu+2/
	ubmHXLy6syDjh/NA9X9k66SD8jS0bQaooFfmZPaIkLSHJiXQonNU6cqXpVm/TXJH3jcv16Zwb1d
	ODO6jRTMWd7KBnVOdAS0D8cEpKi9uZFK9QyzIJCh2lOcKNuVY+lJpIamjDVqPV6wKas3rrAq+J5
	KO6NDhIPsDx+CSDwQSk5Uz9wrBJcwnHdL5gGFezbII
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645696d6.21.1794655856257;
        Sat, 14 Nov 2026 03:30:56 -0800 (PST)
X-Received: by 2002:a05:6214:c64:b0:91e:7abb:a927 with SMTP id 6a1803df08f44-91f241c65c9mr86645216d6.21.1794655855778;
        Sat, 14 Nov 2026 03:30:55 -0800 (PST)
Received: from WENMLIU-LAB01.ap.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com. [129.46.232.65])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d7ba48sm41389746d6.28.2026.11.14.03.30.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 03:30:53 -0800 (PST)
From: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
Date: Sat, 14 Nov 2026 19:29:25 +0800
Subject: [PATCH v7 08/23] media: qcom: camss: Add PM clock definitions for
 SM8750
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
Message-Id: <20261114-add-support-for-camss-on-sm8750-v7-8-8ff2a11835f6@oss.qualcomm.com>
References: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
In-Reply-To: <20261114-add-support-for-camss-on-sm8750-v7-0-8ff2a11835f6@oss.qualcomm.com>
To: Bryan O'Donoghue <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Frank Li <Frank.Li@nxp.com>
Cc: linux-phy@lists.infradead.org, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org,
        Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794655774; l=1035;
 i=wenmeng.liu@oss.qualcomm.com; s=20250925; h=from:subject:message-id;
 bh=aRxMrdDtYyY97/huckpcHrUdtu8c4K3ZC3GA/RWZCDs=;
 b=vWhSMHcARnVI0vXB2VQvgOzisoN8ZRFT+BwfFUA3Ajfs/RhNvQmm+8FhnwOhPEPYq3FPs84El
 /6E37tDjOSZAaqDqFh+2KI8ArW+N1uCOjbs6QglI38hhbVXTFl71AJs
X-Developer-Key: i=wenmeng.liu@oss.qualcomm.com; a=ed25519;
 pk=fQJjf9C3jGDjE1zj2kO3NQLTbQEaZObVcXAzx5WLPX0=
X-Authority-Analysis: v=2.4 cv=ItKL47/g c=1 sm=1 tr=0 ts=6af84670 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=MfOgH6a12QNS3LiSQs8A:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX1/wO5b7XsYTk
 UNt3jT2nQ2vrKR2koQpl5MRmz15TSTQKbGQ64vuuWJy1Ws3RTS6NCwDrt0wTIbFlN3Daw4kt701
 INwRaEiLIM8DFgxapRM9bR0Oq3iaF34=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE0MDA0NSBTYWx0ZWRfX6P1h1MWc84Jv
 O/MHGYCM7CZ29tC3XLJktz8VNQEEZniPsOomxBu95U5n1wdH1/42C4GwF2310qffkg7wKDQrPN/
 RXzCJTAqmilw2cfYfY5wojK/nU42FmAJ8B7I+1LnV+wbTAl2XXZO6HjXZHwGA/9DHA4tS47+mrb
 y0OvFgxgYtU1iUNBCQ/yAe6gHBKE9htSiZ9mENYSrI9axf/L6AU1jsl6QwjCVQFP8NBLutwb04v
 kzU2eaYdPikgC76CZje9t0NM9oQthaGgYdBbCIODRjmBTPbt3j15gez8yamPuQBlBfSSaKMzQpz
 1zVcG896cCqgETpUVSuJXjFitapPBdeNVBJrnMWczaHy35dHXB18lk+LVTwueAwlROa4WTb3Zub
 zkRl/bqGfGlxVDgUOsvoM82urjxfb28A1itu53bW/fhIDd1/d5BW9sY1BHtswv1kVaDfmYdmqj4
 ncp0KFoZxATKlQeFVMw==
X-Proofpoint-ORIG-GUID: 6jKFYHWiPbIIpuQLI6fQ3mWl9q9I_wpL
X-Proofpoint-GUID: 6jKFYHWiPbIIpuQLI6fQ3mWl9q9I_wpL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-14_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 adultscore=0 malwarescore=0 suspectscore=0
 priorityscore=1501 lowpriorityscore=0 phishscore=0 impostorscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611140045

From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>

Add cpas_fast_ahb, cpas_ahb and gcc_axi_hf to the PM clock list for
SM8750. The CAMSS core enables them through the shared PM clock helper
when the device is probed.

Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Signed-off-by: Wenmeng Liu <wenmeng.liu@oss.qualcomm.com>
---
 drivers/media/platform/qcom/camss/camss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/platform/qcom/camss/camss.c
index 3f9dd3a2ec088fa87a9ea90d25c906d14b9a1896..196eebc2d7d118040319bcf967b91c4ca98a4833 100644
--- a/drivers/media/platform/qcom/camss/camss.c
+++ b/drivers/media/platform/qcom/camss/camss.c
@@ -6043,6 +6043,7 @@ static const struct camss_resources sm8650_resources = {
 static const struct camss_resources sm8750_resources = {
 	.version = CAMSS_8750,
 	.pd_name = "top",
+	.pm_clks = { "cpas_fast_ahb", "cpas_ahb", "gcc_axi_hf" },
 	.icc_res = icc_res_sm8750,
 	.icc_path_num = ARRAY_SIZE(icc_res_sm8750),
 	.csiphy_num = 6,

-- 
2.34.1

