Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794563684;
	b=UualECASpows8sj1kh4YSUByxYJeO2xsg22vLNGQDimACuiJRFm26XASrssZXjQC3gJ1
	 GKyCQgzQC+WIZZziLK4wXwjBpjtEEFuayBouD/oI8WYaSvIbYwcsddEyp1/nAs1q5TpKa
	 0JYNlBp3iTrfHulrbTKn6rUbraEJiD2ET0Ksuk35jtsaxwNS+2W4lG9dX/qPKJj7EunzS
	 EM9oqHXOIHFwb5vhkcxM8sPojw3ttr7+N8StJw+GxDwAmlQ5rAvUNSjosnrbZhtu3L59I
	 B3mpVRgu+dIbv+tZVxfAJj0E/iZRUnvMfYkvw2KHzte2YmJ1yAsyO+MAxUhw3TlU32w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794563684;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
	b=cEqyhCspeKHmPq6xQguY620FpXppUdkDrBYOVIWyL4LF0QxZcTWTvbec0Blj5BHncQEC
	 IbmRFQCjrVZJkB9z4xaDtQ6pztR3qBrW0aoL3wZwjq6tZWjLdaSSYc1jpcjDYlSBpVt8I
	 UsKpBEPe9mJUynZiEb1YDaagO0cWIqOq13oL6Zovt5gWwI8gB8EoHG5QJSQLI2lMtZeIu
	 YUlZzKm8LWf3zlKfF1mv9kQ+YQZsoj3E8ntZQ+dH/Xz3l7v8vpYVwAs/8vmK5bd9Dp5ER
	 K+w6V1n36awOOE0/00qVn+l9PUAWRBg5NI0F7oXV+oQq/xA3BKoaC0ZFrvXrlfrTAOw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="n/9+4myU";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OpgJB97+;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D40B606A32D
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9D40B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=n/9+4myU;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=OpgJB97+
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8VAER913760
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:54:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=; b=n/9+4myUxHJ2L4b3
	pyRYjtpmX9OVXRcZ4u280wcXS0Wh6f2eEI0+P3AfccewIz2022OOhjrNuJYYSAPo
	Pwin2RNBFEMUw85K9fngCx1mpeZXl/my9cxXS/uAkALam5gVWNwJ2+ksOCxZD1rO
	NZeN+ZuRx0jYzszyM5TqB1YFgM2z+0iZT/B7/SQ+sb0TAAbEaZ1oNJxU4C0uH95X
	5LqOoJiRM6tP+8b/8xwi/33ND75GBqiBf5F9ItCeF+ZSI6NpRs+opJRgIab/7/XK
	8fS2QaneQA0RIfIlxcmytR1czXWTIv7vCoGBsoAhN8rKUyD4a9g8yKm+QDih6YAx
	p1q1Uw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hwbx34hqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 09:54:42 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-94958b50eadso21446885a.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 01:54:42 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794563681; cv=none;
        d=google.com; s=arc-20260327;
        b=WIe2P/NJ1lr181m2vC9JcK6e9k/AIgKXT8+Gofkkfayw282jJgMBoLdhdHSxYhEFt1
         SRJrMOcGMtZnHrK4T9uNAJRR5bbDuNFuvivClK7/+w/IkHSPVe7xzV3hGXTQDaFYXSgp
         qZygnJUNIkRttpnLZGFTWZgdquL8xaLpV/R3XeIMtgwDfuvS/2rrYAamsuNQmIVnYjbk
         HXLNqRwn5d+vPwUvmVDF6h1uaHYAXWTYeMQVJswWclaQO1vyZoCqpBN7pRNQStLfQ5xi
         XFM/Su1Iqz09v70XZ+sYil8kZoKd0ATEjMklh2RtXSzR2XlqbzyxPxbZ5ofkJNaz3a9P
         sc1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        fh=bqS0q3TxB25hK00cnsFuUTHJOKRpVXN/cfrDZgmk27U=;
        b=lytQfdgMZ+J9FexX5cYa6Y9lKP7lQHtmbWwX0em0FO8mbT+AYwDVtMOofIpg/3VIP8
         giqsci63kDwvyFW239pK50lfvRQ8LbFPSbkhtlJb/Zz93Iijh4TN292nZWXeQofzRmE0
         wKIAm2hQiwSSNIF9oUXLAV2qENdFSYT28Tdk/10imYqZd1m/98+tQoxhQGu4+qAeWour
         f2Sx0Q5eJr4fWmk0fGCYr3sdNxbByhSIsZT8Wkox8xuZR1PvwuVeR2r8AiA2B0h2Ldnj
         TLJET0yEb/PNfYHzhfx1awtaYz0NPHBGQKfgQW2zSHJRJzuzvxXUeKy6gcoOrRtx9e5y
         yCYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794563681; x=1795168481; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=OpgJB97+PXs+oX3bRGHOKrvm0RTtnCJnDjBZeYlymxs+HydvyxEDZi0aezSI5nezjd
         SNDr7O93tWM2TgnORMM4PVHxYh2qXL1TVwSmMEpNYR41D/SgqftwgJaWqMyz+EsnALOH
         yn8W3pp3n0eNpOsdqLF914fJfQZV8iEUb/W68nMKnyLUoJFGVFwf76E3NKxMMUgWVEMb
         r0OVSLTxYWRB1H3DJfVEccqvJNGY62KmEUkZP7fXUfHPVhBAG/uGGmOoOYx/nAoSIJpb
         BbwwvdwyqWhPGfYM40qeI8yQ3wivBnqu/b7aivrhdy6zaGCVRZs1kZgYoljWbsN5UiPm
         6xaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794563681; x=1795168481;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MUuHahUXcDaN6PAwfuUtFPiUbcMouajPZQiE1ymbJKg=;
        b=JzpehmwdFfw/RmHwD2cnd7cfZXMv1twYqRw8j4wp1INU6hn+U3q9UM2zkfi/pLXhvZ
         aUFLSo8iyvCaqxHoNDTx2OQ9Fe8hiSrhhmtj+6PMezcCI08djJYV2Ocd7O9xQLUdhMO4
         mXH42Xh/eZL2wR+fvRiRsBY8qf7mrqFw8tcYhOlPEw4ASekb7gd4eKEa7TENvd/XaPVB
         DWeX2ITzJpoLvDGN1ndosZHjAErLs/uj6MiTOMQWjyK0quJPjnhL8+MglDA+DwqwX7qf
         qDqsrrLkNoPZ0UPmpnZiehb1g5gFAFc3nNE321S+1QYFupK2rH2XtiWHAeJ5JrYZlIK4
         OR9w==
X-Forwarded-Encrypted: i=1; AL+hErFz2bXNSM7fExNfrtVzAVujL/d1lLjDcpqqezkyUKTEy66Z8T7TWOxtqekXLc0hNPUMS7Ieac9QjoRmTQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/tZw9j4OVrVX0ICW9AQvtqgsFWdOnr3M/mxu4JMfUSgIp1eIr8
	Umv056Z5KPRr4b5pE8JaWO5qi9Eja6Gj4xutJEb4V8HjP3pby2+WSyvxnqay887vvqk6mfTI9Yv
	8UfBMdDGXM59UICDj52noAF8/oXkTmWnDEeVPI23of+ndA65iDzkl3APvqjWEgC6a2JHEq0nxA+
	kucAvQQfVA8hXxqSZ+lgzGjfmXWwnraoq9NfAqFX2R
X-Gm-Gg: AYBFou3IW1jBkdVA+H1EpELBJrt7YJh69uapPjE6LrhkTDgWpnGIir17oXZ8kwHIrsE
	0AdWo7LxWfKGGi0Xq9CHIQBW5WZbHUykvMMyWgUGzXrWgG7jrMBJ/j2gjIippJxE25yPkAGrOvo
	yH/ojNANrjrjYvnteSe1VbQOIqrOJuY30N1ULC/VIACh7JNUQja2kZo9khhnEu76zLpSXaMb0XU
	LPev3XGNBHYsK3sSfIxBXxPQ+dljOjZMVJid8J48paTR7l6VFmGRbpd5PvrWiODQMfW7zqhpByO
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id af79cd13be357-9494baf6dc6mr335666085a.14.1794563681643;
        Fri, 13 Nov 2026 01:54:41 -0800 (PST)
X-Received: by 2002:a05:620a:1a29:b0:93e:942f:b8a5 with SMTP id
 af79cd13be357-9494baf6dc6mr335664185a.14.1794563681101; Fri, 13 Nov 2026
 01:54:41 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261113-glymur_camss-v2-0-b1b76509c744@oss.qualcomm.com> <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
In-Reply-To: <20261113-glymur_camss-v2-1-b1b76509c744@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 13 Nov 2026 10:54:30 +0100
X-Gm-Features: AclHuK--hQiioKQaB_FA-5QovlmCsdFTukadEaIJn5s3vWyrV73NAS_u6OCE7JU
Message-ID: <CAFEp6-2Twta_X4nyQVBa72zj1uaeGiK=F4j2edZFJrXA3rmtFQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: media: qcom,glymur-camss: Drop port@3
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bod@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-media@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=S+5MU4sP c=1 sm=1 tr=0 ts=6af6de62 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=x832WoCsc11X-eU8GdcA:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfXy5l9xk1iDoUl
 iWXJNHdEHOsqSmWjfHdnwzyv6xzfUQ+A/HTBZrCoUDme/RWIhMk3v8Ub3VmlRDldugR6S46KRHO
 0VHXXcyHFIoblrzHAD9RPFjBaltJgmeTaf8iCcfeKmdnaoWPPkKxSXA4MiCICctuGVfsLxPZDZw
 aYTdMWteXyZ56eQ4/a6kudJrOvsyVmX9keJly/1y7ede7WfA05RkOdsPK6UcUMi7DzdGNxE4fzT
 erWf0WRz31dkHz6wCBKwDBSRUASGRO7QwVyRMk49sSRGSXNlJV7sYl/YCiqmOLpYL1V4/X16RBb
 TI+sDT5qBSE25gmi6mid++oNTA0PGy7HKmE2gnCa5BztSvc0UR2M6Xn+qQ+Lu//73D7ZsKWlqww
 S4XCDxs38RK0rIBeLTq6jty4cRmXUfVfyD1pxMwLxiYVfR6eiTXRUg4KcoP4SnDCvxQCqsLGQuh
 oPVCfzjmYBpUAMQo8lg==
X-Proofpoint-ORIG-GUID: TMziPpH0MY9MV4OJIGB6FDT88hj0FadS
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDAzOSBTYWx0ZWRfX1tr8PKpgJelG
 itHoSUflSIuu0GJXCSQ25kxdKX/KD1clv/H3DPM2B7EycEID38m/vhazJYUiDpbLg/LT0/JvXgY
 LXPrZTOG1zBJz6Ug82jAGRcsfkD9b+A=
X-Proofpoint-GUID: TMziPpH0MY9MV4OJIGB6FDT88hj0FadS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 phishscore=0 malwarescore=0
 adultscore=0 spamscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130039

On Fri, Nov 13, 2026 at 9:20=E2=80=AFAM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has only three CSI2 PHYs, so there is no port@3 in the CAMSS
> binding.
>
> Limit the allowed ports to port@0 through port@2 and update the example
> to use port@2 for the third CSI2 PHY connection.

I know you put this in the cover letter but you should probably
explain here why you think it's ok to break the backward
compatibility.
Even if the binding is recent and we don't have in-tree users yet, you
may encounter pushback on this.

Regards,
Loic

>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml | 6 +++--=
-
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,glymur-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> index a0b77edc212319fad69113f3d55ca24f184d4b23..18a38fc4f9025f6b927780f55=
ed4fab194091c02 100644
> --- a/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,glymur-camss.yaml
> @@ -109,7 +109,7 @@ properties:
>        CSI input ports.
>
>      patternProperties:
> -      "^port@[0-3]$":
> +      "^port@[0-2]$":
>          $ref: /schemas/graph.yaml#/$defs/port-base
>          unevaluatedProperties: false
>
> @@ -288,8 +288,8 @@ examples:
>                      };
>                  };
>
> -                port@3 {
> -                    reg =3D <3>;
> +                port@2 {
> +                    reg =3D <2>;
>                      camss_csiphy4_ep: endpoint {
>                          data-lanes =3D <1 2 3 4>;
>                          remote-endpoint =3D <&csiphy4_out>;
>
> --
> 2.34.1
>
