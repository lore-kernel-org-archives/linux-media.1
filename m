Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792506169;
	b=n+1SMqUZrGPQzJdduEAmcuByNEihyKh76Lfrwbtsfb4aaCtclcvVKN1anXHPjlYG3ns2
	 DYBNjeUPC2dHHP/uc3vqWYC4sEsoLU8RJNukZjW0hbfLvAAZZ4q6P4IcU4PShNlq5HzhG
	 kn1AJruslQZ+O2Wc5sq5FaY8cMC1L99I6gvY97pzLSHsuEONFNjKO4Y9IKTxIDY4EV1xY
	 V1Z2c32g2J9JVFTYk/wsj6tDdR8kmjBoEKx0UUvZE9rR6N+3K8mH+ggr6idQt389QVKL1
	 FzPpv5Rfap1+LmhxPPqYalmK9FPisKt2PaSujLJUY3Sc2G9mNCw2azZESereUl6MBRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792506169;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
	b=aeUr7kePkifvovGNX5J1wFxzpWxNhX7MzGYOh1c+jKvYWOXP1od/hPZhUlYwGLF1zkoG
	 kNl2sx5cB+UwBTK68pWpFqx83lC85J26nTvEzf0geZfG38HpGrEjlXXNYA2s59e8FEYb0
	 kDawcp4dfE3ffCd3OwfQ1HK4JLxC7ecza9VE2NDHyKkDB8w9LxMbA7rV6LWgHP6dZ3oiZ
	 7lxxJMydY7RXOEK1JJ1e26H2olgIbuD5D+x1H4G6J8nloYuGMYp2k2J10r/iaMF01M0Dt
	 3taJZwb6q8DXNPRAVLz+cbd7ItWY5GVe7illa1fzWP9wvtEbICCXSppOnfUtQXt3fCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtlC7IKx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4eGbTJd;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E8B2606A327
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E8B2606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RtlC7IKx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a4eGbTJd
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KD9vRM270638
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzH
	n3mxWWTY=; b=RtlC7IKxtIqFJmNr70Gv+oXDs/vvzLEj/1wdskZzxhVhqX1yRWp
	qAawtxurCyzcXteo4eyU4KxXADNScm3Qfs9WTn1JihY/fxebijkFVnPzeBGsO6iu
	zgxopjYqOlq8Ih01O+m2BdEMtWD2JDE6a3eDXkez8wOcoc9//MCKaU/ecN6KB7Cw
	qajWgA+sodFYw58jKIKUgasvM7ZO8pvAiA9lAGe1ghS1y+6cDbxFdeM4suKxoiOT
	NIHS29lStbWIFAUEthrRj1zmLtI5JZixW9pefFQ8f31GuXebP0+abMybH/U8PxRE
	QEiUnT6OXiTEncSRzk7ivHFyQf+IMNNUg9A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4he7hv8jk7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 14:22:47 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934956beec8so696736085a.0
        for <linux-media@vger.kernel.org>; Tue, 20 Oct 2026 07:22:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792506167; x=1793110967; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
        b=a4eGbTJduheBrNSP6RWMEOCL3+P0TMv+wOU3JisHWQ2T8wd1Eati1rLH17CuQPJYqT
         sOgEnV+RBplzVaRo6gc7LcLlHLMs3jRbxmwLgR8FHAPgOUaOiN6uX4emdoqLTPg+KXz+
         EsBxGkKpCQ9pZO6kGaJd9S6QYfNgkrSVAfzYC4rgDSI/5MiTR4V4zFMKoU4NpVIvY/79
         JgExdLXyC5iK1l9qkoi2owuMwel6F71sw/r+5vt5RbhjD4PA01x73URRfRRfNygmHc3r
         +Nd7XlxJv8olTwEL4+7ri9dGvxqDxhjPdYHzP7SvP9R+iRtfaS9PLM6VUJl63QFVGncn
         NN7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792506167; x=1793110967;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=4r8OWkHbUTvMbqeAm4mkToT/KEGeXEr6CzHn3mxWWTY=;
        b=IXwJw3QTfCt1ckkPE4B5BkmPkZgBLKXqZw8NEH79VLCnqoigSFN776fWtj6arPlncG
         /uHX+voos6iMYKjSfLmNLsORtNYElLpkIuRLmBvfcPmHNIqr3sLf0BRlzQRNdPlIEVeL
         dh6Us28iMXZUk7O7Z7dm+OfRu0dvpyNeF1pIjMKKo8qGT5QFBEmmgcYWSZUR8CLVK5+o
         O6V1QVc1P7iFwfqov6v31g/UsdW0kq/qYs3XobT+ZJFFQPSVae2p+3QIT4t/pvONDENH
         59PynalUuqAk3LKJhR6c55Q5Q6wvNQU/T22c4d/t7Ns+pTtgcma4HaHXErNDz5m1AtsE
         Jhag==
X-Forwarded-Encrypted: i=1; AKwUvByCNpL5WYi60r2WocL+AU2NL1JaOLrPISvozqbxLuetmSb3zL5I9sKrAwjfvxLOXQ+kkBzzDsYj9qxVTg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJNreZsW27IhvRoJLamTVpX1F870jzFQraY7OIByCfHjnVJoNbB
	driTiUIFbpKEvLajOTqqIprZ8AxYkcNujq10hBhedSIpLdOxBlJfS1iepjtdTKYSfNZyydqzcBl
	6rWZKP1UPhi62tSoqWKmzVa88HEexlEgaYccP0HeunWGzZhGKMwQ+P/jjxquVNU1sI++iGiHfzg
	==
X-Gm-Gg: AYBFou0yuCB8TR/Ui9+EHazoZACVFxZ2k4AHuY8UL6XwhNUczlYItXLVi7xt/Vtp9LL
	ueOBQi2FLSDeH6zPv6krnHyLCRstmLCwygLv4bSrBFZyNQVnwUarcW8AVnEydaPEI7l7UlWhdad
	tXjslrrAsL+sNREYcf9Ey9RA8Q8I5A1kb13Q1GRu9soVd6DScXvfc8NfTC2yFdx2WH6BtXtFJfV
	OI7IDT591IW6IpLj37+vdwOFjQaxBmYoLuGA1LJsrHAz6asjs1Gl8MVUVCh0E6GKUv8rvuPGXKH
	/TPb6zHCM0QENcu0dCvdiYXYT32a7wZ4+U8OgeuB7mQjM8R1b8pSSXo7Li+6NZKW7PI/BkJmHsA
	wiM4qfa4ZzFpraiOelzFSffFvloc1RgHBPMwMXiPD1j7AdxghU9yPr96GULmxuU8mwcVjTbuGcI
	gZR8HE1O6rB8QB/Hk=
X-Received: by 2002:a05:620a:1a25:b0:93f:38c7:70f4 with SMTP id af79cd13be357-93f38c771dfmr1256011385a.26.1792506166908;
        Tue, 20 Oct 2026 07:22:46 -0700 (PDT)
X-Received: by 2002:a05:620a:1a25:b0:93f:38c7:70f4 with SMTP id af79cd13be357-93f38c771dfmr1256006285a.26.1792506166485;
        Tue, 20 Oct 2026 07:22:46 -0700 (PDT)
Received: from shalem (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b38a1b113dsm5185084a12.10.2026.10.20.07.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 07:22:45 -0700 (PDT)
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
To: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: Hans de Goede <johannes.goede@oss.qualcomm.com>,
        platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
Subject: [PATCH v2 0/5] platform/x86: int3472: Fix AVDD and add DOVDD + DVDD mappings
Date: Tue, 20 Oct 2026 16:22:38 +0200
Message-ID: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
X-Mailer: git-send-email 2.55.0
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX0KlR3Cj1kmiQ
 iBx0duaQxDeZKV363KNDSdLaLLtbYyv+Ccy98PBDelY0WC8AQIJRWWHR8zw4w9EFCyar1OucFG3
 9gneLV550ANerVhg4uy00VrPDO9sHyFrkFA8HdRIoHP71YX6AL34C5Q/W2JzgKMc5kc8o5adTQk
 4BZVJQKSLW0p4VT+3mcqjWQ50SUn/8j7NHPaTDWC4dUCGCuam7a66XaXbT61GyZfhhzgd4tHqxI
 EZWsRCDoBNkLSQB3iNJyOjEIhZqLA5YjuXrBK+8yFySziDTc04fRnHuNVDpkphDDyo/pRhzsxdV
 5IacoKZERNriWRD+QDQQ/niZH5Ra6vC4ZW2+/nWi9ljwYsI6wjTnv9ANdciEmuvmCOq8of7MoaK
 2E2Sx17GMkT775dFwDmQnnk8vx8+wCwUEskrEUjDMOAWoHtrucl3u+AvfzpY2Py7RabXwiVDag4
 SOBemYit6PN3UBJmWpg==
X-Proofpoint-ORIG-GUID: 5vNKypHR7lA_2GAEKgB4JyIQ4DpWoDG3
X-Proofpoint-GUID: 5vNKypHR7lA_2GAEKgB4JyIQ4DpWoDG3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA1NyBTYWx0ZWRfX91yY/iLCHvQ8
 c7Fj8l4V1g7q8FNY0kXs84Nl5QlTPoey4x+PyJ4Q/Jcn/tmEeAO2ssEcXRf9OUh05Djj5nIfeOn
 2WdimPTKj1k027q2+FcPirZzVje8AKk=
X-Authority-Analysis: v=2.4 cv=NppE4MdJ c=1 sm=1 tr=0 ts=6ad77937 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=kVL90IzE1108TUsV_fAA:9 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 spamscore=0 priorityscore=1501 clxscore=1015
 suspectscore=0 phishscore=0 lowpriorityscore=0 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200057

Hi All,

Here is v2 of the patch-set to sort out the problems with the Linux INT3472
code mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.

This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
to properly get powered-on by Linux, without breaking any existing setups.

See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
a "avdd" regulator" for more details on this. The other patches are pretty
trivial prep patches.

Note this series is ordered so that if [PATCH 5/5] somehow does cause
regressions it can be easily reverted without needing to revert any of
the other changes (which should all be safe).

Changes in v2:
- Fix #include-s sorting in ov05c10 patch
- Collect various Reviewed-by tags

Regards,

Hans


Hans de Goede (5):
  media: ov05c10: Support full range of power rails
  platform/x86: int3472: Rename DOVDD GPIO type to AVDD
  platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
  platform/x86: int3472: Rename avdd_second_sensor to
    power_enable_second_sensor
  platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd"
    regulator

 drivers/media/i2c/ov05c10.c                   | 32 +++++++++++++------
 drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++--
 .../x86/intel/int3472/discrete_quirks.c       |  2 +-
 include/linux/platform_data/x86/int3472.h     |  8 +++--
 4 files changed, 43 insertions(+), 15 deletions(-)

-- 
2.55.0

