Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792768607;
	b=JtSNASvy2BsS7dXYkBKaZiQ44XDc71nL/81eXN4ZoHCP7qCIf11AuLblVDo61Dnq5B85
	 UnR+hNnpiirC/CQ1YzjK0Cszwh2mqKYT10BOEVlIV8fu/e5D8Qzt3KPLY4Q/O1BQzMhm4
	 4BLyeKgvYSlrzBeOAptS1caxQsuy14wsCJREplqSwb4xdjKvx1yelC25Onn+wJ/438yHp
	 U1H9UrOrAa+P6rCRm0QcsXrkOyVFApVGLyU/JQGEQ0qV+NfZWrcM+w+dTGmQj4VqDDj10
	 zwZ4vZTrzdEV+Cje1te6UyrwFmoBix4zkGcjk3vcNYxgumy/P9yOS+WrMgX5Ndb2A+w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792768607;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:MIME-Version:References:In-Reply-To:From:Date:
	 X-Gm-Features:Message-ID:Subject:To:Cc:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
	b=Rb7INYAUB5vIlrbvv6vJPWixGpOw2E2K5nsz8WbhCpdnj3E76lKx5QSt6MLRqol3Z+fm
	 c7JFBnOP9URKKPmHh4CmNerZ97Wzub5LkOoS1Td8QVxN0NFeSEPcZaq832VdBjy8VdB3k
	 XaCw6dGZmqF9hLsMqrOdOoRpUpYK/ihBajpSUSIF8AfURKsdJvDZAhC5zJAH2wDUnvCAN
	 X2BKUEMwV8d5SNbL38RsPJXJa2w4B08e+USAdumr3R18m8QmpyzB+30qy3R3LGkx/kjJy
	 k4HfSYe18kcWmBySVeTbm8HPAZDRrziY04EAi7jrbN+MP4vlwHrYDo26rknyxW5oWdA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjEZ4Pne;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EAD606A32A
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:16:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08EAD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=RuZfbKXK;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XjEZ4Pne
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE5wx54063463
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:16:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=; b=RuZfbKXKE7ctzwuv
	czGvcZJqzCy2XCLn0xdke+X9ts8FAcun4WTZQCudkdJKnb3xdFnvARNiR8w9By3I
	NwA5f19bmPM0F4/1N8NdyKMtmcsewJn8V8CTbPlcN5jFBP0GZaF5wiyzsdocXvUS
	xcjmTXDeIeiuipdkZxzWk07LUQizJOAFh6S/jElNl3n7/mp18BKLuVQ1wp+bgk9l
	+FcF1qB2p+MZRT0ltDw0JQzJxLrzFY3qx4BmkwskNY9DfkKwOgNAhobCbeqgzD3C
	K4wGWwxI6rnBtUmB7j1FsuYzVYhAGBUyEOeSjKp4k/YEspItviojK8felV6wchif
	2pd1KQ==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com [209.85.167.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmrc8xh-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:16:46 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id 5614622812f47-4f4612a1a5cso2490943b6e.0
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792768605; cv=none;
        d=google.com; s=arc-20260327;
        b=hxVegKplXmAd+oqHyDDYhU8E3BHBvUa6mTEjnacJdBTUoAI+VuVYbwWiXSACzMJQPt
         rYonTCg6wVfoUmX/f7FdgK89/XSMi9BgZUUacL0HxXtxzHVrNbLFAh0x5eNEFt9BwG1U
         pCtcBtCjFfPUi45W7oVyTodCL8obbFcLHiTTClWfF9NA4EtA/YrNB5//WJr8w5IYC67r
         91Oh+C91smBDAc9sbm/rKltPdXMnolJpNbjo0A9b7/V2Y19oSK5DSe+imON9gOTzHHNU
         AWNInWFe6F1ka3egTxncpMhG5YbtoFyT9CQ6X8I0mzWvODqrdDkFH0814vXbW22ZzFe7
         jhhA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        fh=BP2WTWGS/169IMTESU//v2ciMFmiWvuSwzE6VAXXGqw=;
        b=GHob1mrKLFOnojwjy86cz1ULPNgKpj20NF1ikk76WTRWGd6nQRW9Rlj1FiacG2yZKL
         xLHLTnGnOg8+pL75C2LuVhlvTNkBvNEfQr7rj4RmrF0+tKeNU4vL7WUNEC7HDdQ83mcc
         0rwMJmGrE14e6YX+x2HBdh9XoW7IAXPrVmiVKhIAauAvYSxC3+V46hry1T0ahaIxPygx
         pz85aq7paZimOOfApsqaiQCI3d0orD5texl7DhVfB3u24btAvC+MCFqzZxJtIYdwyG4n
         A6Y4rLU4fDusjvhpfGgS7jG0Kp6Ahrhufo04aKAgo91wPeexbeduWpZHW6Uw+31CRpxL
         56CA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792768605; x=1793373405; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=XjEZ4Pnepv4NYweBBIK2oMXwsFsXqkc2tHuqv40trR8WJ+9a1yPz1LvYGDAaka+xEu
         qOce2+oWf+/6cRlpba4EC3eTlPoyW52hEseUIvU0vqUejxRjI6cRCddOLNmVyZm+4e7M
         DudzLNIuodUBlPHvJ35mguwGkBzH97K+L9Yztk3A0hjOcKTaaELI088NZ0HPHxZa8oXc
         U85Cx96xUfvLK8EMdPaTSNy+fzvREDX//JjhR3RR50srHkm/DuzW41+TWw5Trj3iZSQv
         mujvV08YfTlyPYtQt8vVztvNZ0Ha/5B9tXSt88xH5aOixmt9t/5mIpyQxfX28NnnW81q
         4Fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792768605; x=1793373405;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ntGLFzlDvuBFajhsf5fvpyP7EbCcLO7E8qSpRPn8wxs=;
        b=0fqDCR+fj/GUFwGo/WWG23zJie2FBtUKHkKjLdnBmi2yB4lS8wvF2USs/btoXlKPFU
         3x+uF2roFZWHJTYRc6wRvBxtfMtGWF+qdrOZsHcVq3YWT8aNNwdCdnmMyfr7q011w49k
         IXuaaub32Kek0irlSsCkR1TmKXtWWEbexHHo1fo5KE6nKAus5gMFxdwlWweiSsDhHi7N
         tysaY70Hi3XaQ6qmF4ld8tNe5nTb9WNjvumpdMh79xcb/O1sOaxWNB42LfwPnb/V4tB6
         BHFbjUk1VYaAztst/QhTWNBUEmOponEa6aqky6RnN6jyEb3YSxxzRdvm7PsN/CpgjpbI
         oRDw==
X-Gm-Message-State: AFq9FYKXPOFM5CK20DmcRzCJpBR0G7LLSWYnqNvHVEkfTSWUFBe0FB4O
	QfrQ0znM9nOGC/UPbVnsFIPs1X86VpxZK5U7TWtGl4vVWco2NJqcCEh9eTtO76QToAFCzeRJOGk
	EvVPAto4rgW6SkutSkGPGjsKDlnq8L1gX0Q3GKOVFt8iiH7+OLW45kK/bhAquvCOQBaEBouoVHH
	AXgnB3RhXte5zH0zkuJp/imlxFC8Z/0jsdf7oarAjn
X-Gm-Gg: AYBFou3fSo8MTehhn8JNToHzYl+4iyWAzHzFP0EVc3q52mFPFoJOJKmS3tO9+QEy3sl
	Dw+r7KR0ZXsW314JNh8cvdYuRm8AMPeKLNA7BfZvtPzmCCDEE2F2QYRj8Rzsc36v235LbV1UImW
	J8IW/cAVfSl75VGxFIGZKQSbqEj/t9zI4MhB5l9AGy4R3IBT4bORi3hY/aoU7mEWtpJ6YiQChwx
	oh40SlI31gxqxAIAHM13X+C+8cWVVUddW5MRZwaGM4lvIbtIuZ1WWnyKNh3BQrfLn4WRVZxZoo=
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id 5614622812f47-557eb47d075mr3061929b6e.26.1792768605507;
        Fri, 23 Oct 2026 08:16:45 -0700 (PDT)
X-Received: by 2002:a05:6808:6f86:b0:4b8:4703:db91 with SMTP id
 5614622812f47-557eb47d075mr3061832b6e.26.1792768603405; Fri, 23 Oct 2026
 08:16:43 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023-camss-isp-ope-v11-0-0c2937195298@oss.qualcomm.com> <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
In-Reply-To: <20261023-camss-isp-ope-v11-3-0c2937195298@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:16:29 +0200
X-Gm-Features: AclHuK_gI7FsS6nJkI8EHAiWfGIfmG-kFFxZK8IqQe2rUZA0KJsBBIIrHA95LyY
Message-ID: <CAFEp6-04RVyYG1M18Dh6Z3J7MycTb-WdMkHxyyVPfyiHVK0z3Q@mail.gmail.com>
Subject: Re: [PATCH v11 3/9] dt-bindings: media: qcom,qcm2290-camss-ope:
 Document shikra compatible
To: Mauro Carvalho Chehab <mchehab@kernel.org>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>
Cc: linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-hardening@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-GUID: v082c1_pq7uhknbmkjoOdT23qunnJAY3
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX4jsMEUyuqheO
 ZgFyBcvwNBTMgchWWBe2ivTOVuRzwgWVzxwVGGOWj2EvmtM/k4RsfqqEv53N4xUMGhSMKmXHs+H
 N5DmAC3WMAHhn3FNcdexYidFYDAE8kc=
X-Authority-Analysis: v=2.4 cv=VNZIDNPX c=1 sm=1 tr=0 ts=6adb7a5e cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8 a=43rrA-HyjK99Vs58VTYA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA1OSBTYWx0ZWRfX2kFC3gK9YR8P
 raA+cOMLLSvuYzBXKkMsuMaXvppgBbXBahe2Ov9+Uh8+VnZvJUE4nUO2Dl19DWnvuLT1+nT/O0y
 rxci6ClMs3hxFal4qKp6agVHoSLoF5dM3MLwbkEDl/jlW45cVVQeI+J7rR/40WjUvFdJt3XNS5P
 sW695mKcYLWcZWtvLf5EQ7pLCpv+9wF9Aaqhq5x9iKI6QZcsLhSmClVqvYtQ5rPB3pEQgbJEvq9
 joB4TyZyzppkSGZKTtYpqo9/rurceBCrqQeEcGY5jLf3aY193dVOYQjMVKnGSlFpltj8ayrAhW4
 I1u+8DrUV/EVeQKm+SiawuL3Uej/XklLoQfwzalhgwRj3d0IrEy1e2Az/HUmUm0OVzDc053puyw
 28L69iJjosJ6bZlInCUx+0axDjTxvQ+Nz1T1YJF0sftNiqoR3t/Gl/GWmmoYq1oSkvqdRLLD/bt
 8Zns2/V68q7JMFlIeZw==
X-Proofpoint-ORIG-GUID: v082c1_pq7uhknbmkjoOdT23qunnJAY3
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 bulkscore=0 adultscore=0 phishscore=0
 impostorscore=0 spamscore=0 lowpriorityscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230059

On Fri, Oct 23, 2026 at 5:09=E2=80=AFPM Loic Poulain
<loic.poulain@oss.qualcomm.com> wrote:
>
> From: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
>
> Shikra uses the same Offline Processing Engine hardware as QCM2290,
> add qcom,shikra-camss-ope compatible string with qcom,qcm2290-camss-ope
> as the fallback.
>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

Note that I missed the trailer update step and therefore did not carry
over Krzysztof's previous tag.
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

> ---
>  Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml | 6 =
+++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>
> diff --git a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-o=
pe.yaml b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.ya=
ml
> index f9c31bc88e94b028c241060bbd8e56e0bdc49af5..3359581bfb13e918bb4efb3bc=
41749e60d772ef4 100644
> --- a/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> +++ b/Documentation/devicetree/bindings/media/qcom,qcm2290-camss-ope.yaml
> @@ -19,7 +19,11 @@ description:
>
>  properties:
>    compatible:
> -    const: qcom,qcm2290-camss-ope
> +    oneOf:
> +      - items:
> +          - const: qcom,shikra-camss-ope
> +          - const: qcom,qcm2290-camss-ope
> +      - const: qcom,qcm2290-camss-ope
>
>    reg:
>      maxItems: 6
>
> --
> 2.34.1
>
