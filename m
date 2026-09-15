Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A9C1472F9B
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789467442; cv=pass; b=MRbCB4hHh3iMNzfum82XN1C1OET8opIq0eDHGKNX0x0vTINaRpM2RtLYATd18Dv3jbewFHG5umIuIYFLdBsteWLMSbr9fowbwukAY3e5oYmTUOitFYegfBuyEEqdlinIkMM1pirnvq+N8BSbn8tZ39rqMvGArBqYa3NYdMI966c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789467442; c=relaxed/simple;
	bh=MSWHoWGIFn+iwFs4suHXdlxtL4JfLcvYlTQxB2Sr6m8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Om2lCEo0wxIN3E5CE4N0WM5d2e4u5k39u/RNzxoE6NUZ4ENBA6rPBFLI9cowPSm8z+taoCtRCrv9hEEDfVYcQdZSY20MXWXPrvZvzICZbYqzz69spzgYE9dOOHYqQLiwB7Ncr+XIkhbgPLCmhuf/gl++5Z7Xzma++YiMlJg4zlA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NwlEfJCk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=kgB+WPfR; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NwlEfJCk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="kgB+WPfR"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68F9hEDk3911947
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:17:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=; b=NwlEfJCkHhcoeSOK
	bmZITvB9u6oxNjBQ7h8OqvduG6KCTuaHaqtd6r7UtHxSq9vvGuJoYmXWue24/YWs
	MB609WXQEURRd/LJndkTYQ6tbZ9N3xKbp9j4xqrmYqudZRmUR23aOjb1wiSMl9x2
	WraC9KiG18nhXL5+RWojUvSULL38a1AVIuq5wq4oC2SIwPK/yiuq7QxjLvhDS92V
	TtLI4pKdvjibQRzT//j2jYyCCunekiY9BJgaAkPJB8tYYO6yH9LJwaixx9l6rHzQ
	CyuIomy4EwIApyYEM55fZcqdQ+/gbGyH5NI4FWon/jf2iN0qItqpwrYceAbbhvzX
	5kbpMg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gq0jes17a-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 10:17:18 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-52f9e903b02so11848141cf.0
        for <linux-media@vger.kernel.org>; Tue, 15 Sep 2026 03:17:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789467438; cv=none;
        d=google.com; s=arc-20260327;
        b=r3cXE2jAw/Y5Sel/Wmgq5+z5QB2cK8JTm8YuqcESweeKEUkRtt1Ng0IC09OUNVoC6B
         YSH2NLxE93fkoH5RGnkz6iN45G8aqlVd8ru4fKH4lyVQkZCL6t29QzajHpLQ96LKHBrb
         a/kefzOdjKcc1nkWnX5WciBlzaf1Lm6VilAclkOVb/z/2nrEHMYmOKeajzIAxNYgUYU2
         MCvvgkdqo7R9CrX4Kl8caZV0IGy34RWaleeGL3lJJxaUEpPyRL99s1LO0m+Q+o6KGMY1
         OtczTu4d8VN9AAgenM5hOZlE+HJI+zDQ/azSzOHjvY7V8YAB6AhPXkn+x8prdyBnNvN3
         zA5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        fh=feoSsMQxEStBBxiYU+svT1XwTXRIRen+XP1Qfq/r0yw=;
        b=I5NJyS1cAmdqXpfQ3bwpUwNXDvvIooL9yXLNvaOnxG9bWzOWLYStVS1i4qh2he/Np/
         uV8ARcLeD8F/ZzZAEr/u4w1JdMzmZ8JJ5qNZttTUNN4vLdcCM1731AA/tYiRTdScxCVG
         9TYxaLYsPDF5JKaiymqFWteMPrYirXpd8o9BWgr91OApcsjT++h+WnLDULZ5vkWogcZn
         PCl/HoIfbQDY+55SlHdnQ4QHyBVkUSoyHg1uqK6U0JGi3spHW59ixyS/h8yA/lYRlK86
         SmUR7I+/VCFi7sS7VefC1O0ydGNdVrq+0ZaELY/o6Dk1qHTiDabGtUAJjgTIgGdhG4yV
         13cg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1789467438; x=1790072238; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        b=kgB+WPfRNtBYroWJuT+BADNoMFDxeZv2ePNsQTVDgIz8e5BxZ/O+MmxoFT60ikZgvY
         0Esw2B42vJuKSEnxNi+8xU3/CTaw75oEPWi1B8B0jZw8y47f5T6hJiB84sUIZrDc3zfY
         uZTdmgI4XQfMzpCs7LRJtck89ODH+3V25mEPr4W11mt+0lBPQoGJc7X5ZONV+xtCdx9H
         +6YncmshYoN3FFsDNVIuTmcsvitheVo7shMQeUjL6mlzpd90EGHXukKjJ5vewjuqZVzo
         GpuLTdhka34ep3JR7bsnLHlgkOqeX0KtTjVGx1N43aQ/dCZDn459wVA3oztAsR/8wt9s
         bVhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789467438; x=1790072238;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y4oAyrq2KtQXNsE5MFIxXDu1u6My17cNb8DrQ/MjMRk=;
        b=yH63Xv1hk1qSRkGLncbQyhFlDraC3V7hGyxlNbwhxAGhCIoo5xqSopGYUXxGKxS3UV
         GYfj/MmAh73tQJtqvcCfyNgs1ruwYAs4EN0DLg/jGGjLEjyIQgPeEjPeUae8Zem7AxQk
         AeTn918aN80dHYvUClZr7rzOyef2cJ0ph8Fzs7eQSU3VCGw8RNjrdI4NB9kk83corLI3
         hUdm9ilqlUmxogQmfSkOZcYZhOd4tz64g0qofg2F17LI4UV2OypH+UlhsHvm/QNORy3k
         ortqO8nKZxbqk9k6OcFmv4dZqgCG5xDJ7wyM7BexFuIIjpbcTMMhodKjw53SALI5Np7x
         MgrA==
X-Forwarded-Encrypted: i=1; AKwUvBymCMKVXxSqFsfrotC3ZWM2sJQRb6VAoIHuORhKwoV6GXvmm3Rn/OwHMzKlvga5K6KhyjfCwRcugHKU1w==@vger.kernel.org
X-Gm-Message-State: AFuF++n21A3zGxdff//AbMqCY2AJEfSoUn90g9K9h+d0dl+s8Q5bpgzT
	dHrUgzZA0vNLu/JEiLhQFO4Kipv28T5k7HP78LRcDRaHXZQuAlYjj75NIkVONvDGKZ7mWXoWXIq
	Ef5HvE9herKf94OrwrOfedMDRUa7KSjPWUlK0RPTt1jaVZBC/ooY4+aAuB5vPu0FfF3AMG1VE++
	cpPOtRuJ3JkzWXZiuUHC2VYBSQyjObhWNHhgyq+V8J
X-Gm-Gg: AYBFou0jmlDRJHpwplwkQabDr484KtMNu/luiN8uDK5SqnTu7qaD5YfhjPpyXkGXViA
	3ttZu4c9SJHvLaz1i3NDnQ+uSRZL2EDt9LJWLEznUqH4bltTirAzu0bk0B5cQAHhb2adaoJUkK7
	Fq43EnoLh+Tr7SysahWjWy7g2hlxffmsAyZRYeSYncmSAKpQk92soZF4TXxBcHO0DHUHk9Q/ECi
	jrBZvpCnaOf6CG98l6olC1nOQbqv2HIxxVZOLA4nxaPbOVhIBuLRUvMcVjK5xCpPCtp8ta5S3Xn
	mapjdFNe+dg3p1RHBCxTLZHmSJkE
X-Received: by 2002:a05:620a:2b8f:b0:936:d00a:4947 with SMTP id af79cd13be357-93a345745demr388771885a.2.1789467438296;
        Tue, 15 Sep 2026 03:17:18 -0700 (PDT)
X-Received: by 2002:a05:620a:2b8f:b0:936:d00a:4947 with SMTP id
 af79cd13be357-93a345745demr388741685a.2.1789467433112; Tue, 15 Sep 2026
 03:17:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-camss-isp-ope-v7-0-77b13d131d3d@oss.qualcomm.com>
 <20260915-camss-isp-ope-v7-4-77b13d131d3d@oss.qualcomm.com> <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
In-Reply-To: <4b8f4fd6-53e0-4efd-953a-cd8ebad7d479@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 15 Sep 2026 12:17:00 +0200
X-Gm-Features: AcwNN1Xege-7rQu-hUK_GBF3L260MNhym32h4wKC90S0C1_dNyEg6Nm0Y0W-5zQ
Message-ID: <CAFEp6-3bvRtjDhmRy+G3AzP9vL=TrnGpOf1gU-=aQKNcdyzn_w@mail.gmail.com>
Subject: Re: [PATCH v7 4/9] media: uapi: Add CAMSS ISP configuration definition
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDE0NyBTYWx0ZWRfX+uuYXvOvEasj
 tcVxvBRCyXCsdeVqNoMko6S3gnIoHHPkdQ+ZzObGveSNg+KPXMqUZIHodk8ztnclsdJ+OFsPhzz
 7g7ktEyRiwNaCGQjUhKdj6EFRcihr+o=
X-Authority-Analysis: v=2.4 cv=Kr/YSmWN c=1 sm=1 tr=0 ts=6aa91b2f cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=xq3W2uTSAAAA:8 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=_-fwvmfW1z61RZSq5NcA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
 a=P5L7wpMTXyg1GfFA3Gwx:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: DhRDvVT5F2m_uUNS-Q7s5tNjurqXe8Eb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDE0NyBTYWx0ZWRfX6ziWZS2xu1/C
 Sff7HhJ1ysAeCPoCD/x28qTB6G8J8nZMxwxHW3xnw5pPvsK5332EQzsIwbWQ+WrGs7pQzyD3ghb
 GQjih6IB7/Egr151PEnAYyPMj0L2i+mawW9fFABMkxhiHBBpZIfLJ2yVG3VHUl9exJ0qP4kyuCE
 rZxxU3WgghOm2v6wbE9kQPPYG5ek27Pm0v2FbT8rqF1g7624o9ekCVoojIxr4zQ5qUOihL0Dm3e
 FSyzBUdpf3Am4Lk3gSswst9Z6bEKudneh0qyUQy0gtptMe8XFYE5EJExy82AlWM3w4HtU2H2Ej/
 BoHTra+V8ol2XACEWG/jeewVkpWsL8mcHnGUIeZ4sJabEYjkr/lWKaMA2HNuxoO+cHG2pIdQMiD
 b1ScfdDYuVdNWye58mOz5pSJDKdc6vOhOdPEUMhhbr33HsfrulKJVSxwm/DZHN39wSBR7m8nP7i
 W4yXvf19PUiO9kLUd/g==
X-Proofpoint-ORIG-GUID: DhRDvVT5F2m_uUNS-Q7s5tNjurqXe8Eb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_03,2026-09-14_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 malwarescore=0 phishscore=0 bulkscore=0 suspectscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609150147

Hi Bryan,

On Tue, Sep 15, 2026 at 11:11=E2=80=AFAM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 15/09/2026 09:11, Loic Poulain wrote:
> > Add the uapi header qcom-camss-config.h defining the ISP parameter
> > structures used by the CAMSS Offline Processing Engine (OPE) driver.
> > This includes structures for white balance, chroma enhancement and
> > color correction configuration.
> >
> > The block type enum is shared across CAMSS ISPs so that userspace only
> > has to deal with a single set of block identifiers.
> >
> > Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> > ---
> >   include/uapi/linux/qcom-camss-config.h | 212 ++++++++++++++++++++++++=
+++++++++
> >   1 file changed, 212 insertions(+)
> >
> > diff --git a/include/uapi/linux/qcom-camss-config.h b/include/uapi/linu=
x/qcom-camss-config.h
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..e3d6cc4df7de00345e8142c=
81392dd42338c6ead
> > --- /dev/null
> > +++ b/include/uapi/linux/qcom-camss-config.h
> > @@ -0,0 +1,212 @@
> > +/* SPDX-License-Identifier: GPL-2.0-only WITH Linux-syscall-note */
> > +/*
> > + * Qualcomm CAMSS ISP Driver - Userspace API
> > + *
> > + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> > + */
> > +
> > +#ifndef _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +#define _UAPI_LINUX_QCOM_CAMSS_CONFIG_H
> > +
> > +#include <linux/types.h>
> > +#include <linux/media/v4l2-isp.h>
> > +
> > +/**
> > + * enum camss_params_block_type - CAMSS ISP parameter block identifier=
s
> > + *
> > + * Each value identifies one ISP processing block.  The value is place=
d in
> > + * the @type field of &struct v4l2_isp_params_block_header.
> > + *
> > + * @CAMSS_PARAMS_OPE_WB_GAIN: white balance gains and offsets (CLC_WB)=
,
> > + *   &struct camss_params_ope_wb_gain
> > + * @CAMSS_PARAMS_OPE_CHROMA_ENHAN: RGB to YUV colour transfer matrix
> > + *   (CLC_CHROMA_ENHAN), &struct camss_params_ope_chroma_enhan
> > + * @CAMSS_PARAMS_OPE_COLOR_CORRECT: colour correction matrix (CLC_CC),
> > + *   &struct camss_params_ope_color_correct
> > + * @CAMSS_PARAMS_OPE_GAMMA: per-channel gamma correction curves (CLC_G=
LUT),
> > + *   &struct camss_params_ope_gamma
> > + */
> > +enum camss_params_block_type {
> > +     CAMSS_PARAMS_OPE_WB_GAIN =3D 1,
> > +     CAMSS_PARAMS_OPE_CHROMA_ENHAN =3D 2,
> > +     CAMSS_PARAMS_OPE_COLOR_CORRECT =3D 3,
> > +     CAMSS_PARAMS_OPE_GAMMA =3D 4,
> > +};
>
> Most of the OPE specific naming can be dropped, I shared the ICP
> data-structure analysis already:
>
> https://patchwork.linuxtv.org/project/linux-media/patch/20260426000346.11=
58633-1-bryan.odonoghue@linaro.org/

Ok, I thought we agreed on having OPE specific structures, that is why
I recently moved everything to OPE specific name.

>
> i.e.
> > +struct camss_params_ope_color_correct {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 a[3];
> > +     __u16 b[3];
> > +     __u16 c[3];
> > +     __u16 k[3];
> > +     __u16 qfactor;
> > +     __u16 _pad[3];
> > +} __attribute__((aligned(8)));
>
> For ICP I have:
>
> +struct camss_params_color_correct {
> +       struct v4l2_isp_params_block_header header;
> +       __u16 a[3];
> +       __u16 b[3];
> +       __u16 c[3];
> +       __u16 k[3];
> +       __u16 qfactor;
> +       __u16 _pad[3];
> +} __attribute__((aligned(8)));
>
> So this data-structure is shared camss_params_ope_color_correct ->
> camss_params_color_correct

Ack.

Also, I will remove the _ope_ suffix from the wb_gain and
color_correct structures. These structures may differ or even be
absent in the ICP case, but they should remain aligned with the IFE
implementation since both use the same underlying blocks.

>
> > +/**
> > + * struct camss_params_ope_gamma - per-channel gamma correction curves
> > + *
> > + * Implements the CLC_GLUT pipeline module, applied in the RGB domain.=
  It
> > + * holds one independent lookup table per colour channel. Each table i=
s a
> > + * direct (not segmented) map of input level to output level.
> > + *
> > + * Each table has @CAMSS_OPE_GAMMA_LUT_SIZE (256) entries of 16-bit un=
signed
> > + * output. Each entry holds an X-bit output value depending on interna=
l bus,
> > + * the upper bits are ignored by the hardware.
> > + *
> > + * On Agatti OPE, The module maps a 12-bit input to an 8-bit output, t=
he top
> > + * 8 input bits index the table and the low 4 bits are used to linearl=
y
> > + * interpolate between adjacent entries. Entry i therefore represents =
the
> > + * output for input level i/255 of full scale.
> > + * Output range: 0x00 =3D black, 0xFF =3D white.
>
> That's not specific to Agatti, its hwo the Qcom gamma silicon works right=
 ?

Yes, as far as I know. However, we may observe some variation if the
internal bus width changes.
Considering the hardware platforms we currently support with OPE, as
well as the upcoming platforms, I think we can treat this as a generic
assumption for now.

> Same RTL synthesised in OPE, IPE and IFE. So you don't need to make this
> OPE specific commentary.

Ack.

>
> > + *
> > + * How to fill a curve (same on all three channels for pure luminance
> > + * gamma; different curves per channel additionally shift colour balan=
ce):
> > + *
> > + *   Identity (pass-through, gamma 1.0):
> > + *     lut[i] =3D i;                                // i =3D 0..255
> > + *
> > + *   Encode with gamma g (e.g. sRGB-like, g =3D 2.2):
> > + *     lut[i] =3D round(pow(i / 255.0, 1.0 / g) * 255.0);
> > + *
> > + * @header:  block header; @header.type =3D CAMSS_PARAMS_OPE_GAMMA
> > + * @glut:    green channel gamma curve
> > + * @blut:    blue  channel gamma curve
> > + * @rlut:    red   channel gamma curve
> > + */
> > +struct camss_params_ope_gamma {
> > +     struct v4l2_isp_params_block_header header;
> > +     __u16 glut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +     __u16 blut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +     __u16 rlut[CAMSS_OPE_GAMMA_LUT_SIZE];
> > +} __attribute__((aligned(8)));
>
> For the ICP I have
>
> +struct camss_params_glut {
> +       struct v4l2_isp_params_block_header header;
> +       __u8  instance;
> +       __u8  _pad[7];
> +       __u16 r[CAMSS_GLUT_LUT_SIZE];
> +       __u16 g[CAMSS_GLUT_LUT_SIZE];
> +       __u16 b[CAMSS_GLUT_LUT_SIZE];
> +} __attribute__((aligned(8)));
>
> So it makes more sense to differentiate the firmware type to the
> register-mapping type. i.e. the above becomes camss_params_icp_gamma {}
> whereas your subumitted change would be just camss_params_gamma {}

ok!



>
> > +#define CAMSS_PARAMS_OPE_MAX_PAYLOAD         \
> > +     (sizeof(struct camss_params_ope_wb_gain)        +\
> > +      sizeof(struct camss_params_ope_chroma_enhan)   +\
> > +      sizeof(struct camss_params_ope_color_correct)  +\
> > +      sizeof(struct camss_params_ope_gamma))
> > +
> > +#endif /* _UAPI_LINUX_QCOM_CAMSS_CONFIG_H */
> >
>
