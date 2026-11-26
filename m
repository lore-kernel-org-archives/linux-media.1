Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795708797;
	b=PikNDQsWS0eY17DBctYyyP1y/p2WbHLjBx9zUbwGf6D+vd71cX9CnGiENVEQKp5Y6uqp
	 o9l/Jn636NzCn9EcCCMBSjvq5g8sbNz1n7GTyJc16eOWrft+FoRyDR0AiMkntaMr6U+h+
	 x66Bpv7Y++xNc74mmRpo31mSPyVaE5AHUqDse7SCFSbz1PpYqE9hX5MnF8Ri4gLbCvXu+
	 V6swH/9+9fn2+Pz0Q0gPEIlE0Q7Kf8aJQMWoXKMa0aO3IWl3hah15DeBO9LarrnWc4Muh
	 35o3o8LMa8Tq8jOlYeLJFqF8D02l9w5u5qRxOQLSh8+qngp/2QehtG+PPddXP+vbCyQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795708797;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
	b=0hd/BXMiSxyssaJgkxNNJtu0ziHfBYWodLlWJWxomiZhuIb5cbbc89I41U+JuyMYuVVj
	 SOhZarfX/2xkQ7LRWPADiA77bPVK/ZRibGTM+zYbmramBc/KJ0/qhzWo1OhKXvzD9+nWE
	 yTLjy5mv4B32//nHfxbdI7aJ8HQpaBLAyWmHWB3XrejQqbXseRkJUnEuIlQGcRnKoDNhm
	 PHqoUWkhDWFElhyC0jaCDVo8y76F/4SZmnSYMghLRK69bj/bkSV768qTX1eDCSVa0wVee
	 NchFSFAfYKmOQWYlf1eYWgSz6HFlHjd3k4hoerLPZfcm54Hcx+z8aGL3180UTAh4fxQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhABBdDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT+Y6Tez;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD874606A321
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:59:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CD874606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=DhABBdDL;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=CT+Y6Tez
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQFu9T92835170
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:59:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=; b=DhABBdDLvQum7O59
	AQvVo8O50yWYH+5zhVt/6j6Vqgfjjnij8Az8qaMhwCEyV3CPKRfqLrkEG3VuAsnk
	0FNCfNzlgWNW/xBcZqPfmY9lQQDOabPQHzkV77VHy03nfjujNO2Cb0zlE0e99XMm
	28NfwbtwNOiYDWAVV05jHM2VkSnvLv8pf1qKccyx/zQ+kAePPWp0xAcO+uoYue61
	vjPbmCDQjEkHNcg+RemJp103hjez7Z2Gb9bmgOD4Gkx/dZcgIintmjJuG92kCrxM
	b7JRTDq5zQr5lTh1KgnjL3kSpOEci+MBDOaoduULzXPBKXJttr9n+/QsTlCwIFES
	JsFuaw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j6pgqga5d-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 15:59:55 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-949b0d322fcso1194484185a.2
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 07:59:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795708795; cv=none;
        d=google.com; s=arc-20260327;
        b=OJlw2AbhF6+4rYQnvMDrlZgC4xSgm04ygLYaG9pb67yRWCO84SGdolZNC05l+57x1Q
         KSIc+0qpL6N2dVNDHN3EeveH+gJFN0ENOfd4wIMRPhJ54V0gUTnsefJtXzuute+LdL/L
         4MUvt4TelrxOUnzgSTUJGoG5eQPxGej3EyeLMQKfRW1ra1zqs8SP8Dllvzh1aM/GkAkY
         YWTQhhqczZFDaLe4ozLAr14w1iydxoUgNaMc3ie5FwLGTxEC9BaUT3K8nMeRlaw3gMkT
         5WjPnAPyjvegQRmJwULySuRney2mvux8wA7idhuNn/MKTKwkX1Kt3Wt5RDsjac5g4+UQ
         iCPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        fh=/QgiAD/Sca72HKJaVtuwk9T4o5K9rbnMafvLHFEMw9U=;
        b=g2Zc4Var97dSbXCyi3GrK/dYtpviAouqlSN5FFTNdciTcQTjuSAxJvNDsYagRSzNKO
         UiUNnn25/60BQiD8tVojTjDui2v5YmzzoSlAAo9GPDFx5jzKFf6o+BOaIB+7ck764UIo
         zUCnswKyoPCOOl1Vf7eUqQexJTsXyvpNVp8TiWnW9fX8AK1b2DNZnPvkMPdTfd8qZzwy
         4J072zdAfdIiaTdDsB2CLIn9eY3/UDNugKz3xX8PctFJ4/DCcWdisaVvikhl439O30Ol
         VUJ7p1LESSGtZRaPypkUlKs9hkQKIl/5no5aJPmgDnY6zQuSLx50moKPT0L6FjsvNCYt
         jgTg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795708795; x=1796313595; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        b=CT+Y6TezZ7fQMIfeKzR2Ayn/82qAzLdh1YpUAKIJNZPrSx2LVBATcZwit7PO6aB5ud
         0wnt7UFMNo6uMxXg9Xv8IfgF6KlBz75Dy7Yrbbk1dJKTq70VVfmnvMMyorpqGFHDjC+t
         CeM0tHiq02YSKwuJ468cHRV+QlB8ma508eFOGJB259H4l0UArpJgQYV1XBUl5kVb7eNr
         odhI+xoYTtBgTxjrzQqGq1WE0iyYP0hqTH9Og/8qYp4chvdxlEs9JzMznAKdou5I0X3z
         8QuKTn3rchF4yeW3dpaYyUz4UklVGtP3Gunx2TUTRb5t+ienYNZY3NdUTrO7/ddfMOSj
         HHbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795708795; x=1796313595;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=C8yeyIqOC3W9aXuBesLk0QQ9NHdeL+wkXCVAFp+Tjio=;
        b=KJuAbYp1H4XlHUvyXbE48600E25O64BsmMXNoo1TMyuLhHdRredo357E6xyjdkbLOI
         8VWS3i2cI1jo7NcYG4u1kwN1AF4MunvywrWpG4PrkiunRo4iA2nGyAxkLrEOsQdIadFq
         rkakAqhiCwHxL24rwfNV9hPOAF/eVp0IV9A9+zQx8gWqFKH41MDIVWTW9K88UaRwuuX9
         i9WVYxV7dobO+JK+AC6SRDYEwGpT2KsW6v8yAEqXbHSUhYqhg8lJLayl2H61qGvCeZIj
         amq7w2hnSn2Ju37zZTfMeEtd9+jJbhgmj9p0xbdbnMRboHkkj+wdNRk9PO5g/3mB6n9e
         mWvQ==
X-Forwarded-Encrypted: i=1; AL+hErEIMWLu3c1yUOLZESez0BxL6poh76j40UQUMOx+J7YzYT1FfrAqobDpeQpKBRfRwTlJm8h82DdMsTrz+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+pWmvLSxykJbrFlteH8QBaokpodk2+rJwuR3247jzmdXdhyPIb
	hlM7EQKA78Cu/SVnqIKIYLHoLVdV0DjGX4c1KtyQaEeEfeNa5akweA1kCNh2hmzzb7oO3AV6WDo
	tPehdIZ8D+hxyUMYAbYVbV7VdHKyCTH95Ogdny8xzBi6g4P4Sqj/cm/5SlJYqHIDcWipAuVl3rr
	fkeideSd/ohbtp7KsK3W7zgXxMe+ZPa+YH0ULG9bdu
X-Gm-Gg: AZFdTZfn1o6+m27htxn2bi3fTqdK8xOjw3UbnrZgIqLNr0FEyv16U15xB2WLAJQx3Pc
	3SX6pLMe/meunc7MwrXHsiAOwxITC4KtQgQ52lBglLWWVrtq3Ksbw3N4ntZ2KVLoheDxdOVilqj
	nwSL3hP/5W8IlK3XUPOhXXU9Dt6t7snhYMrbWLtWMsinVQDcDsBO5NSvXYrOg8n7Wmbw8WrtrrS
	A1nczhmlvW0PHOe0izFx4FlPk5FQrGzu+p2/smFiGdekY7sX4HWUnHedETjSDw/xaHvGpiDPS7U
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id af79cd13be357-949ba9acb4amr3818799785a.37.1795708794793;
        Thu, 26 Nov 2026 07:59:54 -0800 (PST)
X-Received: by 2002:a05:620a:45a2:b0:945:d1b3:f047 with SMTP id
 af79cd13be357-949ba9acb4amr3818795285a.37.1795708794291; Thu, 26 Nov 2026
 07:59:54 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org>
 <20261031112203.545319-2-vladimir.zapolskiy@linaro.org> <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
 <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
In-Reply-To: <8a34e083-f364-4eee-9a46-9533647f323a@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 16:59:43 +0100
X-Gm-Features: Aa3M54peUk6XV8OD7QKnhkjRXQ2GxSLWWVGI6NCDtwyBprAYGTAHPkFhcVa-1Ws
Message-ID: <CAFEp6-09L0nwaRv-SQ2dXutFZwR1Vj56C_9bHXai8CPa=mqQ3g@mail.gmail.com>
Subject: Re: [PATCH 1/6] dt-bindings: media: qcom,sm8650-camss: Add test
 pattern generators
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
X-Proofpoint-GUID: CzGOhIbUKEBpS-yIiR3EXumF6bZRgVXk
X-Proofpoint-ORIG-GUID: CzGOhIbUKEBpS-yIiR3EXumF6bZRgVXk
X-Authority-Analysis: v=2.4 cv=A7H5rKWG c=1 sm=1 tr=0 ts=6b08577b cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=YMgV9FUhrdKAYTUUvYB2:22 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=rdiVOT_3p2XUELqUUpsA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfX3ErfBCJv8uPt
 5gJkO9Kp5o7Ja5kdf35ECjTusdMm6Mi9roQy6tnweFW/OrQwmgpcmkDHs+OU5F6rOXh/TpXPkmk
 qqEpSmtUcriEMF7lLBSKmDZWPtQApCo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA2MiBTYWx0ZWRfXzvhY5gUSfIkd
 cso4EYk5dk2bqSVsypUxwypp0WR9Gj933RFKfJaA5ikdjf5uZ86bds+Cxde9NL5j3IxZGeM0OWI
 tQtDYjik47cjz+blAzQ9fM82uDjf89CGC/aiibNRdpRdqUcrxplTord8KN7wCvf2jU6UsA1SmGF
 YW0eGtOcPNavi5ohMytmUC4sbkfqdIHVBsCHOlm75kow/OIiE6Ijj0UVmNRGISwbHalYDTZQ5TL
 eusy8x/YI8hERAfuRMzxmraQL0XMO4Flemtc8xSCAvhmq1ns0qcVEEZT9+tIyZB3QuK/K7XqO3R
 yldKM4KeA7BpEO02loxQCXQ69qKXxrQuFljKXwyUCTh2vGyrkDVcpCasVCuaUVt3nVEyO8CPuhs
 Nhbp2uMnal/dArHT0uf8ZtTCli1YFQnyfJBdxZiKCPWq3zzZC5IATj4B8efoIo6PMUpzN3IOEyj
 kDY9IWvcIaLnpDDWzAg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_04,2026-11-26_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 lowpriorityscore=0 clxscore=1015 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 spamscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260062

On Thu, Nov 26, 2026 at 12:23=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Hi Loic.
>
> On 11/26/26 12:52, Loic Poulain wrote:
> > On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
> > <vladimir.zapolskiy@linaro.org> wrote:
> >>
> >> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) bloc=
ks.
> >> Describe their register spaces and the non-real time CAMNOC AXI clock,
> >> which is required to get TPG output frames passed to VFE.
> >
> > Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
> > the TPG perform any memory accesses?
>
> No, I don't know the details, here it is a simple experimental evidence,
> basically TPG works with this clock enabled and does not work without it.
>
> I believe the NRT clock is "cheaper" and good enough for TPG usecase, and
> to some extent it is a buffer data copying from some (static?) memory pag=
e
> sitting inside a TPG IP block, while dealing with PHYs requires more
> expensive RT clock.

Ok thanks, checked internally and it looks like there is some 'hw
channel handshake' requiring both RT and NRT AXI clocks. So fair
enough.

>
> >>
> >> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> >> ---
> >>   .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++---=
--
> >>   1 file changed, 18 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss=
.yaml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> index 9c8de722601e..50ae30cdcb82 100644
> >> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> >> @@ -17,7 +17,7 @@ properties:
> >>       const: qcom,sm8650-camss
> >>
> >>     reg:
> >> -    maxItems: 17
> >> +    maxItems: 20
> >>
> >>     reg-names:
> >>       items:
> >> @@ -38,9 +38,12 @@ properties:
> >>         - const: vfe2
> >>         - const: vfe_lite0
> >>         - const: vfe_lite1
> >> +      - const: tpg0
> >> +      - const: tpg1
> >> +      - const: tpg2
> >>
> >>     clocks:
> >> -    maxItems: 33
> >> +    maxItems: 34
> >>
> >>     clock-names:
> >>       items:
> >> @@ -77,6 +80,7 @@ properties:
> >>         - const: vfe_lite_ahb
> >>         - const: vfe_lite_cphy_rx
> >>         - const: vfe_lite_csid
> >> +      - const: camnoc_nrt_axi
> >>
> >>     interrupts:
> >>       maxItems: 16
> >> @@ -226,7 +230,10 @@ examples:
> >>                     <0 0x0ac71000 0 0xf000>,
> >>                     <0 0x0ac80000 0 0xf000>,
> >>                     <0 0x0accc000 0 0x2000>,
> >> -                  <0 0x0acd1000 0 0x2000>;
> >> +                  <0 0x0acd1000 0 0x2000>,
> >> +                  <0 0x0acf6000 0 0x400>,
> >> +                  <0 0x0acf7000 0 0x400>,
> >> +                  <0 0x0acf8000 0 0x400>;
> >>               reg-names =3D "csid_wrapper",
> >>                           "csid0",
> >>                           "csid1",
> >> @@ -243,7 +250,10 @@ examples:
> >>                           "vfe1",
> >>                           "vfe2",
> >>                           "vfe_lite0",
> >> -                        "vfe_lite1";
> >> +                        "vfe_lite1",
> >> +                        "tpg0",
> >> +                        "tpg1",
> >> +                        "tpg2";
> >>               clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
> >>                        <&camcc CAM_CC_CPAS_AHB_CLK>,
> >>                        <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> >> @@ -276,7 +286,8 @@ examples:
> >>                        <&camcc CAM_CC_IFE_LITE_CLK>,
> >>                        <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
> >>                        <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> >> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> >> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> >> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
> >>               clock-names =3D "camnoc_axi",
> >>                             "cpas_ahb",
> >>                             "cpas_fast_ahb",
> >> @@ -309,7 +320,8 @@ examples:
> >>                             "vfe_lite",
> >>                             "vfe_lite_ahb",
> >>                             "vfe_lite_cphy_rx",
> >> -                          "vfe_lite_csid";
> >> +                          "vfe_lite_csid",
> >> +                          "camnoc_nrt_axi";
> >>               interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
> >>                            <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
> >>                            <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
>
> --
> Best wishes,
> Vladimir
