Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793610941;
	b=ZtdpL4rUL18iVv/jPwfU3XTIW5S4nDT9DskQpuZZG9juL0S5ZzKtQbhg55VNyfy9wAiJ
	 jFMu6XGJ6T/6f9/Lo7kG0wPcqxvRtzZ/qN/0AMc74u5+/bXBcjiCA0IVX7wWxuCKU6xhF
	 41etfhSH+SrOGZjVu6+1kXsBe3eQV+6P5Z6HBWGNdl2Zfv6viU9NueD3/sSYgFGJupIlZ
	 oLT1qDiuLkdtY+KzYIWutUzxfIWGoAhGq8bUTTflgpqimwoU5Bdh2YZZ4TZkvEcMKXKER
	 UiUKNTQpJyrtNE1o1jKoEj+wmgtwN8tkbcCfT2CJJx5L5I2zbduzfQRWZ52s1Up4iBQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793610941;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
	b=KQpodmDwJwH+0WWba+e71FgEUdUBhyBCKdEu7TfPpc2HWKv8a6eMgVDBVjm+cXYa1Ie6
	 xEwafTCPsmbdRmTT4mzKC0ilWgcWlI6ESsAp0+rmCIvsgXr6PR/J0om3/bo8nF5YPzSbe
	 50HyhGxzxY9ZOTKa9UPv/5tvKNTLrGla7/FwP6gfDxPJ56SsxLpxhzDq+kHjThKQuvaFh
	 YHDgdeFkCEEIV1SMptHmjb2mdWXPbI27k/Zk8AefXT9O3oOnDgz9YUJmqKeDadOxW59wM
	 wtFd7UZyJcaxk/V5IaAzIkDx7eozO5Ke7UO/HpWKUeQiWPqjCpQSLw9kcnuCaA7lucA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C91606A326
	for <linux-media@vger.kernel.org>; Mon,  2 Nov 2026 09:15:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98C91606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=aar7RgYg;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZTEQuBhl
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A299uKx3402352
	for <linux-media@vger.kernel.org>; Mon, 2 Nov 2026 09:15:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=; b=aar7RgYgm/5vhEdj
	Aeyu59+LXbpUVGQmFfLAiggu+wtMIpPNQVUTrqYg5iuP9kUgZfDHxWOdBGmz3h+K
	vuhuu0DSQJTz2KckgrCwIUaMgkmCdLPkh+JlWS83pBVTLuWlKjn+YwK4odeCYLZG
	fiikjVokI82lMXGA8p/2YSEaIWfD2/1m1kEJtLRi7xINpR0bVNW8pvKsCz/4beIr
	q7Gs/gZtn/8AeFxBc6nQXvu7veF2z0thrVus1uM9dBNwSdrTi6tIxE2Y3T+rF+66
	J9ZepK1SYGOOzAJYP6GO2yni4ixlqL3fGZZzy4eRD7d0AwGp7qGn+FO/un3d81HR
	FeiWjA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hppfe8bt5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 09:15:39 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-943e8ff02d0so239550985a.2
        for <linux-media@vger.kernel.org>; Mon, 02 Nov 2026 01:15:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793610938; cv=none;
        d=google.com; s=arc-20260327;
        b=pEA5XQ8HoDkArjOb+zaQH72WYmGEG8+Gms5MDzFG86pJkj1eV9O0+j66djnk5eF29d
         1mhLuZ8z0o7Br+AQ4iFFVCsrUFqjqoBHbkWFknkTakjlAnXcpKLSFfpHMBy1LdIZj3bg
         dIqdFFbc12q39GYdx7py2wKZMwChDpwOui2DcTxhbjijfAmCcw8MxmC1OBh5UQyD4WgU
         D44Ndb4ivMhDEMLS1tNkMoi2BdcHm26Sa3coSqx3GVI8MVeYT6Lxv5JfYVKSKGTajNqa
         GkeJUL39tVDJ5En36Sdp2GXVl+nQpCQQOo79nyJLUSiGM74QgP1SRm8liN2Ae57Por47
         JVrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        fh=jakf+ldfM4osBeFnCBz/Ip//SeiGkHDnfYdPRIcnrk4=;
        b=ByBiLHV6cn/DP5K5leUTS1QIkCHIlxF5M7TgE9nbWPMEyEDZLPzwHAZUtN1gqqxbPL
         dyHepWDP3vTSnSFVcXKAWFbkdV/1gKo7P16xgJ7tDT9DYh7hzeJEPstKK5p6DERZGyjf
         K+TSEAdHfYKAx/9KPVqkBYdbiyrA46rvC4kMrGTXnUrdSAGvphLY+rJTWtaxhpj3ycsn
         IDfpgsegsWhet2e4OeY0vsZS5Kk+4eAoj3q8digKHH1lIROUPYDywsweqPDIWBapRHsj
         Ze4Psl5PzETa/s15kKjlSJNUKp2oDqB6wqY6PlwDRKOBOoC1qAKyl76AYLlmkOq8KA3C
         M6vQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793610938; x=1794215738; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=ZTEQuBhlquxXcghAghWe41mg7QngqBllRgUlvQT9uehPiOd06nBqHXJEca/YXjfHEQ
         eIZqKvQ5MthODkagbQ0jobFFQfsMNmHtJkX6nmFKd47KGseqsN9IGfkF3y3mg5yhyqWd
         yVIOhkDbgGIL96ilx5IBh9xeBMKNVhgdhAyt1zqfHIn60krvrTaCX+HKjaTs64jJgLkG
         VbTE4b3ZkW1HzUtccdnW0VJ1bgWAqRTjYNRVf1mK528NcVcuAvJD60PjargNsljWowvj
         NyK/91lxtwwmazwTY80HeHRu8Z0X30QNOkdZi85PD1AP9KF30wPuOLvO/mrgJTUn+AdC
         hSgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793610938; x=1794215738;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Tw4Il/543zMhXi+Vlw1yVPrTNlhNw08frbkre1OFtwo=;
        b=stZZK6gpUcBQGcvFK7ho3S7DiDRuzRm+Ktou3KHQyrgG0lCeO8YRWr33MNcil9FYnN
         fBJTy/ibayXHW/RW1dq6i2LonuwK3OGF1jVkeigUe3rmgiwxzAsNuc+exIrTwkVkzR9x
         BX3LrZvNVrAA3zzhVummsND87wXWOw0mJmJ5GkH6uISaRUVcwNZGoxwS5jHdk2U2wsfO
         XHE8hQoOen4mgrwkz+5GbaZegZhOZsyIZEKv2l/d5Kqk8wO09EjQU5LUcaL0s2/lsKzO
         VdDG/7op1e+2p4gHdy0760BWwQFWuHNBMwf3bxTNz0bcZ4uM/krw6CxGo5pOzNVeaXZG
         /jFQ==
X-Forwarded-Encrypted: i=1; AKwUvByEJyzZGIT+BPYl368OljftJhuF1mtAzXZPIMCSo6GJedTGZlPj4TTMQCEq1Xn0D/i/EIBSZs7rbPXHgg==@vger.kernel.org
X-Gm-Message-State: AFq9FYLTWBj7dtlKYkKqw8RkuqZZ1KreN/HbffynbZuWuo3buOJ790/T
	ihSzGx9vfC8d1++qZWCyNp3uBahZSlq7DfelHj55qwn+5/aBxHXKsgRzYTvEeIEi/5Kf4FCfMAS
	VBDRDO/EvLVWE+PuWaO8Yvom3Zsfu6gq+lznlbJkTIULgc1Sk02kJ4nbwNGUetRhygv1fmOfILV
	qaMqb9/crDfhS6ky9WJCdbms38Cpraob/FJvCeadaja/zWbpqhamxG+g==
X-Gm-Gg: AYBFou0pgdTG03mQlQwWo61IykQQPWPokrc+CU+4Gaa27aP5Wra+OX+EFXGrZxVzST5
	eJ4GfY55IqTUr8Od7yiV8O2bDqJQF94rzlrs8TwKkNGOFlrPm41NtbQ2Wr+wtJ3JKYnrb/JK9JZ
	Orb9QuiZmSbp0hzA7caU6ruaQa7gQ2m6rTu79EZ4FJMxzM6jCsHtCsuHJM8CGlyyixfNd84QRvu
	U1HxKxxnCux3R+tVfknf91oPqiO9vPf+AK0uZPg16ZYN79AuuXvt3oS+Q2rSHy+sb/XhuV2WAA=
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id af79cd13be357-944216b7459mr1546914985a.13.1793610938024;
        Mon, 02 Nov 2026 01:15:38 -0800 (PST)
X-Received: by 2002:a05:620a:1d06:b0:93a:2611:270f with SMTP id
 af79cd13be357-944216b7459mr1546910185a.13.1793610937520; Mon, 02 Nov 2026
 01:15:37 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-3-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 2 Nov 2026 10:15:25 +0100
X-Gm-Features: AclHuK-vXfGGpfTNdBgvUtbM93_wYn9Fa5uzM4AszJQG5UxZU_Wa-Rfb9kFn0d4
Message-ID: <CAFEp6-0ymJQN=9tu7HOYHdvRheAU76iyn3KFcVVgf0j8SDbM1Q@mail.gmail.com>
Subject: Re: [PATCH 2/6] media: qcom: camss: Skip TPG if its registers are not described
To: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Abel Vesa <abelvesa@kernel.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=SeZi5fRu c=1 sm=1 tr=0 ts=6ae854bb cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=HTgco5He2NIbjNvQVVcA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX8f24o/kIu9/c
 3dgZCjGfWAny6UtY1Mn5kIWuU6/Io+2+cAtbetEJUzG4dTBU53CBsg/+79/KXYhjxDkhUn2gSRf
 eEezl/j1PZ12ZN4XXlm0TVWQmDTlIfC9ioqrM9wt/tcgRaFXZpY4U+h1AjT9dnN/OiY3ODc8TSP
 4EY3psHZZEgqJOPOn7N3QmyMd4hqO6AcrhAAWRjdt2wZHgMez7zc3GkB7P4NbDXRtvcjrFMWPVB
 zLpFzg1/BCW0CzrNoEuWmAOshXAUd/r55ycRAx9gwfo1fAYBK0nMOW95Bxf6O9kpbzc747BnFHf
 wkeMS0Tn0euRAI3qHUUbbv8yaJvubLD2NOBlFwwAfihEvUk2ynzfB1v0gXfyIiSkkFvD0+4lLB9
 t3cp5Tz9UOZuycKNXGljN1CpLWFc+BPIHvUDUbRnnn/S88rhWsdZISKLa5ADMMziSxBcpjDiysM
 e/hmQu2py3FDupvdARw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDAzNiBTYWx0ZWRfX6jB1cvKjBTWu
 6zq8JqFzGQoZ1aT9FubiJuQgP08HJUGodUn6VR8JAdRhtiBTN4dSn56oCvvZbTjS4xnd2TXX4/3
 44AewSbzXmJII3mgBn6km7MQkChuUns=
X-Proofpoint-ORIG-GUID: FTzl1DUxVA09Q6kSSPFJ5E1dofb97Bf7
X-Proofpoint-GUID: FTzl1DUxVA09Q6kSSPFJ5E1dofb97Bf7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0
 suspectscore=0 priorityscore=1501 clxscore=1015 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020036

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> If TPG is supported on a platform, CAMSS probe fails on a device tree,
> which does not describe TPG I/O regions. However support for TPG can be
> added to platforms with functionally CAMSS at a later stage, thus
> registration of TPG subdevices should be skipped for sake of backward
> compatibility with old platform CAMSS device tree nodes.
>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

IMO, introducing a camss_has_tpg() helper would make it a bit cleaner,
but the overall approach looks good.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..cf4687a20dba 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4965,7 +4965,7 @@ static int camss_link_entities(struct camss *camss)
>                 }
>         }
>
> -       for (i =3D 0; i < camss->res->tpg_num; i++) {
> +       for (i =3D 0; camss->tpg && i < camss->res->tpg_num; i++) {
>                 for (j =3D 0; j < camss->res->csid_num; j++) {
>                         ret =3D media_create_pad_link(&camss->tpg[i].subd=
ev.entity,
>                                                     MSM_TPG_PAD_SRC,
> @@ -5434,7 +5434,10 @@ static int camss_probe(struct platform_device *pde=
v)
>         if (!camss->csiphy)
>                 return -ENOMEM;
>
> -       if (camss->res->tpg_num > 0) {
> +       /* TPG register spaces may be not described in old device trees *=
/
> +       if (camss->res->tpg_num > 0 &&
> +           platform_get_resource_byname(pdev, IORESOURCE_MEM,
> +                                        camss->res->tpg_res[0].reg[0])) =
{
>                 camss->tpg =3D devm_kcalloc(dev, camss->res->tpg_num,
>                                           sizeof(*camss->tpg), GFP_KERNEL=
);
>                 if (!camss->tpg)
> --
> 2.53.0
>
