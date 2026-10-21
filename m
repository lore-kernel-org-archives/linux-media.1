Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792593173;
	b=dodrSjy9Jff3BGs9peZ1KPoTgSSYxDNH/p1HnlGICsOS422Nidp8bf2NfsBZ2b5NLUKL
	 hV3bjVuayvtMFMLb/rBNg1rZ/UfizUQ9v88IGK3oJep0BmlRSJ3Mndc0pyHdI2dkLh8S4
	 K1WUNGJHKqTmojWxaW5EA4TgaZNQw5B28SU5pX5oKgB32kM/Aws7D2oqp2pp6ZiANKX5k
	 uBvEUptyuqx2dlNAJsQUJpckHdnCYa7EifiyGCDtuk3uj7rDtU0EcqbzdIoJXRsFue3pR
	 J83xLSErL7VT5Rz4qznNquUHAejCS0b4CiS+FbozDYRGILddmiT5NALtQ56XPOJ7NjA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792593173;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:From:Subject:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
	b=xsOd8tTRYqWz4j1QOiBgaZKaT/A7l/DX5KEqdetux58ZCH4jveyxFukEeuCFph0LvCW3
	 1N719JeJvDNiRBxUvOKW0EF520PYLR/Q6mVec5lA9Glt7BMx4CeaBN/UzpPMta4qKcHDv
	 mOMEi48ZNeaN+snU32eT7ET49DQODXwYbRBpJiuD7fn2UqXdOrVII9/4kRdOESobLQ8me
	 ICEOESTp686TWR3yckZTFAHMReDl0i3Gf00v02wOK5tDPi6IP57UMAHMTnk21jbLDEB8q
	 X66B+EGjsEjePNqM2wVLQyTIFzaxZV4qWwTWu/Oj6GDiKIKxjizvuVf1+0IcnLGqKug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoBEpexJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzUfWia4;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50862606A31D
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:32:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50862606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=OoBEpexJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=RzUfWia4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69LEFkKZ3994852
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:32:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=; b=OoBEpexJhcDUokcv
	/oJpmHQE6KvS06+mnpwKXbS/cq9oVcerGhZKgecWB+oN9lSVwSVVaV10XG1g/pKa
	P+0FZEJFZcSk9zd6oqOSNUilJpdMQKM7v1UzbINMwu5+v+/i4C5jf9YWlRy4tXny
	DOAXeCNNT8YbjhxNqTOntZoRZWNLTGx9FQB/V5gM8DQ+fvFMvlavtbBRXWF6HeeD
	SdSjwc9Sgcl8/R2wqRZfCaYCvOaAlTd3Y55fiuYQESJC08A8ahuoLJ8neleSCDLz
	J88mC7sYbgR+y6clgNM9ItDyCt5kCeuWswrDZ1eTqIrcOFvbn8h0qoTaluURL29n
	xD7+IQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hex5q8a4k-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 14:32:51 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93caa0ce0cdso108555985a.2
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:32:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792593170; x=1793197970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
        b=RzUfWia4qA7nT1HJcy/RuUX4lmo21XKKgciNyKWslx3rXmwS58A2eXQG3JfJ5tDEbi
         tcy0omQQAQqJX6MhJGf+Qptlpnb2frNgLu8O++qAGcaK0rriStjjUSC1ROvj5j60k2rJ
         JjY75lnsCQkggw/1PAXvkf+2XapaEkqRR6kM+vtxE4Vu6H4KJZn6Ov6BJUx7pmZU2c4W
         moVS4cjeeKbOAQ+s+g2svlHZd13gKiLrk2mEWgEBisqPu1sHma8X1BbvWSrpydBSDL+A
         HyvYup+Pb9S43GboPguMe8I1QnJys7+7bjlaBOTe1AevmUHft9kLr22AglVo5QQ9kwWk
         nYQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792593170; x=1793197970;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:subject:from:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AM/NbC4D/S6IZaw9GLu+10DxkxGhyZ5Y2SK3qxYlc1k=;
        b=iRC5+Tdo81M1wB9ka5f8+x36AIhNzM19m2upm+Gh/bphgFKznei4rDpgltGd8zOsRB
         XR9Py85gLcozWsHjgX95lpM+TqSEP7TILCYU13L/Dsfts6siIP/dLlmrazqjfxw9M4ER
         qDxebWK3++JA+ouZTweud1eTL4MS2UQxTNpho6wTxrfqG5iGZ67/abGDqdJZuaRueF8O
         av1mHZQY5uWg6O173pnmrhwtB/BD4L5+/7n0ULohfdyaW6sn6jPW4AiSBug3tptkmCGy
         0j44cewpjsbRnOmyWIni47fkBYAPLAsYwcVZrAA/S2wFnqp96b0u21a3U05C+00KqyxT
         +/HQ==
X-Forwarded-Encrypted: i=1; AKwUvBzzfiVMmOESS1Rq95O4tLeSbx8iEmsTpiFHsKITmvzf/uMpx+kWTx7WmmpP7zF6Uty8fw2SzFB0vgbpPw==@vger.kernel.org
X-Gm-Message-State: AFq9FYJMzDKFhS8gfEb0l1SdAYKh/B+c6i7+yEUzvA9aXokj2dtDYfjp
	PcWahQve2ZinfksEXlNTt23X0vGPQhhaWEuX+BrWYoM0PNEZgPziYyuR4V3b2apQMRP+FJ5xL4R
	uvVpK//J+mOpnIHWSzvGVbO/EnkAaRrho61F+QnAIVr3Sqv36e+B4/y2LN1oLs86x0A==
X-Gm-Gg: AYBFou2VKXf0RCSzN+8/pROSCKcdA1a9s5q7wulZ7G7zl/V8Wp7+LkxVo3gUqYSGLzc
	BINi3XSbclKFLrGRWqlKwTmPEdnEWiqEZ194ggLlEyP2WSzO/3zGuuLtQmhxOu0553vd+48WKU5
	QosH9Jgqr5LjtGbnzS1cuwgsjKPBlw+1mt8ZGUsSrUibonh5x2SqCUJoBT4lN7BYozcykaq1Xqa
	lJxjw8iC4+xrt7Cuf8XWBUg7C6Ui/VAklxJxmEHx7bWFeYg1Ph0hTkdrjuy/VWPrOhFcRikH7tp
	jVKCrb9TApaA7O3WaeQ5+rMWAmkFHCEbHsGh+4gRxIynXWDWjiGgzYGrbbxAcJuz4G9SM13eAYI
	3wnNUIpG75Rc7CWpk5zNacNe5T2SavcS4Nx9+XY+z2G7qejSiofb2wonkTzYBR+Dqqf9xCGIv+g
	hE/dGxfDifk20yMVQXl97Yx5hQ4nT8LcCkRc5cFIG2x9tE6M+jP8LhqWRbYCJIlEfV1A==
X-Received: by 2002:a05:620a:1711:b0:93e:f9ba:68fc with SMTP id af79cd13be357-93f57f65f39mr488311985a.21.1792593170219;
        Wed, 21 Oct 2026 07:32:50 -0700 (PDT)
X-Received: by 2002:a05:620a:1711:b0:93e:f9ba:68fc with SMTP id af79cd13be357-93f57f65f39mr488305585a.21.1792593169636;
        Wed, 21 Oct 2026 07:32:49 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c32:7800:5bfa:a036:83f0:f9ec? (2001-1c00-0c32-7800-5bfa-a036-83f0-f9ec.cable.dynamic.v6.ziggo.nl. [2001:1c00:c32:7800:5bfa:a036:83f0:f9ec])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c468a1f2981sm10594866b.10.2026.10.21.07.32.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:32:48 -0700 (PDT)
Message-ID: <2711274a-94f1-445c-9f8c-ef4bcc5987f4@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 16:32:48 +0200
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans de Goede <johannes.goede@oss.qualcomm.com>
Subject: Re: [PATCH v2 0/5] platform/x86: int3472: Fix AVDD and add DOVDD +
 DVDD mappings
To: =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Daniel Scally <dan.scally@ideasonboard.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Antti Laakso <antti.laakso@linux.intel.com>
Cc: platform-driver-x86@vger.kernel.org, linux-media@vger.kernel.org
References: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
Content-Language: en-US, nl
In-Reply-To: <20261020142243.25072-1-johannes.goede@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfXzrMs/hDmvJz9
 23GPt1SszQx4crp7biikNi3KhiEaNtwMfd6JgRFt7MHYdfOVzpfKQG6mgUGUaB3F2wpssX3bFCJ
 4EwzlDEqPb3/tg1URiEOMxefnawoq1c=
X-Authority-Analysis: v=2.4 cv=eJaGH3p1 c=1 sm=1 tr=0 ts=6ad8cd13 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=pGLkceISAAAA:8
 a=BrVY_DFHyF5R_7dy03IA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: PNOTUkQfcQ4zs8ks5eImBQEH8xAY_zi7
X-Proofpoint-ORIG-GUID: PNOTUkQfcQ4zs8ks5eImBQEH8xAY_zi7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDA1NyBTYWx0ZWRfX4wUr2ydZaqnu
 jsqR6+GDWDxh0R0l+j0Rzso2YOIig9EraF2dfhPhlrCVYrNQ3tqfnWs/glzZYcnKy4TYrK1G1ZD
 MEiV48EUHbqzW0qU9BFKjE7kljCiF05aZ43RehKssKk0ZZUR7PqzbvMXnnZnQWdX6muZBs3WqfM
 qKDeo1A07gpmiR3Pc8ta81OZ+8iSlkE8rEuVL+uSHKcTX21Ryqq0LTpIZJHbJHnMsC31x9zJkMJ
 Na4TxD1jGEpkMpSLRqglDCGCxbequtuEnJ8KsEj691qxTevPa1ihqfGtruM6mBkAR9kO5DyrnMp
 Hh7apRRlpCygfHgxfgfA4lh0aRLHAxpwWG6vrE3FA7TdQu5RddwQ8dKsbxtQWt/R2VQiqBvK/9+
 FN5gN1McDUZLBmEg28WQhKCuUq5qEg/nB22mOcF8lkFjp2IMcup3djvL+Tg7IHvWWarvnoji2MT
 PgxUyf5phzDsH9w/wSQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-21_04,2026-10-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 priorityscore=1501
 adultscore=0 spamscore=0 clxscore=1015 bulkscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610210057

HI,

On 20-Oct-26 16:22, Hans de Goede wrote:
> Hi All,
> 
> Here is v2 of the patch-set to sort out the problems with the Linux INT3472
> code mapping the 0x10 GPIO type which is meant for AVDD to DOVDD.
> 
> This should allow the OV5678 front camera of the Lenovo Yoga Duet 7 13ITL6
> to properly get powered-on by Linux, without breaking any existing setups.
> 
> See "[PATCH 5/5] platform/x86: int3472: Properly map the AVDD GPIO type to
> a "avdd" regulator" for more details on this. The other patches are pretty
> trivial prep patches.
> 
> Note this series is ordered so that if [PATCH 5/5] somehow does cause
> regressions it can be easily reverted without needing to revert any of
> the other changes (which should all be safe).
> 
> Changes in v2:
> - Fix #include-s sorting in ov05c10 patch
> - Collect various Reviewed-by tags

I forgot to collect Alexander's Tested-by tag from v1,

From Alexander for the series:

Tested-by: Alexander Patrakov <patrakov@gmail.com>

Regards,
 
Hans




> Hans de Goede (5):
>   media: ov05c10: Support full range of power rails
>   platform/x86: int3472: Rename DOVDD GPIO type to AVDD
>   platform/x86: int3472: Add support for DOVDD and DVDD GPIO types
>   platform/x86: int3472: Rename avdd_second_sensor to
>     power_enable_second_sensor
>   platform/x86: int3472: Properly map the AVDD GPIO type to a "avdd"
>     regulator
> 
>  drivers/media/i2c/ov05c10.c                   | 32 +++++++++++++------
>  drivers/platform/x86/intel/int3472/discrete.c | 16 ++++++++--
>  .../x86/intel/int3472/discrete_quirks.c       |  2 +-
>  include/linux/platform_data/x86/int3472.h     |  8 +++--
>  4 files changed, 43 insertions(+), 15 deletions(-)
> 

