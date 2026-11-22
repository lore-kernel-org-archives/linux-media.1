Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377878;
	b=zCa3k5jT4cSjjQdFNu/XnZ67x0lnw2mCskv8XxO9xHpQcXKsF/xcXxkLh7m5jxHWVj8q
	 MDSklZLB653KT2ff9iT3bVAb0UzwhtCSKaW1KBv20YfrXNrDqihD2dQIzNjmedj/RuhUa
	 dy/moDz4uyUuY3MzW5cY/6i9k0yhZ9MYQXt/cbwdRD6Fga19YtKj1N1nCQ4ax4jCH+TPy
	 515QXwWm8Dl/dL3P8Bn92M7aJubcUf6tftDFDqSVL5iqV9KbTtd2A6xUbbpwvZ9WJ9/P4
	 3basZ/3krfVen6A/aDJB0nnfk1GYrgr8/UBV9vlV7FKOQDuK60SZ8y8Wup8zCxJuY/w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377878;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
	b=b9spp3ysA/gMsZzSi1k1soEFPwzvVDKoqVbl7RXyj0JSxmY1oSwsUHUn7xzeANufX8Jl
	 8vD/Xty3cfJlb7yWMjLUcKjB0wGocw3+vD0aQhyc23O2EVwtRUCPuHwKlLFls/Jt+K1iL
	 O+UVP3AVCCeWxhVKoEUhbq2Eb5Fi5cA1PGAK39NUqqJPuksmhAzBWY5QVJpMq0P8ZMd/5
	 8N9Pf0v+o7zxJtVzIrKZdXZUXRer3JWLOOCIsRjgivgAJC86rurNOuw0XxlD43FJ7hYXn
	 ckc8b/OxJJR0kZRmka4hL12D4djzmqxO0gzStvVVNxUA9C2SxIGQgE+TXzX9w962wkg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37092606A31D
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:04:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 37092606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=cdiIEb00;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=LB4lqMI4
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGUwQu3514924
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:04:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=; b=cdiIEb00v5kWagL6
	eUwVvRPDz7im7ZtvWbpO6np93uS+Tj6CgtuPzHT0uXaS9aAppi2+6C7VpSjbRThb
	viw0mCz5onFIhhm/NoCGQOqDOzbNh3ZyANUYz60/gvsdIRoJoDNvZW8qiMJMFjbk
	IK7y12qFmmrO5l/dMoVL62bM5Sw5CXS7gKWXwx5Kp+NRwgnCrdoB96sQIBR3ir5A
	jBVzUuTaPqAhdZ3rXAyJHc0ggNfLvEVIkDlU2dAewu59uPBxpBeNMlOuNvAsqMZf
	ylCpli4icCzd6I4npM/MFkoEIt8WRsqjtY9oxanAoMuW+24YPR291Q2H1oVUTCWA
	BCoUQw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j33p7v3j2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 20:04:36 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f6f4fe531so449544485a.0
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 12:04:36 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377876; cv=none;
        d=google.com; s=arc-20260327;
        b=HLb/uwJfy+psqRolbbLNW8HbNTBDuVEdKEkmucLhIPueLmQ/suG1LQ+DymaM1DVqjU
         POlK6Sofg+BvPDYXye1728bTldo0ieNOQAgQf6kXK2mxSfFMXMXfZfPcAFfz6tsRaVHO
         GjX2BPMu+zGgr06cdFCkaDd0/qNk5c3LtmA+yyeVsKi6sdDD6suxrBzBlJ5R7cY/grzW
         YLDnbq0Zex3ymXrz4BLGZKEhu1XDpSAWPILWGvPnpLSc9H7g1Idu/iWyPnsLOOngKXOo
         56ql06tPinWrv2SYk9GI74A840X6ODK40wyoa7cV1NOgmF/vUdZv1Hdb3aHVbtYeGdzo
         DVPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        fh=If8Z8KSxKTZ+2QBoFr8BE69XEIwovlavY4R7Z24XNSE=;
        b=ELpK6EmwSqcrTbFxUdbdm6hVYAiuraX3ONYt1fu4z8GJlZBGdRXSTB2Z9uWZCpt+c+
         zmCXO95a8essf6MxsQ8R5RJBV8r2H0gnLxsHc+35uvmtQFWFTsnG6PZiblW8xnonrCQQ
         12gv8wy+yRtEe/BOcB4OyPMjO8uuEEkE9UlptamaSpx6RbfA9Dbjo24r68YQ5ql3IY2a
         u5OMdjG0AOOTog4RH5xtJDPuJov/9x7D4PgF/T+rLWbBMpg39+aNQ3yiYx8T2PHkQNaq
         ujNOSCLm4E8kqxGAFp8U/HDZ4L2fXIHEhieaFNbheEtF/NriTQx2MPrNNQrX9ZR05lvA
         Grpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377876; x=1795982676; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=LB4lqMI4yntPsxt+YZJAe7MvQboR47G3/2H8Q5gTMXmlMKohkJIH/QzKS4DqKNoU3w
         h6InpvLoMTJxh7lrfvQus6zK0i+AFiY1cMSpmtK6WlpUa2Kt9twYVgmGPE+OEui6F7hO
         9D5O7E4Ov23pyiS0Jomv29FFxPP6RiqZVuszaDe8MpL5eR4fsEM8nF8kVrfplK155x1W
         MNqXorBxFIkrCGYjRAXWps2Xodh3WqfRZO0+/TDMYUwlxfO7rSjePOhIL93D/lnnn+wa
         ktIKpb2mr7Xj6lLsbXPPN/H7hfxHHGadW1+OCvcixdHZqHadnBsqhQQnO6jn01SBP1CL
         HAqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377876; x=1795982676;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ud9K4nMYxU6qN3BZwhFFzQdteSrr9r7YHKUiNUWG0JY=;
        b=WoarCNtrVI/Zz8WPO1CdMTLf0lTKYbi/8I70BgQ1PRKW9llQrcq7+Ds8r0RbRSxGCR
         Gsf2aCeExnuFYbZVV2Cjk+u0KD5nsOohRsR9T/+/YT2KPPANFScaDO7fAX+t71t1faYX
         TBfENdoZAp4bHgAqcM7lV7znPZMy2oFwOXEZiCrnAad1Dwr97N5ulsnx3TWnxhGwSL5P
         OJ+YCZauJiHuPZxkf0YGmAuTcvVCV88MW2jDXEQ1mRncXsTnqYJ9jPwLglg1h2hrxtF8
         WRx9e2HilP5cnJWqawGXAP/ygr76UieKKVFy2cw0uEcI94jJFet6Tza/HD39gdCqpnRw
         NRdQ==
X-Forwarded-Encrypted: i=1; AL+hErEchb9pqUN/GxyyH03HQz35YRpRU4lKu240Nb1rWYJvoaOQOs7JQDxtw13u0owZg1LFP+VNjf9kGVuHtQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/X9qanzWRU3Jy7EnrwnzEIXTG7NcM/2s8tIZHV2th44xtPOYdk
	c3j4wTZD67qAGUkd7gvThEjQJzd7mZ2QM8OPgQX8Q0+EhMsY1a1WwpF//ZDB2TuJNCFJ7ZuTovD
	sQuQ0VuV5QQjkKqvjYGF8RyySkdyp1xZOiX5f8JpmjF5gjV3FucY1nhgPhIGJulNqqteVYiAaS5
	a9kBvk4PpW+fPw/8lmjyDgDSkBnYqAEXYJLruhrW5x
X-Gm-Gg: AZFdTZfbLnMpb822k18eTgI/nqXMstHze11kn6gvJZUa8a35l+yexHZZlck3PZTsbtT
	rwGsoVwYw0snJ/aRN59ZqQpus2e3W4VxoFPfOHR5IWV8hoxZxdj9ahPNviKRwfXrbY6ATpKU+97
	1NEIb2yWJEsjJJ3BpkK0Td1sQFVwIsSLbyxS6AmF2Il4ptcOWwcX2dsex1h67DskYfK3+CDhf7K
	nC3USKIad5oL4b6MRlWH6ZMauIEMQ1SUxhs8AtBnyjEVA44OtD2M3/Pv9U4tjsR5f2oyloKrV/x
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id af79cd13be357-949ba9555cdmr1583914185a.25.1795377876395;
        Sun, 22 Nov 2026 12:04:36 -0800 (PST)
X-Received: by 2002:a05:620a:17ab:b0:949:7f50:29d7 with SMTP id
 af79cd13be357-949ba9555cdmr1583910685a.25.1795377875985; Sun, 22 Nov 2026
 12:04:35 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-3-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 21:04:25 +0100
X-Gm-Features: Aa3M54qUzr4tb0KxbdidEOr8hL9CXGm0SM5knxBXQMkR5xBalOtIALTCOaJIY4E
Message-ID: <CAFEp6-0p+m7gV=qk=UtD_E5haV2H=KJbmkXvH4P3_C9YhwJYFQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] media: qcom: camss: vfe: Eliminate ever expanding
 src_pad_code switch logic
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=OrHaWC/t c=1 sm=1 tr=0 ts=6b034ad4 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=z14PLRylv3i5yIR1d5AA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX/Bd/9e73GgS/
 AgPR6J1bMyUDq/xXfoY/LP6k0+3S3J6sGv0ZHaJlNB6lwN9/BwPlNPhKN/jGNG/79za4hoihqKI
 /NhP3obrEHWDK70p3XRTHC2RzdkAWcw=
X-Proofpoint-GUID: _bMOsfiC3lXQC6StVCLSJf6czTMTKIgP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX7KgS+XzW7U9K
 W95ixW39+iekcwbX3HhYvPWgZrto8RrBOYRE7CFNScrTEx35wLGUFRrR6cJISoRTafzw8Wv03Hk
 jUWpZx3aaYJnmDSmP2YsusT2sHszzc8GtFKJa4FxGUzWbaTS/3//s5DeRjaUdn3gQZAq8N3cHLO
 zA5bUFtA7RMioUrbly6VwR+f4r/V26/rBH7EfJzgXrjgY20lznz4Nj4+/UW8IqTu2NUVX0M+t19
 U7cdxuYOZDUTxsow8D/IqaDhj484Y6azBGfiLjhiOgHoxYJqeQSPG5M8zfBTN7n9iBKTVaxD04g
 /yOvwRP4XDnanAONxZpdZJUVCBAsley4CmNm2sMmkppfrdxw5TGGxqjOwTOUaYk77D1CAuDh3gE
 PTsz5BxzK9Upd5o5l3M+Ta8b3uCktwaJTQr7v3X5bLknkdTlHULKxW0uHnTDCQwq6giFgXvJCHg
 ZZQZxi+6KvXfuHZGtSA==
X-Proofpoint-ORIG-GUID: _bMOsfiC3lXQC6StVCLSJf6czTMTKIgP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 clxscore=1015 phishscore=0 lowpriorityscore=0
 suspectscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:11=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Every time we add a SoC the src_pad_code switch statement is expanded. Th=
is
> expansion has continued to the point where there are more SoCs listed for
> what used to be the exceptional state, than the reverse.
>
> Invert the logic. The exception to the rule is the old SoC set there's no
> purpose in expanding this switch continuously.
>
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 20 +-------------------
>  1 file changed, 1 insertion(+), 19 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index f9bd2367671f6..10ad862ff5010 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -340,21 +340,7 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       case CAMSS_660:
> -       case CAMSS_2290:
> -       case CAMSS_6150:
> -       case CAMSS_6350:
> -       case CAMSS_7280:
> -       case CAMSS_8x96:
> -       case CAMSS_8250:
> -       case CAMSS_8280XP:
> -       case CAMSS_8300:
> -       case CAMSS_845:
> -       case CAMSS_8550:
> -       case CAMSS_8650:
> -       case CAMSS_8775P:
> -       case CAMSS_KAANAPALI:
> -       case CAMSS_X1E80100:
> +       default:
>                 switch (sink_code) {
>                 case MEDIA_BUS_FMT_YUYV8_1X16:
>                 {
> @@ -415,10 +401,6 @@ static u32 vfe_src_pad_code(struct vfe_line *line, u=
32 sink_code,
>                         return sink_code;
>                 }
>                 break;
> -       default:
> -               WARN(1, "Unsupported HW version: %x\n",
> -                    vfe->camss->res->version);
> -               break;
>         }
>         return 0;
>  }
>
> --
> 2.56.0
>
