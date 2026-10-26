Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793010137;
	b=LbzqKDzaiPA/c6nw/csfudrnFxBvhXxi2MiASVG9fZbrOwGwT5JCLi7y15OA6TMtBka+
	 JJAd3ee5coR322so4LUTZHAYfSe5ro0bWdCL36XBxOOpQCuc7sbadk+M76vPJ+ievF7Fx
	 YupZIZD5t0up84zSgJiEzGR7XEoXgsoNy0X6WBgMgDtUQetntnJFcAtU9kdTllTr01pXP
	 l2Xin994nJXUBz18qe31HnPrDX5XAm3cQSCVZcpQaqOFUvMU2Bb+ufIjYZNozc5jRQugq
	 UdkUz/q7YLoNLt5TLWF7t6hd1aTk5T1mtDiuVPI4wdoLuBeH7eXU/ESu/xPaTBsecJg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793010137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
	b=zUNyx9nbBDmXmi+b6UZReMF/E5Tak0GZ4gPHXVDaWQvnfLB5N/NcLcYddR1kkcC2TAsP
	 PuWWzc1aUDhiKWAGcu6iiW2/aHtOMKQzueFpOLvFJSUxFFJ4YpQHKm07bYglwh1csdJFN
	 HAd44aknBIZ8tz6iEzDDciYtwwrJKVL1vSg1mmJqNbgCYh6+w6XwPWsI2iql34E2HyeTv
	 d9KGCGreL4Ek1fqdC5RjiTMBP1CC8Vg7y5Bcjv0yW06FnFWwCfbmiL58TKZplYCGJemX4
	 wf7hXn6vEvLN+Wi3rs0bFiz2vLZeWEuIJMq1XzpNY+EbKlJytWtXhH/GIEW5IkkbB0Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm4QzNr0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50E3B606A324
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 50E3B606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DzghUXN3;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Sm4QzNr0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69Q4aPEM3300568
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=; b=DzghUXN3GTriIoQo
	uVKgpHKJuKi2N+Uxol72TGifH6HJfclAUE27lq7LK+SiKWdF5BDiybBP6PaNCyao
	75JN3do5HIGuGXpP36SEc0/JhsOceDOA5od4cqpVX0RY8iF/zZMnHvKoC03XejAZ
	saR6NQAfwO+CavhgH1S3C0H+3flrzrG1XmEZLyvxeCJMX3+0+UwWUd9Re5itBGD2
	W4UxjqyodaKDeTL9yNScNt/YynzCv/AfJmS92TqJQHTK1T2lUgoo9kASCHnf7O0X
	KV7ha4iPcf5OwVVCuw4kFn+SMzY5KuRDoSs2H3yWohI045L/e0TrqFk5LjfFItax
	HjipPA==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hhshpsx82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 10:22:15 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cc06b9ca9eso432027137.0
        for <linux-media@vger.kernel.org>; Mon, 26 Oct 2026 03:22:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793010134; cv=none;
        d=google.com; s=arc-20260327;
        b=ec+ncdoKwU1sWOKnKRuJgOkoCSdhxD6GLqMDWEXX/guaExC4tX3OmnRJSeLEelR0Kw
         7pBZOn4ILnG2RbdYm6mILgUNskRLcGiVzDJI7liTmTAKh4+pd6J/sXuj/knDDyIT+i0G
         io25xxCRGxFMMttP6JWXPjRUI/5WPl7+w9ygBKV8h/+jGjbzYMpm0n3vRJYcAP/WK4rB
         4j4+y0bpCVA5bEjOkgBi5WYomQhfupABCltF/95vOPRwkfmbDrBzpeZ1ayF4YUKR9F21
         JcTTAE87VrrIr2qwlAXZRjECgSE8VNEsp74ZctJBVw1BoZBmXMGB6dmLsvoMoH+mSPCO
         tfBw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        fh=3T1UU3O/IyBM77iBNZ09ifkx36XA2CgH4TKvZdOoCUE=;
        b=qkql8hllumpQ+QExLOmeGuW3HffkgKVnTwg7DKjb01CyOnixL7A9NdKgvx1I4OqQrX
         V0hu5gbivfxQOX+m6SH0sCq5xhfEXcS0RaR2u3xP9Gm2MtMfXi+fTcTseG5WCuYO24Zj
         9SbgldBojHQtixBl/TZ7jIMRI+6vdrRMyEmFNqDSyKrDkLWh/yzcbqnY6s0YZ7VwuPkM
         R0/QFnLQ8zS1T9wfOzK6ZHpm3eVHrnIgM2yoItDfLum0jgoXA9QiZl51H4+HyKsOQD83
         CEHa9/7x5Eu0UYtc7ja8YRW7BzYXjzo7CYxtwvDlnW0Pe93k02zEr2nAbZMOd9LhsaXc
         9PAg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793010134; x=1793614934; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=Sm4QzNr0n24T0+J4lycYDwCzkN+SN1F3Hd1Fru9eln1Dz3/qIM9wBSdv15Zp8pQ+IN
         anhtzW0tNObCndoYH05AsmLLhNOQhRhzJAiskTtcMypCkdKw73KL/wWOK8m6RFN/obsH
         lCE0GDeej+fyAc6DLudjRMwv/VrpqDPj47pWhgLFgMwt33mGhaCELcfYxj4U0yXm6/n3
         udE+bVcMq6OyAgdYH1zWxjYBRpIKd90ATASrTbRmUVaMr4Q0BCfErQU31RTwT1PS76hG
         cbeEbSBjpz1AwvNBhBalIc9U+rxI51z/izin9Gk1OSHUlTBjKgXXPCoWWKFtGaGGZ8sL
         4NNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793010134; x=1793614934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=KHrbmOf2F0FaoGuY9SF3WxuZWl8t4HRAuFWN10h/1qA=;
        b=AfxvFT7UMW84WZW3FjL7TVnb1b7KgRG7hZqTttZDVZiNBNU1QLrNsnBBqzixALLyWJ
         pUi64SsAk6yFTfqNti+DplCJv6gTvtHZvj0zAWGoiHQfxDteDSwVuQ1vusrApMKEJRcO
         aDGUi5j7R0+kGjpji3KpjNxuzwEfxzDLjjcIwtAjsNlYPMomAXjEZFuykQGtBimsOh3y
         VldAZeSMu5sVVNbksRcGMU4XHYYY3IYhCnd3ztESvddt8g4c/X7rVLWq+c2uU0FIYldR
         n+UslG7jB6Xma8tfP2cOKZ/oeHwjfrErNGH6jIW87FKCHAwQBF78+cCJsPerS3zNXui6
         tODQ==
X-Forwarded-Encrypted: i=1; AKwUvBw+QSmkzCuF8E1XzJMGj/HPKxrjNSmg/ENCdgjGgIDM135Yv0Ntn/Htvm84SXsVj+crNdlbMFcg+u1xwA==@vger.kernel.org
X-Gm-Message-State: AFq9FYLvrtlp9OXgsqwbd2rqDx55AedckWq08ST1PAfRrnSFkUX4z1KS
	XYdlMRCrDBodlauw6mgHwJWQ6+3w1dK4EHPBFKQAag4Mjfi4UVeMXSZ2CxtqXpFOud3jY+j4etp
	ZiklxHOo/TBAUVmscFVaHdCzwJDvg/hrOtyF6oBNyZHEgBHDx06c+urADrpGbzxtXn4OXasa8Mm
	LM76Bc1nlJjsF7RJKFwFQ2hFAWfcqbahxSbW5YHjSm
X-Gm-Gg: AYBFou1nmdLUU04zqriKAdiOtHR7FZK2BPcYB9qETNInyJu6T/8JPG0kofJYCKgoAOx
	ZlnP5E0jE2+LVSPYYC52lKDO5GkbDtlGzF71TZLg1BzUd4PV4soRChzgPt3SNphivOMsoovDUWZ
	G4rbiUmwstuQhMTtoRzLhl7FhOErRrt1CUfU6nhrQzvLwb4dsSzFj+qYqQl/ZxLbX1U7yV5K+Mw
	hz1ty/T0k7LohN+lQ==
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id ada2fe7eead31-7ce5ccddaf8mr1532826137.12.1793010134559;
        Mon, 26 Oct 2026 03:22:14 -0700 (PDT)
X-Received: by 2002:a05:6102:148e:b0:7c3:9b0c:a75 with SMTP id
 ada2fe7eead31-7ce5ccddaf8mr1532813137.12.1793010134104; Mon, 26 Oct 2026
 03:22:14 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261024-kaanapali-camss-v22-0-7da3ea49c8a1@oss.qualcomm.com>
 <20261024-kaanapali-camss-v22-9-7da3ea49c8a1@oss.qualcomm.com> <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
In-Reply-To: <CAFEp6-2a9-P=eN-A3h_aWY=pbScKnwwn6me59S0oJipD4gLcmw@mail.gmail.com>
From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
Date: Mon, 26 Oct 2026 18:22:02 +0800
X-Gm-Features: AclHuK_xlm6aQdEz-Css4rzUDVJF4QbmrIMsutgXwCB88U0Xqwpq1be9I71U3vE
Message-ID: <CACbMrhrJTacHvdJ7eext9ucxwo4=XEDnnxxtL+DSpYzw+ozKxQ@mail.gmail.com>
Subject: Re: [PATCH v22 09/14] media: qcom: camss: vfe: Add support for VFE 1080
To: Loic Poulain <loic.poulain@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, linux-phy@lists.infradead.org,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        jeyaprakash.soundrapandian@oss.qualcomm.com,
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>,
        Atiya Kailany <atiya.kailany@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX4IIXQYZVG0lU
 Mp5INaQJmNowX+REdBbH568xnohSB7W/K4RM049FcMusxC8tIvE+UM8DuHJU/N+dwIhukYUIjlK
 l8/tRkGU7hZINbxAcKRl4Y6u3Rq0sqo=
X-Proofpoint-GUID: HbctuNtpnY5VCglg7FBtivZudcx875Q0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI2MDA0MSBTYWx0ZWRfX8M9PZ5fycb2U
 CRJGTPsLrqggmg5wkstxkdQRsNH07MnDJyUiw0V/9UKgX9JByUlmtSUoXGCRhZbFSP4Lt+wPNtH
 /E7tIe3AtXQSrEmkOEqUL+y1nywCwahdVa9oW4xdx8i6RpTeuJhLNu8pwReMWetP5Qw0ow0UToA
 UvGJR/I0fGZrMpN/CABjXmMMAoZhsHBrDOVpUsmf2SXOME60MOQ5KgFXzQANJbSbb+RSaIs+LdX
 PxxRJ9JowjUBJqzYYz/amvB2odymS4FHUby1yN5f8G5TtrEm7hx66/dh8eQrbCTV8RwumyUb7Gn
 mgwx1nmJrfXtTn5Hhz23WVpH6K7JVgAVPqGhDAiecz9FoHXdyzCoavQMPnZHN2PT6Y2pAYtDvML
 tNJ08/sm7ANtMX2o4wt6Y/gvt8FdAe1OjBmVUomY7upT+YjTLNlAilijreq8vE0rJ8xOPkBN6Ny
 MLL6TmnJFzHmCWIf6nw==
X-Authority-Analysis: v=2.4 cv=HZWB3SE8 c=1 sm=1 tr=0 ts=6adf29d7 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=q1ahQF__i1vN_A3V8cEA:9
 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-ORIG-GUID: HbctuNtpnY5VCglg7FBtivZudcx875Q0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-26_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 priorityscore=1501
 impostorscore=0 lowpriorityscore=0 bulkscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610260041

On 10/26/2026 6:00 PM, Loic Poulain wrote:
> On Sun, Oct 25, 2026 at 4:17=E2=80=AFAM Hangxiang Ma
> <hangxiang.ma@oss.qualcomm.com> wrote:
>>
>> Add support for the VFE (Video Front End) 1080 found on Kaanapali SoC.
>>
[...]
>> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/p=
latform/qcom/camss/camss.c
>> index 7acace363fc2..beca4b827b32 100644
>> --- a/drivers/media/platform/qcom/camss/camss.c
>> +++ b/drivers/media/platform/qcom/camss/camss.c
>> @@ -156,6 +156,152 @@ static const struct camss_subdev_resources csid_re=
s_kaanapali[] =3D {
>>          }
>>   };
>>
>> +/* In Kaanapali, CAMNOC requires all CPAS_TFEX clocks
>> + * to operate on any TFE Full.
>> + */
>> +static const struct camss_subdev_resources vfe_res_kaanapali[] =3D {
>> +       /* VFE0 - TFE Full */
>> +       {
>> +               .clock =3D { "gcc_axi_hf", "cpas_ahb", "cpas_fast_ahb",
>> +                          "vfe0_fast_ahb", "vfe0",
>> +                          "cpas_vfe0", "cpas_vfe1", "cpas_vfe2",
>> +                          "camnoc_rt_axi", "camnoc_nrt_axi", "qdss_debu=
g_xo" },
>
> Now that we have pm_clk in the main camss_resources structure, it
> would make sense to move common/top-level clocks, such as the AHB
> clocks, to it. That would avoid having to duplicate them across each
> individual sub-block.
>

Thanks for pointing this out. I double-checked it, and this makes
perfect sense. I'll move the common/top-level clocks to pm_clk.

---
Best Regards,
Hangxiang
