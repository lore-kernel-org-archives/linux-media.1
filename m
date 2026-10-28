Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793197917;
	b=373UQTnWyZ2l8NTa4SrGOBeF15T3Sp8f5NhMX2s53GA3nx0u00gqjmJo7+4HjrxgTSCy
	 92BcpZwoQB6gNsxV9DW8q5H9hfiJtgiyDqUnFolhGkXPsx6GrKbFHegW0NlnJoVK0ia62
	 eLYUt9/pMtsuUp1WyDSD5N/SqrvyyNeMfH5PtsBAqUS8O1cnen5Ftx5VrXYBwExkSG2gr
	 Jm3WwQDM6PNSh1csSzC3pV6h5MtrHrcgWc8bm97pwtFF1t9hGrdAIP55fTmNl8yAZ5gRI
	 5SiEgAOc5XZcSBb7MMgXNcabXUg4ZYy8wpzGKqRZCBxi3ZqrZ+3I0r3Dm4lkNFcWyHQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793197917;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
	b=NhDWysFY2VbbWChP/a1qa/z29Z1/OQSOVzyjfvOtZoSSqgeRKuPkjWCMJ/ViTGv32XCI
	 avUvLmYO1YVv3zQUiGm8R6Hhf/lNbbIb3MYfqfURJN90mJrLAGKNZKYKsK64OOC2YOztV
	 cLyIteJTCdvUVBqlz55hrrsRoygk4qboDd06wx4dmXOkHhwWJ4qIwSZCXVdw0jYrkrn6W
	 rzHScYiKx4ymhczKgeZvBvm/tvsH5CfoPkJasg5JMQ2mbGWPZxcNgyYSwhxEfWMfjmIJS
	 pU7PZicMu512BgUDUq85yktgiDnf7nH60EJMiH0FF4DcQA+S4UtLWjglQlPK/zfFxNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236BA606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:31:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236BA606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ip5EjwMR;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=B1CCQ8Wl
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SBeArB1606928
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:31:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=; b=Ip5EjwMRu8GypD8d
	vmz7DbjstSvLvVFPMsypePAHwg8buUeQgw00rGjw7YZzvHjvzbQ2XZy/bAoqFp0n
	Ae1cxOec6EaoiBkw5orNHBN/+w5CPm4zhBaIdhYfCqRJzdyf39jsK3QKU4hCPwyA
	HuoIN06dyAi8Us/jvpJjxKSDXMt6ZE9TJmlwJ5V9fvUZw1Er96kYm+Z/Arn0HiYo
	bdtrUybRSJ1XBqfHAnKDV58ualIQYh42uaIM9vsVPwYdNjx0EIlDJFLsDpBs6rON
	cqrCVMcCqaMdY8nxbSn8FxIHeO5fM+Yh4UGTkunUzZVkB/mmHCaww7Fj74GnhkHN
	oc06Tw==
Received: from mail-yx1-f69.google.com (mail-yx1-f69.google.com [74.125.224.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk7g7jmyj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 14:31:54 +0000 (GMT)
Received: by mail-yx1-f69.google.com with SMTP id 956f58d0204a3-67994010b21so1757267d50.3
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 07:31:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1793197914; cv=none;
        d=google.com; s=arc-20260327;
        b=FRBPhQos3BQrQErLjUc1rMagbnhkPlhPl4+bZ4L2rSDCTWn14iip8CIjC6aa4tAW7z
         o+8KDtkU9gWMVypMpyhUoONIMRVnUkPzz2BW0zoKQjaUuF+HM5FZoQOHK3IBwCy6k3Fj
         93pfeJTAhhFzsGkv80Z47qb1Dm38yzaPWkSrpZCNGPfTKXOPoian0lV4w+kQ4ZlXzmlE
         Q6txCpYHAi/loEo/s/KtgJYRa+3XPLd0aqyUfYK7lggvp4XGE83HLxtmkyXzG5fMxjWm
         zMl2C0lHOciCKrnrELGu/R36K6Wy3gIyL9uRf9YJGWZlfFgwuzfnbNUrMcKEOqiY7o2J
         +8Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        fh=zeM76vNfSJpDCDlk6003+1uouxkhrtzUWPIwYoBQjFo=;
        b=F4Y8kv8petna2NHcFc+4NaN/eKnTm0PnRYcYG6x9vRuNeU5zTNSTYAtFGYkjNUJ4tD
         IEOpRbre6JSNZmVSWLVSVHuYR68kb87PlsIY6Fzs2CsWn+Rap8uKe26CzVAp20cyAm1e
         eBBQ3n3UwJkA2tIWku5BpqFwwNPNc343N50hJmIiXl5zUMVNI2t89BmZCr4LwloHRm/E
         6myprLqYSHfKm213+V3BCO+s2PPM01xmCmoq+3ROwaWt8vUFr3/yrgKOzP16KaHJWd5X
         89xuhS/4SSQgjGhCkaNeSBauxn9v3dSJOebN+BUtFZbmt0E3FvcAsnjfqmvJq12ePTU+
         NTaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793197914; x=1793802714; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=B1CCQ8WlPbHOxHSGlEQJHyf2cIBsnEazIur5nmeVCdJqSdObS9xpFYrVMMwQM+JqL2
         AgunTgJhBAxRDmN5gVxmcUfD8mU3YUJ2p7htl0Ri/2r+VB3G6svO6nDWIuUdpJmomXmc
         TZH76o6OnTp/b8HPK/g/Ix+UV5PR34YVXFmjvWm4FpVjegZIXPlgEb8OxCu0JM9Ybsgq
         ihePli8x7s9oL/QL4mw876BQfZFCxx00/y5ppMdJJpggQAUzzqAX3bDud0O17Ax/e9fl
         XloD73cJcnwYOygWZ9b/GFnp+dPF4bAs+meXkcaw9c3zeZypNaseVX/HICFYPwJlRjfS
         3wgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793197914; x=1793802714;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD1eush/RY/6jcM3VK3+vNkMLz2HWHW5vG8JAOLsPng=;
        b=GCFaULMSjvztHJwbLBZjIFQ+L5CcOtQMxMV28RqvSQlH8X7r+vZh2ymTLpnRHqTqJ5
         zy0a16KYepag27LfOpRdY2QV2ab8ku5K40lrjznt/cqxJ+RkZOkZR3m4UzXUQG3nPqKB
         tFeHJl0u9xh6bZtQTJfEJiapqpdHlkB/5aImNp+321WC8qA8WRSSjXphJQi5nYxkFrvH
         TCNfFfVr6Fb32fGJLlPfo7Okb4+eg7zC1MG0l7yBUU1BPW0jW38eTPbTSxkGaK6tmGuR
         fELAQsebif28pJjhIo4k6GOUv78zp7wSpdcVESPXQ+iLD7gxegxbHFZx9t6iO0rLPTpa
         LW2g==
X-Forwarded-Encrypted: i=1; AKwUvByPp8GL23PXV5x8Yu77YSeQJ1CoWeqGgFrHL6inMIEsIBeWKx/C1SHKuJD7n38ngAGgtxxNZzZ6DuRDvw==@vger.kernel.org
X-Gm-Message-State: AFq9FYKW8oQF7jVgapZG0hHkLfnPvuAh8zRMVYIIHHZcISX6XPR4wT2R
	n1wMtEJhTnWwPYa8/dGyP9VPHHAdUmxm6CGvRb//V2jVqgOgO3fo4lpif0rOdB42wVpfxxmP1Qp
	T9CYUXVAPfwHIBlsRaB6qAmxrhnCzzeEjgQYuAFbSM2vgb9qPMNiqhn+OOYRTunn5qREIESJ6oA
	6Q5IXCApIUx3sTKjcg0vLeI9/UCx0ifVpPtfHlSaOY
X-Gm-Gg: AYBFou2AABbGgc80PWPVm6zpsux5viqVOrxAU1avYU40k0yK9MdflejLxIA2yB0uD+U
	uDt0SFP9lKPhwWCQVpmIYECMlVgcPqH+XtJptOeqhMBiE7q/e7zLEb7TEUwcUyVfRvikid/e3Gl
	CyQBZitRXu1y1y843GAq7PtgwRFmYjAvSXZmwiOdqCuNm8cNmDozjXnXbwjN9uLK5f/43vNu6Gd
	NMY9cj5fBe5vxqRB1XqB6jcYKli7Tu86XqGJqjpEgoM2vGvWmHx9t26pm5iWnYtZdTyMrT/dmg=
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id 956f58d0204a3-67a7bd37dc9mr1724001d50.107.1793197914370;
        Wed, 28 Oct 2026 07:31:54 -0700 (PDT)
X-Received: by 2002:a53:de12:0:b0:67a:693a:b1c1 with SMTP id
 956f58d0204a3-67a7bd37dc9mr1723945d50.107.1793197913680; Wed, 28 Oct 2026
 07:31:53 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261028132403.3505037-1-atanas.filipov@oss.qualcomm.com> <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261028132403.3505037-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 15:31:42 +0100
X-Gm-Features: AclHuK-ZetXLnRlYyVA0Aar_ekVy_y16swNN82xfp1QmruhUCAZreqlcaSWQtgI
Message-ID: <CAFEp6-14LzGwZmX19fGP+TTBcUft3=_JahLjg5P1SC4sW6euOQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] media: qcom: camss: clamp VFE clock rates to the
 highest level
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX8A031kNVyiZw
 wQpHpjwz8vLHb8twzgbZEWD+t4Km5dBiZ2tDP0ZFyNQIyi61NFXIBk+SCYn9A4Lki18ezOTTsoe
 E2jMc6tJi5qg88zYPG8rjo5TR+i+Lqo=
X-Authority-Analysis: v=2.4 cv=SoIFe/O0 c=1 sm=1 tr=0 ts=6ae2075b cx=c_pps
 a=J+5FMm3BkXb42VdG8aMU9w==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8 a=04hEKUbGTPlOapuoViwA:9
 a=QEXdDO2ut3YA:10 a=Epx66wHExT0cjJnnR-oj:22
X-Proofpoint-GUID: AZGwSoEoqCD79IFBtpc5HDcNRDvNe9tQ
X-Proofpoint-ORIG-GUID: AZGwSoEoqCD79IFBtpc5HDcNRDvNe9tQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA1NyBTYWx0ZWRfX/TieKRj8K3Wh
 Yb2SQYg9HCcBtKJLwL9gjBer6XSAH/HZEOgyoq/vKof6u/OfPDof9Bnim8tgBzspzXxkPhjUx4l
 vyRwOAS53u/58jRGk1VYcpdS05I4omOcYxfGUiJInOpEdtl+BywQO9RQzeW3Fkaag1LaxP2raaI
 f/D5rGAQDi3zykM1NZKamyzMYgddtwj65/iSDtbsYU1UBu/2fxtZ7TLv9cjAkokSrwhvdfbajZf
 uSY3PISQYCwf2CGkMk+4k3xyH8NgUVdLVd7osUACF5Xtv7SwrD+mkBqvkT8kSSmY1wPw74IAFWI
 WuPFfN9ul8z1z+UR8o3t95Dt/hcxBcLjFXieyx4neOrrC1jJDnDLSeflFDJqSi7IeGeFxtmRLzO
 c2cPptk+Nevo2WE/ja2Fx0Hbln2uwaim1DFFCS3JOhCqepTtf1IMERcbP4/H1N6AWKJlYmxYdqQ
 I40TVDmGh6X8n/mWH8Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 suspectscore=0 spamscore=0 phishscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280057

On Wed, Oct 28, 2026 at 2:24=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The VFE fails to power on when the pixel rate exceeds the highest rate
> listed for any of its clocks. The rate tables of the VFE clocks are
> independent and need not have the same number of levels, so a clock
> with a lower top rate than the VFE core clock, such as the SC7280
> camnoc_axi clock, makes the VFE reject pixel rates the core clock
> still supports.
>
> Keep failing when the pixel rate exceeds the highest rate of the VFE
> core clock, and clamp the other VFE clocks to their highest listed
> rate instead. Take the clamp into account for the other clocks when
> another line powers on an already running VFE, so that a clock
> running at its highest rate does not reject the request.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Just a minor style nit, but the dev_err() messages could fit on a single li=
ne.
Anyway:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
> Changes in v4:
> - Keep -EINVAL for the VFE core clock, clamp only the other clocks,
>   drop the warning (Bryan O'Donoghue, Loic Poulain)
> - Dropped Reviewed-by due to changes
>
>  drivers/media/platform/qcom/camss/camss-vfe.c | 40 +++++++++++++++++--
>  1 file changed, 36 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss-vfe.c b/drivers/medi=
a/platform/qcom/camss/camss-vfe.c
> index 59be37f83df3..bcc2c1929af1 100644
> --- a/drivers/media/platform/qcom/camss/camss-vfe.c
> +++ b/drivers/media/platform/qcom/camss/camss-vfe.c
> @@ -918,6 +918,20 @@ static int vfe_match_clock_names(struct vfe_device *=
vfe,
>                 !strcmp(clock->name, "camnoc_rt_axi"));
>  }
>
> +static bool vfe_match_core_clock_name(struct vfe_device *vfe,
> +                                     struct camss_clock *clock)
> +{
> +       char vfe_name[7]; /* vfeXXX\0 */
> +       char vfe_lite_name[12]; /* vfe_liteXXX\0 */
> +
> +       snprintf(vfe_name, sizeof(vfe_name), "vfe%d", vfe->id);
> +       snprintf(vfe_lite_name, sizeof(vfe_lite_name), "vfe_lite%d", vfe-=
>id);
> +
> +       return (!strcmp(clock->name, vfe_name) ||
> +               !strcmp(clock->name, vfe_lite_name) ||
> +               !strcmp(clock->name, "vfe_lite"));
> +}
> +
>  /*
>   * vfe_check_clock_levels - Calculate and set clock rates on VFE module
>   * @clock: clocks data
> @@ -1001,9 +1015,14 @@ static int vfe_set_clock_rates(struct vfe_device *=
vfe)
>                                         break;
>
>                         if (j =3D=3D clock->nfreqs) {
> -                               dev_err(dev,
> -                                       "Pixel clock is too high for VFE"=
);
> -                               return -EINVAL;
> +                               if (vfe_match_core_clock_name(vfe, clock)=
) {
> +                                       dev_err(dev,
> +                                               "Pixel clock is too high =
for VFE");
> +                                       return -EINVAL;
> +                               }
> +
> +                               /* Other clocks are clamped to their high=
est rate */
> +                               j =3D clock->nfreqs - 1;
>                         }
>
>                         /* if sensor pixel clock is not available */
> @@ -1045,10 +1064,23 @@ static int vfe_check_clock_rates(struct vfe_devic=
e *vfe)
>                 struct camss_clock *clock =3D &vfe->clock[i];
>
>                 if (vfe_match_clock_names(vfe, clock) && vfe_check_clock_=
levels(clock)) {
> +                       u64 req_rate =3D min_rate;
>                         unsigned long rate;
>
> +                       if (!vfe_match_core_clock_name(vfe, clock)) {
> +                               long max_rate;
> +
> +                               /* A clock already at its highest rate ca=
nnot go higher */
> +                               max_rate =3D clk_round_rate(clock->clk,
> +                                                         clock->freq[clo=
ck->nfreqs - 1]);
> +                               if (max_rate < 0)
> +                                       return max_rate;
> +
> +                               req_rate =3D min_t(u64, min_rate, max_rat=
e);
> +                       }
> +
>                         rate =3D clk_get_rate(clock->clk);
> -                       if (rate < min_rate)
> +                       if (rate < req_rate)
>                                 return -EBUSY;
>                 }
>         }
> --
> 2.34.1
>
