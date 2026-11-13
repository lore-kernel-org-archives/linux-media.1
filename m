Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794558046;
	b=KXrD0+Ul+YxTVoBd/8uw7GeIAboW4PA6OEzHcRQju6+zF6cBEUPBkQu/ac9h94oAAx0k
	 1Za6kHNeXPmndnA2sLou3K28CRCNIx8MhTaFjAjqjgm1U3ybL/KmW2ifsCextHfV7Ia7h
	 DnzMknQqTssa5Wd+Y7UaQmd18fJklhub96Ksji1AXsSzRXlCxFUbMtieRaUtIuBOFJrRS
	 3vxGSw4YBlFcb+fC4VsgwLpwu/IABTL2CSydWYWo2f8cV7RL8sMSbZ+guPhU0A3/LV08L
	 O9aJI4U64ll8aJDCTKtC9qmGxtDPc4Z/ZRhRthqP2EsqeTfTJxV9yi1LmDVLEwDNuDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794558046;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:
	 Subject:Date:Message-Id:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
	b=d5bRRtIXY4KJmII0VWzX/EFc45ZiwjTrTLGWGEOO9/2Ze/4ZuTadNRvalWFPT211Gmht
	 OiqJzl/6KEpGV+0k75OZ1uLKLiZlETO3ijpJeC1jUcCqDbL0IHh4YE6neJ9yllrP5j+LR
	 v2t9V2CJj9kH6nUkx+3lbbL3g2nZ42BtYnooWD5u23DGi1/GD5qq/c3bj9THLaoC1bFbn
	 03SNR7pESbKMzkW4v2kucB8t6JOPs1ikbj90kxH7QwNqCwpRep8EYTzcYk8Nj15IEzJU2
	 zu//E78Q8bYODtFj6xsR2u4PJQNFFcQgKjHWK/D2WpV61hMYLamaflJ7ePaXLBZY8QQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9884B606A339
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9884B606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZdXx7Gw8;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XviP7BGW
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD57Efm3283675
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=8+HhukhZuFpUmESx9rrAxl
	UZVKyiO21AXgcFpUXvUvs=; b=ZdXx7Gw877oUzcqjI/khCD4wl/8tumGoJRseaD
	dp31C2d2ZuAlsev+5Bcx7FPzZgzlQJGV1W4pSgfBSp1G6tOkuNVzG//4PHRObgKu
	y0YqF+ohHJASIbRtbV9cgR865nMJ1RJtY4QkEdvk9WCj6UFMIa/2k/Q1UwQOXb/H
	ZvOJIVeuKbX4i3vo2UzZOa+hljTci6ZUd3BVTEXYVrU4HEcK2zAxR4HxzK27hXLE
	0nRkgDEeTdJzAiazoKxrZjHuMhzSga/f0KRkfzYjgPFNK5KPseJCduuB8yAcDjWG
	1EwIdDfcprBsyxhohO5dF/2SfP6V1v0+8a6nghMIUh9DtZ+Q==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwv37gnrc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 08:20:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso1130729eec.1
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 00:20:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794558043; x=1795162843; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=XviP7BGW9macQtt8bKsVdFJZWd3zkZrRCnMigzK1JPzSuzGEKTh4TkGYGfjOkY/nkW
         LMaqVziN5Q73g095hK8NYt0jH1hI947ky1DeWht7fuNkvZ96gvHjUmmIQkEMn7n4xSkp
         bbDtjNuH9N6hotZFHQnCmkCXSEkh6yiXLjdGYL0VuKi/bv9cnnJhP1dA6xe8R1uPS+EQ
         ndk4/nZCznv+b1t9AxWcPn+f6CUHDipEzFx6vONt2Cr3vd6JGORD3/6faA4Ugjx/FOG2
         xOQ4jW5rZj0WEe1zMDp175YDrleZrF83y2R6zT9CMst3MJpxJxbDOlw6G84bT35pwL99
         w/4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794558043; x=1795162843;
        h=cc:to:content-transfer-encoding:content-type:mime-version
         :message-id:date:subject:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=8+HhukhZuFpUmESx9rrAxlUZVKyiO21AXgcFpUXvUvs=;
        b=mybvDZmRS3cspNG4mvHsnBV9FEKNINaRFIncNk/zhb/T66etGjlvQ2/PgZqptmvs+a
         i4IHLhjDQSlBSEnGlWMgwLic+wjNJR5ATNIuCHe/q4ARr6Kc8fbH8qrO68f/zshu5WcA
         LAPYzqPJwK/X1BKOQzZZAn1mq24URUtoUYTFwH8DMP7KEuz3VsPC4B+4bgRG/kTic4fD
         j3UkX7LPIaT6cRZhF1egb6UJwP4G/y0HOxfU9GB+MyBnQrVS3tOF5cdQITMrSEPv6wc9
         fvLarUTGVRU6dILo/VRFu7AWTNcVHR2/xs47VBJhFv5V/aLTvNs/X+2hYJr6ub3pGmKE
         /BQQ==
X-Forwarded-Encrypted: i=1; AL+hErGr6RrgFeoHmyr8v8RgiuRhmDIoF8pHJORtfRRgCEFATPxaQKFqEJuXH1uejzNS9+jGFQy1byvZ9m722g==@vger.kernel.org
X-Gm-Message-State: APuU4Z8/o14pkAvdzQmnFciBXO9nSLnbLYO+VN69G3Cy20a4gjZVq/Xh
	V9RII2I7vYwRrqIdH5BPzQQOC49fj2oa/njNgXeoXPbFhXpZs7D9h2scpAyMGFORb9nqvchxzP5
	S4wyMkIBisBb1ZDq+gjknW9BSvT0VI0NYZc6aGa2FieHIwrAsCFDE8hsjBXZ6srTxLw==
X-Gm-Gg: AYBFou3jPgKToRdKavEA8I3+zBr62hbgtSeNdrdrGxx9adcsN1srxdvLmBKhCSnny5m
	yVz0Xg/GfjBRZ12XN8spnuP3DJ8Leuh8pKf3Orf9bBcSAM120On8pGRg+vLsdPiCwMOTq+k3/GX
	HndHBVEczGln5HZgLCfsGUx4Cjm5jAtBS/QYXpZdV4OK9fg0cZWFtgQuBMUnrv60AyUVfeoOYLd
	obr91NNFwgTV6DwSyz8ys1pzfIoDSm9p4CFSPTdSyqnzKNi5UTKTJIDHv1WZL/0kPFrVJDzlfr6
	bSKVNksJn4u4zvaWRWdWjhmTkX9qtMD15hliPqI8s38pnM/wzVlwOmG3qyFtJhpii7GVyPhfkRl
	u+GHVzIV1H4qHJTUsnDLpmj65237b19e4TtmYrAtB9GjjqMgP6YbnXv1yhmesYc8dDa5yxR0gs/
	AR+o3k
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176096eec.29.1794558043277;
        Fri, 13 Nov 2026 00:20:43 -0800 (PST)
X-Received: by 2002:a05:7300:5994:b0:37a:1be1:e70a with SMTP id 5a478bee46e88-37a1be1e7ecmr176086eec.29.1794558042788;
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
Received: from hu-nihalkum-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955822d58sm4971713eec.10.2026.11.13.00.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:20:42 -0800 (PST)
From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Subject: [PATCH v2 0/2] media: qcom: camss: Fix Glymur CSIPHY topology
Date: Fri, 13 Nov 2026 13:50:21 +0530
Message-Id: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com>
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
X-B4-Tracking: v=1; b=H4sIAEXI9moC/22OywqDMBBFf0Vm3YiJ1teq/1GkxDw00JiaUamI/
 96o224GzjD3zN0AlTcKoY428GoxaNwQgN0iED0fOkWMDAwsYTmlCSPde7WzfwluEQkVukx1xrO
 s0BAiH6+0+Z66Z3OxV+McrNO1hJajIsJZa6Y6yuW9ZLIoNZcVHPe9wcn59Wyz0DPw//FCSUK0a
 HNaaVGktHo4xHic+ftwx2FAs+/7Dy6mUtffAAAA
X-Change-ID: 20261102-glymur_camss-1cf83f4a447f
To: Bryan O'Donoghue <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794558038; l=1301;
 i=nihal.gupta@oss.qualcomm.com; s=20260608; h=from:subject:message-id;
 bh=ZIVdnv/pVYDJ6VtZ6cVcvJh54NuXewcKEXwu1xtFH1Q=;
 b=ezUhCnPza1MWnKyzNnbcZxiMALh33SYPFT4aqKXPshbyjjRg7x3Nwlbcpd0iqNPft+UqOp1Qu
 2ckjaTSNqZSC32kw7mcM1REEM1GIN3Bi489FpmLStDFe8xQYpoJR9BY
X-Developer-Key: i=nihal.gupta@oss.qualcomm.com; a=ed25519;
 pk=DIbyFMNwqU/iMvU/0pCQp2wmRVgtHFBT3PcSu+A+Ncw=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX2/SPcV7I6eam
 jcjFrET6WV02/NBzC2N/6kR/zsWWDN+Bs5lDWisOnbg3Zhj5kzhgrhSLHjnZnLcKr1Ym9dgWU8P
 GW0PJbPzLwvxOU5fejGmGJnFr7mSePc=
X-Proofpoint-ORIG-GUID: JjTilmwNmjfrEPBwHZWLjwimpjpUDUrt
X-Proofpoint-GUID: JjTilmwNmjfrEPBwHZWLjwimpjpUDUrt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzMyBTYWx0ZWRfX7meNuahESlhF
 zkAqP2XqTRtFMlLhBV4SJ6i/uoY2KVNfEQ2gnVNE54F/tCtZ3Ajbc6faZdwk+6gc78dwi4e3pe5
 AFIyqQE05ZKq3G1eqyJbnfBDSgg2g9WudarVV38fF5ZHRs8EEAjlb2QsL9hasQ13wkgrDeckc0e
 IDUjfNCBkPiacmVwFC2Y4MaDHeLUsAKIh5dWQEwhnb+40YnC/WgEY1IJ4LtR73GVCbamRWzbEQZ
 m/DF+koKEn/+e6/xamipkvjsdLsAFwnzn/zIDm76ZinyVQV5pBJAoKnjzZE6x+axAf0OyhNLUh2
 eekENXfk2+YwzjlOM9oevq2otLYiJt273V8JHlwsIk+6UyzXrU9fhhYNCEgmWjbEoBcf9eGsdC2
 nIiDAc07mAzbzkd/DggAPjfiUrLCl445vJiRe5DYYJ6/OOQegMaNHqNyozzscO+eWIqOASjQ0Xw
 FOWQorX/SNthApVDU7Q==
X-Authority-Analysis: v=2.4 cv=ZeeIpcVA c=1 sm=1 tr=0 ts=6af6c85c cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=ffzozp4-zBr36aKF_PUA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_02,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 malwarescore=0
 phishscore=0 impostorscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611130033

Glymur reuses the X1E80100 CAMSS block resources, but has only three
CSI2 PHYs instead of four.

Update the binding to describe three logical CAMSS input ports, and add
Glymur-specific CSIPHY resources for the PHYs present on Glymur while
continuing to reuse the common X1E80100 CAMSS resources.

The Glymur DTS is still under review, so this updates the schema and
example before the old port@3 example is used.

Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
---
Changes in v2:
- Rebase on next-20261112
- Use logical CAMSS ports 0-2 in the Glymur binding example - Krzysztof
- Add Glymur-specific CSIPHY resources for the three available PHYs.
- Link to v1: https://lore.kernel.org/r/20261102-glymur_camss-v1-0-fcb619fc7319@oss.qualcomm.com

---
Nihal Kumar Gupta (2):
      dt-bindings: media: qcom,glymur-camss: Drop port@3
      media: qcom: camss: Add Glymur-specific resources

 .../bindings/media/qcom,glymur-camss.yaml          |  6 ++--
 drivers/media/platform/qcom/camss/camss.c          | 42 +++++++++++++++++++++-
 2 files changed, 44 insertions(+), 4 deletions(-)
---
base-commit: 6d582d78fad9d828e575ca0cdcff8ea47a77220b
change-id: 20261102-glymur_camss-1cf83f4a447f

Best regards,
-- 
Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

