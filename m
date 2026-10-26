Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793006949;
	b=vHT3olR1YS1mr7EE0lFNkAdWgf16xUobvrD5giiiQAaAIkT9PltT9MwcsEftniZHJQwi
	 UXrQFjHV32dvAjQVjYo9FZGywiR6Km3MRawBkpRAyuTep//yyRVRQiyEKxMtaCwgSdByD
	 FKJZkj/jD5hJeWi7j+Yja/pHElcdLj8MlOGOgDcaPLHCa5WjyAuMyiQEexLS23e/utYWf
	 uOIH+z/KDB9by/MVgYt9iDkXajped62hrYwR9q7bEU6pB6/09dheAaNQa1VLvUISRqR/4
	 0luWUNgNf2Hg2vVT2pTaPAuy3Qy8stvysyMlJ1bP1fmb603V5HHOI6asJJ62c7wEwUg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793006949;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
	b=HOLOqi0e9Lx5R7ftuHyw0/0h+WH7KO7vGF44OmVahyJ7nwatJX/SpYRO+5ARILckllav
	 WGlAOgqrNz3ZsTzTlEEOSmI3JMbfrFPXAZsjbJN54j4TFtkY3wgTOADLx++k4PjCkoNwP
	 xdF9XyyPfixMAnoq8dSKKyJBOSIMLmOsCjtiZnVKycZWwWTJ9BegX26WQZAC2WmnzV4xb
	 YD26pehHwm6NuwiNbeiZiKbxRbm63dOfXc9BwGmApB6KYn9Owvd28W6XWVUoovJyen2rb
	 puWxZAvs9vF9GeIDZ17UXu8Ie7mD6mctxBitidv6dyUh5Ijn1B2ntUv70HDn7DfdjUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0466606A322
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:29:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0466606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Pp3hQZtO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JIT5cQOh
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aSne2222559
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=; b=Pp3hQZtOo5ZhG4VD
	Eb3Xb8eJwMvxCRPtMHEJpyXTnakxTLarKD+/+Z2Cb+wXYQFrJtfP4KVql1/ywfKL
	jLcoEsfzDgfZhD1OV/fnd+cpXae9vcUEgLQgPyTNnxVMZ7cNVYGFwal0RGh24QWY
	0AnA2YKyLbQhybhWWhSJ3EyNcrLOXpKd8a4NFVte1MPipqH+YfY1143XFtq07ZdG
	aJh4SFdIfy5kB6gAaSMYpGREuLDqQbF6phfALiVerB3Fiyyhww1Ke1rMK+SkJkYE
	joAluke0XrY8kN5yk2QP42xJbVqBOgnvuBn4FQejM2fIn03rpooN65uaTX32Kqe6
	I9J/EQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhvdd9fas-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 09:29:07 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93ca9b53afaso432692985a.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 02:29:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793006947; cv=none;
        d=google.com; s=arc-20260327;
        b=kaChONydFplk0c5sYgmp3t6c/SHSA3v+OcE586xvjcvi1aiWW9oAmlJQXumv1NTH+v
         ARUpXP1q1E+bfUcVOVhje7h46eN6sQXOZ6442AAxDBWLdcIKumHpTGnx6N2hQ3stF7L/
         xKkZuDQtl1TcA9CZwllx8/R2Fql5FmjA3zjLssk5Ty2lEKRKvOkLJwl0bbbNoDXNLiFA
         KzfDWHVuTid6QddAQGk+6OG1l7nuACXBH33lVkfHr+RWhlDnPAq20aDSPWeL0wWJRzzT
         pVG6Olkq1WF6q5NHlpb1b8EUqe5C/7QoZBMjUBAcuJEkPsKD+xFfD/yYJm3iAK31xU5E
         KdlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        fh=Ei1CbunWe4zL/Z+qpqkLCY25QC6ZWyzBkDeVzcx4LhY=;
        b=Vc1bxCYVaIjFfzSoWXMQJCAwI34oKKGZLUlwxx6IShdplEfdt3A7qxP3B4Y3oj6whm
         dF6Ax07vyilBzui33agp2+Y0XEHIBaZRqo+oBMphwYoN8izUSpWBc7AmNzSwEQOCf4Xc
         heiD850CeDugdVENKLHrINtjTAJ1BVfHTTqeFs4iC3PoxnbM+87uRVwfFuPYcpNZWuVQ
         ug0WZbYuARTTUccsTXIa48LITJwoA7uCz6eYOs6GuXp+hnuLgVJruuiGHWgL5qfEbxLq
         KIrMQmw+oKmMUjHVtFG8I/jdqz1W6FrlK6px3efWBqbyNmyYhLIV4u+r39JkDfomAqH5
         GxkA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793006947; x=1793611747; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=JIT5cQOhNkfyAyNeXnhv1F3WhTXEzH8KlnKTM/1VQmPtb+e9L/ymd2ijEUD8soK/86
         03j1VfyVDqMybJpFc+UDgQTg0/yDRimIfp33hH/8t7nUtZoyBVnhMY0cEQtUUp22nyqK
         aM9EGGVZRCbRdebp5OULMswJtv6E7rNf0uyxiYeDCTil6bYN9T/0e30lV0PfkpVT8qjA
         y/DQNlG45uKKc+gjmJjZrRhqfjSb+X2IBKuYVMgAd3jm6h+70QyE23d6hUe7XTOuD/cq
         uGWlIX/vVVSN5JKssiqLAIlwaDAilOl/d2AUz5o7ir54FCsJnCcjS/APgrM5ezfQqMhU
         xUtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793006947; x=1793611747;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7jTJ5mGKgF+XLWB7Pust3PZpn3wcVoEPv+yh/iFoGJA=;
        b=gLtecZSIuM2z1mh16+jmF4Q4wPiRjFc2X03rsKGz/UvPx+r2PsXCfdpm4PuCI1b5yz
         qkM51a79UcCiu35rPPj5a48bEEaUOZRVmcuORljJp2FUjNF7K64BCqHDaNpoP+Iid3pz
         sHw4Vl5Slvl+YSXbAB7v9XmU+ujwACKysRWrtGAhq8XqQ5BNVR5em042WSbgLBY9F1tv
         52JJkyG1GNkQbI7fIahrEoj7pghjHTLZ7SbLXWMkwuH5fwSIZ09TGcxbP+ClHVe2Kvzr
         Vayrsf35Kt3qb40ODLmqP4hzqOkKBDGlj2u7k00rxG9ulFDNGweyDC96v2ZsviF+v8J/
         P30A==
X-Forwarded-Encrypted: i=1; AKwUvBwDN5yJjugeolxTDNBTRvHTnA4okWWGCFtEpW9hN4uu9UeR7Og/ox9w3CzT6IjYYsNbiAw54j3LhyeojA==@vger.kernel.org
X-Gm-Message-State: AFq9FYJM/tmsB4+okRjq6KOmwlEgAimpDP3iKW5LCV636tfD9tV/BTSH
	Pr0a/p1ChXBBtY0vCDF3pYAtVwRREKDz60b0C8VL2EgZhP+CntoYRh12RRR2OJIrkbKniR0RunL
	Lg9euUagFBoet7mirWVXEgyDAcCuqM9gPBp9cQCzTJiR//Se17YIEt0F0+NMgc2CcX3BNJrg44W
	lRL2w6AsPwdMoSySxxMp7SVR4bZMn9hsqm5brhWQr8
X-Gm-Gg: AYBFou31QgrRzU6aNI0rFrABuI/Ranwze+7PL6ogZkpQtW0H4xSHIjZxLIXPIhZfRda
	E831WVb4BSij1vcmuGLO/NaDTT9+1ye1vPjp3lVYaRU6LuobxI2ueGbbbqh4YS//yolQ06M6CiS
	3wmjmkiPLoroBSYLd9eL0XeXRQQ7PauEOY78KAm61HqH6LXj9Z0P1HJHeGS1GO/1dJMo5ygqNLK
	TWNjV+1+ou2pgKxgIsmG3b0ZRMPTt89H/sY/0AGmI+N0HlflzBZu8AlrvtGbCN/JuDV8I9rQJBz
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id af79cd13be357-940f2d96196mr581359985a.6.1793006946776;
        Mon, 26 Oct 2026 02:29:06 -0700 (PDT)
X-Received: by 2002:a05:620a:6314:10b0:940:f2d9:5f43 with SMTP id
 af79cd13be357-940f2d96196mr581357485a.6.1793006946328; Mon, 26 Oct 2026
 02:29:06 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024094027.3095475-1-atanas.filipov@oss.qualcomm.com> <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261024094027.3095475-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 10:28:55 +0100
X-Gm-Features: AclHuK-H3z-Kwbr7ajvKaP987banPeBc1O1PjrjsKicOkU5pIukO3QkXQMIr7Fo
Message-ID: <CAFEp6-0tby5B7hUTEyvkWVnNsOLXnEomTDt4d6xgGtF_3X2hsQ@mail.gmail.com>
Subject: Re: [PATCH v2 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: VTwohFtg2VpYKPFaS_x8qyt-Gumx0gKK
X-Proofpoint-GUID: VTwohFtg2VpYKPFaS_x8qyt-Gumx0gKK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfX9wAS8V36y1P6
 FG7r+KwWVXN04NQx1qI/sza5z4Wv4kSgJ8cUZRHwvZnD1Q1jzWw+CmDi7MIEyuK4eZEivIIhhNY
 v0Ch9jON1yrqQXTGTyNb61qd/jmxlgWnNVk4zwZtQgUTTnx2SrnkXQarxCltXoy+upkd6xwWIHF
 PQNdWJK2cT2ER3O6uiRP4kUGHvlAZ1X9e6CBVXYbc45nhoack+kDBun6pbSYL1ioYtOPQq1czSE
 YLZBLBiSANgCWBP64KmZBKs16Iud4XEWd0bUfHdvOnuAnO/RoXKNtH1CUWjEB+YSyNnxwGMCNWH
 OFjn0Rd0rQC3qCG/AHzDFWkB4Nj5AzWGihCOU7tawy2r5X976FZdclVkGaqZAUKmrPei4Rhr3I6
 pw+f3WMGkDOPEEBL4y6v6TRU4kIYZXF6MUZaj/Mf2h3hKhk52k7OQwJBYWye/o43UW3Kd/7+5U6
 PF2FlroqAQDrf1wJFkw==
X-Authority-Analysis: v=2.4 cv=N8+8hG9B c=1 sm=1 tr=0 ts=6adf1d63 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8 a=vVGVp6KvjHsgx-TnZO8A:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDAzNyBTYWx0ZWRfXyGpP7U8+591q
 MrqebwS+q23CtviQT6hfWTSKfPMVRQtfO21+d2n2qQD5++D/iTofd19UxivXWJ0lwBi19MCpKt3
 w4eLut1KudmBIf3yw7i/Ys+A/GyfuKQ=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 phishscore=0 priorityscore=1501 adultscore=0 bulkscore=0
 malwarescore=0 suspectscore=0 lowpriorityscore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260037

On Sat, Oct 24, 2026 at 11:40=E2=80=AFAM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Clamp each clock to its highest listed rate instead, and warn that the
> pixel rate exceeds it when the clock lists more than one rate. Take the
> clamp into account when another line powers on an already running VFE,
> so that a clock running at its highest rate does not reject the
> request.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 18 +++++++++++-------
>  1 file changed, 11 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..359b5942df89 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -996,15 +996,13 @@ static int vfe_set_clock_rates(struct vfe_device *v=
fe)
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         long rate;
>
> -                       for (j =3D 0; j < clock->nfreqs; j++)
> +                       for (j =3D 0; j < clock->nfreqs - 1; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> -                       }
> +                       if (clock->nfreqs > 1 && min_rate >=3D clock->fre=
q[j])
> +                               dev_warn(dev, "Pixel clock is too high fo=
r VFE clock %s\n",
> +                                        clock->name);

But are we still comparing the pixel rate against potentially
non-pixel clocks here, such as AXI?

>
>                         /* if sensor pixel clock is not available */
>                         /* set highest possible VFE clock rate */
> @@ -1046,9 +1044,15 @@ static int vfe_check_clock_rates(struct vfe_device=
 *vfe)
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
>                         unsigned long rate;
> +                       long max_rate;
> +
> +                       /* A clock already at its highest rate cannot go =
higher */
> +                       max_rate =3D clk_round_rate(clock->clk, clock->fr=
eq[clock->nfreqs - 1]);
> +                       if (max_rate < 0)
> +                               return max_rate;
>
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < min_t(u64, min_rate, max_rate))
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
