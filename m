Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 543D34D7D30
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.168.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791894280; cv=pass; b=qXRpJ3D99fPRm3FFdag03X96cmnMuQ7Sq+mMYg/hq5eiC2xy3e9GGqX7hXleaci3THt0/NVB8XcunMVCwpne9cG8n5xdcIZIQZtnwRVmMuxELS7Q67xHOpVahUCVx+8Vqa/fQYIj2J1bRUaxSp1u0r47Kb62TU1nbRKgunwIp5o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791894280; c=relaxed/simple;
	bh=jUlJOAGscmKzGahwZhW1vZi2twtvH5CpgUlhI/gE7gs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qP2Ls3MyqvcaC+YmoQSG/w+EeUhtOHPXuNSrfg+lueXMhYsEB23UKSNSFUtJntTZ638Wk6HnJ1NObi7kD7+WQvFW2zwyoBx++E4zgAUV+jS5NT5OKg10I4b9dQo5Tpn7wsfcPzfTVYtFW7uM7+QONOfUtvO1GlZdW2h9Xwakj3Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Jp7m5aax; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=TPw/WDUu; arc=pass smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Jp7m5aax";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TPw/WDUu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8OkR3989880
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=; b=Jp7m5aaxYj2xkdlL
	M7R8sMwZwwJMzHikLYlGEXwmc4Z4MQBVEeg0ZCnfSXIxjKxj5b1k7WxeZcDZ5nIJ
	ZZ2LcpaeMz0u9gZpZiH9LPEJ5qYLCB/raFiSeJr0wczRVeVyzwNbh5l/630XOVtN
	IV4Q874QRojeN2KAQWAZjR7aw5fJ6cipK9c318fn+iD6RB9RG6gTcpkBZL6fvMTl
	QWWAWly1d7Xm+iEEx29yKpK3cAod4ncsZeXlxi5ZX1sy80+HMAL+ucqentmfXQF+
	MApnxasg/u01iYFGniqdZemDlXvn2Ny5s39a1hEIye/3oABV4KCEtjZF6yrFO092
	lSNIgg==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98hcavn5-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 12:24:38 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-5340b037c6cso29079671cf.2
        for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 05:24:38 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791894278; cv=none;
        d=google.com; s=arc-20260327;
        b=UR0q6RmShEMClLcnGgaR3OZOqYFJCCfUBM2n98WSlQ5fsCSzOBu8HwWxhlCgdVlEhz
         7qv9RhF+hzFbqzQ6MSiU0cabmDV7dd61ZduUmKSvg6VkNK0GVyjhurkbJGAFkxnqincA
         VtFN9M/X6e26ZkR/4DRslUo2btMXJr1uUKUxm4qTupvoVW36ZCpw3dMhzObmwhdiHFEU
         yW4P/2cy98FUGoLEZrNJCPDqVi72MU1sjMVMuXa6RohvBrgQvjTCclwbSAYF1WXm5wCk
         WfcM0fgljkHJ4ZTev09MqepYQ5WQaI4PDwF1ZG59L9ACI5ne4uBdxh3uWVTCzek9Ul66
         QJRQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        fh=CDOnh+25ck7MPZlTyFmM2HsA4j7ocOEJx5ckW+pI+Ro=;
        b=EDE2gXPYhv3SwvvlbS2hTZk/E8iMTH8OO5cqw3n/sJxIH6YfTYmalOvvLcSciHMugJ
         258Zrafd2ljZyg2P1NDwv0fku8R+XK3TSwqbrk1gZC9zHk0n7tNyqZzg5qb9xZdjAyYM
         ahg4nggEZGyd5/H+p/Cau4ui8j9OZ/T4WCRVKPlsqqfRkMZEsvRnEkGSo76bT27Ncw1P
         f/DxFzUpMHngtB2ktWzqwM/iv57j8IIyfxWHLz7bNcTFAixgTfO1irWu7nsC2L/+tP0V
         17loazcpquKxsq1PWSNwRU28In3ypECseo20/G5YATKxoEcagHn9busdNJbrOfo+Perc
         MdiQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791894278; x=1792499078; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=TPw/WDUuZderJT2aqy6PMJm3j3giymVIjdm3fysctqOh5l5WnWxkNwoawNNJMkLaSW
         29NIbasby9lv39Idjx/snHxO1rsdJlUcdsNuLUfZnA6QSDsnaY2zfXNohhvGW/Q/prvi
         uTR1KwJ3m84kEO/gbC61kbFLkKvmikz073WC5DpDt2N3Tok41O0ZDvQSwupcDwDRHc/n
         6Y1DOo1murEzPSM2753YaQ+WqO3mF8tOaoqBiAEXvHRJXBBDjBZB2CQEfC6t8NwLZDTG
         +TCSrCkOj/ryUKOTG+3vRur1L+kF03vWi1XJCvyhg67LttgYLbxTisfIZ47Dp9D7O3qq
         F1DA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791894278; x=1792499078;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cBHSeEg5m78MeGq/62DbhP5UimRnwtu1lp97yd0gtxo=;
        b=ouMHyEufhgLUlfgdgrjRv/dq+tAI2dSTUwJ4qJ/0kColqXmYa1fhfwdrXOH4Gm6GN/
         /2880dtAiEiYlneDewaKasgdYe4z54zkfFu2vHzo5ULm7ZdzxkMfF5yJq+pQqsw/xQxO
         1v3FZtE/C9Ij3JwWUuTMMEPxbIYb7pzLIt++XJMkkXdF98FmHAbH4Zpc5St8C0ehFVDP
         rZOkar0fbM+iPOyxv6exyVAPwMz/x9ZT+LeopzCJoYfDa8xXqaBdCvcZqwub1Vy8Kjgo
         rJdh3oxe8+5RvY5dOiMgD4nfbzL0YqLbbu+AISsOAbFgHWlvblaNyhVZE12zW3AeV5ZN
         M1Ig==
X-Forwarded-Encrypted: i=1; AKwUvByyKqVWPQEFYj9PCp94Swa4fCasqyF6fOaSqM6uzMZz95a1OP5cucEekQf+it91ELEL/QePBTqjBJfESg==@vger.kernel.org
X-Gm-Message-State: AFq9FYIgpqGUaTiYer1v3zbQRx2lnjW/BQjEo7xGF7kaTwdzk18FiLS0
	2J1q3FveZqeytVXBG/RvEkynkqvstN9jDs5PUtjxP8lhDGfp4vre9BSSxvcLNPGiAfePU2bnT7a
	RsE8S+eaxcIL37OIDRjj5DlfwkrWqHy1gO45sjAiQ8QWLZERl5UG1xG4QoHycdPBVQkiRdDysK7
	kPJ12CyTil6nphvmspfDVwlBlQ1oQeQHnSSCTsFAa89eMn43nWmwQ=
X-Gm-Gg: AYBFou3KYnjltz5UGiZDyMaxCisbmhKGGRoXPxsLCT6VA0GzBLQ814yStNyebr9/y+n
	Zw8vr098LQJbx7TZwV02FY21S7hUf+vINIpdE7FJwByG6Il3MvU6NqbP5RUSEplHLyKBtBYq0We
	fxKk1cr/wF9Or1uJ3Qwnhz9e5xzj7aRthrA5qJa5Y9Fk0nQIVY/4ab6fRAlOqOftu1VaxnXtD1S
	KKxbfvyCdZ+55PNr8heZMM/gBOqITeZypEaS+3Rukr8rdhkjFscIWPCPoPo8Vs3QvU2VC8fzvla
	ZdDbBMOh25FcExwM19BacZFc9YRN
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id d75a77b69052e-5359fa9087cmr195111081cf.20.1791894277406;
        Tue, 13 Oct 2026 05:24:37 -0700 (PDT)
X-Received: by 2002:a05:622a:1c15:b0:533:21c6:f4e2 with SMTP id
 d75a77b69052e-5359fa9087cmr195110711cf.20.1791894276755; Tue, 13 Oct 2026
 05:24:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-hawi-maili-camss-v2-0-fc93222da89c@oss.qualcomm.com> <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
In-Reply-To: <20261013-hawi-maili-camss-v2-1-fc93222da89c@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 14:24:25 +0200
X-Gm-Features: AclHuK_DsaujXZKzgQcz6fY7MANZtkJtyyIAn3Pjdl47YmkPjme6QijlN0LMNHM
Message-ID: <CAFEp6-3LXSdAd5seGb1e7OZVYq1SFR+8RdK1Q6mM=2ZeZfM4FA@mail.gmail.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: i2c: qcom,i2c-cci: Add Hawi compatible
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Robert Foss <rfoss@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        "Bryan O'Donoghue" <bod@kernel.org>, Vinod Koul <vkoul@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>,
        "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Suresh Vankadara <svankada@qti.qualcomm.com>,
        Vikram Sharma <vikram.sharma@oss.qualcomm.com>,
        linux-i2c@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfX5OOfsj1sJw2r
 XEFX+SAGaQzfYGnb6jDje3DdkB/KB0eIydW/qeAJmzL/Qk4qJ68YvZQdqsN2yTwAX1ORmZqs1DJ
 w6wW5eOsFYZfBNv8apdAH5y5FvRJgQSJmSToH+S5w/r4scUdpJj9E3Fc2zA1/uoefO1EYA+Zfza
 EoROEXYdEYc7MO8DBTMoTvXOWpkGgm76psLNcOaWIg6gYr87GC6Q5kmTekGwrKc7X49D9vjSoX6
 2mF/N7JBHaeh2/oN1loG1wQGqQBPX64IzSWFXD8TuIG8d3pojaFYWJZx7+sMMPZaepJLPhwRmqu
 NLAByZO86LVfsomHZs+Owl72JB1AeXhE42pFycpLzG6RzaQJcwEznGsEVuLuCUy5+89NtnjwZHJ
 e77Dz4Z+3LUZVYM30hLTW169Gn4btwVIVYAlvzWI12953MdPXLMqFfysue7Y9M1EvEVGN9fLSUc
 krSCpgHee6+EISAGv5Q==
X-Authority-Analysis: v=2.4 cv=VPVIDNPX c=1 sm=1 tr=0 ts=6ace2306 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8 a=b40KZWPJp5KrgtGOUacA:9
 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: ZawxoctJQTHeXaDrgYADBDEUHxfvgqdj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0OSBTYWx0ZWRfXytkPwWXeO7J7
 Q9JK4iv1GF/nCSw7+B1kDXoxn5UTjdgot0aQiS/yS+ZsPIMyoCyG3gxId7Go1/KtO+Y2d8Pbb+d
 r+0MR/0uizPfB8YOupuLYy6QVklploE=
X-Proofpoint-GUID: ZawxoctJQTHeXaDrgYADBDEUHxfvgqdj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 malwarescore=0 impostorscore=0 spamscore=0
 suspectscore=0 lowpriorityscore=0 adultscore=0 phishscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130049

On Tue, Oct 13, 2026 at 1:03=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> From: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
>
> Document the Camera Control Interface (CCI) compatible for the Qualcomm
> Hawi platform. Like other recent platforms it requires two clocks, so
> add it to the corresponding clocks constraint as well.
>
> Signed-off-by: Hangxiang Ma <hangxiang.ma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml b/Do=
cumentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> index 1e8def25ec0ec1ef6b34859709d10a2a36fe36f5..b2b4d4bcf780792515ec153c8=
73bace1764fb3e3 100644
> --- a/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> +++ b/Documentation/devicetree/bindings/i2c/qcom,i2c-cci.yaml
> @@ -27,6 +27,7 @@ properties:
>        - items:
>            - enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,milos-cci
>                - qcom,qcm2290-cci
> @@ -137,6 +138,7 @@ allOf:
>            contains:
>              enum:
>                - qcom,glymur-cci
> +              - qcom,hawi-cci
>                - qcom,kaanapali-cci
>                - qcom,qcm2290-cci
>                - qcom,qcs8300-cci
>
> --
> 2.34.1
>
