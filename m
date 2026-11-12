Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794487077;
	b=2tFwJx0H9cd2VqDRttVrtj5Vdhp7A6NCdwHkjqDgG0TfQ6LjqSFQfXpMdBwC7MwKTlBn
	 T70xuxv/GeX1TfO1ytFZWz5rL0FcNyvxuVOt3dqAh4gVEocYdc4lDHeeqSw9t6/YxLzaB
	 hAt/k3e7zJSOiYV6Efw/Wec9J+YiupXCJ08SWHVPIrvxMves0HW0XLUCDC85hNptnNBah
	 htUn5GBegAS+NxKIE+eKM1j5+b0gqLIyx4q9Axmv3W5YFY+2rnk0lXs7Khfc8Q2ddPkuQ
	 M3tYplnZk2DoyVfT/FyfjvRC/zKMzDxjVHM7v1Bzbh/9mpTpF5KRj9ww0sr1fxId5uQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794487077;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:To:Cc:Subject:Date:Message-Id:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
	b=Hj26f1WXiFYghTkR4MLK+7OM9/GKk4wioyNaLOe8EqvgrATYCH1QE0evM5LeSeUFfVD8
	 9T8IhdutGtC+szGWYAF+J2hn1MSpAOhE69aUssxHhlosqWurVwGr8qWB2TH3zemNssdK4
	 pS3cVoqUEZlgwrJBtV73t0y4RwjIz0Rh4sAQfO2AediGwq95T1evxLffahYXEZHvKODFO
	 8/y9pmz0u2y7vQpaDLjwdsh0HeT7c9g0nqS7VOwFirD+LhBkGx7S4qOfgj08JsVwIrZOx
	 Yvg8yVEh7enNgNr+qKV7Syt/SLcuv2538t+0sBmiaB2dD3lPr0dntrvzdIyAf4hAe1A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E92CD606A32A
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E92CD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ZPpIsLyF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=EshcJ5Lx
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9E2IG480282
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:37:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=klQOpf+HavR
	xRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=; b=ZPpIsLyFlzvsrJvB0C/y4EP13Vv
	jgneVLSaabLJyzCH6rNkJlgm9eGncJsFY/RtZPkhNuEQWua/wJgwpZpfiTVLJ7x5
	9pjcIixWQbc4MMQ+wZG8xuYgp6L8V66mAynaToTuGARCLDgK7xQGGykq121oxzpj
	eDapA4FOLK3XpAQKU9FGw6Bebwdg4k0ei+MrnneuzAMeZKExWgaST6rt75xW9cW3
	0C90NbS//4FVlF9/1d7Q8IX1z8dO/RqVmZZQ+ARkeYcx9ywGKvzBZX9ApN/nn3lg
	WIYIzrUaqDXsx4Wxn78PRy2+TK4LiGMF9W0ZVNshJ8LhlhcOvjuKbCIw3bA==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwan4rnsk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 12:37:55 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-943e8ff02d0so477030585a.2
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 04:37:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794487075; x=1795091875; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=EshcJ5LxyFizzXWgeXmVqSGNlO1yogXHmur2ZJtqg+0v0mK43qYlPSDs/xN8CKisqI
         628fwRrXPo4IqdrVtkvThDf1tg0joDG7F7FhUiCX3p0NgjmT5AzGIVHKYUVrzrO1LxTA
         3ZJD2xUsNhEt1XyTmZ8r3QAKdx7GAsu/Yuipkqlmxyl6+BstYGlTqTIhmcYk2eMsHFze
         //JLHzZSLFAhlVAdd0Oq1O/Ny0h/FKf+idnBkQycXisbG6NSPyQpLXYEMpXSNOmiqpfl
         HYqEBgVwqv/DcGt9MYzZm7iZEmgTu80+ath5+9du6A/+wFyUoTGAS22nm48g/cmXqez5
         AOHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794487075; x=1795091875;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=klQOpf+HavRxRFNlSNefqEWhR0JJ4OucrEz4ZjfbFU8=;
        b=uyht3kI1jC/fGdxb/VGvZqcSzJpK8brN1wcgxSFlEQWb4P9fzaYySFddv+m7eXfMWy
         Y/ULAgWVVTKBLZBzxgV+rY68YfVNPhOL3+G7L25kLF9iNGXmNdIYF3z479kQkFq3iRHQ
         NTJOLnNSB6trBjuvtcwgaFaYndZo76BmR7LWJoIoj+zqAO33mYKtfv3TYY7oAGhWxwC4
         lCYVQpEcR7T/k1M9hr0NT/3jql3/+T5IbBcePnzdzrbSCvcX/PkBrMkYvZwjev2IicU6
         jerEWTFsC1m9A7EHG4uCwzy+nemYHdIZRvEWkakJBvMs2daXqX47+jp2gN6ugIM9f37e
         ngMA==
X-Gm-Message-State: APuU4Z//huOIqTeBwM2rSv/RXQQdX4Q7PA7cMAkZpxHTsyYehbYjseBa
	gzTOCHt1wfMfAcIQ6EIX5wQepBj8zHubbTLuW4/rS/RlFjUy3pcKf90HkwoiQvn964P7fYy/drO
	p4f7TgKVoY7TyrZugdjOSsHxKjALYA9SxI62XSrNK/ULa7QKjEbEKxJH/095NPw/ybQ==
X-Gm-Gg: AYBFou26JKmTD33DYjHxq32uOj7CZgM3ix/I/AEbCKl0FU/BaaMuvffXwrnLYdegB24
	0s5CRegyWqGM/k+oISsoajO1lCkxk3UoZcrqphKgPhoQ7DUJ+k1cgIm9p7OUqAPmvIB5kKTiXp4
	p2uG37eS9lmCJ5XgsJM5SHOLxMgXZHBLQXfbpq2bFf2WGOU1ijg4kn3kmH5mIgKrbAnX6No212J
	E55M6b2QJgPDDo/uvc6eVQnL9/mwB5Ln6bIpV4FHpf5VGeTKiu+cBuX4/xGJ3fx7TWum/1re7SO
	FqNaHN19pwJFRoVojkG0kQYgyyYw2ahg5t51/vU0Wh82InyZCjGjMpfw8rpkmTIHMmf1CqlEQFG
	YINh+MK6Cax5Mx7HdUe6LZQXuCLnmzDslgZPsfJFoJXlq+HXwTN60n1l5EHXV1+le/TrrWbo73w
	==
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875239985a.40.1794487075194;
        Thu, 12 Nov 2026 04:37:55 -0800 (PST)
X-Received: by 2002:a05:620a:2b8e:b0:93a:2221:5460 with SMTP id af79cd13be357-947affc0f5emr875237285a.40.1794487074769;
        Thu, 12 Nov 2026 04:37:54 -0800 (PST)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a59437fsm331534766b.38.2026.11.12.04.37.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 04:37:53 -0800 (PST)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-media@vger.kernel.org, bod@kernel.org, mchehab@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        andersson@kernel.org, konradybcio@kernel.org, loic.poulain@linaro.org,
        dmitry.baryshkov@oss.qualcomm.com,
        gjorgji.rosikopulos@oss.qualcomm.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        atanas.filipov@oss.qualcomm.com
Subject: Re: [PATCH v8 1/8] dt-bindings: media: qcom: Add JPEG encoder binding
Date: Thu, 12 Nov 2026 14:37:52 +0200
Message-Id: <20261112123752.711726-1-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261112-benevolent-discreet-warthog-1dbf04@quoll>
References: <20261110163909.78085-1-atanas.filipov@oss.qualcomm.com> <20261110163909.78085-2-atanas.filipov@oss.qualcomm.com> <20261112-benevolent-discreet-warthog-1dbf04@quoll>
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
X-Proofpoint-GUID: 7bTdTyPQgEYb7n0uwPjzkg25cGs50edE
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfXxEC1679F7thn
 PnhADrDmDkjNuPaBotbhIjvHRNex7nOib772qF6NI6I0aQDKOZqdFJzxzD/pc2OcHcFagqYP27D
 mXinie6b1/ied7R2YSILEJU+Fg8T2H0=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1MCBTYWx0ZWRfXwcD5B9wnKZdq
 TXqS8i/66ksG/qJxnXjnhcjwBn9pbxp8Gg3idtcpC1O5OXIRtaNwFDXaWmhwcHKs2a2Z1umwnS8
 zUtb1iosRDvjiPGTYOqgObzwO5pKyjR/CCQU3gQhxQjmedMzgdBLs5e/wlpkQWJAhGWqDC8sx6X
 6/feESI5XSNc+Hh1VGYkGh8/n0f2bDocZygpsWF7I6wnMPdhQuiHLFSGq7+dNXWIGf7sIf/WVa3
 HL9cXE6dVaMDD1T2KHqviu3JlrPcVzUxNSmTO96jwZrvCB6/WUxd9ew7bSoMluSCyvZUKPELlJ1
 ew6Yw1wdzZzfFwEV7GZ5zUCAEiNlxjqNSiblP6Y03kUB9mA6Qn/LdN/YkDSrXsjTye2DrwK+w5o
 pQ/Xj1JxKfo509t61yywpJQW7+KNxJhRi7IkQWdhUWEAlfPfrkk3F90Pe5FSbwDwjvVl3wOzrMl
 4M/MPodsVmZvNK9y1Qw==
X-Proofpoint-ORIG-GUID: 7bTdTyPQgEYb7n0uwPjzkg25cGs50edE
X-Authority-Analysis: v=2.4 cv=Gd+CDgXL c=1 sm=1 tr=0 ts=6af5b323 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=bWJBzm-gYxnYfWmHbWgA:9
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 clxscore=1015
 malwarescore=0 phishscore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611120050

On Thu, Nov 12, 2026 at 11:02:13AM +0100, Krzysztof Kozlowski wrote:
> > +    then:
> > +      properties:
> > +        power-domains:
> > +          items:
> > +            - description: Titan top GDSC
> > +            - description: MX power domain
> > +            - description: MMCX power domain
>
> CX and MMCX are the same inputs, right? Then make MMCX second, unify the
> list at the top-level with minItems and here you only narrow
> min/maxItems.

Ok. In the next version there is one list at the top level: titan_top,
mx, cx, with minItems: 2. The per-SoC blocks only set minItems or
maxItems.

--
Best regards,
Atanas
