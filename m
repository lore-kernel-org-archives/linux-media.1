Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793118844;
	b=SqVQnAzc2HwtatZkUF3ed7e5lcLrnRqpwNfylgDeEPXoj2zL50Jd1cPd388IUBZIYMPg
	 YQAHS8oN/ZUVNCdPCjlI+5rPsofrOazWsj7OfZVaYcYqMF876Ucod1TfYMToxm6SFrbWJ
	 RvQjI/Xy5kwGQM7UUtwzk8uEUcjkE7gY5IqvdD9CYxvLDE8DAsW7R+S7IwE0lVa6DbBMx
	 KlB9l1YD/lwEsMcKPlmuW3NkugXB+4u+sthlnmlerC/xWzsfA/Kqn/jNEoAjKppHCfa8w
	 HHuqjI8RyY9g0HRddqJBZ4RjRGwZ2H+je5R25Jl9FKkJ2vAPCI8mKbDnau1cdvc9pEw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793118844;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
	b=aYnOYAl62+Ypm0k8g2J7LhB6DEAn3r96uS8wW0LzzkASgiUEWef6H5gLZRA8b7daV121
	 NE2w2ApM2PDJA/5bCr6gBmpsAgerHOTle5l1noC9uCICzvurRUu3rPi0p324iOdv1HASA
	 /EpuEbrSfUUwuFJQlRh3EQ0M828md4ueB7YA2rdHqXZMWyofic1/Fe83cnPKhzkVXSWCC
	 5ArID5Awb73NxmeQUh9Qe+arcsoPiqpeUKKSTNXt+Zg1SJ9kYlC+wsOCeZcjsUKVxHQva
	 fLgsV4EmBZxEx51xrRjJfUieMtocBE7UgBIVj32VEyzyeVIzHsOSrc6VQw8CLgXtTSw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjjOHyKM;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9950606A31E
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9950606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U6pJPW1a;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ZjjOHyKM
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69RFKvAO1693134
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:34:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=; b=U6pJPW1a9PcPo0tq
	HaV0IZjrwONB2IQ8bzDs7E6/FnePQJ2g1yuYzIeylDAxd2zPmi3gAfb5mVOJCC/S
	kH9fipkT6AiMxzac2Ft6xTvMY1VPJ/q8ugfBq3A9HctgWvpfrCPORejVHcEz2zil
	JkcFK+z6ylbkuRUlYc+o0moz4R9bwUwXc79smGrvPRDWzDGq5iNA7aaq7OgaquxW
	AcxV1b4PI3I2W++lPG3MTM9RDPCRXZU6hE+utM4Wh3FDwgxnl3kjg3QAVHif3q1J
	ctmKvMbbDQ3mxBTxd++p+SnsoFdaQ3gC1q6Xl2J9QXVfnh6RhaqjHQfURMNC1LGy
	o9eRKQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hjp2tam0p-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 16:34:02 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-9179a556c43so1161286d6.3
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 09:34:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793118842; cv=none;
        d=google.com; s=arc-20260327;
        b=o/KSThoXOQ2OyqdKiBOZkZ92Qo4sKtAn2RwnuQxSyi3M6hq0uuuCZFZzQ6nCZ5b8tn
         t0w18owGu/eRkS25VKmqn4Le1iFeTJFl9SCIoGpvW+YdwKwfT/odoA9nN4dzT9VUV4Sv
         fMOrZoGkaT1Wm3/oHBm37mPxNwxTnGNeflOrxI6Lm244Ag+kevGX3a0O+kNhukfJRmWh
         VgFyELKnFLxh6/3KCvKE6ckLMH3VBhXPpN0gkpSl1/3AT2sjHfkrW/NdeTROwSoRJ3Xs
         kyOfMARyGQ58cXO5xNo6a4K75s0BIP9jgQ01dn+G4RvxJvvqUjkXNPPSfcRG5C/EBXa2
         RFow==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        fh=XSfCFyWQWGjqp5vokYUVtNgzp50c9Xjag00CA1ilACU=;
        b=F++Xnzy51AJJWY1BN46nl+Yvypv0FarstSBf46bgWE6Osb0/GbFTxFEtkXJcsKJKEI
         man+K24tbtL1jjS9d8T8nH7Xo4MxsNXZJlyaVafGa5Azk1IsIFr+k0XOTm6p+zaYBduB
         qlSB4eZXdXfnN8InlpfyS9T+cQ93KgAgAprq09m48sHP1G9RYY6zrCZSZfeb+Bn+Q78M
         3tDvRrrmVFl42hcdwmrpUwz9vDbhaL2BX0F1jTzR4wL4/STeOeGJ9zk2ISFiJ3nzFqIh
         294dDHhHae76mBdUcQ+Bl0cKOZ6gOzSsto7zw5rmbNUMZqrSEFAH1nCh1wblDrBZVjEW
         /4rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793118842; x=1793723642; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=ZjjOHyKMLfvQbck/kQ0G1xja9KTAUQlD8uIQaGeDRSGvun2eBq/0XzztF1QP5r+t2y
         Dq3qykOvhp4lQXSos5VJ3DGCFDfw2Q8WtyruGOabjMS3beIe1s6/CQ+c5Nuux8Fxyrww
         kVzHwuikumGIFv13p/j6tTs/BviHkZvk4tCdZoakOKkjc51yOTiTDaBihfzlKzQBYq2+
         wiqP/Lw/cgkrIHnHHpGsl1wrTgdhKcRDkyHtt7txc1ho1iOiyna781YpmzYJdaZaDwFS
         IIQ86OIGwc5PbfBxBLE8Ss4klSWwrH7S1YS72Ch65wvIkOvwPqgAeB8SsLMQbnYgkRB3
         rFCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793118842; x=1793723642;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VeAJlfjTIRAgBzguOHJPySMUaBKAa1xzAwSe46T494A=;
        b=iJajSr7eNasxsbqK/UgiBHn+4LYPt7b4HiH+zVQE8J05mxC3XEuiHtqd3+uroC9TW6
         YQ74BeDMGjxU0TjgPm0Afz0kcYP8YfCFl/XYB2TsJ5b0a5lJZQd7ukqrlIao9VmzUw55
         L5R15LGjFNoB1jxymmQ624suSpwBPrwHFqbZbr6uLMUMbeG/vmwtWqtFBx5RVsxDTBt8
         jIzU+xQncep03G6FSGG1v2n4a/N1QBnCHsYQfXQQqWAMtKC447cQgUw2XEfkz4mZCrug
         coUzQS/fA5JkuxDMO7JkYpowIeiBfnTYgEFk97LATf1lXgaAIQ7Nt+L3etCuCt/l7fyT
         pOpQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkoPp7gTEcyCkfs5xYpgSNzrOy1tapGbpPc/FeXyWj2c60zZc/3RsI8Cr6WeFJkAZHflvqHLYd1IdWnQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYI65q27R78xadSXFQKdnc6AzO86tAJszfMqXZbbUCnGjOQpbnE7
	+9RkcTRkmfOwRnEr0im04beCsLeFwYpi6hAvOwpcNq9aYNvwVNFUjnoplmh4p2YLOSDrooJdOjK
	2FgZxuT7yhcd2QMPblpDcOjSnujdVJID9W4+Rw0P0rbvHfaZhDJlTz/b3PYYXcsUoSXo+5Iuwc5
	VDv7d8j48QH7uyGVBhZuUMFq6a0bZ/84USnIX6rUSs
X-Gm-Gg: AYBFou0hATLOtxlPu+NFuW2Ri8/XlIHcY5sz6HjnbIEVxS3wryEg1mRQPgbpzB2rwOh
	dkiFaN9q8tCeVtEn6j2j4aka20Bo8sD2h7APVFkAmSIvevVYdXi5XW3AQi0bEo4CxjTrf5b17fY
	qGL3JUr37v1Rl1z9P9P+zrafBo29w8dUnP6c+JdRbvcvC81e0tPB085hT+/Vw6vmxIeNDgWnBoK
	KfZ9FsBN1Gk7AI1csz43AqGjB8d9YK4Q5NiV5kjF1+WmCCLJBlvx4rlF/kAQ3iHNTKrMdlv275V
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id af79cd13be357-940ef6833d1mr1472865685a.0.1793118841521;
        Tue, 27 Oct 2026 09:34:01 -0700 (PDT)
X-Received: by 2002:a05:620a:271d:b0:939:31b5:4e08 with SMTP id
 af79cd13be357-940ef6833d1mr1472839285a.0.1793118837619; Tue, 27 Oct 2026
 09:33:57 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
In-Reply-To: <20261027-csiphy-sdm845-limits-v3-1-c58917e14107@ixit.cz>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 27 Oct 2026 17:33:46 +0100
X-Gm-Features: AclHuK8j4mStUHhryvskQijmxQMRr1T1BTPG7p5KRrujFPF0uIKAlxEAa6i54Sg
Message-ID: <CAFEp6-1N_bUQouuLqLJdLWXx4e4o_8qoKdwa7CD-D9Jxd6MhnQ@mail.gmail.com>
Subject: Re: [PATCH v3] media: qcom: camss: Don't reject sensor links faster
 than 4x the CSIPHY timer
To: david@ixit.cz
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        Bjorn Andersson <andersson@kernel.org>, linux-media@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=AJjzCM5L c=1 sm=1 tr=0 ts=6ae0d27b cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=bC-a23v3AAAA:8 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8
 a=EUspDBNiAAAA:8 a=1LqAIe8ZLxqIxhs1lXgA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22 a=FO4_E8m0qiDe52t0p3_H:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gvm-gpVDgmqRyzuPTSx9rQ7_AbC_sJ-f
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfX2QfJKDvuOihM
 lnWr36+TbZNmP7Qma/cRB62eu2+JlvVv0pV4teQ+sMdpDeRp+GFF6y+DS3klb4/yEpbgisrtNns
 gO49QEijxARhdn/J3NaoDBSCFTkgNrc=
X-Proofpoint-ORIG-GUID: gvm-gpVDgmqRyzuPTSx9rQ7_AbC_sJ-f
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI3MDA2NSBTYWx0ZWRfXxHozFSCGmK3v
 tN44jjlAP56InQqNi5GuxHbVevVR8Bd3c2axwwXw93hPXpnntHr5NvMvCukxmatLekofpvndLZ7
 vWIR8dc/29kSbWnI7R+4cstZDyvr5ZXdENoOPW1+gRniARhE7x7tmfOglTvur+TcX5zINuPGTX7
 TvSTU5reMdZBtljkzH0M+zXxwBMbo22KinsQ/nuyGipWExtP1nErJSN63gqOHja1I7gm5BxIAfU
 TH7ii7ltoUkKNgfZgIBhg+Ig+t1SXBuvtlF6Dd5fXBGg9HI3KKbyCzo7OFa4dkfKkqoj/MnQDbq
 igJM2dHhHTYAiPqhdX5Dkmsta34R8wzmfIqOM0y2MzDHol1PVbuwkNwrpu9WPBBYju5vR7idxn6
 SfvjvUkJEP9xFTxo4QElt4ACG9eLiX3OdTbqmquw/MgGbsTrqizAhOic6iacncwU8d4EgqYNlK8
 CNg/oAr7gU+i3a8iDSw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-27_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 bulkscore=0 malwarescore=0 spamscore=0
 clxscore=1015 priorityscore=1501 adultscore=0 lowpriorityscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610270065

On Tue, Oct 27, 2026 at 5:15=E2=80=AFPM David Heidelberg via B4 Relay
<devnull+david.ixit.cz@kernel.org> wrote:
>
> From: David Heidelberg <david@ixit.cz>
>
> The timer clock has no such relationship to the link rate. Both the 2ph
> and 3ph code use it only as the reference for csiphy_settle_cnt_calc(),
> where a faster link makes the settle count smaller, not larger: at
> 269.33 MHz the count converges to 16 as the link rate grows. The vendor
> driver pins the timer to 269.33 MHz for every sensor (it is the highest
> rate in the SDM845 clock plan) and streams this exact link with it.
>
> Clamp to the highest listed rate instead of failing, the same way the
> unknown-link-rate case is already handled.
>
> Solves issue on sdm845 that caps the link at ~1.02 GHz,
> so the Samsung S5K2X7SP, ~2.3 Gbps/lane, link 1.15 GHz) fails with
> Pixel clock is too high for CSIPHY
>
> Fixes: bbde31047434 ("media: camss: Use optimal clock frequency rates")
> Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: David Heidelberg <david@ixit.cz>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Tested on SHIFT 6MQ with sdm845-next-20260820-9.
> ---
> Changes in v3:
> - Added R-b and Fixes: tag.
> - Link to v2: https://patch.msgid.link/20260914-csiphy-sdm845-limits-v2-1=
-622db5a6ebf0@ixit.cz
>
> Changes in v2:
> - Drop the camcc change entirely; the 269.33 MHz ceiling stands. (Konrad)
> - Fix the check in camss instead: clamp the timer clock to the highest
>   listed rate rather than failing, matching the vendor driver.
> - Link to v1: https://patch.msgid.link/20260822-csiphy-sdm845-limits-v1-1=
-d360bf7cd38f@ixit.cz
> ---
>  drivers/media/platform/qcom/camss/camss-csiphy.c | 16 +++++++---------
>  1 file changed, 7 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csiphy.c b/drivers/m=
edia/platform/qcom/camss/camss-csiphy.c
> index f99eea2ef2289..985171276ce47 100644
> --- a/drivers/media/platform/qcom/camss/camss-csiphy.c
> +++ b/drivers/media/platform/qcom/camss/camss-csiphy.c
> @@ -159,25 +159,23 @@ static int csiphy_set_clock_rates_legacy(struct csi=
phy_device *csiphy)
>                         long round_rate;
>
>                         camss_add_clock_margin(&min_rate);
>
>                         for (j =3D 0; j < clock->nfreqs; j++)
>                                 if (min_rate < clock->freq[j])
>                                         break;
>
> -                       if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for CSIP=
HY\n");
> -                               return -EINVAL;
> -                       }
> -
> -                       /* if sensor pixel clock is not available */
> -                       /* set highest possible CSIPHY clock rate */
> -                       if (min_rate =3D=3D 0)
> +                       /*
> +                        * The timer clock is only the reference for the
> +                        * settle count and does not need to track the li=
nk
> +                        * rate. Use the highest listed rate when the lin=
k is
> +                        * faster than the table covers or unknown.`
> +                        */
> +                       if (j =3D=3D clock->nfreqs || min_rate =3D=3D 0)
>                                 j =3D clock->nfreqs - 1;
>
>                         round_rate =3D clk_round_rate(clock->clk, clock->=
freq[j]);
>                         if (round_rate < 0) {
>                                 dev_err(dev, "clk round rate failed: %ld\=
n",
>                                         round_rate);
>                                 return -EINVAL;
>                         }
>
> ---
> base-commit: 151a134a4e6ec66f69db8750c66006f5207f7a9d
> change-id: 20260822-csiphy-sdm845-limits-b1e3dbaf5d38
>
> Best regards,
> --
> David Heidelberg <david@ixit.cz>
>
>
