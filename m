Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793020728;
	b=H1/WeCJvunuPt9m5hJ47VoIQaLzwPjbxqsPtrdbyxB4s3rQvMUqDXfAS4fF7hBiDI7Jg
	 hwT+1J2ZyK1XvAxkg5XCHuSKeVUKBrsqWEyIHe+pse9i2nxqgfSfiIqNrbY8J+uQ74g56
	 JbO6k/W2ZvM79Xfz0mB9yTDKOl77SWzCK8n+uH9Ru76PZPA2skzcusoikl9mLZw/WF8TC
	 VXLVeSFZEPXwgAKR5xkUGgYG5Imw/Y/+m6JsyyByWlYT700miQoL9W6JmvCK6WBftVMdS
	 T5jHRKhWyDm0IcHEyI/wQXWS5yj7+EdMoSz/LkK4IEPWZvLymbupUjk+sMJN8IvZlqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793020728;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
	b=OnoLJXAQXkcSGGCjckdGHkymZZ7GIesFYDoDxekAvioGFUpJqsyz9K4N5kDO1bTirYTz
	 0ABke12GSC2O/laG94W+7gKpa89Pk3esf6xHRYV5dUY/ZHySkiw6owyAPiMGd7D5SNgjY
	 rJtY2c8rmZwu1DLpdwzw2oc0dswG5Y/H/vqH2cN/GoPFXLche/ae3uNPZEiw5AJNdDOsm
	 ERJcS6oip26+xOMwuXXHwENSFako2024jWFU7wp9PGanVAXlTDtnNTUOnfzoaJsXW2L2u
	 lFzzr3XErflhFdSlcSx0pIvHqxL7t38gf6eGprza82xtSmmQ9GPl/wd7heCZyCA+RFA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="DZ/egG/G";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C83D60A2608
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C83D60A2608
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DZ/egG/G;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TZsPBHXn
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69QAt7214126432
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=O6hrhU2TB9r
	VsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=; b=DZ/egG/GK+Mov6W6DChHfL9rtzr
	4vPzJgp9SN531V4cFO7s+I2kIkT+D5itugKjsdAbwwzIV3W2Q8WKiF5MrgX78sOI
	lAgHBXFIxW3R90xJl86q31M7DJhnHdvYNvGiHx0ee9WI7JbJX+a7LZkkgEjDOZno
	aiPRcqstWQhK7FyjCnAoeV60BDrFzoIn1Pbl1tl+fG2PYBwfJPZuuSNX9uvYEdOp
	bz2Gz2+WF80ZtM6T0SVW3QFqTlyKZMv9p5TTzxwHG+oHFEZtKpajKKJxYJHWDm4y
	kjpY7f/KbuNv3pIUmCxHsSNVqx4c8gEw1iqsyHRgM19m6NKlV9c0TNXsSGQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpthum-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 13:18:41 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93ca9b53afaso478349985a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 06:18:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793020721; x=1793625521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=TZsPBHXnXbzTwyrObCcMtxPdmqbKCDkN0mUZOwKBdOGTzorFBid62dueC8X+5dhKHV
         KCiX88tMM0nRRgfpWDzxlymN6yjjJYpF27y4esg00WI3y33nlA5h/O6pIqAqKnT/Jhly
         jnNaNlkd/SQv7bq+cXeIyJrjjT7SQ/1BgsDQYsRk8fKzPHN2BQA8AYflwgMuqNMf69SD
         SFLeIOrV2B4Slvj+1qpFE4v65JX3rkWG/MyBsjX7vm7aT516Tovs5yOnNA9Qez3Gvkut
         9Hj0nF/4HrrlopDNkajVvIAqOm/iVgtvRaRmI8AgjZL/HzkkVnmTSgBnzqw5Z0T6a8Z+
         Ah5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793020721; x=1793625521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=O6hrhU2TB9rVsLWQYqcoCNb31D6Hz/SkB2tIxRfJ18s=;
        b=xmbdL8fE33+9YbaQg1qgU+dWyicagV+mIXkewOnQnYMq26drPhzB7+5IzouTG19d2U
         0BdnB4T6a15slhkbWHCcc+JP1mPAWHXZNFi6XDKjgr1VtA1sOrBuEOtBaB6j6PR8zxNR
         jzJTcKbtb+dKqSgQZbZ8a4sr1/eb7rVSJqs6uNdSyaiT8mnltc2yfstPh9JrWlWLc7le
         uSSa3rBSnLxaiY5FbJcO7p7GMdcnGml8A6To8RO+YzEuTa/eBxyLuthtCDfO1KFarcfn
         +MZK5gHWq1mMPDS/9D+2dJqRw5DKvwvLOCjkBNgmiOomYOlkc1JGZdESZbp2epEpV8Ou
         7ozw==
X-Forwarded-Encrypted: i=1; AKwUvBzbpPJDwp1mqrKvlDYN3K0R6gh5cYrXNUZvF3WMYZOB1CfeGhfERa0m2N/oDuqjrX5VjPBHCcvFZBnaJA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLQkmzjIIhqxxxTiWeSHILLVnz2zMSKRNZImfuFS1lpBs5jfmGD
	e5FUC3PwEPulCIQGSQlMHshit6iSGWvEJ3/IyyBwzOb8oUurT4tASDDYF75hS0V2dTOFG3x7ALv
	K9lgrsMKI4dbiYl/insnuDwd0fbDSET7XzT7okpg/GKo6f1C/XOO1Yi+l6B2u8ToxhA==
X-Gm-Gg: AYBFou31oto3amS+AXX4xNlB5XS/kREK81hR9t5qalj79MJbJFYP+Hj/E4uwFzCVOBp
	ICv9lgMd1OqbndxJixutqPDFduXJLro+9YkFisC6LNN4K/yhINnQP+YmKArRDANvnZ6q4KD/iiE
	zjZrHXowNKrUosSOjt7p/4eWBQPXvaSKyD3r6hwvidZOAWJKnbwS01gt+g/NBeC1Kc9WVRYz0sg
	rcEYsbSr0j/w0qhqy+GnJ8v4XIZ4e7AbyC1qIFTuj58n7apsHXJxqcS+ymbMCGGcOTaTBvUbSXA
	vKE9dZZ5jExz5zJITJTsd1JME8gbEfWBUHW9TWw4LLFGggFX6+TlymRJ4zdpotuuSbJdhSXKfG1
	KikvwbhGGz6gCzKhqRVLFcELx
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013162885a.19.1793020720917;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
X-Received: by 2002:a05:620a:4589:b0:93e:5060:f929 with SMTP id af79cd13be357-940ef8ad22emr1013155285a.19.1793020720353;
        Mon, 26 Oct 2026 06:18:40 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a033702sm158170775e9.2.2026.10.26.06.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:18:39 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 5/6] media: qcom: camss: sm8250: set the VFE AREG clock rate from the VFE
Date: Mon, 26 Oct 2026 15:18:33 +0200
Message-Id: <20261026131834.3247963-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-6-atanas.filipov@oss.qualcomm.com> <f8173d20-3193-45e6-bf27-a05de7187ae7@kernel.org>
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
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfXwP19PJhjS2Xw
 9JTTfH4fi+iS8wvtOzcANS9MyEu1giDOoPETk+WzbcwZwJqsW+M1YjGm7Jkhc/Qg6cK0VDyN1RS
 VGqXuIr2rJpXuwwJeX4JrbaTABr/wWU=
X-Proofpoint-GUID: o48cgE_lyCHvMTF0oD20n6GOLtYYZywA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA1MiBTYWx0ZWRfX0c8YRyIY2n0M
 PlW3LBBCAPeW4QWZ9L6qCbRN18Z1z+FpuYYbwY7CHD+SotDGe2syETdK3NKaLBIH2lpCxSMBBoy
 7xK7pLWsy/pYWdu0oVsIHiZTxnez5sNdUV/F0+6YxwfV0o+8Z7G/l9rhsZdHgh5jAJLnGFMo3lc
 CoF/53TAI1b15IZN5XJqHaUGu5MtDzlDi8jibiLMfeADJbNozyWBUtbhO9zm3OH/SHAWcKwbcFi
 naKlC39AwWa7ND9Xyt95WuEizA60CiOKG0BWLHC24yfKXCs+EWm39K2xPi5szmMtQ0Q8u6pclGG
 Bf8QbQQZQxxPMW8Fw3X0KrMmnRw0/YFCwwS8OH+W3oWh4gIf+jjUbEBt1SQg3Enzi6obWu9YBAl
 5wMzDXizJQiQRVbiplmSN8eMcKyGagUSTRwSFxrXuEZPFO1FFYPyWIOTOysq1FopgYuhb59GmxO
 QC2tqnFK0udPjAFnizA==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf5331 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=wnPfnd104F1z6JJcfBcA:9
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: o48cgE_lyCHvMTF0oD20n6GOLtYYZywA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260052

On 26/10/2026 09:22, Bryan O'Donoghue wrote:
> Why is 100MHz a problem and if it is, why not just fix to 400MHz ?

100 MHz is not a problem by itself, and I see no failure from it.

With the rate ranges from 4/6, VFE0 at the CSID test pattern sets the
fast AHB source to 400 MHz; starting a sensor stream on VFE1 then sets
it to 100 MHz under the running VFE0, as the two AREG clocks are
separate clocks and their floors are not aggregated. All frames are
still captured.

v3 will list a single 400 MHz rate for the VFE AREG clocks, so neither
VFE lowers the source under the other.

Regards,
Atanas
