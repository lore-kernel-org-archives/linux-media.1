Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795202975;
	b=mhLptSX1bn3ZnLQwzowvG392DaITl9MRE4jWPPwTqDoPX9gb5589BvoBsa7I7zA5C5un
	 rLGwrwHpvxoZ6xoTznETGLFaujA1Rvhe+qVYNzHXANKcI0MhWJPNXqlHzbz76rl1Y78iz
	 p8GQzdPuSSgRln/02ZwZqzud3MoA8uUEnzJVAtRe25u5tv/V95EY4m0IDzx3bB+M3zZ6U
	 d4JzQfBiLIJRtFJRfhG+9GC8KI+DTg0PLAKxYgBrOh1mQi3igDrbY/15wAQYL/mm2+h+m
	 lCHvdMlIgCzCDER106loIEBT9km7EQE3w67b7hfMnTyUbj43HqaGMWMYceAw0ZGjisA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795202975;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
	b=CbXTDhdCfluVEG5syKdD/Uq4Hu9LD20aCcmO1aOm5nIgca3OMDpG71AU6VOJIcNMKgbT
	 YpdkqEiqwYm+dkX+peN6+7HKXRcr7SUhjbxFG9rm6pqSc5SoRj2cEDkngRlLl7QnYuoN6
	 PETz4504BjOkN6JmiZgDv4p7+g/O6gHmwGu0QfZnS2LKowmelYZHklmEyf5/HCJtQcLN8
	 I4XWW2GJJ5Hh0olMxtIFXBTxtRI3stQlq1l/fs4AKgKdahZJRxDJyfmWdAiL3JBeJZAh6
	 Q2OEdkhfn/7JpcZsysldUn9rvzY7Eq9UU62CTek/CExLxRKhVVOyLJC4OFFqZYR/HXQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVw4TN6K;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0SI3hZV;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3040860A2609
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:29:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3040860A2609
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=AVw4TN6K;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=a0SI3hZV
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AKI1c2L1507154
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:29:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=; b=AVw4TN6KzdjgA1y5
	Jt+QYf+Wcv/0PAUntradkbNVSb2Nc48KmyDqKYziSEKXlOf7W1e5CMOtGEtSAPUQ
	lLBJ4nSesSJmS/kdxh4b7qgfYv0X3C3+vO7Kou6v6kX6L2Sgc/IBJlqjjwMJ+tsJ
	PMNa5J6DhmhgV0GNRNs3KHDqqINBK2SqnXxaJEDAgWCJwelg1dqOUm87VM/bcdbG
	7wAV3AfLR1dnJzuVFklMlL90KPV5fmvA678Fa0nczcbMsq7xbRmnKk+b7JDzFECP
	oUr7cosRi/HOupuohti8cAig6DBzzDBK+t3llAtkZNjgeQLO6/8P4noYKatbav/a
	OXt7tQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j2u4frcd1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 19:29:30 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93909014c85so256585485a.0
        for <linux-media@vger.kernel.org>; Fri, 20 Nov 2026 11:29:30 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795202969; cv=none;
        d=google.com; s=arc-20260327;
        b=i2oLOUhiK8Xoa/n41OMHYa/O3FfgNfoSXNMCPcScnoAQr7IE/fxABKZOc3oESLCvjk
         pqY1IW/p+6ZIeN1xJIkptm+g8IrFoMSf4kqFsFYuXKx8hiBfPtvECQAK5uIhc1wapoSE
         N8E7/MQ2CkqnsKGcFzgzaN7Ti0Q160c0g/eqcYpyvaJOEv6SlrtgYLXOKKIIrd7kH2jw
         m/07UYdA06CKCQhQNUF2Ybpi9scL3Fy6tpDMAkygDCxJ8gIX0Dnprrm73A1KsgSqKm3U
         OIJPtpY6ZlngS3uvwgor0Z27d2yOQGkKaeDBbimLvBJBDNbNDeoM46yM0nOX6X7Bweuv
         5++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        fh=fgz6E2P9FkxLjy8xGOezaXp2gFEdZmGgHiYal5ASnsk=;
        b=n96XVuXphuzXOT4EzVOpm3DqaxF1veMSmcjgSZwdVpmWib5KzqxFu2ErQNPVIk+yUE
         Tti89l026ZH7UTr0VWtXp8J+ZTONOO7AIgNlZgMulHVA9Evkp8jqbxXCXaqY1IX/OcXP
         HopybeM2pu2QY4kmjZjoiSieeJiSGFUevWeI/K5R6OHGYtGCpNu84pTdZi7AqG5Hzjgf
         A4BJAqJ9PhwcJVPmglw4e3bRPfEa2aZjX+rnvlLW1Agf+VnYiUOL20tE1lDdZitm1RKW
         kN7ZqckyLVOHAVvph4vp2COSqMQvhhBD6kYBMWuHFNH5DmaFeEc0RcQtODowtedZ1IJL
         Skcw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795202969; x=1795807769; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        b=a0SI3hZV3/nt74LhHgEtr79XOSpuz2VVCLhOrFbTAIltPQaijUq4qB+jfQUsidSY9h
         WKbFR1QwSl4xPonNemOsrJklus25vsKSAKMguoaOEu4ABkBw8Zg1/JV8QZMGxusX94WY
         cKb81aEg7+AgK68tkmeYt7TrEsUdD8KzSe03ARyXuGpggTWnSy5tfIN53l3IbAMzlfo4
         IC6i/mAUBUj8KuPztRBxLTrO0wdFse0heY1hDVTBhnjUn6gABXdnz+zdHVPcnMd9Zb8C
         Hruo3+2jbbLVJFvXUIin3H8oGzDzgA0SRzZe/mruqf98zFpRuPKRzEqvWFO75oGZKPEz
         pgmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795202969; x=1795807769;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3hPt5T223abe4nik+LEpIs7O7LLYblDBvB7tEmB8rfc=;
        b=NlnLZOwVXY3UtdvO4sAvbEncnKeHm9Ag53+TwGUP76yyAQCqg26wOXiaYRVVcbGYfx
         fVhHLdvsvzsgnp3/lQen6rpZpHY+007XP5mDecV3WWT/UTsLTT7XSRNsP2rv+24sOI6q
         T/7S6Ysa9iw8AbO1AapHoZh6HwFGCm7feGsGYd5sc0lgu0GMjfPWWPikbTXuCiXgEmR6
         /byhi4HmI8C9hRaJk41Xg5Xy29jShwczfL+xn3LmHXBupPqTM3vTUKpdfe6km28OolLU
         pb16QIbvLuVCJAR688tUQLmVSTAjzo2GlQAyYSPMRs8XrpBrs66rFVpOVUE7bZ4SPAKJ
         6Rbg==
X-Forwarded-Encrypted: i=1; AL+hErGVXMK5wfJMWgj7SKVN0bUY0+o1H1w3tjXXnnXTr7B5fcA6+j9YS2Mj7jf7cZyU/gOVYdZTIfM3mKVwIQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9LGtbJrcqG+6/BdzZDjtXu5cGKrprdsdcmFd5OkjjP6EH52RMd
	60/GEVU1EntnHDf1tbYfm0kKacjw4JXVp3so9oJNN9KAltlMUIgBegJ0VO8aB9FcYoUo9lyUwEj
	IWDcVYLw5gRwlEHK0oEImCfNZOXvB7M+kGPnqrQvGHmOJNHQ6a2FdRaZBRtwrlUjI+3j+PG9QMW
	tvI+pIhy8Hh3ebH9BlbRtz5NPMUdTlkZIpx80+Vqw2
X-Gm-Gg: AYBFou27XTajbjFgSIHzq7LPeJztCKmUPj8sC/kpDBauNDFrQumQj3mFgPHc8dAFRr8
	Mrvi+yJGza+SHRtAynl2B2JuVh6mS4ikHvDCVibZdTXYpcXLUeY1ffKtrk/Vw5eKJRH+ucO6VaE
	YyLrI2BCs3WprVlyE2q7wL9lS5I9D34CuoJQXgErBGZ1r8bJCE19zuztUNOUR260Hx7IEAedQUZ
	SqaBh/cWEdfhLmUZRfSOZ28yoR1Tq99UYSW5ryKfdQ4A9RS9f8BlygcPnsMC7w4S/HFuxYz4IPE
X-Received: by 2002:a05:620a:2803:b0:949:6e15:e1d7 with SMTP id af79cd13be357-949ba96f2c2mr618797485a.25.1795202969149;
        Fri, 20 Nov 2026 11:29:29 -0800 (PST)
X-Received: by 2002:a05:620a:2803:b0:949:6e15:e1d7 with SMTP id
 af79cd13be357-949ba96f2c2mr618794885a.25.1795202968630; Fri, 20 Nov 2026
 11:29:28 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1795196107.git.jesse.casco@gmail.com> <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
In-Reply-To: <bf48f3c809f33c060e2944e5896f8a5a93fd78ea.1795196107.git.jesse.casco@gmail.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 20 Nov 2026 20:29:17 +0100
X-Gm-Features: AclHuK8qGNVtFqueyJZyAXK76qn_kBHN37vsNaB9trnpwFSizFkRMZaKi2DsVAU
Message-ID: <CAFEp6-1FXhcg85YKTMAwYA5uBP5ry=WagyZjTPFHQdYOaWWDow@mail.gmail.com>
Subject: Re: [PATCH 1/2] media: qcom: camss: x1e80100: Use the lite clocks for
 the lite CSIDs
To: Jesse Casco <jesse.casco@gmail.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Allan Siriani <allan@fatecpompeia.edu.br>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=VJBIDNPX c=1 sm=1 tr=0 ts=6b009f9a cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8
 a=bvlobPmEph-3l50GUF4A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-GUID: vRF_WMu1NfZfcMeES3Qe7tvY_ul96Q8E
X-Proofpoint-ORIG-GUID: vRF_WMu1NfZfcMeES3Qe7tvY_ul96Q8E
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX/J4GJ8qc8Kl9
 W96JIeYvPdvzNZcmIfcKpoA0t4N8Wzf6LINt4sJvpfXtdSVNCqw6w2s9LQzAURmg0fV6NbwE5Y9
 kTKmix6mDNs3uz3Jpum3XaCQIqkF1zc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIwMDA3NyBTYWx0ZWRfX+bM/JKuQrot3
 R0SMHSv2S2zpgNgheH8QMTEhijwu7X1EdrHKBZ4rpfcG+h0k+61yT84Aiayhpag83C6jrIKjmYS
 r+PXt0G8ETWW8bhW07Fc713y899t017pXmJw7ostoo6dt8l0o9LUZCtzt4fIf/Swgcs/zzciBNV
 4PcNylpOLihf3tDvlj1QkutXRAbdb3+Om/0vlSDi3WvqzLrzWKjldG3lPmP2+Rqhr56bb2OyvMQ
 WbjCPc9mIWFH5wGnVfBk7JmIgPZVf5QBZp22THFwn+3e85Vbm6vwSvTR7NOIlKnTrbRTeIm7p4F
 4AomZlnyIu8w9r1juzByR1aCx2IbpSmlv46NUfADecHwFZhi9SSfUqno8xsLFyZT0bNGThX7rLe
 y8GdIuaw48lCu4zW4wWXOodm68zNYK2c7OhGCTEiyTv9dv7htHeH2HCQxo9smfLIyYPx8EzaAaj
 exo+5xKpBCdw8/OtpwQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-20_05,2026-11-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0 impostorscore=0
 malwarescore=0 lowpriorityscore=0 clxscore=1015 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611200077

On Fri, Nov 20, 2026 at 6:40=E2=80=AFPM Jesse Casco <jesse.casco@gmail.com>=
 wrote:
>
> The X1E80100 CSID_LITE0 and CSID_LITE1 resources list the full CSID
> clocks, "csid" and "csid_csiphy_rx", instead of "vfe_lite_csid" and
> "vfe_lite_cphy_rx", which the binding provides for them. The lite CSIDs
> then run with their own CSI-2 receiver unclocked: their registers can be
> read and they raise the reset interrupt, but they never report RX, RDI
> or buffer-done interrupts, so no frame arrives.
>
> Use the lite clocks, with the vfe_lite_csid rates the IFE_LITE entries
> already use.
>
> Fixes: 1830cf0f56c3 ("media: qcom: camss: Add x1e80100 specific support")
> Signed-off-by: Jesse Casco <jesse.casco@gmail.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3..7d9622097 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4287,13 +4287,13 @@ static const struct camss_subdev_resources csid_r=
es_x1e80100[] =3D {
>         {
>                 .regulators =3D {},
>                 .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +                          "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cp=
hy_rx" },
>                 .clock_rate =3D { { 0 },
>                                 { 0 },
>                                 { 64000000, 80000000 },
>                                 { 80000000,  100000000, 200000000,
>                                   300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> +                               { 266666667, 400000000, 480000000 },
>                                 { 300000000, 400000000, 480000000 }, },
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
> @@ -4308,13 +4308,13 @@ static const struct camss_subdev_resources csid_r=
es_x1e80100[] =3D {
>         {
>                 .regulators =3D {},
>                 .clock =3D { "gcc_axi_hf", "gcc_axi_sf", "cpas_ahb",
> -                          "cpas_fast_ahb", "csid", "csid_csiphy_rx" },
> +                          "cpas_fast_ahb", "vfe_lite_csid", "vfe_lite_cp=
hy_rx" },
>                 .clock_rate =3D { { 0 },
>                                 { 0 },
>                                 { 64000000, 80000000 },
>                                 { 80000000,  100000000, 200000000,
>                                   300000000, 400000000 },
> -                               { 300000000, 400000000, 480000000 },
> +                               { 266666667, 400000000, 480000000 },
>                                 { 300000000, 400000000, 480000000 }, },
>
>                 .reg =3D { "csid_lite1" },
> --
> 2.56.1
>
