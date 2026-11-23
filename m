Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795434957;
	b=cHC8UzE83WLGRwPVhA48dsR5hgnK3RMIX7DG7Gf8zj8nu8/RRnAc4pRcOeyFhERBxMGR
	 3REa5RzKL73uqbe5HcXIMaBbXkVN3GTpgFnr9UcHjEK3M1RG7MtneOOzknIiQqNubI9h2
	 7e3FBrZE10cLqpGLlQZdN66rlcF9y/JRfDEHRZr8ZOnblYEl56njhNfItHWO/PAL3wnMn
	 iYrEZSm4DKwgy3XrSMVtYC+ckT0+kWjQphp6ULLwDGLscm+FfZYCFcizNhnpipNTxw5zJ
	 hyYoT8YBFI5LlwmuUDP2s4ZLN26kn1QtdeBkJH8lzKcUWh6bdqVjmqTAF1jxB/+eGrA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795434957;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
	b=aUpgjL01w+3dV+TQzla1g6Kcy2XgjQZV8fTyg64KmhRPm7rBO4bP8SkMHNfyGI9QJEAL
	 WNxsqJgLCMAOkzNLV3HGLxcPAXeeeArHYZFL/mioPHOxI2KPJTjlvJdmxjAEPgAe1W7og
	 tHCVKB2rQsHEZ917TKCp/tGgSRZsb1h6u69NZc6qqgUrmQD/byftPSKZmgcAs8yoj8Y/S
	 WLcFx76JgiO2xiayg9LEZ2KtbNPDKh7ZFwzO1nUrjTr5vIitY7BGbpYrF3/qqUed+25V7
	 OxIfsW018h1t/+PB4ZcEGfnWSjp3ee3PODdC7ZAvy0+bEg6qE7vd+z9tuXA5JEcaVRQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEC606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:55:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 88FEC606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=YgSwKQS3;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=JCR73BE0
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AN9FuUm1543949
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:55:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=; b=YgSwKQS3SPovgQxN
	GUmINrmPXDWGKW6q/ioYH0ObUPIVX51a/+TwH7Njh45HmrwWoo4cUva59RqEoz3i
	tHzHZ+PdKTh8sVbrg2BnL5olufnr+T4FKpWHWp4MQwDwENAeCulBVJHBMXv/PYVT
	opFWwysZ+KmyuiIC8nQHq5c9ocdzxnbTFwYGwGNzm0HzLttVBiX52PzeRH3g7yhX
	K/G9PiwiJxch99qx6zW4uPiX5bcvaxYzGWyaWtzazNp3cU5gieqIQ7jJ9oLDcRTI
	L3JuFXAtvn/KdW+dwvns2cIvmsT+WZhWRqgsDp5AP4OaTUZ3C3/XpsShQybdiZnZ
	yg8Fxg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy018x7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 11:55:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-94960bd17b5so543550885a.0
        for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 03:55:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795434954; cv=none;
        d=google.com; s=arc-20260327;
        b=hQR+6sj3xxtIwxoAm/rRs0d63y45OX+BY+vr6iv6NHzcX8Dnk4MbXth8mJFR50rde2
         /h9rCbjxvjBEWbeGSbtvzTlyHIsCr+kKPrXP/UvE5hkmHqvgbBcKX42AxlPKmZdfNl3n
         oyUbNY/jJETJ2nahDkl+8h/q6jlFNdLDAu15WMYKS45SZD7XZnrr/vpNpGtkRH7MdYxb
         yg7MT/Ai6EYC3GYaXbGcIUAuWj9qDWuLBY/c99IWq/GhtNqWrBA+SfAUQBuaXWzDQxQx
         hlo4gWxYj4/umdFxJl0ieWKUbDEUZYIt+znicUsKj6pG9aWFua0clFgCp1VnwED5Sb9h
         m8Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        fh=VFdKLi/hzSByaGsVDfY+TAtTw/xyWD08Bbqk0OLvYDE=;
        b=RsWT3JXGNOqRXV9j7GK7LjJ2cw8AAvXlcunxOSYzfSb5mI8NsSdipzMimuxymgvIAl
         2YX87hNWWsPWR0x0bxAObpVrDwDrA5m6NCmAjzqI6l5VAlijRDg+EHDEY25eADMzL4z0
         3M1h9PPCEJG7IiNggK42A+dsUf1iRZ2XSubixtdgn3Oyw8dndrXqOrlHv8oKtOI4iS2p
         6EwX8UhS+0dWOT6GTdlSSVDQr/2wtCxAn+kJB8H0OoIbWGzpAwlu3S1huOKJo/uHMndp
         kfp4/Nskg+hjhk0+wupLvHu8rPl5PfvNS4fy9VDs1k3AS8MwD9+W/ChSa4nEsCT39c7f
         mfEQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795434954; x=1796039754; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=JCR73BE0OGo9DDilbWsp/GyyMFZupxVJaH5T7/HsEMTauoI8z1FqyUUyYvhpGOdMs/
         YQmUquYDr52Ivxj2z09Tp+0KPTZl5pUjVlrgv3Q2TsD252NNet8UBg7wAZwypEEKvFiv
         zOx/aV8qLOXkF+5vYNAHCO7xHXXv+g1HFjLGDGabnmWsT9k9pdsn5VxG4YvZ5ScGx8dz
         hRRvNgPAlw9HzL/7/xcDYRcLZ52AWmNJa5ikTNDUy5RJmQZS98PTSLXQwbmeXPz7vpUN
         MQtlMfAt66MC85OeGESHWLiXF4pbgRKN/bvkHlEgGdh4q54ekWL51EW17IWxQxmcUQOS
         4MsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795434954; x=1796039754;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hd2gZTqfmiccN7JCAY7xzbxOwBDTl0afP5b0LLoatco=;
        b=hXdfGjjdPQdmn3+sh4ln/8DX5JVOFaYFBrFXOLKjH5EoTC8eV9MyKZRAulcTqbHXsb
         jh3AdESBVFrnww3VzVdO2C94FpNgbRcvA4IStKNnlKnYLKHiwqT7Uowt4MGMmSKtosQ2
         xWtf0mrsTbHMEC6TKlRi603p1HxSLJhXa1TaRS0+9BvsJhYvc7IRSbO32ebTauhucdRW
         EutXO47PxQ7I/2ZXS8/mwBuDOl7c1eM+kHEqhb/4gXvTxK608TDvq4n2/bxXi6wHrSvn
         vkWzMIaOa4C0hSjMbaQw7vZeJJBoOwJiv8aOhpyTI++8hTgMFDIltF+cEbnxpS06c9rY
         bqUg==
X-Forwarded-Encrypted: i=1; AL+hErGlKEfVtJ1vbSWzqSX0rJaFTVW5ZVOPLRTPpHk23pSXZcjhvfnfj7+Ke8wuhE2v7ejA7BV6II1ShTKBgw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+dsBhCsUgldvAs6X8TWqXJJ+tnDNzjYfhMZVYWqzT8Bxq1iEkb
	ty6jvyUV4Tw5vxcXwPmefs61N5hpbcY/iMVgc1y273bePXe+W8Lf1vIPR7nx+sly0NBodjuQ6P0
	zTymDJGvN7yU5zBDYbDsMfD6gn73rvHrdcMMFMOVl0STG3lx63sl9OJ7iFvIOqlQYzAcTvL4IML
	xrwA9PIa1xl9I7UiCXTrj/X4u3bAKMWaZJZzbutnz9
X-Gm-Gg: AZFdTZcGMOEHBwdVEqX8zoEkSqwSuSuYPnrdIe2rHIirGuDSUjO56IuZJdjlgPVvbOV
	tNz0YTMn5yAr6K4RNV0kwtBi3ZiC+Gty6MYn5jhuREmItbm/5YfcYKHht3W0K/xIUwAunYs4e4e
	Brtyb+qHWlq31/VV1xWR6cLK2zSQS4aVmlzb/BjdqFG0E6EdZX/rMu0kVED1zH0Qd14CJBaOvqu
	gg/aa1ESNQZaBcQkne1hatlKMpZHhxAHJdVWyOFaE/aw8WfRTw3W1dtx/h33PzmxVBmAVSGKTMu
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id af79cd13be357-949ba9d4cfemr1741028685a.50.1795434954520;
        Mon, 23 Nov 2026 03:55:54 -0800 (PST)
X-Received: by 2002:a05:620a:3710:b0:949:a6ac:cc1c with SMTP id
 af79cd13be357-949ba9d4cfemr1741026985a.50.1795434954035; Mon, 23 Nov 2026
 03:55:54 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123-glymur_camss-v4-0-d7db74f59e22@oss.qualcomm.com> <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
In-Reply-To: <20261123-glymur_camss-v4-2-d7db74f59e22@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 23 Nov 2026 12:55:42 +0100
X-Gm-Features: Aa3M54pzaN1MMD5e1zJKHe9DPNQOJ_Dbh-NSm_ScNAiRKuU9oPpZJY6F7RsVn6s
Message-ID: <CAFEp6-2EFh=gEFN7-ot+dYKjigm-2tdKPmKjS3_irCq9BPSATg@mail.gmail.com>
Subject: Re: [PATCH v4 2/2] media: qcom: camss: Add Glymur-specific resources
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX5JLATX6UJYks
 dWrLfM1wclBp3k4zWqaBw1qEy+zo+isuBs5eWGOaEwuMCVara7WB00XuFWRSfqbrTvgtG1GKWG9
 K6s641mXe8wV6nR1AV5RYx/IttKqPuPmzje6P+VEiAK7gg6GBNr3577nlTqM2xu7LNLOPaxj9w4
 2+zJ+YbptQ9S2Wy6jXMuCf5tiJthtBFUeg8cCWi0GRsh0ywx4jB6RvOOugiK7UTFl1znCxOYjUY
 i31XfBR4T9vdWxP5pstl06OAXT6u+q5cWzVz2+Lx/W5WJAKhTZYD3MFnbbg6ORubb7Pt2nVa/kR
 zrxjRm41F/nB1+rSJv58ltlukVEM9eSHnHGBC9Vc8oeh1YCd2SG6iclc+oA+uNaSW/MnxxwzXmP
 wCVzJ+cAIbXQe6aQCmuc/woZGwymIcVeMDAxQ5CPMvkkt5PVRxrqYNjZS17T1cYALBl6QXbjeQj
 ye3Ze/dEZwsigzdpxHw==
X-Proofpoint-ORIG-GUID: F_tBFGaxqr1yWw9wcR1gjSRY0D88BFs4
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b0429cb cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8 a=FShq8-UYHVsJhsOZGvwA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-GUID: F_tBFGaxqr1yWw9wcR1gjSRY0D88BFs4
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA0NyBTYWx0ZWRfX71fBopcEMjvM
 ZNBk375hROgYIzTECJtFpYeJvRF7zqYoEUM+zFs0g3gAA8JPZX7QJOcn8oEBmTwBwSfEAiaheI/
 5iusaEQPMKucIgnt+UmQ2UDquHt6rDk=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_02,2026-11-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230047

On Mon, Nov 23, 2026 at 12:36=E2=80=AFPM Nihal Kumar Gupta
<nihal.gupta@oss.qualcomm.com> wrote:
>
> Glymur has three CSIPHY instances while X1E80100 has four. Reusing the
> X1E80100 CSIPHY resources also exposes CSIPHY2, which is not present on
> Glymur.
>
> Add Glymur-specific CSIPHY resources for the three available PHYs while
> continuing to reuse the common X1E80100 CAMSS resources.
>
> Fixes: 09d6c30d3fae ("media: qcom: camss: Add Glymur compatible")
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>


> ---
>  drivers/media/platform/qcom/camss/camss.c | 42 +++++++++++++++++++++++++=
+++++-
>  1 file changed, 41 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index f8e5cf9f3ff09e96d3b48cd5628489715385cc5c..f3cab9ecef04273e09b81ee0c=
d4e31ca45d1c915 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -4103,6 +4103,30 @@ static const struct resources_icc icc_res_sa8775p[=
] =3D {
>         },
>  };
>
> +static const struct camss_subdev_resources csiphy_res_glymur[] =3D {
> +       /* CSIPHY0 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 0,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY1 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 1,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +       /* CSIPHY4 */
> +       {
> +               .csiphy =3D {
> +                       .id =3D 4,
> +                       .formats =3D &csiphy_formats_sdm845
> +               },
> +       },
> +};
> +
>  static const struct camss_subdev_resources csiphy_res_x1e80100[] =3D {
>         /* CSIPHY0 */
>         {
> @@ -5572,6 +5596,22 @@ static void camss_remove(struct platform_device *p=
dev)
>         camss_genpd_cleanup(camss);
>  }
>
> +static const struct camss_resources glymur_resources =3D {
> +       .version =3D CAMSS_X1E80100,
> +       .pd_name =3D "top",
> +       .csiphy_res =3D csiphy_res_glymur,
> +       .tpg_res =3D tpg_res_x1e80100,
> +       .csid_res =3D csid_res_x1e80100,
> +       .vfe_res =3D vfe_res_x1e80100,
> +       .csid_wrapper_res =3D &csid_wrapper_res_x1e80100,
> +       .icc_res =3D icc_res_x1e80100,
> +       .icc_path_num =3D ARRAY_SIZE(icc_res_x1e80100),
> +       .csiphy_num =3D ARRAY_SIZE(csiphy_res_glymur),
> +       .tpg_num =3D ARRAY_SIZE(tpg_res_x1e80100),
> +       .csid_num =3D ARRAY_SIZE(csid_res_x1e80100),
> +       .vfe_num =3D ARRAY_SIZE(vfe_res_x1e80100),
> +};
> +
>  static const struct camss_resources msm8916_resources =3D {
>         .version =3D CAMSS_8x16,
>         .csiphy_res =3D csiphy_res_8x16,
> @@ -5806,6 +5846,7 @@ static const struct camss_resources x1e80100_resour=
ces =3D {
>  };
>
>  static const struct of_device_id camss_dt_match[] =3D {
> +       { .compatible =3D "qcom,glymur-camss", .data =3D &glymur_resource=
s },
>         { .compatible =3D "qcom,msm8916-camss", .data =3D &msm8916_resour=
ces },
>         { .compatible =3D "qcom,msm8939-camss", .data =3D &msm8939_resour=
ces },
>         { .compatible =3D "qcom,msm8953-camss", .data =3D &msm8953_resour=
ces },
> @@ -5824,7 +5865,6 @@ static const struct of_device_id camss_dt_match[] =
=3D {
>         { .compatible =3D "qcom,sm8550-camss", .data =3D &sm8550_resource=
s },
>         { .compatible =3D "qcom,sm8650-camss", .data =3D &sm8650_resource=
s },
>         { .compatible =3D "qcom,x1e80100-camss", .data =3D &x1e80100_reso=
urces },
> -       { .compatible =3D "qcom,glymur-camss", .data =3D &x1e80100_resour=
ces },
>         { }
>  };
>
>
> --
> 2.34.1
>
