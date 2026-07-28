Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C61448B82
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=205.220.180.131
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785247717; cv=pass; b=VegOCCDQuDA2ultJXeDPCI4NDSrULmvF3ucvUlrAky0ASrooUfh1dV0X2/ZD97/6zoYXOncYre1f5eDIiVeqV8gR3KKwU3rh71EomJLn+E6pZ9Vn6s0KVR9aGOHzKIoKSJyVZDTBDmz20ZRSja01DOz8Ele7Fg1JkNgq3O7oEMQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785247717; c=relaxed/simple;
	bh=ADsl6Oh6BO5X1ATAFohCJeEUaOkmKU8XJWSMqfZeHIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dz0oxvC8QsWewM0Y5dENLhOYnz605TBq29/YU1Maxa0eSVPSmedlHbp9Q9meZGDfGlJksq+94Xf92NvQFU7L2rKTeHvU42PZgQ49dVQBsUUtYrYdcQP7bEh5Nczbije+1qtBTgvkcxRxADMBOcuwdHL0+BF+7MuH1d3o3GeDk3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NSoDKo1D; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=OSQQ3sCb; arc=pass smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NSoDKo1D";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="OSQQ3sCb"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66SDOiap3059435
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:08:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=; b=NSoDKo1DRTM+d2OR
	xcEg1CPv1i2miZnJHhIKmXpRMqLAujW6GhWOPhBY0uv9AQR7A4P6Pvi/QaRi4Gfb
	GuKIhxcWvRXsyyaRla2PP+uge6SSh/SIHcel/gxQ9OXho2SFBiNfbssTEaAIvi8G
	22n0s8kUpjiGc2dqB7pqH7lw3WKyau8wCQDa0Zgah7No9Y86wLfxm+cTpwKPkTNG
	khkMlFaAND0JHSVlf+6tr1cYUZCqvgOrQ0rkDmRpcPNS4RlBj5ccNdOJOuSNqvwV
	f087lQhsUae6dRhITDfop6Zeauz66/K8sHlHuqpKQEAWm4or6M54rPRGs06G6dka
	zfO49g==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fphh7k6vk-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 14:08:33 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-92e695a3b28so115305885a.1
        for <linux-media@vger.kernel.org>; Tue, 28 Jul 2026 07:08:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785247713; cv=none;
        d=google.com; s=arc-20260327;
        b=gZjjz6fh1/MMVmHlq0z+oqyxXHy7A+M9VTygyeUYrUTJYhKRwXLyLrWux7ygl/Zdgq
         zC9ndigzoyU+kga9cMvNKyCzCVlTVHxdeTcK6Uxyf9TBg7iugzpzFw02gzVngiM/qxkz
         L0kEs+AcEe/tEL/vlHoGmUQVIxYNHvieWQURgJg/+6XdCEfGe29XXAWcjA5Dzn6mwNVM
         hdgb4TfNbjsYV37RVCdE3BCnRSFEdB6pLl9ARvEKFkKkGqrL3zpHkpR8iSrV92VGB0g8
         SVAva/auSU0IIQz9H6btIK9yn1+obDGyzTbIQYI1UMKmNqb4bjK221334q5q7J/Feywj
         8Crw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        fh=xVuCobEka4fjyMZnSqOrcja/GsyQ5q9hE/ZzQ+tOna0=;
        b=RGTQGWZXuJ1zsDyC5Z+d5ricWZCBU3XcEJpT5UnZacODXw7gCmO2jClVCG6yLweZIC
         hgqGqlkdIL05I5Np0fQltQVOr7tsqTcETLA0qHnr/5Wsrqm+LFh5i5QB6oscAAEXlcrR
         /PcmYWcqDdPe05uzqHLIeMd6DTCOjekpw6iByY20DbTWROPtrqpUGelfXG7thekg2UKW
         c0DskC7WxtY3e/+n9r4xiKqCfi8zAr76uEae3H1fs+kE9+RVLSxfcnXxQtzmD+Oh+AW3
         GgP6qAA59BfVRAhZ5Fv384Cz7LbbHok8mgdyBFGHtxrxyVrAUcSnLLT3IsVruequw8hD
         6i/A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1785247713; x=1785852513; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=OSQQ3sCb9rZ0MuqedNA/2Sj2nia5iRREdv7+LXEgbV+7ktjV/FHYU6NLGL7wf47GfC
         u+0BG+5Ai4EN437/fioteFT2CTFhY4ZyykwhUUYXmluLoYHaSox9V3sbdp7/rGZ7As3T
         oKLF/U9E0T7qiaKyyg8x/sz/4QlCT2BMB3GUw49SPmnVBsxtp7DHFVEC37pISuJCvWaM
         WLourPq6gNbfd/czQBA+hgcszNzaKbjNq332uxePTbiRlejHzvwLSf0GmdtMEbqLnxfM
         4SXtzgyHydefE+0x3cwMdJ6vK9mGM2GrNZquXjovOQlu0cOJ/Yk2zxEvcKoFcienBejP
         m/KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785247713; x=1785852513;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dgrl60IlcgUtxV8b+GtgWbSKL9T4fkkU03nVj9x4Tu8=;
        b=h9qYaU3NxHen222vVmEmSlY4y6wWNwVymo9NRifn8ZfeFwgCr8IZW3psd6m58cj1ZH
         1iQtm4MXEh28B5WmX3MPMz3RgfkS/DoN1O9HOu+nWcqWYp/GcKl58uuLNWAoL/kUX8+2
         FdJd1+ieePiCpsZeB8sxXk9twGAs4gY3Enshox1M0NLUFI70jr7S9zXDudrDSQhk7+cM
         9fhTwL8UnLHi61AvjHIn1q8WRHa+VUPyYN2evAEq0+4obfqMPJzjsAVRvABbTqGldrpQ
         0b/Nrl6MSJZ5fTno85Tn5/uOd5S5dqIvV+2C/O2UZJoGqm0GMpwP3qeXaz5HNXwB04jd
         qezg==
X-Forwarded-Encrypted: i=1; AHgh+RqH1O2FyOK/q14Ho/5s5E94RXuRnWAOE12u4t1J/4wJX9oiT1v9A2YylIIUN5JX6NzKsvvJgu7Bg8qp0A==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy6LFIvk50kqwjh24gn25DseRxodg26qTNS1UYfLd8wFH566rk+
	msXLtbXDV0arCcDNgqkN9KE/+zt9Gfe39oyLaomYppP94dgs2tGjWwcu/BQF6SQ/Zpzfjc6nU8O
	iitcNiBz9oQDEbKBAcuXi5yad3tcv3sCbjS4sGeH70mX2p6eEVnZKBcasyYt8BBKXZhJyoAnedQ
	Eg6QSw7NAzGsmV1LWX5bM7FpL54RHDv5n1PPOuQHWL
X-Gm-Gg: AR+sD12cqNY+eHVr/7kw4oEPWyIKHRhk3f1hsdU6EWgTkBoiTWvGsmwUTzr09NsOyqj
	zr6D1auZbOrd4aTh3ns49MnSsp6OB1z9rEoMwhZOHJzmB+HCFf8M8gBpVT7sWOEIGewtGSV9cuR
	abmzXbcJySliA1AZPlJtMbFTj+RVQkH//VsNQZZ4AxEPl1ZPW+v2OzBX7C2B9GJMmEkGumTEcCo
	Ccnzmj2CUH2OcI3sNUBJwH8AaRN/scXMWhrWM0w61xlGJLfZOfqxDC6Sn2DkkIHO96CWim14ks=
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id af79cd13be357-9330263c462mr233338085a.16.1785247713200;
        Tue, 28 Jul 2026 07:08:33 -0700 (PDT)
X-Received: by 2002:a05:620a:25d3:b0:929:f78f:6bf9 with SMTP id
 af79cd13be357-9330263c462mr233331485a.16.1785247712676; Tue, 28 Jul 2026
 07:08:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com> <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
In-Reply-To: <20260728-isi-v5-1-1d22ab91602a@oss.nxp.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Tue, 28 Jul 2026 16:08:21 +0200
X-Gm-Features: AUfX_mw5JcxlCW6NeAN0Cy8X5f4_Rk6VWvnTqzYs1-6WgLhGTre_063E34AGeNA
Message-ID: <CAFEp6-3jntC6xQLDLjQdMps5Lq-sOCGEtMnkFTtrCDZpngBwRQ@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] media: nxp: imx8-isi: Use BIT_ULL() for 64-bit
 stream masks
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Christian Hemp <c.hemp@phytec.de>,
        Stefan Riedmueller <s.riedmueller@phytec.de>,
        Jacopo Mondi <jacopo@jmondi.org>, "Bryan O'Donoghue" <bod@kernel.org>,
        Dong Aisheng <aisheng.dong@nxp.com>, Guoniu Zhou <guoniu.zhou@nxp.com>,
        linux-media@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfXzJUVnU8yavCw
 I7vqNaVkxL+mm2kCcTc5iyfSJ3t3MjsaSwymz8L+f7pjgskAclZsCyN7pa2PrpJMgjUXv80QU2y
 GTaILI2kZT93yUJ/p6/Tx9N0hEE3bhI1sixn8itGL0LgUgrKAEqppS92ob8Mfu78kkcq8dd7oLT
 S2SsMrAscuhjiO1LWfdHcyg/isuB/3wepr77oJFBPYOtuWhrTY8fs9iU4fSbNlPp/I/B8KxWwtA
 BLwbH1j8WwtDX3MnGi/E+oa8KRGhVdbGkdOaYq6LYNqkALshYkNOCV8D8O3joal2mNKhzQi2NiU
 vZRJpWjueHgEJKLmkqYHjojIprzy/rqZ7I36X5P71jriZO8GstiLs+ag5yG3wapSZbhq+lgknj5
 7rC7anbFfZsSr1p738+OsmsK2HGK/MSa8RuucwQk+JsbzPLFBp1iZ3c2SsvuLCivyRu4ZjN8cme
 objFG/sWtefvh078A7A==
X-Proofpoint-ORIG-GUID: PzgYO1id9ThaO8XTXT0-bTmya8RkIy1-
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzI4MDEyNSBTYWx0ZWRfX91xkeTdVYDt+
 fDf26Erk8x4tIbSqtHqtWlUA4X4o4aCe9VWTr2SkiGy5kYJpGoT89LpB9mQCZJfyxzSHA+ABY/O
 FEp6Fb43h6UWUQnn8zAY8/I/Ox5evpY=
X-Proofpoint-GUID: PzgYO1id9ThaO8XTXT0-bTmya8RkIy1-
X-Authority-Analysis: v=2.4 cv=b+6CJNGx c=1 sm=1 tr=0 ts=6a68b7e1 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=3WHJM1ZQz_JShphwDgj5:22 a=8AirrxEcAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=LElf2VvS5UWv9C91Qe8A:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=ST-jHhOKWsTCqRlWije3:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-28_03,2026-07-28_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607280125

On Tue, Jul 28, 2026 at 8:55=E2=80=AFAM Guoniu Zhou <guoniu.zhou@oss.nxp.co=
m> wrote:
>
> Use BIT_ULL() instead of BIT() for u64 stream masks to avoid incorrect
> results on 32-bit architectures when stream IDs are 32 or greater.
>
> Fixes: cf21f328fcaf ("media: nxp: Add i.MX8 ISI driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c b/dr=
ivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> index 9f0231ca47a3..9db9c6e55c2c 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-crossbar.c
> @@ -157,10 +157,10 @@ mxc_isi_crossbar_xlate_streams(struct mxc_isi_cross=
bar *xbar,
>          */
>         for_each_active_route(&state->routing, route) {
>                 if (route->source_pad !=3D source_pad ||
> -                   !(source_streams & BIT(route->source_stream)))
> +                   !(source_streams & BIT_ULL(route->source_stream)))
>                         continue;
>
> -               sink_streams |=3D BIT(route->sink_stream);
> +               sink_streams |=3D BIT_ULL(route->sink_stream);
>                 sink_pad =3D route->sink_pad;
>         }
>
>
> --
> 2.34.1
>
