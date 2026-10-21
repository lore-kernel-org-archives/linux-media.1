Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792569409;
	b=WsZHOPBPcSneMjVV6n43xSYh4Y0v28P7Gv7pT+3FWGb2kNrPvmQamxbJOxR2zFu8NvPw
	 WCXjRB6Q3x7lIkpoAi53moSvUIzRX1szRu8WmE6hQRjYpU+pHc6I+BwkmdJMw3D+lRyLK
	 pERUbNGxLd419X6mfqkjFe04/2lESWsRTUZH0UmeZ1Wb8K6seExYcA2u15FJv8LkUcwvh
	 hDLoGvJqkR1ewGRP2V6ZQkhFaS7orOB3NQaTCwsj0DKsowuay8xQ/No89twVgY2YIB42+
	 61WpEcy1CmrKpZnt/ImctMw0ehtQYMxqx9e0owHWIBMO0G3vHeZ7QCI2IfK8UsYiF+g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792569409;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
	b=lQjZewrwBANwJD4uvISZWiotw6M7H7rIY2wmWrdj4VxPBF734E3tcFWozf48MkwC3xsU
	 rjwxs/hM1m0BHoI9It+GIDoZJWFilZw+fzbuZtt9Pn85Q016cuyHo3hn0E9NiYfMW6ji1
	 yweDFFGBtH0bYovh6uSFcOfAttQYMtbvDJdFN7bvRLNYsQ9AKBBnkRf9E1JFjY4P0ssnu
	 Ktli3I1D1euc9YJytXnxdEAYRqd1t3FANCqf56BGzDCYCZmyIfk87VEsTwNhsqwBpsFkQ
	 qWuI5aFURlHNHWIOwqkRs5OX0MZ7hiOYYYaAvENv+J+PJqOe6Wtl4Z+1Kw1XOxENO2Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrQWPL2t;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0D36606A31F
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:56:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A0D36606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ecVcew5d;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=BrQWPL2t
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69L5jIgF2848156
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=; b=ecVcew5dxNN4k/2h
	0RYmgVIYj9XR9ah50jv/VbBldcVVw6zbs/CXd/yG3XcGS6W4b7bB+jU3hw2n3Qv6
	3TQtOw6bJ1aZpflwraMX5ssKqb7s0LDOGyA8OQngx4RF7BV1ajmbnlumILuWKT6J
	FfGE6X98vL3noPVId+y+Pm7ODYSl23baYC8sChE8YDbh0PV1fNqQLzIJKCCVg9+e
	mF1thX/NT34kBc0UHCo1vl4lRu2NfZrBMikrimQIlhu5S+IKzJy7hWyLmvO+c+Q6
	f2L+EPdPRsESNwVnfwO3Gkl+4zqUJxj/Xa3QvIZFI3M2G/Z6QQTQxSH7y1OITNda
	MQVFDw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4heeb9afd3-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 07:56:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93f2373e9b4so51397485a.1
        for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 00:56:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792569407; cv=none;
        d=google.com; s=arc-20260327;
        b=m7eVVhFkbpMJBi5A229nanj0JUeILiEbSJfxk1caleZy3/81y5iJhZdJ/KcRb9EHPL
         +E5bW4RR0nrWuGa76fzcDSjTS9c5/VoAdZqNVQHdpALE3j9K/Ad0iUuBSalruqi2EURU
         9WNw+h32ayOBO3SCqV8tchS9N0+YVaVxvCiqkZVWJdCO51nQ6EvEdxvyuzVgONcj4TgS
         Ti4eBs96JX0eNCYDozJAHEiprge3ANv24BMDHtlPmNQWrpptruEvGUAMefonKZCtB7SO
         Izadl0FdhdSelX22oUH+ew3aK3ihaCn66UheuL5z0fpUNOZIcGcrojnhIxced2Fw9HnM
         gWZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        fh=R8COEcONYL9RWb7xyfYM9/ET0GJbIDXCjLq3zXgUmHc=;
        b=GwIdlMEAGFXut0O1uDVplCStmg3FBi+8UjCtPbzCOR5SYRsILAIqHbUw4fNmUqJ0ld
         95+DBcvjYm1ntHqMQM1DNeMkRu8oozW3a4xDPp5ZWegPd7un4vUagDoI9FEro3WpR5c5
         L2Xe8jFrfuu0cIj+UZER/aCq+a1PoVRF9QERUyq9DPOtOv6uHw2Ef9D5z6iPuqEKxPSB
         LtRDc7lqBbm9ON3/IR2U/JgkxvMJTGnvQq5saP9C9DA6KXPODC+8rc5MjhjG+TddJFgV
         /jA+/Lz3ytVJJXV54fcOoblAn1T68A5q+jFxjDdPvqeeyY4rp/m+7eMBlJ3QMUUYRiAW
         66HQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792569407; x=1793174207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=BrQWPL2tvcvvtyfd/UPN6pBgXiT8po3LOm3XgvE5p1+Bo/kvAQqGaNetZQDDjX+MIG
         MV2G9x0OPDBrH5WfXh1dlRPPJf4Z11A3Z6uQeDpBu+tquQZJ5jQLG0Hw4ek0iBY3lJ5B
         OGa72i8gc88fBLYdWmLGAWzRwjLD83EZaIcQSZyOO6xjubdSQ9x1/mWwqNmDSc85pEjz
         wn9/aXSFIHt1QVWjyrZ2P3sLLDRsbO6MKKyaD+tHDu2JFMLWRYqqIPRyxsPmB3C75ORd
         Dw31fuD5b/Og0AVh0ZU7VKoZ02oXo7zOY5OYtvaPh5BP4Fm1csU4c30MTvda7MdC/+NA
         co9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792569407; x=1793174207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oIWWxOwnRpq6QbCd8IrW8JOBm2tuiGSDBQ2+EhIn+aY=;
        b=2xD4EiI5fa6WfSXu0uoM8w3FFTmFI9uyQ7KK/eaYpJFXBNaYnMmYzr3UH9vu7lY905
         lxxq4BRVZP3EDUoekscaqyXIKtGHJhsVTtN9NXsbDwI/aRmhhHa25a/RzzrENecccURi
         usXcpIwGeYBgMCgksq0fX6AAmaeN2lqq7cDUloN1zByixoGWYrzlLkZj3tPd5+efgn9c
         BGFVjELCiJPVJJ4Eg70ZGU01NsgGJF1wsdpuABNr7YJzmdEeq3KauUTT+LnauE5CWiTO
         5vkB4JSA7yrpTKnAP2+/SbLOhngtGCQy+sS8VwbJecZloUAIlEHi+m+/pmmoLGDB1oKC
         CT4w==
X-Forwarded-Encrypted: i=1; AKwUvBzLd2ZyGCTtkx7T8MO7neDppp16OJ4zl6NfQzg0CcQ+llWxzGr8yywNoHs84pRozHaIehrc7BJAmt7vZQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYKoQP704VydPiSgUEmBSr7eScbj89u2J9NlAgzNNlNHIf7tqyTB
	SoAk1THXRNf12qxkdgHM0Nrqlv0rPsXRFUjwh2QPRTQE9IPR761T5GHPgdO8Qy0Qv+b0AjomFFv
	UF9y1Y32vqMjrY4/6DovqMAX0DMeP8X/k9QDTHajdq7LW5jo6ItpVlAMBm28YgGeIKciATYCeq5
	iATbZk7crL9RZYkczLC8u0iLrwgxnyU0oVYjNf2rgn
X-Gm-Gg: AYBFou1kKbHTINQE/nobzx8Q2H0SuxyEa/7tvARPFbQBInjAJDgnOQ835MXC1bJ9Czn
	YxWFQq82/+iW5WnR8YbfKN9W2mi65WLSCHzWkEAboAIALK40Rb9AW1VwKvJu8tJ6PhMT9ZJljeI
	dMZNb8lj3Ce37P5CmyPSfIlCqZpLy8f5HJBlaM5juMhXGesPPEQMzDIJyTtts7RZDtLo4WsnhvA
	Ro8ftJ7X3CQLB68PS0rqZOo6T5VPX2ttxlFAtNcldcHqkGdu04F7MVH2pPBmkAFvOHm0k6c9as=
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id af79cd13be357-93f57ebccf4mr265203285a.10.1792569406229;
        Wed, 21 Oct 2026 00:56:46 -0700 (PDT)
X-Received: by 2002:a05:620a:2b91:b0:93e:4f4c:b380 with SMTP id
 af79cd13be357-93f57ebccf4mr265200885a.10.1792569405691; Wed, 21 Oct 2026
 00:56:45 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261011-kaanapali-camss-v21-0-04fd28d815c6@oss.qualcomm.com> <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
In-Reply-To: <20261011-kaanapali-camss-v21-4-04fd28d815c6@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 21 Oct 2026 09:56:32 +0200
X-Gm-Features: AclHuK98k2MczxGrkHeLuzC-J1vF9mCnI0valuaGqqaz9pJgB0ntPucnOeSha1c
Message-ID: <CAFEp6-2d_hpbJnxR4uAzWhkk+h2d6ffkbBWyATKGrJi2E_z7KA@mail.gmail.com>
Subject: Re: [PATCH v21 04/14] media: qcom: camss: Issue stream-on REG_UPDATE
 from CSID
To: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
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
        Vijay Kumar Tumati <vijay.tumati@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX+z8E4AJmtFpl
 Hf1zAp1BluHCNFNzlXpCXNQsnHNrIg7wCutQ6SxBmbJX+O/d07ViEcR+lVd72Dud7Jivlk6CiK2
 4eZ0EfEp1CPiNtzyFhGpnuiygBgMqWk=
X-Proofpoint-GUID: CuDi6ecQTPOEu9p0w15ALJ1FO9avTAZr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIxMDAzMSBTYWx0ZWRfX6J1XSc40atyc
 /ma2vEC2AuBczgqgTUiEFuRcoYAQiBvEBEUDctWDobeJsznvDicS0AQlIH2krMArMkoPsrjulVr
 2pXyVam33OsuOIPZhLlQiXaRM2IrmaM8WPbgMellxagZ2o5biq6R2xSPngjS5PVPpx8+y0Geusm
 Ow8iqn2FHWoKIsldjsAL4gvL2Mmj/OKokqq0Yd6AR5fZwKvkRdklYAkuva0kJ3/4+iAsymFmIvx
 vEiFvfGBR9PZbEdb671ZErbOcxIfpGlgLYn+UY3UeGmN9I0wxdFxxln/VIzdQZ9BUiUnhkZ+vNY
 NJWTQuJb51SDz94lmCoStjWnSK3dZV0QejwfeWODbzKbBqIaEuRE01QKhxWx1Xk4iqN/eTIfLcp
 hdzfxAVLBurEzjcZ30xsRiHb6yMLsbyW57gKVumlF4mj4DmZRXQ1YGOkiCPJ+4tP8i6GI5h9DIY
 aMXeY7p2/RZyNspyZAg==
X-Authority-Analysis: v=2.4 cv=R42WitRX c=1 sm=1 tr=0 ts=6ad8703f cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8 a=0Hab3u7fAHnAQfOSGZgA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CuDi6ecQTPOEu9p0w15ALJ1FO9avTAZr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-21_02,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0
 malwarescore=0 adultscore=0 clxscore=1015 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610210031

On Mon, Oct 12, 2026 at 8:45=E2=80=AFAM Hangxiang Ma
<hangxiang.ma@oss.qualcomm.com> wrote:
>
> On stream-on, CAMSS starts the subdevices upstream from the video node
> through their sink pads, so the VFE is started before the CSID.
>
> Starting with CSID 680, the REG_UPDATE is issued through the CSID
> rather than the VFE. However, vfe_enable_output_v2() still issues a
> REG_UPDATE after queueing each initial buffer, before the CSID has
> configured the stream. The VFE then never signals BUF_DONE. Therefore,
> the CAMSS now issues the REG_UPDATE from configure_stream() on CSID 680
> and CSID Gen3 instead. The operation happens after the RX configuration
> and before the RDI path is enabled.
>
> Skip the VFE-side stream-on REG_UPDATE only when the CSID connected to
> the VFE sink pad implements the reg_update callback. Platforms whose
> CSID does not provide this callback, as well as lines fed by ISPIF,
> keep the existing VFE-side REG_UPDATE.

So why not simply make reg_update optional and either not implement it
or nullify it for the related VFEs? That seems much cleaner to me.
If the VFE implements the callback, we invoke it. If it doesn't, we
simply skip it.


>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/camss/camss-csid-680.c |  3 ++
>  .../media/platform/qcom/camss/camss-csid-gen3.c    |  3 ++
>  drivers/media/platform/qcom/camss/camss-vfe.c      | 37 ++++++++++++++++=
+++++-
>  3 files changed, 42 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-680.c b/drivers=
/media/platform/qcom/camss/camss-csid-680.c
> index 345a67c8fb94..556cdfef6207 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-680.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-680.c
> @@ -296,6 +296,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         int i;
> @@ -307,6 +309,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>         }
> diff --git a/drivers/media/platform/qcom/camss/camss-csid-gen3.c b/driver=
s/media/platform/qcom/camss/camss-csid-gen3.c
> index 0fdbf75fb27d..830c9c818d3d 100644
> --- a/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> +++ b/drivers/media/platform/qcom/camss/camss-csid-gen3.c
> @@ -219,6 +219,8 @@ static void __csid_configure_rdi_stream(struct csid_d=
evice *csid, u8 enable, u8
>         writel(val, csid->base + CSID_RDI_CFG0(port));
>  }
>
> +static void csid_subdev_reg_update(struct csid_device *csid, int port_id=
, bool is_clear);
> +
>  static void csid_configure_stream(struct csid_device *csid, u8 enable)
>  {
>         u8 i;
> @@ -230,6 +232,7 @@ static void csid_configure_stream(struct csid_device =
*csid, u8 enable)
>                 if (csid->phy.en_vc & BIT(i)) {
>                         __csid_configure_rdi_stream(csid, enable, i, 0);
>                         __csid_configure_rx(csid, &csid->phy, 0);
> +                       csid_subdev_reg_update(csid, i, false);
>                         __csid_ctrl_rdi(csid, enable, i);
>                 }
>  }
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 2680a9914765..16a0b5663fe2 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -502,6 +502,37 @@ void vfe_buf_done(struct vfe_device *vfe, int wm)
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>  }
>
> +/*
> + * vfe_upstream_csid_has_reg_update - Check whether the CSID feeding thi=
s line
> + * issues its own streamon RUP (i.e. its configure_stream does the RUP).
> + *
> + * The CSID->VFE link is created in camss.c for all CSIDs and VFEs, so t=
he
> + * upstream entity of the sink pad is either a CSID (possibly with RUP) =
or an
> + * ISPIF (no RUP). Only enabled links are considered.
> + */
> +static bool vfe_upstream_csid_has_reg_update(struct vfe_line *line)
> +{
> +       struct vfe_device *vfe =3D to_vfe(line);
> +       struct camss *camss =3D vfe->camss;
> +       struct media_pad *remote;
> +       unsigned int i;
> +
> +       remote =3D media_pad_remote_pad_first(&line->pads[MSM_VFE_PAD_SIN=
K]);
> +       if (!remote || !is_media_entity_v4l2_subdev(remote->entity))
> +               return false;
> +
> +       for (i =3D 0; i < camss->res->csid_num; i++) {
> +               struct csid_device *csid =3D &camss->csid[i];
> +
> +               if (&csid->subdev.entity !=3D remote->entity)
> +                       continue;
> +
> +               return !!csid->res->hw_ops->reg_update;
> +       }
> +
> +       return false;
> +}
> +
>  int vfe_enable_output_v2(struct vfe_line *line)
>  {
>         struct vfe_device *vfe =3D to_vfe(line);
> @@ -511,6 +542,7 @@ int vfe_enable_output_v2(struct vfe_line *line)
>         unsigned long flags;
>         unsigned int frame_skip =3D 0;
>         unsigned int i;
> +       bool rup_in_csid;
>
>         sensor_pad =3D camss_find_sensor_pad(&line->subdev.entity);
>         if (sensor_pad) {
> @@ -523,6 +555,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                         frame_skip =3D VFE_FRAME_DROP_VAL - 1;
>         }
>
> +       rup_in_csid =3D vfe_upstream_csid_has_reg_update(line);
> +
>         spin_lock_irqsave(&vfe->output_lock, flags);
>
>         ops->reg_update_clear(vfe, line->id);
> @@ -552,7 +586,8 @@ int vfe_enable_output_v2(struct vfe_line *line)
>                 output->gen2.active_num++;
>                 ops->vfe_wm_update(vfe, output->wm_idx[0],
>                                    output->buf[i]->addr[0], line);
> -               ops->reg_update(vfe, line->id);
> +               if (!rup_in_csid)
> +                       ops->reg_update(vfe, line->id);
>         }
>
>         spin_unlock_irqrestore(&vfe->output_lock, flags);
>
> --
> 2.34.1
>
