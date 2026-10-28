Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197200;
	b=Uv2wkMBnu2n0OCaCiyC8G/cePk57Ygqi0WerfOrqkMHSS/Zks31mr826pCrPB928fM2g
	 ToNjCQOI7vG1/A/rsqSw8zPbJad1QfVmLaLvYUaKK8CHedmipelDAyF3VnxAyJKWhc5r+
	 INUjj3qqakgoZOIFwPQZDT1eVxm47CC4MS7IfvLgGpL3hC+n2XDF1n1QxlkzyClmh5q7V
	 9m+RuwlXwmr3828f3eui1VVb5yjCGL/OJoKCyd2x6VAxIckOB8+kTbPKFMNhcG/ElGsqX
	 1b28l0FH853lSJrrOp4T6Hfod/ak2M9U2JA3g6BFpGy1XLRpVBZjs0Ry/yhxRVHuoHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197200;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
	b=w00iROc2hTdzsK+KE/QsIV6XRmyIyMBKn8V7J4QKIQYT3HpAHEV9zCJQsU5McW/RR0P4
	 NiEi3Hn7+T7k0kx4EaADmMgTReTddDlQdx27Td2HtNKM25uutVAVn6s97j3WpSJOKoVW7
	 HI7KJU65snulC6euIBZ2AWC3f3Stnnn0ZwvFBWSCi035FSE3BjLmqa8eCGTULVCbnPMYf
	 /PKDPsvWGA6pLNuMDLrQTa5w0aPMpdc5Dcl81s3YfAVmnz9pzjTH+0AvWjQHBpmdtd3v3
	 7BeCr5Fshe38J9qSZtrOn8bwA9504ig+yO67pmJkFuIdbosROmuKcq4EHJagtngTsEw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpXVKErx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14B5606A330
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:19:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C14B5606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=XyW708ld;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WpXVKErx
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBe2nc4154745
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:19:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=; b=XyW708ld3LtIxMLr
	pGg+XwKvx5S0CKMqGYZHMb3V9qIkQWuvgBlglaV3UsiCfBhSlO+BuPX7mlZRWVjW
	c3fek6v6x2cWIyTT04fw3ObhqkSdAEh41dcHvCOjqSbGAsfL4r9cteX7rZtkB4jd
	WmF3lqCQpqX1WrWFbltBzmTS9t9GpB2eWQkcLQaeLvt9EbHA0oiaXhJYmzugyGrj
	RY8FljuUFWljOLVLqBc+EH8cOwKDZpkK4npctZAxuCqb1wQYE1xSmZrDTyC+aZgk
	kP0wLrip1QK93OKTR/45CYRXwxNvlp2U3XTt00mHCb+O7TmmAudCh5g6Vew42sS2
	yRg0fA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hkdsp17gh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:19:58 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f559420f3so86908185a.0
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:19:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197197; cv=none;
        d=google.com; s=arc-20260327;
        b=cg6C4AltHzU6wWp4UCKc/4F6jEECeZqGbAB+ng2TY2YNGYt3hKPgGbY4HF/rOzrGaZ
         VkHq7GxbOHGMfuni6f5zTPY3OhaXMdpaRS7M2I/H++kZtFWm9yfc9v1C3MqoHVWxvKjY
         hWnAWlKVSsTtvIqj7m17odAy6mp0utnlQWourp+zJypDwXmPYhgloBftPfhMedtPoY1V
         rrc/GWgCDMqKMbtOvzMKBLjG2vBB+I6ldtHJFAvz9pCKiDf2okH/ZQetMAEqpc5d42s0
         qRudr489WK5RUr2M9DtFih7pvzHPyO6Agk+9qBHhxK2rkqe0K/e3WeSQemumQS8NjXef
         d90Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        fh=x1VPM+F8beWs0L/t9qAquQEF21zcYW+mnqnPbcaOm6Q=;
        b=eAlafL2z7hT+/jVNlHHGZsH/pbMlINxIpETNRhmlz/qgR7VMPCHKlMGJdWx1XdaZ9U
         d4T9d00aixTbTL6BiYMbjZwtBf+fJQ2KfQLUeUUqIAQYwEyxH1zuJSMOuC+EInYYJvdE
         xPG7v09wMYuDgUM52EE1gucu17x55HQyEHI+D5C+iTvf7xGeiJWFPDjVqJ5u2OJXXahd
         NFLun7hBS0gqEXGfVd//YazUWokhmguMyY+CH/Kh91c5FHIadKzwQv2A7TSCFJHUE204
         9xu4YEeBw5LVg1gyj6d856RiEVJ0ceWwPh/TQPUPDczWY3lbeHj11cWd/P8LCegfrTuW
         M/Bg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197197; x=1793801997; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=WpXVKErxIbyYTlg2/4OsiY8jyYxlP/mnR8JUW6LBQ7MpO740CUzOH68gb8Xl0PkCjE
         oGK7cpT5UbJHOhbfxyuPAt5lQ7YCHVQiZCNnQXPmQCjlsuh2IcARFPqa7TmkICTA0kko
         vu4Z/+pEGENGN+6aVLJOrQhdAMiyDLlLVrL4nNx4g89PT+KNPHvHIq3rGinDAXMJTmnu
         rwMAoQ3nQqGNo/iVfM6DXeP10bm7B+jSzqUNAY89cHiF0JILqyaGhp0DNAnwAC06CA7S
         d+97lVVyNffQyZ0hHySbmSVGJjtUEJAX+o/TSft6xLwwg6HXuo4+ZUzQJ12jsKHJHbHG
         kNQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197197; x=1793801997;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sjqXoqPS3GSg2+oKUPBpXTipKFah5Ifty0Jw4Alix+o=;
        b=m4ilF8cMl5KtrE4Horopj2NkGCnR7rqWYV0P8C9ZWHQtxmHPRYbgv6Fb1sqCP/fJHn
         1qzVOtSnClDYKeSiiBFwyc8EB0q5u5dKUn+4wgBrh9BpoQMti9CnWF3TPXaAvq50TQFT
         YvyeUv7gW8EWH1S6euRlmKc3o+Fyxte/HuiskZrvfQ1WEdQrJF5KlWsukvQ9UlDOohEW
         nfjRDZqCsE+Qfjbh6PSlP+hMxphaIAQzV6vXYkBCxWgcCzNrSs/JS1Gs7vPV0+7+FT6S
         AYJV3ZozlAFziOrxadpoTfeHdnrnyzWMqTR6yRTZai3zgBAWk2mk98FVJR8ZUq1SQMi8
         aJsQ==
X-Forwarded-Encrypted: i=1; AKwUvBzXlwpig6N7vtuyC8CuqfRfYQKbBbWKgzyBB0RB7OkLfT3UqKBelve5LDEIMB6U3XOHbxnJkv8SzEqr0w==@vger.kernel.org
X-Gm-Message-State: AFq9FYLerMCkbFvjlTUgxd0N7V+a/8kyoW3e2AQ4gqEGKV2bIWq/EqSJ
	JiT+/TZ3va98uSLoYmmUVI+QKOTeswXHyLzoHl0is2BM4DMJ5+F8vh9jALo/Sa9/IaI4BclAf5t
	GlRYHQhMrQHpcHbJCNHSO3ZYVect446f3005yyN4E35A8mCcmSXdf9HNTB/BMVGQY10cYAvsOI1
	RAjb9MdCwAudcPJJauXDu1FJsOPhPYAj+7YhH7HvlYqPBrktS9
X-Gm-Gg: AYBFou1yE90W3q6lVI4MQ2KZtBQwPcsq/N4UwoaRnKc+9H4z0+BozGLrOcXSZMwynox
	QJlTfjMdFZnlsfoZW18isHS1pGFILiggF1dZiCQclDJhIFrRiSnKYiyNPb3a/BccSpOBEGfUDE4
	t/gPK3nEA7ltyq01ZvjrYmHWwZO1N35kQ0w49Jf3Yp7cZjvavUYjaTsL8YJ7hewIlaNeM8mPBgU
	0rXXWw/DeRNErHKHx8doWFk1QhW1Robp6wSMlBLdbR20OMO+vmazJsuEcMqYgxHfOO81UMNXLY=
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id af79cd13be357-94408d08e5bmr375731685a.62.1793197197435;
        Wed, 28 Oct 2026 07:19:57 -0700 (PDT)
X-Received: by 2002:a05:620a:458b:b0:93f:237c:1019 with SMTP id
 af79cd13be357-94408d08e5bmr375725285a.62.1793197196764; Wed, 28 Oct 2026
 07:19:56 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-2-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:19:45 +0100
X-Gm-Features: AclHuK8kkq0Gqe5D0rM_tGuX-UB3ViZblls9exEieIKoK6z36eZPswD3Pd1PIYk
Message-ID: <CAFEp6-3-B3ub9giiSu5G_jJtDxv=D6+kxWqRao91GgjyumAp=A@mail.gmail.com>
Subject: Re: [PATCH v4 1/6] media: qcom: camss: factor out the VFE minimum
 clock rate
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: 75BA34Nza0b5ZEaxgQQU37s90lgGMInI
X-Proofpoint-ORIG-GUID: 75BA34Nza0b5ZEaxgQQU37s90lgGMInI
X-Authority-Analysis: v=2.4 cv=Cssq4X4D c=1 sm=1 tr=0 ts=6ae2048e cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=4dG2s3dy74NheT9wN7EA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX/S6zP59qjCif
 Xp27NkxZ9ppF7LTGAp4gn6dldDs9h0HdBaqCSmaGrygoXr21uMHWDZdwJLsFrdjJ6a2C1fKtDBA
 7d7JI2R9H8x/ipdckw4KDfM8EtdS5DKrUC1Z6EJlRHTFNI9L5GEVc28REC+KUH5LfrAIb/L2cjP
 uPqeN4XbsqbvEyMy0izC2F9MjuH9tAPfenNF+PhFMUwZ4ShIA03LGLVJKwfjWLII3r8Msh2feWR
 3Y0kLxOGw6BgonLvaFm11b5/QwwvoZPHOcAucWruIUSpMC5FMjM9EPy2GOXuZDL2iyZnGPq+tnt
 mz0sVnMS9lAVP/wWDp7pfZ91tqApf4spX4Qq6ilSK6J5/U/76c608zjmeBhJSmrIWeFxL5/4wHJ
 EtWgPFswy3UHQrwlTC3ajpO23L6p3CHvYfno15t7EeGGDmMxAJf2tg1xYd0yFE3biKxS7+ImF5G
 64rJ7BOn0YLzGz50KVA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX56H4f4omybZR
 2zL0EJQNMd1mF9Aei9RwXMZ+IhD1fsjcMwjsJG7g9dTuJAVsUwB/pdOtWj5zq2ALUIOudkQrUlq
 2lk+ue7t2WT8GE6G9aTYFDoVMaOu2Q0=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 phishscore=0 clxscore=1015
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> vfe_set_clock_rates() and vfe_check_clock_rates() both compute the
> minimum clock rate needed by the VFE lines from their pixel rates,
> inside the loop over the VFE clocks. The result is the same for every
> clock.
>
> Move the computation into vfe_get_min_clock_rate() and call it once
> per VFE, so that the clock loops only select and check rates. No
> functional change.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe.c | 108 ++++++++----------
>  1 file changed, 46 insertions(+), 62 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..59be37f83df3 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -935,52 +935,66 @@ static bool vfe_check_clock_levels(struct camss_clo=
ck *clock)
>  }
>
>  /*
> - * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * vfe_get_min_clock_rate - Get the minimum VFE clock rate for its lines
>   * @vfe: VFE device
>   *
> - * Return 0 on success or a negative error code otherwise
> + * Return the highest rate needed by the VFE lines for their pixel rates=
,
> + * including the clock margin, or 0 if no pixel rate is available
>   */
> -static int vfe_set_clock_rates(struct vfe_device *vfe)
> +static u64 vfe_get_min_clock_rate(struct vfe_device *vfe)
>  {
> -       struct device *dev =3D vfe->camss->dev;
>         u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> +       u64 min_rate =3D 0;
> +       int i;
>
>         for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> +               if (camss_get_pixel_clock(&vfe->line[i].subdev.entity,
> +                                         &pixel_clock[i]))
>                         pixel_clock[i] =3D 0;
>         }
>
> -       for (i =3D 0; i < vfe->nclocks; i++) {
> -               struct camss_clock *clock =3D &vfe->clock[i];
> +       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> +               u32 tmp;
> +               u8 bpp;
>
> -               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
> -                       long rate;
> +               if (i =3D=3D VFE_LINE_PIX) {
> +                       tmp =3D pixel_clock[i];
> +               } else {
> +                       struct vfe_line *l =3D &vfe->line[i];
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> +                       bpp =3D camss_format_get_bpp(l->formats,
> +                                                  l->nformats,
> +                                                  l->fmt[MSM_VFE_PAD_SIN=
K].code);
> +                       tmp =3D pixel_clock[i] * bpp / 64;
> +               }
>
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> +               if (min_rate < tmp)
> +                       min_rate =3D tmp;
> +       }
>
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> +       camss_add_clock_margin(&min_rate);
>
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> +       return min_rate;
> +}
>
> -                       camss_add_clock_margin(&min_rate);
> +/*
> + * vfe_set_clock_rates - Calculate and set clock rates on VFE module
> + * @vfe: VFE device
> + *
> + * Return 0 on success or a negative error code otherwise
> + */
> +static int vfe_set_clock_rates(struct vfe_device *vfe)
> +{
> +       struct device *dev =3D vfe->camss->dev;
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i, j;
> +       int ret;
> +
> +       for (i =3D 0; i < vfe->nclocks; i++) {
> +               struct camss_clock *clock =3D &vfe->clock[i];
> +
> +               if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       long rate;
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
> @@ -1024,45 +1038,15 @@ static int vfe_set_clock_rates(struct vfe_device =
*vfe)
>   */
>  static int vfe_check_clock_rates(struct vfe_device *vfe)
>  {
> -       u64 pixel_clock[VFE_LINE_NUM_MAX];
> -       int i, j;
> -       int ret;
> -
> -       for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++) {
> -               ret =3D camss_get_pixel_clock(&vfe->line[i].subdev.entity=
,
> -                                           &pixel_clock[i]);
> -               if (ret)
> -                       pixel_clock[i] =3D 0;
> -       }
> +       u64 min_rate =3D vfe_get_min_clock_rate(vfe);
> +       int i;
>
>         for (i =3D 0; i < vfe->nclocks; i++) {
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> -                       u64 min_rate =3D 0;
>                         unsigned long rate;
>
> -                       for (j =3D VFE_LINE_RDI0; j < vfe->res->line_num;=
 j++) {
> -                               u32 tmp;
> -                               u8 bpp;
> -
> -                               if (j =3D=3D VFE_LINE_PIX) {
> -                                       tmp =3D pixel_clock[j];
> -                               } else {
> -                                       struct vfe_line *l =3D &vfe->line=
[j];
> -
> -                                       bpp =3D camss_format_get_bpp(l->f=
ormats,
> -                                                                  l->nfo=
rmats,
> -                                                                  l->fmt=
[MSM_VFE_PAD_SINK].code);
> -                                       tmp =3D pixel_clock[j] * bpp / 64=
;
> -                               }
> -
> -                               if (min_rate < tmp)
> -                                       min_rate =3D tmp;
> -                       }
> -
> -                       camss_add_clock_margin(&min_rate);
> -
>                         rate =3D clk_get_rate(clock->clk);
>                         if (rate < min_rate)
>                                 return -EBUSY;
> --
> 2.34.1
>
