Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795377074;
	b=vjClcbNs9i0KkbBtsWWS7AnnLMHJM7ul/mUdO+KjFv7VkrzAmVMVR2wGbrqhfxttdB5r
	 e0XfNyrPfIdTIHWDKUzWPt6++09FfaWlirTY8sh/tgirPSxdZ+yQtPsA5EIsiFIJycp+3
	 yUkYWXhLq8ZwKSdNpSV5SMEL9W9OwDED/y095TWUK8cr+0D4ES7X5R9JrbeNAXqi//XqN
	 huRaDU7Z5DgeM+rZH8e4BdJGj7fSDhNlSSl24AUxq4CUm8ApakZSuwo55hnOkGWHWOV5o
	 SDQFcTmNHt7PYjaInYn/5zCXIb7fe+MpntYZ6XoOM71/U9u1HC+6/h55nHIfGXcvO8g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795377074;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
	b=tCyGnW1SmwBsz+PAYXUYwVxrYI7Q18YWSt4iqFuNHNYjKlGUgHy5Dn6fHfgnDyahUcXR
	 qraxX/qSRfYfzZ2v+/OO2rhGseZn7NN9CcOlwBJqJ/mP/TEnT7FCzTxwMi5KDPyzh6BR4
	 wXsx9WO4ERNEBBOwYMojb5ljxDjH1ElTBrRZTjJApvcJtZbChDUJIGVI9l0VeH4tea6XK
	 1nskOj5LvO2TG3yPAAPxwnQCjVnmwqDz/8Kif+5Ykwo3ZlLU8eo0Nnfj5TAcTc6fTmcSO
	 /85r8B+nHjgTrrsAMVGzqN/o0qi59YiBYqxzqi7qhFLirkaYJWH3KENz9l7ThiHkhTA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59C00606A31A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:51:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 59C00606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Srm0FQ+0;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=G9aPCLiK
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AMGVYPX412750
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=; b=Srm0FQ+0E+Nhaa0M
	JAoh3zURFwR3lGKK+ATSxpFXd7JTLC5faR//DYv1SpaUKl9r6qVGJLBC1me9N83j
	6gOEsgrV65uqaJ5khG4bkmc0fSngDi6J4wHreLdz5siSwKelDV/OcANBLQTA/m4/
	xZ3pJvF8isNJ/cLum2MkgRe+ktK2YhgMMrGHhqjQdp/3N1PIl1LXhOwH3PwbmpSj
	iys6aZnW2Pum57lMjEj8o+d4reUPZzAhSCh0ZurXTgBZMGdKRAt5n7lhuswWUPyR
	ebczyzbA/rqPugipC85qYx/THcSgDs5EKEvWnRnV26jrQKuJ73C8bh+0ystltrM4
	nukBfA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j32a6m6tb-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 19:51:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f26dd2165so705249785a.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 11:51:13 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795377073; cv=none;
        d=google.com; s=arc-20260327;
        b=NEx2MgFENYHxqAvh6906USBIpSw31TJuFxj5gCdqt+8ZLKAFFhOIs9c0l0FNmBO/2o
         aMwY1Z6NqTVFka6R/Pc7lhJoyrSur3+f1D0oGJsf6lDaQo94WCAy/yNkfKUFwgf03/r/
         L/wjlEOVXaqSddfouJ3181MVGn2AHm/pBBC+3QnUkkW+YXK6o76iYyuiZgvOP6Ers3uB
         Jn52Zk4w6rqUa/X2KhnZzWRg2oXCkukj0le987XV4zkHNYpRE3ErILSZhgUlOkDNg0yk
         A5jwEbTqz6OBuFV0+XruqXkhZddkwVWZOT1t+3SZfxppclsI5/Puxn//oBzFWVbnScJo
         wPGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        fh=YIQ/ONFX8L2O9OruAW1j5Rvf7/A5ZkrroBIz2Tv5ECY=;
        b=glaaOqAYmK3NMTt6bnq2IdshRsyIFeASNS0BCUNCjz6UAsP20Jo0q+p694ZEMAz1EK
         ib8EhO+gRtxy/FjL4b49OC9atnwH74F7yDlKx1u3z9OZXev/GtGt+CuR04rCbF5P5DaT
         qhTNBYfudvATvgKxC4CMcQfOX2FjwgYBtUMKAZ1OKShCW1iMnx3cJWCYLtMhoIVUB3YI
         6fmKmWNapPIBNsP3VyRuQIaMt8fsOohgyRxll4zGJDQD+gH+jUvRNhD7LGCTlayR5876
         8prgk6+LdDdyBn01rfqfFfXQXvoNpD7uWjQ4xjwE1dtFpVmQM7XmfHXo2MWP9OSykZSL
         kPUw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795377073; x=1795981873; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=G9aPCLiK4n62QzbLjsEnsHi0Rv21CYYW1EGHbkKzAORwY33aWS3jEq4YCMKTgWrmJg
         w2mWgKF1LZ1Fi/zMLuHEevtYdo5gX60ZOKa+j0PjYQMcrAN6r57cKF54NNphcNEAPrv8
         1MeQHMbNws1hyvJh6Ay/IwCFIlR4Wno1/UW2nKELy5TiTtIGKTn+QJsu3HGOvfc+oosl
         b/fYu0OU8Uty2/wIJhFvKdd+bmPA9Fu4TeP97t+1UJqqelBkc2KoKwJeBoYE9mi9Id7O
         wSvRLSaPtpCbUD+7VdM7LA1PrNz2xg7HM80oWKIku/6B/DdFw9M8BP2J+l7M8SiRGOfc
         q4lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795377073; x=1795981873;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FfR2KZfb5vYyl5GgD/dMaDXtb5WXvXYxyg2TKNOauL0=;
        b=OvzFY1s1p/0zjs0MbMIHuwdGdRDrOMf1FkpgyNdR+2fbmXf7rQ9dFZz8FuwNt1BfPs
         EHQS99a04e9guWKBj/E8U6w/1J2Tz/0jqRht0tvGhVZ/rOK284MfZwV4YBwLKBg9c5Mz
         mgiFvGSKxPX4w+oBUgSJWwgCMj09rEpd2Ko/RABD5/hhuSGxWZHGyLluKAzyoHH25Bxw
         Xa9w1F/xbCmUZC0UTxiLT1rXULGYYtuLtfnfsH5PcPXbKQxEfEs/uFL5I28ZJ1E4tyRi
         T3ja2w3ntFCZlVv2tUdy8CnRplSiLrxEr5VHutBZxfkLmMX5mTf/CkqqDzeUQ3egsC0a
         UOTg==
X-Forwarded-Encrypted: i=1; AL+hErEoOoiCrP/k1wOWdhGLgRzXz7S3zrnvaaj6kHuBPBiaqj2REDzLtBT8zTi9r2Uhe6kVVBTYTx+3I3nHfg==@vger.kernel.org
X-Gm-Message-State: APuU4Z8or7NGlVZ+HDWMibLe9iS/NNTlzIzVd6xsmQPk0s0ro9CAfpmN
	neuh9aT5ldtgrlseFZvfTdabEnvP+xXEmzlhWQFwcHLQf94wooTeddrdhoUq3Xk5GTSuG2fSwKv
	hHw5JjOFvz6g33+hEQYWt8yW9WAdY2td2eLaLNvsEraUZlf8CehNwUWvIBpjzKj5BiWYBSZJMi2
	ST9laUCAd+pVUys7gWJOXv92zixe1dLRK7jZyYBBZn
X-Gm-Gg: AZFdTZfw+cdv8Bm9d9XE0RbPZv1NJD9BLmpg6JA8X8EQXLc6Uynq66jXnuWdBKnFXu5
	73Pxc5vfcdzi/SAwGA6tNUXu31IkabAM8sCvAEkSVexpJY5PLbFf9mvfMAp56N/jKCiuSrgG9oe
	xW03AdhxOLAiLPcwnnV9cNzzOU15ryTrEe0PmYHQkj7hMe9R1W01PcLeQftHDoRRdUHImgySSBT
	jmFyt9E8Ino4UN3TcaNNzgmvYEaoMzKJv6b15evhzZN5y3auduGjx+d/A+5oxIeIyM3hRwotlDu
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id af79cd13be357-949ba9cd23bmr1618396885a.36.1795377072760;
        Sun, 22 Nov 2026 11:51:12 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:949:721a:184e with SMTP id
 af79cd13be357-949ba9cd23bmr1618394985a.36.1795377072330; Sun, 22 Nov 2026
 11:51:12 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-routing-fixes-v1-0-0deeeaca2622@kernel.org> <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
In-Reply-To: <20261122-camss-routing-fixes-v1-1-0deeeaca2622@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Sun, 22 Nov 2026 20:51:01 +0100
X-Gm-Features: Aa3M54q8DVvj5BuTbWloIlkkU2isU41K7yHCwAzHNhHp_C9LxH-6l0mb3H_XQ2Y
Message-ID: <CAFEp6-03ywJ2tow23woY4FkW2Np8r_Lja37zDH1dh3z4skYFZA@mail.gmail.com>
Subject: Re: [PATCH 1/3] media: qcom: camss: x1e80100: Fix CSID2 routing to nowhere
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 7dQCmvhKMz26GhXe_Zx2Bnx0wplRsG5I
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX1ALo2CktsoXi
 s4KZDA8IHnWR4fD7EBCiWkSkk9oxIwXNE55WmTekbprLj3GVwFFFaWRQB4LbNVN6jaOJTfFdqAJ
 ssa7qpiTA9Gqes35+BavJXeWg8cz3Ug=
X-Proofpoint-ORIG-GUID: 7dQCmvhKMz26GhXe_Zx2Bnx0wplRsG5I
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIyMDA3OSBTYWx0ZWRfX2suyl89TBY2i
 drDed8sbVv8DBFyMrf5p14iu++gAY/IvYUiPaQcIP4ExSkaVA2PJ/n1Z3EycfSxNcn4/P/oLpji
 r9SuEbyOjXFM4w0Ivr1Rx1axld/X41jbx1LAzYjSLycBeU3UzQt6f0xft/rL/XQ4csah2Dm/SRt
 OaIHOPH8KoWXvbwPgv5f1TeROcvcFe4WkU09Hd7KTO8ecGspLXWFHe9+FH2TCa/YyO9n0EScqu7
 xyFBYnZMSjuj4HSeT2PQMZUrIP/WCLlrBkla5ZqLcF3d7DrrxywA0+qKzcbfku/Gxaa35lL8ACV
 XwB+DWlgX1iBhVJBnG0XPrSyjuUPFGdvvbxHJrP4VXxVERdbuLBswvFGlKOUdXGS+qw2JgLuXcF
 v0w21tX0tWZ2W2B+nYnwFdhZYs00zOd0hgOauOdfHBodjJP+d6TKS9deQDEY8uyEqHK78kzSWHj
 rCO4PuUzXLeh8sAKQtA==
X-Authority-Analysis: v=2.4 cv=UbHE26SN c=1 sm=1 tr=0 ts=6b0347b1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=uV7-nGl-jdedDGloHnwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-22_04,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 phishscore=0 malwarescore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611220079

On Sun, Nov 22, 2026 at 3:10=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> CSID2 doesn't actually have a corresponding VFE it can receive CSIPHY inp=
ut
> and raise an interrupt but it can't drive any VFE write-master. This is
> basically useless and not worth coding around in the upstream driver. If =
we
> find a real use for this we can turn this back on. In the meantime drop t=
he
> definition, it only confuses things.
>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 21 ---------------------
>  1 file changed, 21 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 26e3f2aa3ef24..aa6d01d8fcb2a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4515,27 +4515,6 @@ static const struct camss_subdev_resources csid_re=
s_x1e80100[] =3D {
>                         .formats =3D &csid_formats_gen2
>                 },
>         },
> -       /* CSID2 */
> -       {
> -               .regulators =3D {},
> -               .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> -               .clock_rate =3D { { 0 },
> -                               { 0 },
> -                               { 64000000, 80000000 },
> -                               { 80000000,  100000000, 200000000,
> -                                 300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> -                               { 300000000, 400000000, 480000000 }, },
> -               .reg =3D { "csid2" },
> -               .interrupt =3D { "csid2" },
> -               .csid =3D {
> -                       .frame_sync_en =3D true,
> -                       .hw_ops =3D &csid_ops_680,
> -                       .parent_dev_ops =3D &vfe_parent_dev_ops,
> -                       .formats =3D &csid_formats_gen2
> -               },
> -       },
>         /* CSID_LITE0 */
>         {
>                 .regulators =3D {},
>
> --
> 2.56.0
>
