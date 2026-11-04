Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793822184;
	b=W9GL3iw2cSL2KrUflDJdOfEw28HkWnLcytcUd9fkr9J4NpAKETVYHuD0kBmIz9mJIKoa
	 GCgbpMpJKalZgKnljds/vzyWNB562NinYDDjpOdqVD4i5gt89FdUfQaZKfa1GCe/I/E9I
	 NDst+WXs6+wEDI5TXvW0lqti/JVA6CQNGF7nlaLtYRy2pPVLtF0JAMIoXQpM2ficuqlsO
	 kQgbQOG2aKfrRgowXkbdEZiXk7nXS4dd3a5SRElpax1yculg7fQfW2pwquNVvyke6PPxJ
	 yqsdWSF0w4W7oCbnpi1yrZC5eOHEqb8CHTxdHZwuBVxhm7eODthhcB8pRaYHBWaBGgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793822184;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
	b=QNsljkd/8qh+3zOAzVIGRgKC9zYrAWLBKT4JBTkSMUtmqDRturna8ASxViY70hDJMthz
	 IdSYSUPWdDXiwcSqoGpmiMuMLrmiqQb7bgyItCxbOOECkb8/rhbMvBJhxZj1GEwUHG12d
	 v/vv9kzgkw2gtLixC9gt1JOPd+LGSvjekTDV+UEmiu26AgL+wPuLbqBMSKqvzNiGQYLt3
	 4GfpKya9p/A0nSfN+qexr8lvY5WW2iQwSAr0noTldHRM2XZKeD4kTaaJTzdx96n8Q00AX
	 ApOWMyjfxEiYweK+fIX6ytg4CP41wMWjhkvfA1Jgn6jddFpnATsHNX7s9k/69xNFWKw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH7OPnga;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BC76609C5B2
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 19:56:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BC76609C5B2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=c135YuXN;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YH7OPnga
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4FjG362829051
	for <linux-media@vger.kernel.org>; Wed, 4 Nov 2026 19:56:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=; b=c135YuXNvYw5b7BG
	fVpcjq7l4pnnMIm1qG2GHUJgCNnlfn8jgwbzvgnRYJPp2KAFBemfPZxq2QR18xkT
	0ty13cOiwNnHBANVNz+7DFgKWTNu6waSuk3O+FRzPab8LVWh9uJB092CYHSObM6f
	O9fh+BI4vQ/HGdk4IEr5EwS/pQ9e2D/RdFqG/w8pVdW8sXvMR5PivO5aKBxvUWMa
	qVnau7cRVYvhT2zQOaZMsQCrnGvMgkBiRLeCYvYexLRKu6tx4XMO1t40H46DhCgf
	9fs+ZxOvTPSV1gDMXEF9HY+NLzQIn8htO8rh8DpFQCZrRnNy4hQH3sXhszpcY2Iq
	/wjQvw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284tj5c-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 19:56:23 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f1e62510cso282288485a.1
        for <linux-media@vger.kernel.org>; Wed, 04 Nov 2026 11:56:23 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793822183; cv=none;
        d=google.com; s=arc-20260327;
        b=K0HCHGefoKNMaRONrGu2G9m2KErXb6v7hWxS2J1ME3CDr89PktAflcL5t9gaaRyW/P
         E5gCrQyN1t8KG4CwmeNyZjeE0cHH6Yx+93h33qK5tE2CsjeC7emIEd6aeG6S36Xqdn64
         yCNmkgbbtnqwssLme3uLDhFlXewcFmSG44e2ac+fcPx9B3HorXweFsEyZVn0aanIOlfn
         fqe92/6oP8cWgvbMadW/5JZLGrgXdN4LfWdE2oySEpGcHl7XwbQCZxn65CaBLbg4Mg06
         nIBed3vAlNZw6TJxoKAijakzvuVKNUq3o+ymAmHLY76qhsXdJ1JzLU+CnvQmtFJOFits
         cOCA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        fh=Ki5iaAX7zFptARwALVGB2fIgMv5yo+CxzGGD+roaYDY=;
        b=ct4OCACct1+NqgaNc3DXtWFDiRv8jFoTy9XnTl9XLX3EanQrdwWLcoJqnYkLLfXqe3
         rTjY7G8M1BU1vcVAcT8KQa44JrDi9M9pkmSj9qKynH/AyGoR2Mr3dqOJRlHKsqEMLJIG
         pjShvM+2/DTvXVksJ50/Rnbvby7OGWaI9EeFuqnaHCxT6Sdr3gUhgwy5nHuzyVD7cB7J
         QJ6jv123vDuUGtbosiwHr73ykzVglL9eZNuEDVayh8SxBMQExp/nu3O5aysAzQdgjVzF
         a5HgXyJaLtiwoVOD/wzOZZFSHpttw8rEl9LUUdCDJfs0ovigE/5a6Z06KaQoKceSTLX0
         TVCA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793822183; x=1794426983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=YH7OPngaVk6SQmUypSZsy8cTcsBVcv6/0F+Y1qOggD6P7sDKHaQwmYHcpJsSLS6B+S
         /x6iwZQ6WJPLvVdV1K5nmjzSy59o4l6Z+fSn4ctP+LE5zMhnta+Gk4J8MZekBFPfpgET
         pKKVdnIckpIKIth/Ai/BEEWr1yjREbVVFh/r/DTxJ2shro5RJshKgCQ58n7m3usBxW4g
         xXSVCuss8z17vtVTPQdpJvD6oxNrnIuiKxyK0iC2DYD4mNqu8otXbOkrqje/iCG4pZTT
         m++NNVYfPGtiqLw1ST9eP10WZUtQCozTYApJHwXP65nZ3d1zYHW1PPnZLTCx/No5xU3y
         EYuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793822183; x=1794426983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XQLFdhGEl+gprzPQzW/vHtrpFsz2rxGpuBF5QN++ENo=;
        b=EKFOJ98fifq6vk7A3tQdAKqlaKqZDt5h3AfCbXhyDzoiEc+M/safIK0+UrQLq7nHJL
         kp76jhXX8kQOSU0HH3ubC9n9V+wwto6tFXRi70gwmtY5b11IIZeF9uYuvr0Ue3JTdy1Y
         YV95s50QR5z/3tR177uQAVz+goW9lC0AwzcyadX7SWG1jUX0GAxQQXOz9qY6TUxXOQuK
         L07t/5MAs2f30Uw1b+V9cXHsx3n75Mn0omQ7obJWEj6hFaDThJmN5fI1SEWhxdDuyM9k
         ZRS/fyH2tjVSsjktEslu9zfWJjJnWK6EbSn4HOKrwfdDSBGAFf6cuStO695dE5EGpIUJ
         LykA==
X-Forwarded-Encrypted: i=1; AKwUvBzJbc58p2TK5mpkfRmazvPJuGr6UrDVPqMYqmhO6yND49WKtufTNXPZ0kVLsdxBqkwhsaOvwL/izCyEOA==@vger.kernel.org
X-Gm-Message-State: APuU4Z/AMVgIlj5tG7gjrzKSciM3GdlEE9nx10W4UsRfGIa9ESRsyv5u
	WMTGDg9JsOzBYexEmtBPXoonmDrn0Db+OHxFw4XaiaPWrDX7HSHNxoEkp/6tsf2fAskRwp0KNbH
	Mf5m/ouaul6K3mTg+d3mydS7670IDsZ6JLdNPwtcPU6DOw3Gd8uWJjtQ1leOZsz4ido1+AexLYc
	fr6EL/gpoHj8Q1yEEiPJzVgud9MSa+w6JE6Ds2Ongu
X-Gm-Gg: AYBFou08hIGzD2IskbnPkcD9BG23nPAz5lb+apF1XRktx+RAVr3shYwvddxPVlxVi/F
	YsxkQE66QC1RcSEEVqhDJkpaynGzQYRmn4ahsjoVfan7i9cOV3OiVUQslEbj9HXXO3J1vYpUEDW
	VVIsZe+IVGpLRqygYaDPF0q8WL0BwO8d7Pok1if5CaA59Lb2Rm15oxkmzwEQ1hXtGw4SLOrS1Op
	gtougG3MFPO1ANuhZ22B4Q85TJjCI92SxPWHpVflXQwTPVBO7kB4jisofl4pvJzerdL8xtnq4K+
	y8+rdmtEy3HRzZSqLgzp5JdiST6X
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id af79cd13be357-94421585e5bmr2998716185a.6.1793822182604;
        Wed, 04 Nov 2026 11:56:22 -0800 (PST)
X-Received: by 2002:a05:620a:468a:b0:93f:17e6:6ee2 with SMTP id
 af79cd13be357-94421585e5bmr2998710085a.6.1793822182093; Wed, 04 Nov 2026
 11:56:22 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261030-hawi-maili-camss-v3-0-9742bca8cef2@oss.qualcomm.com>
 <fFfGGWaoXA-LdO6s8Xh_kQWQfncXe9YNdpcj2yNkphWHAR_V69LdLOcuhXPsbg8dEUSN4j4yygq4wPre5cz79w==@protonmail.internalid>
 <20261030-hawi-maili-camss-v3-5-9742bca8cef2@oss.qualcomm.com>
 <5817be6b-7180-407b-acb5-8c5fdef4edfb@kernel.org> <73b1f591-69cf-471b-9763-a0b719c74501@oss.qualcomm.com>
 <fac8cd6d-c3f7-4ed3-b0d4-7cb8a7a6f451@linaro.org> <d92a8aaa-5cef-4416-b1c9-46ecfc6b2745@oss.qualcomm.com>
 <CAFEp6-3ka3ZKzCoLQ5BNv0YR+yhYXVRwV6G6rM8Lx_9hZ0RqVw@mail.gmail.com> <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
In-Reply-To: <7acf1f64-a2ac-411d-a235-69ea52231623@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 4 Nov 2026 20:56:10 +0100
X-Gm-Features: AclHuK9iS-SlJNui77YNFKE0lYus5bUHSbzooakg4b1KhZgza0So8ebhpAkDmh8
Message-ID: <CAFEp6-0O3PyyytNvAUdvMRaMR3Q1Acb7KZmJmDT2J-gVfjYbsA@mail.gmail.com>
Subject: Re: [PATCH v3 5/5] media: qcom: camss: Add support for Hawi
To: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>
Cc: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bod@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb8de7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_glEPmIy2e8OvE2BGh3C:22 a=NEAV23lmAAAA:8 a=KKAkSRfTAAAA:8
 a=oDkJ1FRbrV4SKMjXgYUA:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 1hvIQdrPnbLA8Lzxj3q5plDEca0cnRWy
X-Proofpoint-GUID: 1hvIQdrPnbLA8Lzxj3q5plDEca0cnRWy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX/M3fs6ycr7gp
 MiK49s8bJ2WWkLbc7gktwcPAhBB/BC7KQcEAsJ1PVYC7/B19woYH04Nj1ozTwsZOYjxlDq3LQMx
 NZ2aDxR1kBwVGZyUN37WTaPyXxzgpkMjC7mtUVt56RSBZ38YqPvYnbwE9TwUr5+6FZ2Lx+Huf7a
 4Nw9lFq92T3yn6nKZpurCfBk7bKjuzlKC05rba/jz6uKAQszgvuERyl490l1cMqrYEsKsUxJWoF
 gYlffnRTnUobe4KKWZfKdcQxHHV23HUQSQHisGqb0ga3qm99+Wb8maruco9osWYXB+yWT3qEMrU
 JUk772CI+8YnMLMrew7OZzQhj5eG7kpyIN9CCF4pUCr69/k5nXAt9YCAqF0/nenFtKQs7MKapDu
 GzKwFfet4hCsvEk485Kqa1BztD+mele9J1m0S8MqFtj0qQzvh6/btgYJ+YR3/4Xwn/w9JB7hZS3
 XRIrTfSm3k0e546K9KA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA3OSBTYWx0ZWRfX+YpW0C5ElOfZ
 KNLxDjkMHEX+Td+yaLiWgYamFpM87siPYOj7qf5JZP4hZZn5wZ3DPozfWiNU5+yu/lQWV3BATCb
 9JqazNpPnhJpFKEhw+ltGKfVQGt7npc=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_05,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040079

On Wed, Nov 4, 2026 at 5:17=E2=80=AFPM Bryan O'Donoghue
<bryan.odonoghue@linaro.org> wrote:
>
> On 04/11/2026 16:11, Loic Poulain wrote:
> >>> We have a series from Antans to address this though.
> >>>
> >>> We should list the clocks the SoC supports not constrain that list fo=
r
> >>> one specific sensor on a test-case.
> >>>
> >>> ---
> >>> bod
> >> Good to know that Antans has a series addressing this. I agree that we
> >> should list all the clock rates supported by the SoC rather than
> >> constraining them for a specific sensor.
> >>
> >> One additional concern: if the clock selection logic still always pick=
s
> >> freq[0], listing a lower rate first could leave CAMSS unable to work
> >> properly with sensors that need higher bandwidth.
> >>
> >> Could you please share the link to the series? I'll rebase the next
> >> revision on top of it.
> > I don't think Atanas' series targets the CSID clocks, only the VFE
> > clocks. Ideally, we should make similar changes for the CSID clocks as
> > well, but for now they are not being considered here.
> >
> > Perhaps add a few comments documenting the supported rates and use a
> > single rate for the time being. Once the CSID clock changes land, we
> > should be able to revisit and adapt this accordingly?
>
> Its the same principle though.
>
> I don't think there's a valid case to exclude clock-rates purely because
> one sensor requires the higher rate and we aren't willing to do the work
> to make the clocks smarter.

Ok, fair enough.

Nihal, feel free to test & pick the following CSID clock scaling
support in your series, and add all the supported rates:
https://github.com/loicpoulain/linux/commit/a02dad23d219de1daa53e4095eb5289=
e5b5a6a15

Regards,
Loic
