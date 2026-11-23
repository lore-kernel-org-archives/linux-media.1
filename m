Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795427932;
	b=ostsw9hN6IQDsffOHJr9m0bGPda+4X81kOjIiAzL+0eH2Z/4bxDk4pI9z8yCiVoQ/Djg
	 HYPw+lwTlZvNxa18IycPfEg11QtgX8DqsEVhxKfvnJ/bgJd9Rio45W5jtjocvSBDzOtCk
	 qZmY4Ub+FQ9llLhW2l9NFkTTpxcdWUrG4v4qRHPA9v14Bdvz8+xGOzEuvBh+p7Tt5Ob3r
	 k9uXWmanhiYVblg4/bKfBV0w76FKTPjmpS/hf3juuJbynsnPvxp87Pn5doNP+L827dikq
	 kOSzC6uGXtLFmb958FxWRGU0Xk8kfENjr7wAUmVG8EzfDe0y/qPkNp3TDwYGxdg3tzQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795427932;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
	b=zFUqDdHSYqfJQz7n1zJvf9YKyA+W9AtbtTLqsqL1lm9SW7RAL11nfs3wz760/Dl6QxmG
	 BDqdWeuVRZy6Ta2GvWOmoRq5EYW8Mi97iOUxsRG3R6QKE/e/3meHqBWNW6t7vXY+7VoDZ
	 KQekroRHCRuPs9d4FQEQjCDWJ8a1dXKbYHLaIDr9Fo3fY3BnJr7c525+FjVfcbXXMv72B
	 4iTTZVrO6GAQnj3AINw1Oz3UG4hfqb8WhrYLmk9m9pIAbDXOZ9JJrwBnCh+rXg9byY6zy
	 Jhvk43R2eMqfZeATHrS8gFs0V5k4+pDS1U4ZLQ+jBEuJFtgaIy4O46BK710ZKb5l5uQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGZIPpMV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="JPzM/jpa";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73E5A606A31E
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:58:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73E5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=CGZIPpMV;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JPzM/jpa
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9Fqwr1828419
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:58:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=; b=CGZIPpMVGOyTcrwP
	5gU3J0Dd2UGnPH3Dyk0QOyFyzpCse1NqtI0P+qDYbwN/puheETu2fgqPARb3rnPH
	H7ES8ZtAVIuoRokdgmzr0j8jpUvKhu2xxDiMct4i5+vzRz9SDyxhXJ9vWsH8SAg1
	1A2mnqTwwRPAvHw3i2RgnWk0ovFyEgKjb8mIjXw1uV1RAAKdA5SO60SJodIwHQ+c
	EJ5Jx4lgh4DdskFzxnRJnK6DlNlWqV8VTLLRVlY200s23NrbkDZxmwyI70XkyHMe
	HknpuqyzKRPzwqeHl3qT7zIhfpZSAy0CZ7kPg5qAKf13AQx+lrxww1LxQLYpH8vu
	WHuzfQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g1p8t27-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 09:58:50 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so783544585a.1
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 01:58:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795427930; cv=none;
        d=google.com; s=arc-20260327;
        b=movJUI0A9mkDSjQYuwlf15tJTYBMd8atMMFPDUZCt4y9/8cBTWVYIAbW56cyySiIZs
         hXMbobcsqkSmmxMMomTItA7MlNDhEMlXWyHijYemYsBqJAjNrWZi5EEav+Cxk3ocLhdA
         sle2OGjxVfU7olJjxg2DjSuOjKyn5WvNmgiC7aAr5NsfyY+hfqCwdLJ33DWnIczd1hEO
         AtvVgKGjDRPgVUvDOOX58pSVWBtBEU/IdGuvPMOmM9uCJNpJpWZb1sJ6K2YIaLO/KozC
         Snij6yfEZCDSRS4KdNQM8UvMISy1azworZjUlhZDLfn7AyYEY0fu4QklGah8jLjgC3AW
         CQoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        fh=wyI7su4gpXCXUj2MqMV/4xtW8lpmrGEwW6v+SS8tTMw=;
        b=aeJ993pNsq39uk3t0QWA92Eb/ad8hCJtHBjDrSb4eNcSa7HquhK+FOzDf3QbhyyO98
         T+HyOKSTiTC0doUBHdC2t6/HUxTqiByjEppk+L/uECqTV55lw2coR/0aLWlAZqDEd188
         1GGWW5Q5PINlUTMNj92k4/lVYKynU/hhPsiRfPtkun4NGUPUigZmtNrykIAyNnAi5Eds
         bOG1wgLd7lpMd/Io9VbKPG0RswEzQqnsNALAhdIoG9x4uLGhUZPJvx43XYMwlApdIBrh
         bnW7yhxaSAhDiSB4dsNgfe8IrlbPmUh1UEZFjYN1mcnBIKGllfjX0GKbhoiQy49lX4m+
         5E7Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795427930; x=1796032730; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        b=JPzM/jpaOXn8S1a6uVB5rhjjNQUtChxLR9axOhD0Du0kqXOWEeSmzXf2Md6+esK49f
         C2SASqjYF/YLTN1D1SnYFZYbswGsxGyBOAHmDGzR0jxN2qwiETBe96sMKazIez2gtkB8
         mmfxqupg4cf/1ectyyQ9a+dTMTKnjAktXaVGevxoaxv5Bcl+hLeRQM4Wtf8P0IjHsOuG
         LLkSi0Enwq/AUgvIg86pi4Hom/9F1jvROBkPMQEoP+X122GoMqc18hQr1xgM1xoHQNRG
         lRcF+gPuwrf9MmqN8FAgYpv20e0LDVoPJIL+/jz+PH3vNVaQxsuSE/GBVkhamMVL6Hvq
         /aBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795427930; x=1796032730;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=s9RoRgSkXuboi2lc6mG/GA8JbDuahoYXjlUXGu6PFjM=;
        b=bZPv97JTmkWB9X6Y3DAWIFocXgpXRLPKdf85DmN2eq3+aF4rI1ekp24RjyQmDpSupn
         OeJ6FFDiVwuR/9S41ki2X89ArI6HZ+E8dl2L2NzoNHqPqo2EZayhPMnTtvK8Wrot8LGM
         kX5ylIoI95SnvNNG/+zQLo4vt2gVN7aXUWOpUeqbGjcnuHiPZzf4NFvyKTPbTAWVKAVR
         UTdf6WryXOBUfE2rHPLDY8+d3sKsUM+l2R1+9cW6heJEDv/PkAKmrB6md3S9vwLCqkz8
         ciA+KMKkHvwY/yFPZ2jVFRDBsCCYtnXsbTPHBj9AlhzXzomxTfCib5URaZ3T69QhI1qF
         8hoQ==
X-Forwarded-Encrypted: i=1; AL+hErGAYbtr0Ld7/4/x5Nlv2E+5q8Mle0DYkDaBoBNR/QuCLrnmTLmmmGOJCqErke0eeyOs1n9m45+T2c2FwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z8ZXPhqN8BIqMnA/yAvrNZY2bGAPgnz4LCgk0yFe2Kn+GsDAcpB
	CIUI+Dk8AA/bG+xQmzvgRZGcQAqFvZqB5smO43YI/dmXIc2SnZrWuTUOXgRqNEnSXQpWZnx59Ih
	2RZkNl4tsHsAmpu6fDWW3C0Zz/v4gqIZ7S73FJAOY0zdz2S4H5UFtULS2KUulKviG7aJjg3rkNr
	IV0lQSYSRNUrfgx52iTf58IficVriXbKaJK3LE+Nlx
X-Gm-Gg: AZFdTZemlx2i+GlhoYkGH8R3eeR34abceafJtl1ee56HvLwmaS6NqosFuLD1KoIrBGV
	agQ+D9Scl4c1MTvx04IhOc3t1exlfB3FnumWZ7PHqDHdn76ECb/LE3HTTDtpwRN9qXoG5vZfEPI
	aPs6wC3+vuzLfxtG7lqwngDLQGNOmduW2PePPzmU432xyjnIEc7+o2qXzmtW5DqvksCXGL3Kwrl
	+6N+FsQT9XDd1eyJpaFMqKJGe3HJm0cIhTB+vf6sicNDc6U7N7PLOZBZt1m7iPEHLFe0oBLmsqr
X-Received: by 2002:a05:620a:460b:b0:93e:d364:c9fe with SMTP id af79cd13be357-949ba9e35a5mr2044448885a.40.1795427929671;
        Mon, 23 Nov 2026 01:58:49 -0800 (PST)
X-Received: by 2002:a05:620a:460b:b0:93e:d364:c9fe with SMTP id
 af79cd13be357-949ba9e35a5mr2044446085a.40.1795427929103; Mon, 23 Nov 2026
 01:58:49 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122-camss-fixes-v1-0-9df4deb87ea2@gmail.com> <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
In-Reply-To: <20261122-camss-fixes-v1-1-9df4deb87ea2@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 10:58:38 +0100
X-Gm-Features: Aa3M54pjB5RmCKSYefwLSyicJ-gt5ipfcqA9X3DS5T2YdO6q68sWSibjlfXkpLE
Message-ID: <CAFEp6-3dHDoXPLGxHRQYHWjhd8dsBT3LMTNkw6NVE8N6FPPETg@mail.gmail.com>
Subject: Re: [PATCH 1/5] media: qcom: camss: vfe-17x: check status1 for RDI
 SOF interrupts
To: robertijtsma@gmail.com
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfXz/ieRa/cf7Z8
 kCht+EHaBhjSzyOp0HVhC3W4kjnERdeCUDnlhAjjr4+wjWxA2tFJZSh6SR3Ec2SqiBpL+NYovTU
 8XQ4U4yTKAeUayGaCB8Ew22fOpA4XSMTSGezAsCNZFdeYkIGW3bHlaM7oKo0oiH6mUz5iPj2lua
 CBLxVrhfjL0xE8PdJ6chnSCyS5kBxPDMpryyt5a1L/G9R5Bh0hxKChmRtuTbPkm6bHAEuWBPY3Z
 eCzmKePhGaDmNZcnhjN0Gl9IOcZ1Pi8S8yEzwhcShAS+YgY2sxNc8fIObBY/kJdvJfJ5mvsIWtG
 d0CIHhME3ddOFoyIy36Bx2bp0nSzSsXp0ZBTGbozj0xNJz5knUqgySNx3D88plJLi/9a9MaWGfN
 jt6hgw8hCALzVINibk78lVWZgi5nSYNdycH3Pa1Z4YS/f8Is1DTWdR6QCIN32U09xO7Q9aeSKQR
 NkRvIKqWSqwlNLdGDdQ==
X-Authority-Analysis: v=2.4 cv=AeIkjHXG c=1 sm=1 tr=0 ts=6b040e5a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yOCtJkima9RkubShWh1s:22 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=sKMnfqkBbl02sVv2kPMA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: gDza68xgOOB1d7jBRfya-4735PdN26Im
X-Proofpoint-ORIG-GUID: gDza68xgOOB1d7jBRfya-4735PdN26Im
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDAzOSBTYWx0ZWRfX6tyz83rwJ13F
 uNUCC8hQ5mTXZUY/WdWMRdUq+kzmhcO+PUuhQQrb/mlNMUtKN5h66oopexfjkpln+C1XbYniStS
 YsfnZIZ2jFipqwvesRrT3u8fsbBhEwI=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 adultscore=0 clxscore=1015
 suspectscore=0 phishscore=0 impostorscore=0 malwarescore=0 bulkscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230039

On Sun, Nov 22, 2026 at 2:36=E2=80=AFPM Robert Ijtsma via B4 Relay
<devnull+robertijtsma.gmail.com@kernel.org> wrote:
>
> From: Robert Ijtsma <robertijtsma@gmail.com>
>
> In vfe_isr(), STATUS_1_RDI_SOF(i) is a bitmask for VFE_IRQ_STATUS_1
> (status1), not VFE_IRQ_STATUS_0 (status0). Checking status0 instead
> tests the unrelated STATUS_0_IMAGE_COMPOSITE_DONE bits (27..30).
>
> Check status1 against STATUS_1_RDI_SOF(i) as intended.
> Fixes: 7319cdf189bb ("media: camss: Add support for VFE hardware version =
Titan 170")
> Signed-off-by: Robert Ijtsma <robertijtsma@gmail.com>

The related 'sof' callback is a no-op for vfe_170. Bryan, I guess it's
ok to not consider it for stable/fix.

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss-vfe-17x.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe-17x.c b/drivers/=
media/platform/qcom/camss/camss-vfe-17x.c
> index 62c2405..502a0d4 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe-17x.c
> @@ -356,7 +356,7 @@ static irqreturn_t vfe_isr(int irq, void *dev)
>                         vfe->isr_ops.reg_update(vfe, i);
>
>         for (i =3D VFE_LINE_RDI0; i < vfe->res->line_num; i++)
> -               if (status0 & STATUS_1_RDI_SOF(i))
> +               if (status1 & STATUS_1_RDI_SOF(i))
>                         vfe->isr_ops.sof(vfe, i);
>
>         for (i =3D 0; i < MSM_VFE_COMPOSITE_IRQ_NUM; i++)
>
> --
> 2.56.0
>
>
