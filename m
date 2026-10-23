Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792760034;
	b=wDLuDnzqLC6dMfpdSju7a2Z7O2SiTgQpYAAfiKltPjJ2GirJcmUusmY9z7DTDofVsV75
	 fP9n2Y+7jT3xQlmUYJUGNNTV4hj6u2G9HPSJTCH8fPDYqgdWUi9rHQoccr0WZPCeLUMhu
	 SHsryni/7IzcRemSVvhRcVSJLFpz6e/8jTzdPw3vZQpzMxU/JdDSA0nxlTfEJQvv01EIq
	 zCuiX1hIa/NyAuXFHnPmrOrV1z0P6ZcKx2lYTdlkFdHqPWMJdpIO8Bim6YKVOERRfqVn6
	 h7y2tQOsRnZMGbkyZ7t/N25nQlHJxILVAH6YeyeYCiAgGeFRpJgTve6GJ+2QFfje2tg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792760034;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
	b=qjNtIb+x77zzjDaHeaBXENlIk0xLMsVN0nBJ3dAMeaNEHDv7q+aAak/VsB7lRoYZpjq0
	 TynWaE0Uk8bsax+/8odUL/3cssnlocm6JYYeal8wPyV7dUhK3ynVq7qcP3wkZ+h5Br1rc
	 R60tW5z/xG2pqTO5Xnfrsu2h4Uolaq7c7O3jfSzoO//0++aGwYXIg0zBivfAXHi2fuLUs
	 54BS4OkCbPaw4YyJDxiVAprh7R6tu9qUjYzsc3PtWXNoRim6U9rkPpbGv6jlICtbmGDMn
	 wleynZD2ivUIsXAWkbPfX0n1dqBeoUKQIvUn3Q1KAWVT8GFkZxJxvi9JYOhy9PRTXqQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0145A606A31D
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0145A606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=k84ztsh+;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gXls9Rvn
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAARL13550444
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=; b=k84ztsh+ot53pSBG
	jiTg1dSaK+oMQc9D7xA+HgHuOZWpuLp3Bvqo13JWoqTssTxPnu3DiCT7aw0xyXnE
	RT6y4OMl2AuO6bb97phV2Q2m27M9GBi+txFNJy1PnbrbtbWgGuBBy1jGT2o2Glyj
	VtnyZKcroVaq5xaitlEzPXctl1jOXjsw6ATbcxQefKFGiZrgJnoA/18skPLXlTuh
	i4HYKYHjOLvMbY5rmQLJ8C4xlHxY5RgSJoXH9e8lf1AONUjVv0nvRMQ6P1Yh8p4g
	c5EmDXZp6s25pmBjf/L5xFz5xkwVWZ+6gPkBsrb/Ycyhvxa0apN/1TYNBwIMdN95
	ff14Kg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrbqcx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 12:53:52 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-93f5844e383so157536485a.1
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 05:53:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792760031; cv=none;
        d=google.com; s=arc-20260327;
        b=hjq+3ODexdHjyNc9GX7UaEbapLPrLTixVG3hKb3PNU/kzBJn2+8I+Vd+88JTQ0GkYL
         ZvZF3KrkesY1cjwdqI66KCYfEtIUrQ2oxEkX1oyP3R0bsKssGA7btUzQLlQ9+CJeosmh
         kP5eD1fZkAPCouKKdwq5MX3fUptcYv+ndkJ5YBXKJyUFVcDYYWxmugz+1WJ9qIYWDQIp
         qLTIYjh6dstxpyyc3IoLC3ZFh/DLo8h/EUkXuv7i8uJf/90GpQymazwWAD7gO19Wv9Ww
         yVYJAczseeEtAyKgnKuYNzyUCSW8eRw0MHsCsPAt8rj0j5pALPtblYIwqodh+/YQ76bi
         h5NA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        fh=CGmKIM53MK6/AdATMl8jdh/DldyjccysFXOGUJxpK6M=;
        b=itst2GYTtXkUNm5ZVAa7SK4wKRimtuCMGhok64URim2vZzp8zyvsNf5wRqNR38Y4sP
         CgBsGhlFAUR7Q1jf6cAJIkB5IpqdkHBFpkIEHM0uZqkfGtjOpZ7PZ1xgVGDkALc0dHpL
         p+c/IaEkhJJXo9ozZGJVVjsG18v6rB0N7YYvcxDVGN7Q+TRaxrQbnqTjUkSUxaeLPh2h
         B5+ZinFGcazn48lPzhNgV5jWd51inC9VxUvsQoH3O1hfBId5PCGt0epsNbx3YBB6g0+l
         qgo4wkTCImgEcBX7x8iNgEIHwVoGkbVoDDvcO3NZHGDRo4OqUYh9Q/FxljrfW5dm7Fe9
         vMKg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792760031; x=1793364831; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=gXls9RvnIYR2YK5cmUlO7e3CR8/MOnt1zZSp4Py9+smXc6q/yEf+3cA7UNdcAvtl1z
         4mTmhog5wJzLRPuL6fL79LbvMHtJxMq5jKJDzFHPN30fmTlGssKoMYe8iaSV0pqELicK
         zjiQfjKajbOkIlNR/miwiSjSr57KDQzYhYC8qEw4oiaLO4Ni7CEOJkTMrvhm8zh2FMr4
         h8u/pD7gZMQFDHJuLfRBQhQ5n++Ru+3dUKVwyjW7epYIEkUR1ZqenmYtx+bXJyLw3ytT
         zC/UbzFFWX+BFsZXhIzh73yMbKpXQnQCb9NsfYF9RK7pKqXsn+Zie9geyE0xn6Jvr5Kz
         zB0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792760031; x=1793364831;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZL5atUgQF9xYrzrdZd3zMmp+VtVfbiUmv/5LK8lZfT4=;
        b=yxP/buGRUdY6L+vV0uYZoKmbychXO8iPSmUqmRKaNOqWVCViY4abjc/r6ewbUos0wJ
         nZktFkdcwSZmAbbUyEhwFnIVPthVAOWjqMzARZkNYskVZjaQwgoHelU/IGpUWK6rUwsp
         iud0OwBv3Q1jfHpo4fVy3rDqFdS1lVHaJIem43ibQEReyqCpCTD9JheDYW1qCzNkmLLv
         e9As3MPAOwvbYrRuCrVQLB1H5NZVD18EtEqWoTRdpWFduQWgO68YYYVSy2y2miJSWnJc
         eRow3JMDaPFQQ9VNifkmcnFikvK8lY8kwdM4/JyDnC9/lHJfgKienETrYqWWgycN5dF8
         Osew==
X-Forwarded-Encrypted: i=1; AKwUvBy4wRHIN5dG6UeUVbrMNh/YnoF3mxnPWqWDgo9DaHFw6b+w+nM+J4p1+5aLe6f/6CUMMK8e0GwNgATcbw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIn03uNHbJ4GOu1yOB2l8WeKD/XTVFcfHaz1ZNB/pqafitYYuwE
	jp1EA8eCADNCSBm6Z0wb/XFw3jsYZ9VF4lhtfX4hMZmGHkFSCI5tNdl8KieYQV2NIXp9H+2Pca5
	8l3Il3XoB9rYZpLIk3Jj4ROHxGO4oAU2W0cyEZCvbEIu0La71Jl9tcVFkRYiPy4yo4ATNBLfI6v
	bJV0W0BTwcLSCd9vFI2ZoQxrjFXQLXQnRLXXaAEOT8
X-Gm-Gg: AYBFou3J1v26s8xTZjDnfSYPecpKoRiiJB7nOQk4qbqVfQGM/wq08LVx/ygAYm1AWAu
	6pxM3Bek1tcbDjK6dYQVvUAtBzODvl9HqdW10XS1KZueLQClw2J3Hw4Km0O+MtG8GXkeZ4cxfP2
	dD5EhdJehUakwV0AcvrsVulsaCUFrv+4Bms71IoAgMfU2NCT85gR9smsU1aba25NZkWU/vM2H66
	XFw/nkTmL8ENAkf4bkBmlYe2ODgMWwjYTyMAEScBgU1Sl1qlVMVDgRAnZVEpe+qLAyxe02zm6s=
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id af79cd13be357-93f6f9b51femr330273885a.57.1792760031042;
        Fri, 23 Oct 2026 05:53:51 -0700 (PDT)
X-Received: by 2002:a05:620a:2608:b0:93e:7ec0:7c63 with SMTP id
 af79cd13be357-93f6f9b51femr330270785a.57.1792760030624; Fri, 23 Oct 2026
 05:53:50 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261022071418.26895-1-bjsaikiran@gmail.com> <20261022071418.26895-3-bjsaikiran@gmail.com>
In-Reply-To: <20261022071418.26895-3-bjsaikiran@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 14:53:39 +0200
X-Gm-Features: AclHuK-A5Hp4e6c3qITTZozdBZs-UH-SXsDSTVo8_muXWDLKvdme3VTjvVNKGIQ
Message-ID: <CAFEp6-0cFMSRcTsgOSvep3unzb+vwFGTRaQCyt8eYrw=Os2L=A@mail.gmail.com>
Subject: Re: [PATCH v1 2/2] media: ov02c10: Fix sensor power sequencing
To: Saikiran <bjsaikiran@gmail.com>
Cc: rfoss@kernel.org, andi.shyti@kernel.org, sakari.ailus@linux.intel.com,
        hansg@kernel.org, bod@kernel.org, mchehab@kernel.org,
        vladimir.zapolskiy@linaro.org, jishnu.prakash@oss.qualcomm.com,
        birk.skyum@pm.me, linux-i2c@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: aFlNMlee7ROLAocwPpBNa1I7oaaCM7Wt
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfX6LnE/i2PcsCr
 5yopOh6AWTE+fLwg8sHqIDksL7kAfJDFgMobt3VxGbDzDApZkhzN3LyTZ0Ya28N3S0Emw7uqnVQ
 ieBh7ouhUUqcm6JKVKrkjA18xSwriDs=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb58e0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=WXF1KB85Zuouuk2w01YA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1MCBTYWx0ZWRfXwYyPWEVwN3gM
 y8m3rzyc/tyINsz3VAakrJX/IO/7wb7Ps57jRIjCHx1FdkHo2sR9YTWjHD2Cv6J658xJegwEoHC
 dXPwGi2w+tHXPwxp4OMXdGHGPFzR0N+YCxBLRuwWUxPMhpZn6vzlh0+tSMk8pEVonPuHFq0ERtE
 xPtgWf+fNFcEVro12jJqvVwmNQEoaQIGswCGzTW7Zhi3EnxJxs19nVNv5HqhiwqPweqoKbo7XR9
 i8tCcaNkrBcf99Q2bTNAC5oCHUA5rYqJl9WsWMf2Inxx9Kf5nMHOisRY+6gT0VPfQYWQvUQWg26
 Td7XHkKlbYU0CqT6r+VwCzJuSRW+dzF6rMsnxvgKHMb+GIyLYnuhx/vm046o0iMNBpUKsTvxrdv
 YZAFfqKHaTpCxAMnW7cCIQ7Iphd1wyEDIw3I5yKnljxDSwlM5U7YwBd1e9WPo3h4JGNp1np+CLv
 rIBKbPGEdb1LVon6GBw==
X-Proofpoint-ORIG-GUID: aFlNMlee7ROLAocwPpBNa1I7oaaCM7Wt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230050

On Thu, Oct 22, 2026 at 9:14=E2=80=AFAM Saikiran <bjsaikiran@gmail.com> wro=
te:
>
> The OV02C10 driver enables MCLK before the sensor supplies and disables i=
t
> after the supplies. This can back-power the sensor through MCLK while its
> supplies are off and contributes to camera brownouts on the Lenovo Yoga
> Slim 7x.
>
> Follow the power sequence used by the firmware on this platform: enable t=
he
> supplies before MCLK and disable MCLK before the supplies. Hold reset for
> at least 1 ms before disabling MCLK on power-off, and wait at least 10 ms
> after releasing reset on power-on to allow the sensor to start up.
>
> Update the power-on error path to disable the supplies if enabling MCLK
> fails.
>
> Tested-on: Lenovo Yoga Slim 7x (Snapdragon X Elite)
> Signed-off-by: Saikiran <bjsaikiran@gmail.com>

Should it come with a Fixes tag?

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/i2c/ov02c10.c | 20 +++++++++++---------
>  1 file changed, 11 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/i2c/ov02c10.c b/drivers/media/i2c/ov02c10.c
> index 221cb93126ec..42aa43ea0a22 100644
> --- a/drivers/media/i2c/ov02c10.c
> +++ b/drivers/media/i2c/ov02c10.c
> @@ -661,12 +661,13 @@ static int ov02c10_power_off(struct device *dev)
>         struct ov02c10 *ov02c10 =3D to_ov02c10(sd);
>
>         gpiod_set_value_cansleep(ov02c10->reset, 1);
> +       usleep_range(1000, 1100);
> +
> +       clk_disable_unprepare(ov02c10->img_clk);
>
>         regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
>                                ov02c10->supplies);
>
> -       clk_disable_unprepare(ov02c10->img_clk);
> -
>         return 0;
>  }
>
> @@ -682,23 +683,24 @@ static int ov02c10_power_on(struct device *dev)
>                 usleep_range(5000, 6000);
>         }
>
> -       ret =3D clk_prepare_enable(ov02c10->img_clk);
> +       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> +                                   ov02c10->supplies);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               dev_err(dev, "failed to enable regulators: %d", ret);
>                 return ret;
>         }
>
> -       ret =3D regulator_bulk_enable(ARRAY_SIZE(ov02c10_supply_names),
> -                                   ov02c10->supplies);
> +       ret =3D clk_prepare_enable(ov02c10->img_clk);
>         if (ret < 0) {
> -               dev_err(dev, "failed to enable regulators: %d", ret);
> -               clk_disable_unprepare(ov02c10->img_clk);
> +               dev_err(dev, "failed to enable imaging clock: %d", ret);
> +               regulator_bulk_disable(ARRAY_SIZE(ov02c10_supply_names),
> +                                      ov02c10->supplies);
>                 return ret;
>         }
>
>         if (ov02c10->reset) {
>                 gpiod_set_value_cansleep(ov02c10->reset, 0);
> -               usleep_range(5000, 5500);
> +               usleep_range(10000, 11000);
>         }
>
>         return 0;
> --
> 2.56.0
>
