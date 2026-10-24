Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792830008;
	b=GA9IY0fYdjpO83/b9fvuD6YedxsuBCM8mYYoEfW93uUoIYP0uQILDtt2hlR9RQfIJHvS
	 pTt3NHJ286YbXnU2WybE9f7lLsFzJRNynztNlrV/YfPTkMqI2zjW3wfX1rzWbHu/WDWD0
	 YLuXPNI2VK7PyeSgsQ1xEVyURuASj7SZ+WlYjNlLXD4H0+fmimNBNQFePG6mmce36rgGA
	 eOX/2ia0iBgzkuoTjUk1XdLGfgSObwneYHe6UWlIYMa2kdN+SvTV50vqjqlIFBICE/Nke
	 q1570hZr5pplBN2V4OXkFJ0+WyPNuo46fnsNm2w2ZYOl6xPT9E0dBwiqDZjK8v175hg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792830008;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
	b=u8rN82UORR62aYYMrN99tsEtC0uQbyJwceWjEjf4ypfJjUmXxKIIGOniNoJDJSan2DTa
	 1eKDtJhiO8LohnL6sqh66UDXfqviUcBdAf2deh2XoX6Y8KZPX9ciJkJdEIfjBzMRK2Uk3
	 IsUW26zetnUnlTmoYX5NXL23ncgEgx2ygafl1lMAWLbI9bH/i++Vc41TbCa27lF7WaYbA
	 vwulu8JV+JzIL8s30NyG39PD/jRzClc9Z0biNzycd30+OKJ9cplcbzZ0pogngFlFQ4r8c
	 z2ZKa2K3ozyCWqq6FBV/xGd1ljuULAmXeAlbLyq+217Ke7uIBoQQeGpSHj86L9ClHdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="N/hwZ8Oz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D85AC606A31E
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D85AC606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=N/hwZ8Oz;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WZbQC5xd
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69O2XnUH060467
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=qcppdkim1; bh=GiqvpLecSe4
	b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=; b=N/hwZ8OzMHsSn6NShlRIQTvDMvK
	IZA8h0NGwW5OnPLl60vnRZzQGx65lBVFHtk74eB7yIeciULp11VLOl7PAijBnOXd
	KLH/sENCFYdlNeqxWy5DI+fOlooWeqn1ekHwyT3teSyaUtxjwCPRNVnyX0cetBdo
	HAqOZOK5ZzLGkAZZAucrQnbPeDw5txoNkZWaBZaHMWpqF+eUyPKUOYgL6juHnqp1
	4u/SyKUw3CaL2kJ2R0UAhZzfqEJCSi5qwbwgsP0ub5Gl9arKpH0Ea0U6R63fYvCc
	o4zhYQS8G8NijfdnV4dB1HSaU4S1/YTn6oUrh9UupkK7BePSeO2yBrhPTiw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hgm0ggm59-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 08:20:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5337f26ee19so1203301cf.2
        for <linux-media@vger.kernel.org>; Sat, 24 Oct 2026 01:20:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792830006; x=1793434806; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=WZbQC5xdDBrWar6d0nGaSxEK6YzwzBTmmNnS0mQ+QSm7FWBGWxgOViHD6BZBfLM+RJ
         lFKiQ4P/2ONshM9U2+j85yUrzDhMgv49SOxN89sLwjDdcMYxJ45REhxMQO+MuJ5ZuLWE
         29zwbV/QPGUf/S0K9uDq05RNTrtUrDDRSJRUyPDlHHpJARRwOCE2GgP7pBAHLWmUrVgm
         HaTL2H1UbC2dmX+b3WiWpN7fT82tRN/zuMFMT97/Rjuo7Xnpx8IMVgTxcxVXOHTAiTYk
         Q4mSnH8vXwmDcoUL/Qu1U9+MbwieQCF+oSS/Y3JMSjJc7Nl9o7LpOUj144wQQHEjlLkU
         DBZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792830006; x=1793434806;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=GiqvpLecSe4b5b1P6D4a/gHwKLcxVWShjE7SHphQJfw=;
        b=vGjFut2iS6RG5QHmsb3sfGbQ/4OeZkM7YG+zF+vUs1sC+8czOB/Bebaokxts+bA7Cc
         /AETrA7hCpr9ve92CsSL7EoArxiRSsy8/iTiJiApf8VsH+fqKq0GonU4OMHcmYgpVuYx
         M2XhgkbIblBCW+uEVyEEmi2AVnoT6QB+Yy51AWotKsktw0G8qt/vQ8f1wmajOTx4Y2Of
         5gJzJUnBSnl79xVGbGb1J+r/FN0wTCwpr/hoHz7PBSCye2fllXuJy32k2OAQK8ZlaS64
         CJ27S6pTVDyF8VCT14YV1XZ3MPxODgNKWjTLgdNjfnAmgGNuTfcdQKWbCUjbDS7oljgN
         04Ng==
X-Forwarded-Encrypted: i=1; AKwUvByzoqSaQGhDtI2Ab8hVcr2IcDpSyvvEx/TdRLqRdoeuO22Bp20I4DOAofA/KEnpDggNYf6dhfqTOnzPDA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIU3Qsyn5nz6ATLmNHA6pSBklxKdP63sQkN46Tr6Lw43Rn+XpKH
	MdQ3AzGcE05mjgUqolIICvs4wPTAR1UXmeba7xDkeIyJJTPS9wR6+6WRYccnKxIRYQWbCKojW8C
	nb1S1ARjlJ3J9vCc3enYysjPBza5jghXF3h5UZnbMtvPjy7ZBPpFL9GhxBeqIRQdJlQ==
X-Gm-Gg: AYBFou17KjdT19ygttopo6YhJaLAKhZwB2F7OhDDV9+2EPK+B1BF3HC3xKdp9JUu34B
	drIbaLb8PhT8zHFDknFTt/l+yFciUgNtPQMTHmAt9c+HRq6fgrgdLWxhl2hf4JTaX/m8V3LDcu3
	byotllv2bnywMkoWfRX2R3/iKNlqogzXuXN0v/5BxHcEovqeNyiaU7cS0Tdb/9ghKha7DaBhrS4
	OiNvx/WE+0BSd2r3iZ1jJjXHjF81Khy7EnfUGrDAp/Hr/vB+PT6Jy5LnWxJo0Ie0no4kBKJS+6U
	LDq3AGYpWmncdwZqj2i6mbly51qJaMuPFUCqYG7/U9Ya4KLGOaUdbT8TYVSJxx1n/ObwOPqLfhd
	4mUWEGGqRReuY87LWJGMKKCvx
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964941cf.0.1792830006152;
        Sat, 24 Oct 2026 01:20:06 -0700 (PDT)
X-Received: by 2002:a05:622a:5e89:b0:533:9753:4e03 with SMTP id d75a77b69052e-5383af10a20mr15964801cf.0.1792830005767;
        Sat, 24 Oct 2026 01:20:05 -0700 (PDT)
Received: from lin-0772.qualcomm.com ([212.136.9.4])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a35a573f65sm38496385e9.10.2026.10.24.01.20.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 24 Oct 2026 01:20:04 -0700 (PDT)
From: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: atanas.filipov@oss.qualcomm.com,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/4] media: qcom: camss: share VFE clock sources by the highest rate
Date: Sat, 24 Oct 2026 11:19:59 +0300
Message-Id: <20261024081959.2887288-3-atanas.filipov@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-4-atanas.filipov@oss.qualcomm.com> <4a88a2ab-0020-41d1-8924-bba8ac42f429@linaro.org>
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
X-Proofpoint-ORIG-GUID: 93kCGrPZJRvYgHf9CJWXGaTmR6Soz7nV
X-Authority-Analysis: v=2.4 cv=UfTE26SN c=1 sm=1 tr=0 ts=6adc6a36 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=7PVpw9Zm12totNsPFDYA:9
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-GUID: 93kCGrPZJRvYgHf9CJWXGaTmR6Soz7nV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXwSMnfOevXsYy
 YhkbdIpp/+aO52SySYLjfU4AGk7lpGa7U1AcdJl+6MzMR6fcwBIRFFjXsH/ZLqrmecN/bd8+Gd4
 AI32drqFUoDcalUDA6KgXAErsNyXJmUP+RJCiM9AZPXbTAs3MenNiP50yQonKTb1VlRfQUG5NuN
 6YSXNibg14MU0kbU3kzBFYL1LGsc5CLkYx+w/L4mYp4GiLYjjt8PRsMBs95PQRHDMOQC11+8xqg
 0bElDNxraaNvSIYTgOQ+bEFgq1ZHPTF406dDtOY9m607CY+1u9QidqeUn9WsT/qaASEjxamLh4B
 qs9AXjbZbrh8lYDYMCudoaUMMxVVy0uQhwMLzaeir9H2ffw+UDcG6rQVwtycnbDxsluFj2fAnwi
 4fsksHW+2jM+FPAnnsOX2/2TJJoO4782Ig2qK2OPqKFHmh+0obmhsGAHDHGtL8tVdvuxsgzxJ7y
 PlTgeqvhJJIYkuPxPnQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI0MDAzMyBTYWx0ZWRfXz5ATLdsbhZjv
 wddPQhtHfkaV8jNMTkcl+B5HpXb5bpa6VxkWhAb7ze8jwQ4/byesre8TOXcSH+cF9AjPopcGU0Y
 xlcI1LkA/vleLn/eqqUEllUdp//UITc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-24_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 malwarescore=0 spamscore=0 bulkscore=0
 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610240033

On 23/10/2026 22:41, Bryan O'Donoghue wrote:
> You're simultaneously adding a new clock to an existing list and
> introducing a behaviour change at the same time.
>
> Those two things should be split on principle.

Agreed, I will split it in v2. The grouping goes first, then a
separate patch lets the VFE set the AREG clock rate. In that order the
two VFEs never set the shared fast AHB source without the grouping in
place.

> It seems to me as a read this that the above text is the abstract
> description of at least one patch - which should have examples in the
> commit log, to make it less abstract.

Will do. For example, on SM8250 the two VFE Lite share one core clock
source, which the VFE sets to 400 or 480 MHz from the pixel rate:

  - VFE Lite 0 streams the CSID test pattern and sets the source to
    480 MHz.
  - VFE Lite 1 then starts an imx577 stream, needs only 400 MHz, and
    sets the shared source to 400 MHz under the running VFE Lite 0.

With the grouping the source stays at 480 MHz until VFE Lite 0 stops,
and then drops to the 400 MHz still requested by VFE Lite 1. Once the
VFE also sets the AREG clock rate, the same applies to the fast AHB
source shared by the AREG clocks of VFE0 and VFE1.

> What do you mean by user here, its not clear to me. Another engine ? I
> think so - you mean the JPEG has a dependency on the clocks listed in
> CAMSS ?

No, JPEG is not involved. A user is a VFE clock fed by the shared
source, so the users of the fast AHB source are the AREG clocks of
VFE0 and VFE1, both inside CAMSS. The grouping only covers the VFEs,
which is why the cover letter says that drivers outside CAMSS are not
covered.

I can rename it in v2 if a different name reads better.

> I thought we decided for full separation of JPEG and CAMSS/IFE ?

Yes, and this series keeps that: it only touches CAMSS.

Regards,
Atanas
