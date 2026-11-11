Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794411620;
	b=Z6CT9w1ItvLOAcN5Mq19ggglj+6cdTkgKJg71oloPt+g7rqGq/HHCVSESeXH/i7NHDC/
	 kXmFxKsLZfaevhc1lmVKXA76zE/VbXhnk4tPtY40XgMPSySyJLWg17gXJ5Ghllikg4QPn
	 +6aFoSXZCBfpPUyPewP4yAfD8+yx7xdyWgtDNp0+41QhbbocZPiVzUkdP5H7fL2a2822f
	 zfbZBTzfK+vGk5kzZeDKxPNYQeyYuyxderGD6zSNhXMsepLcNEhZU1aQnUT3xmHa/4kYn
	 j1Z33llt/FcW21lwUjQQRv+Hw+CswwpGkBFxgmeYxB3tk4vTkiy3X53pbpa9FH8s1Mw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794411620;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
	b=MRV44KHsNqPShNRXxL1NwZ945nhBJQnwb4uIg6BFG17gB4dND6qI9Nokn6JY0C83ylyP
	 PbUWfsBsLIhODlF3cZn1UAQSOa0Q7uuNs0r2d7L1LnVkBeTp8oYUUj3PeL1gQ95cYcC+Y
	 0m1yGY09qLu9nRZ9Dm1bbbFm9Z3zutyc33YWlinK86uDcbrMXk3fq/G+knMivawifZxTT
	 F2eVczr/WKx89UgIn8Aoi3fp/XxlJ6WFpv6S90V8Od6zp0MTeDov3KEHTwBNjl07deGyW
	 yARgyn2tJDJ+Nrw9+3nCtTMJmvduIpBUMV/XlUXcns/k4ZxcRRzGO7ZUVGX6u/MTEQw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D994606A330
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8D994606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=M3QwgKSx;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F6K+7eDA
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABFP5Ff014370
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=OprF36JLM5p
	8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=; b=M3QwgKSxxQJcxSGDa83MrU9chql
	7DznRsYzMHol8NytPvt3D1F2xJjmZ7dbthOA0b/J5D1EodiOHkvC0ns+JiO33T1T
	K0X8/mW6GYTCiciPkvLf9yJh4vSogWBim3GwODi6alKa11Ki6We46ssLeTFXRZbQ
	73acnyKcZNE6fPVGfRl3youG4KSxRumDeKrCNIpH4/ZgK4GE7Hc1IhSozZ/qOkdJ
	W6BHo95e5jnbpoyzkd/qx+2ZxtVCZXc4g8mFRyMYmyY1ShMMCTR63hokMnRaUZ8I
	ry39PhoMrxAMgMeaQN3W1WenZC5Lho3ZexgSJFvWTYn2LyqR/cvuYBmwERQ==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com [209.85.217.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvtymr32b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 15:40:18 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id ada2fe7eead31-7d2c61d4475so179061137.2
        for <linux-media@vger.kernel.org>; Wed, 11 Nov 2026 07:40:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794411618; x=1795016418; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=F6K+7eDABkt7UC+imlBBZ1AEA4ZfVsAuhxpuk2455MVR3z5g8rTJGGrz5TNokawhCQ
         eGEe0h58hYX1GN0mcO7tcueEZmUKgcWXfhy7WJr4W8ZN/OxHjI5lTKBzKqVClo38aziH
         I7sdhV4e14u4935XIbBad+Z7jaicPpIFUzl8GQJYKVM4xHVALHxCkWc9agQiJr2K9FIE
         QKolPWM4xdcX/06T24Dfa77cyhp7YSgl2UyTUDM5kbyGunUd6HPZyEz0U6DFJvAyDCZs
         AwYSD6ycuTIxD7Dmb/+0gMmc9on/GNiX1qa7jOw6WrNDtYwz0+27tvOd0vDsC3C73Gid
         xFFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794411618; x=1795016418;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OprF36JLM5p8Id+XvKPw4GzNwkz1XZPEfq/0vWjxfZk=;
        b=tu7Jktx5LrIENUpWrGbGAKZ9ZgVsyQKewLwGbor7O0tuCv87GoTjrDb7M4yPcVPU7k
         6D3hnwoERhjLjFyRYeA6+0PTLqkpmX2FM/cDewyiYqufoQ6bRkLy70Affuj5q1DsWcz8
         fdq1mTm6GygjFMekl6O0uxFbXqu7l/U2Z5VtH9CfabOxCBaeJn0k1ADIq6bFGUv6e+gU
         4DT8DkNEVrPRAtbvdm0ti4gg6JMk9UvCsrLmjq0H8cDxK6TS8UPRMEPGhoTiwVLwNl+Z
         kqQDGBGafpG6Wpro3udnM6kgrE0yQrVGlvwIGo2ctxHxJQZUSAWKD+kNZwsPhZwANim2
         RSMw==
X-Gm-Message-State: APuU4Z+PQ5poHfNXQAAFQJwWB/qeSOE77xZLtIbKpZWc3okmCHnkDN0r
	e738FceMZlgbS/GsLli+MIYbvSvpzjQ1DPVDgn8XWuTHCFJFczemmEbdqhJdB8booYKlGZQbGld
	2lfPRUMYjK3yQWdJChe8xO0IOu9SPEeHklTEvC68AgeYChGHjjPFfiS0YW0Y+DP5YJQ==
X-Gm-Gg: AYBFou31/qooOkwPocTTWhabvYOeoOdftpttipkUo4rOK2dLlskVr/3No2fX6dpZdi4
	F+iCDTCvIR0lnowWtUpLOeLgb8jnLMer4Z0Ib0Dtg2bRb9wtYqmmKHTzjINzz0asoHLAxti3Cij
	ey253v5EQPXhWAzghkGlLo7FvihQtXRkebp5uPNL7hdPDHnuSkYBy0SxjhzBK23sY5zpX65Ne/V
	NeOcDErtP28M1WoF8ZqFDFLlnu8fsk+0GiLi6EctnFefEKnZBg9UDL0bEqswkqFPhiYABfc0jjf
	CTr6un14TBJpsuq/+IfwsDjl7h1eE60Ky/UF9QpR2HnfIbBXC/vl7oo/BvR2IL27Lu0f1MXVsaL
	rILOqeOUy3A+1QEgNfo2z9rqcuQchoEWF8ntdIHewnXn7/tGBbFAmdC5LJO/rVfVOT5H1HaHdfw
	==
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802018137.32.1794411617751;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
X-Received: by 2002:a05:6102:5798:b0:7b3:7653:5487 with SMTP id ada2fe7eead31-7d50610a960mr802004137.32.1794411617218;
        Wed, 11 Nov 2026 07:40:17 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c5f53efsm3517355e9.13.2026.11.11.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 07:40:16 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 3/8] media: v4l2-jpeg: Add a baseline JPEG header writer
Date: Wed, 11 Nov 2026 17:40:14 +0200
Message-Id: <20261111154014.654617-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-4-atanas.filipov@oss.qualcomm.com> <qb6mqteoxdk7xb7qhgiruncdamptf7m62m3y4zrccs4cesxr4t@q3oukzsd6qyr>
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
X-Proofpoint-GUID: xeoGscMNJDpU0U8yxH6iC5KjVPdSZdLq
X-Proofpoint-ORIG-GUID: xeoGscMNJDpU0U8yxH6iC5KjVPdSZdLq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfX8ttFd3SPpQjU
 wMrpDT+IcoeT/OybeeCNoJQfbmdSDY7beUmJ5scFuBuBl3Qsi9sSlJ5ify9MpaSlAh5GJZuXazK
 KzIzpJD+ELtdo5y3js2U6J5oanr3X8a38KnG3GUDsP2jV4E5rBm6WxmvvoGg1D7jo7Zmd7fpISB
 kdiQFVyePluJ2I5T9PcQFJDCU5VYZNGX0imFJIKZzI3jaAUjk4KBdK2tFq4toNsWmouWlwviquq
 0Sd6wVZUaO7RW7mjw86UGAvEqrfHbc1GWPZ1rWAO1lgaAzGpPz7nccg94pOWwNEYkNncrjpW4Wx
 1dSFL+0/0TdaigB1EETYbTUpeNkPGIg6OgQsy7kpkQBb8n2C2ZYz95kX5Z72AXQVXeApW2oSp1D
 n/5tiiLDB4rsiwjZ1yCO/MMsGXtiTi2fJj/97rbZ+lrdlP6AZZW8PVIGqcwc4fevttko506bQ45
 sAcxeFK0IsCyIiosPBA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA2MiBTYWx0ZWRfXz8z1nMzAw8Nq
 p4vTBU5nUoU+bMsC0e7BqzgjgTZh2vSYZl8+Veg4PmvtTbAg9UlqhZhyJIzxTQfzvh54ll2pMJy
 nLFpVupAUzsiJfXELegFKub8OqERH4o=
X-Authority-Analysis: v=2.4 cv=Q4BHcI2a c=1 sm=1 tr=0 ts=6af48c62 cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=l-wiyt6Y1aSZOmScoPQA:9
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_04,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 phishscore=0
 adultscore=0 suspectscore=0 clxscore=1015 bulkscore=0 malwarescore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110062

On Wed, Nov 11, 2026 at 03:30:57PM +0200, Dmitry Baryshkov wrote:
> > +/* Writes past the end only advance pos; v4l2_jpeg_write_header() checks it */
> > +static void jpeg_put_bytes(struct jpeg_hdr_buf *b, const void *src, size_t n)
> > +{
> > +	if (b->pos + n <= b->len) {
> > +		if (src)
> > +			memcpy(b->buf + b->pos, src, n);
> > +		else
> > +			memset(b->buf + b->pos, 0, n);
> > +	}
> > +	b->pos += n;
>
> Now b->pos has advanced past the b->len. Is it expected?

Yes. Nothing is written past the end, and the final check returns
-ENOSPC. I agree it is not clear. I will use an explicit overflow flag
in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_SAMPLING_H1V1 : params->luma_sampling);
> > +		jpeg_put_u8(&b, i ? JPEG_QTABLE_CHROMA : JPEG_QTABLE_LUMA);
> > +	}
>
> I think it might be better to write explicitly:
>
> 	jpeg_put_u8(&b, 1);
> 	jpeg_put_u8(&b, params->luma_sampling);
> 	jpeg_put_u8(&b, JPEG_QTABLE_LUMA);
>
> 	if (params->num_components != JPEG_COMP_MONO) {
> 		jpeg_put_u8(&b, 2);
> 		jpeg_put_u8(&b, JPEG_SAMPLING_H1V1);
> 		jpeg_put_u8(&b, JPEG_QTABLE_CHROMA);
> 	}

Ok, I will write them explicitly in the next version.

> > +	jpeg_put_u8(&b, nc);
> > +	for (i = 0; i < nc; i++) {
> > +		jpeg_put_u8(&b, i + 1);
> > +		jpeg_put_u8(&b, i ? JPEG_TABLE_SEL_CHROMA : JPEG_TABLE_SEL_LUMA);
> > +	}
>
> The same.

Ok, the same for SOS.

--
Best regards,
Atanas
