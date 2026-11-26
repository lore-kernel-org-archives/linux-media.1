Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795690384;
	b=PYYiecGhfs6Dhczg+jDhX7iotQfV55NUixbPszqSjxVoR2VMhFTbKoQjBY1c4+d7a718
	 etnJ51W8P6MJj2QhvGMLf/4g6Z4Slgg+YcicfV57JVBWq6hTuGaXFu+3ezNm2jeeezmqp
	 oEoEnFU4qKpdUSaEFLcMyQPkodLiTzdS17U/TzkzR5D7wcs4gajS77h+7e6/dZsO0LySu
	 FCOY90UK/zDuYAOUWsZy32u+nwUiVQ7xXzJN8vw2Nzp2ptE57JELL5WQH1X6a3UlM9G1C
	 x43gdQ8RB9pNJyg5B7ZV628b6PhH2HEYim+C8R9K/tg4pwzRaPBWVDx/NDZYrb1G1/Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690384;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
	b=VmRGBiPfvmiO9Vpi7yDKioTTKLcCdtvZfutrOYCfVeVYK9zn+Yqdr6t01tPMDT2KsPxM
	 +H4ACw9aPwfy7UU68sBNRS/y6Y3geIDJXLDcRPEsc64yXmD3fF9SFstkLPoW+Qo7B4Zg3
	 vqj68CVuQjfGKpTyMog5Ie0f/kzx2mulfSRshrXWHvLaQUTXJmxmilrkQy9DucfkqqRjX
	 qbbnVaYU5z+WBZTHk3dk7DkRN6CwUaaHB0ErXdrWx6roSA17DyDy+qwAb9g/KBEZze3H6
	 r34gCa5rECEyp477QFPtZHmMtTwM8l9gVlqd1TYc2dUm4mpKSqXRxUtp+79Da93C9Sw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F4CA606A323
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:53:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5F4CA606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=ENWuQwNF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=exVlGjqy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQAXNgK2629975
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:53:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=; b=ENWuQwNF1PEb57jI
	VZKSA3QE2yjQY7SEbjn//krCUApWSGEsKWnN2OBqjPoTBcZFX3oVVhdeA02I5h5/
	cdfLurFQiPpgSy8c9/WZKqp0Gf/fGPURfmzPccY2GN6IqxKNlcGUXlFUPSg3gPlI
	uF5SoZdOzKcgXWuIMDQJxVjvRtzJR9vNISwI5GQw8m/yZOl+P5TrX86AKZpvelRH
	W8/y6hKsbE0XNIdkWJSgU8RYyB6Uhr0Ze+IxVTQXWUSJNvfcu/ifCF6fdgw8Sm+N
	CiRznVhxs0eFNC0pItmKmD+ka3DhIQpkKpxym5d0ACMxDGT2SntI35eebUs1J2eM
	OJ9D8g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j61ahv39u-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:53:03 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-93f32050e72so1499005685a.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:53:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795690382; cv=none;
        d=google.com; s=arc-20260327;
        b=PziUzw4PN/TNdX+hqiz9C64sw4zmoIHJfuIh6Agw9WO4Ixd4+Q86xJeVz2LqAXgkzd
         XW72RoM9zVJIieM4RCmNY88lrESM0LBX+VxJ7fIyzmar2y7K7Zd2deQmRlrxUw4mZ6a1
         3RSfQbjiZvfvXJaVZjEDHDA41Lk6jf4pvAH0a/6zem2QN60bE9XlDnm9jBM3D8VhBU0r
         aoIKoM9vBaR69oYBcQ40whEq1DQt9jFEWDjCuy6gYMgpLWaBYOPBQmh1516orR+ArTEv
         vhi+kolUmU8MzQMGWisCHm1VMIubE3NTdp4PvCU0jNAMHLuFrBModDNJ22ltUg1PbKvb
         t+jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        fh=Mq1VRabf6IW6925ybnfX+ypbJJp9s121DsvurBwn2bw=;
        b=IIsWhfX2c1wkCGObGJU0Tfacj7O8cC0nJhV7/a4DjzVE5+c+BgPyrbP4u7G38FBO/b
         xGNqZUahD8Fzwwp5OZZc73sc7t3B+BbUSvTL2gWLRu9NgGaZH6VtmxAG07uH3sSChBPj
         qcxg92f1pKcctekDVl41RNgLV6urFN+tLIE09/J6stPGCFmnEHp1JfgNwWFHlbw34HDa
         5sdUEfZ5+Bm5X0jaH6q5J4n1BBY/XWt+ImcKNw4Z9HNcs4AZWNjqncFtByXXKTER64wV
         6WVA2RgpnIOXo6hk63EG2L4o8UXBeZ8Ksss8mMj6vHtN0OSdILXYqui380JaTlkJCMQA
         21Lw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795690382; x=1796295182; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=exVlGjqyVQX69gi5pMCj+rihqHe/tzXd9plbloIjg4AqQOtaYMwnJfynXCHwGLKGuI
         nP2rzSvjJE/Fjkb8jVylE4dc2VaHnxws9iKXRfcvIv/S0gE1WRg2yg8SL1v4/ZVfJnA9
         NU7RUr+XGvtFpvUwMaI82DGkqVbSu22gwehNo22ns7YNhWh51UxxDv1WCyOA9P2viUeN
         Pv+YD+U5fthQddEg3pZujIOZGquHWf71QPRnysTSKjGnfa4tZsBQI71CaQdIvsshAWm4
         AqrJdTCmcclUUeaxbkiTFAI9HplDTr6uDESa+/cen/fXzOMc3CPdxeJvHutvFcLV1dWF
         7ObA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795690382; x=1796295182;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ni6puywMMHNYeFI1EJ7o+kG8F5OQFdRdjsh/I+X4uqE=;
        b=If7u9VCpfQekT9Bo4DPgu4ysRHeklqvOW6XCqeQfLlRJAT28rDcTUysJGfTmm9NK07
         3xsMcaTW7iHV6wM4s4OzCies0WpTqz8s6sarDtG9ssAsyyuLKuxUpl2hRVSyXx4odaMx
         zPRhfAOOm9BYmD1HserVxdN7Jf1sYPwl4qNNcAM1K8R2ldCkqTrBifJeCLew49GoinBU
         jGkR955EJFibEpOss6cKni2NY3dFOXll8tWa1m88aIEF/dubEeTmtmHSQ+N/j4bCPyWF
         AZnb2w6WJVK1Ts/7bpdlb+Zmj7lLvsY0SNGonlzmCZ+F1LeYD+bYISkzadpG7f/SuQIf
         BbeQ==
X-Forwarded-Encrypted: i=1; AL+hErFMc8/O/5NufigBxLViY6rmNzPUv6ZlJTY9wDjMkjBLZSglzfVAdcJJQYpwke/30bRmR9EYF0bFApNLiA==@vger.kernel.org
X-Gm-Message-State: APuU4Z9f73BKPpGt6cMu1Au3CY6cCEADyayAzmnv/QXEaQmBzp+scZMb
	7Sr7XWAuK4saBEgO69YxACDqVXulFVgxWFNc2JAsPXV43Or7ZqPKqy0+nZuF5xTtOEPnNn5lNJH
	tQUQuqbdMjlf41NZf+LGJTyd44sTl58BaUMmRSmBQzOSgXr/X9TJjXdY8BUdKj12mMCUmMkKsix
	vkwmILFb3sruAbfPbuI3MRTt/v+JhPu3z326TD3xy4
X-Gm-Gg: AZFdTZePs6hbflwynRVT3Z5MKJeAHis/lmAXABCzAZ6wxQLKriw4hDOK4O1iUQwKFs0
	/3XI4ZuDFdOtYtRfRFz71E0kJ4PNz195UY0GRA3C0BlYhaV9nCfFpTuUBjiRTaJM2KFIbRFokP7
	dCcA+VdYUiHh819mB8v0P4EQlal2mTztucvMcc7/Nps2uFGbMocvl7DMNorMJZ/JghHH8OMRR+j
	XO/ylgcoEsteIHAlRd6AXZO0iDlxzgW9Tfv0ndH7OmmHV01DQ5uRzMMkI16U0cAmErxZ6G8fRT4
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id af79cd13be357-949ba8483edmr3214746285a.4.1795690382324;
        Thu, 26 Nov 2026 02:53:02 -0800 (PST)
X-Received: by 2002:a05:620a:6496:b0:93f:5519:5e87 with SMTP id
 af79cd13be357-949ba8483edmr3214744285a.4.1795690381901; Thu, 26 Nov 2026
 02:53:01 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261031112203.545319-1-vladimir.zapolskiy@linaro.org> <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
In-Reply-To: <20261031112203.545319-2-vladimir.zapolskiy@linaro.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 11:52:51 +0100
X-Gm-Features: Aa3M54qyoulSiyCZ_DIY3VLySWTTm65Hdj2w3I9NfQxQcNY242sH-YfIpWIKr_c
Message-ID: <CAFEp6-0Ykn4VNMMAa-WzCDcJ9=Z0x9Vd5e7z8FSNf72gGL7c2Q@mail.gmail.com>
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
X-Proofpoint-GUID: w9sb94PZGB7gM-d1gPlVPu9BalHwIyP0
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX1zOCQkvtlebQ
 tEmNhtAcxT6/s/Pn7Mkh8e+0/BMHprnzMlDzmR7rnXJIX+a78sjSMKe5MefPVa+rzvrg57Z/gvT
 Oen3/KnM1PTJPyxZSTO95uKbW99IR88=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDA0MiBTYWx0ZWRfX+j0xq2+3erMO
 nfRIEC+6KgydKlYTCP2/kVhBw0YAU1UqouDYaTZcg8J4LcOpYozvjbAjcLU49vN8jpxjuC8C+TJ
 nC00WMkjC/6SGbkqlNpu5XsJvQyZ2n3UolhtFuV5mZqUTRiKoAD2CWG1HhekmvSR0dA2KKHKVQA
 h8gsm74d947I9KCC/qwAUchsKRgeMJztvaYk/qI1n+lBpdwTgRiKSWq2fD+3t3ZOM8fXnDB3GF9
 FDfBDZGEKlMb8QrXw05aoC4stYkufsTlyilZGYJ5912O9a06jra9xx3tJ3tIG+aX9Zl6z45mcgP
 NrIjS/DfTFw7t28PCogdtujLds6oa2G6OoOvWJOISPf5uCPV5jHbM5pBdmfBXNvBIpWz8PS167P
 iUGzPHBclqgTVzmOsjZWpC2TCV7KaHoHp5ZAj+hqLKKQkDw1sEq5ysZ1RRLMdO0h3XVIH7RHioW
 mlBFZ8xZouxpebU+s7w==
X-Proofpoint-ORIG-GUID: w9sb94PZGB7gM-d1gPlVPu9BalHwIyP0
X-Authority-Analysis: v=2.4 cv=BbxNQbt2 c=1 sm=1 tr=0 ts=6b080f8f cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=KKAkSRfTAAAA:8 a=hZyePdzDgcEG3UIITL0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 adultscore=0 suspectscore=0 impostorscore=0
 priorityscore=1501 malwarescore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260042

On Sat, Oct 31, 2026 at 12:22=E2=80=AFPM Vladimir Zapolskiy
<vladimir.zapolskiy@linaro.org> wrote:
>
> Qualcomm SM8650 CAMSS contains three test pattern generator (TPG) blocks.
> Describe their register spaces and the non-real time CAMNOC AXI clock,
> which is required to get TPG output frames passed to VFE.

Do you know why TPG support requires the non-RT CAMNOC AXI clock? Does
the TPG perform any memory accesses?

>
> Signed-off-by: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
> ---
>  .../bindings/media/qcom,sm8650-camss.yaml     | 24 ++++++++++++++-----
>  1 file changed, 18 insertions(+), 6 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.ya=
ml b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> index 9c8de722601e..50ae30cdcb82 100644
> --- a/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,sm8650-camss.yaml
> @@ -17,7 +17,7 @@ properties:
>      const: qcom,sm8650-camss
>
>    reg:
> -    maxItems: 17
> +    maxItems: 20
>
>    reg-names:
>      items:
> @@ -38,9 +38,12 @@ properties:
>        - const: vfe2
>        - const: vfe_lite0
>        - const: vfe_lite1
> +      - const: tpg0
> +      - const: tpg1
> +      - const: tpg2
>
>    clocks:
> -    maxItems: 33
> +    maxItems: 34
>
>    clock-names:
>      items:
> @@ -77,6 +80,7 @@ properties:
>        - const: vfe_lite_ahb
>        - const: vfe_lite_cphy_rx
>        - const: vfe_lite_csid
> +      - const: camnoc_nrt_axi
>
>    interrupts:
>      maxItems: 16
> @@ -226,7 +230,10 @@ examples:
>                    <0 0x0ac71000 0 0xf000>,
>                    <0 0x0ac80000 0 0xf000>,
>                    <0 0x0accc000 0 0x2000>,
> -                  <0 0x0acd1000 0 0x2000>;
> +                  <0 0x0acd1000 0 0x2000>,
> +                  <0 0x0acf6000 0 0x400>,
> +                  <0 0x0acf7000 0 0x400>,
> +                  <0 0x0acf8000 0 0x400>;
>              reg-names =3D "csid_wrapper",
>                          "csid0",
>                          "csid1",
> @@ -243,7 +250,10 @@ examples:
>                          "vfe1",
>                          "vfe2",
>                          "vfe_lite0",
> -                        "vfe_lite1";
> +                        "vfe_lite1",
> +                        "tpg0",
> +                        "tpg1",
> +                        "tpg2";
>              clocks =3D <&camcc CAM_CC_CAMNOC_AXI_RT_CLK>,
>                       <&camcc CAM_CC_CPAS_AHB_CLK>,
>                       <&camcc CAM_CC_CPAS_FAST_AHB_CLK>,
> @@ -276,7 +286,8 @@ examples:
>                       <&camcc CAM_CC_IFE_LITE_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_AHB_CLK>,
>                       <&camcc CAM_CC_IFE_LITE_CPHY_RX_CLK>,
> -                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>;
> +                     <&camcc CAM_CC_IFE_LITE_CSID_CLK>,
> +                     <&camcc CAM_CC_CAMNOC_AXI_NRT_CLK>;
>              clock-names =3D "camnoc_axi",
>                            "cpas_ahb",
>                            "cpas_fast_ahb",
> @@ -309,7 +320,8 @@ examples:
>                            "vfe_lite",
>                            "vfe_lite_ahb",
>                            "vfe_lite_cphy_rx",
> -                          "vfe_lite_csid";
> +                          "vfe_lite_csid",
> +                          "camnoc_nrt_axi";
>              interrupts =3D <GIC_SPI 601 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 603 IRQ_TYPE_EDGE_RISING>,
>                           <GIC_SPI 431 IRQ_TYPE_EDGE_RISING>,
> --
> 2.53.0
>
