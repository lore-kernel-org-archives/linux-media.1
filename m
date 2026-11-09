Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794218230;
	b=LF8GPChzLeqOM+MkeNBlCLvAvrBJXyDJzrnjniGZteyALD4niMK2ZV74scVhqd4LAIMn
	 va7rASJLoN54YF0U/ylS8e6wObVqlipOF4HeI8FIWEGLC0h1M0P5DIZp2P138rQDxt6V2
	 s8N8U6LepSqM6y/hMcCTkhh8+zDz1SHY4yu0TQGFpXr76OU4KQqQZDTVQKwph9KUnH2Vo
	 3G2KRDB+h+AnQwyuHifmnpsvy/mTR228gmvE3g/OOnUoM3rYTjP8hFyqINyL5EgztkvF7
	 Dc5DyFVCEpl0Kc3nVEF6DaKD0gDdZdit0STDhZ0KIdMrWG7vkHuHAlE09kyt5rnf66Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794218230;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
	b=vYZUNQGhotkWy4oaCwLd+s/R79sl34fpZ3fDd4+xpJVC4LQX6TD8rT8g01Wzo+dJnK9M
	 csg98Md2buAiqIH/uCqCVVfClRfsUVEV1GV1z71wGcHJqRxQTznohFcdcmxSN8xMmWdtu
	 x1saNFZYTv/NPHVVpg9CHRicjeA5BshA46xXVV1JGLCCOtF7+//DnBOnbCyWMF8NajUt+
	 5A5ib59YwSd55UERCFNkhEjQ6LWUd0f4UZFj2BqYy/3X6ej8MR21RTtdL1WWJI0PJhfpr
	 KFHGiPrq+AL91cMdORkzFAbJfeAy9rX64yMPxL5dMQxcQQHhOBIs1aHO2OrZEewtqmw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="YI1HO/W0";
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BB0F606A330
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 09:57:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4BB0F606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=VPtuRtDG;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=YI1HO/W0
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A99ug5T899062
	for <linux-media@vger.kernel.org>; Mon, 9 Nov 2026 09:57:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=; b=VPtuRtDGzb65NmL9
	VLFYDA8OJXcH+ENvRFYSyLXanv3GGUHa6d2HQwcygrFRERVAO9cViv+KuiQjXEI7
	Y9JV6pDfIUcEaKQyOfwoXWnS4i/1R7LzOipuMBeoi0sDOnF8FBLKPN5RJFJdy+T7
	ZTuHdkJ6IQR7NjuVAu+k6tTTs74qHb4VugMtJTk1mU+i0TyZnmlrBi1n3xPST6KR
	Y7xPWEutPUwjd1Bs8Ubuw1s9V1WxlLo7foE6vAj+Q5n+288tGGYId5ioLDgBmPmW
	g271xOtcdtEJJKWV0yzBDc+63+m976m0oSTPCkR32u/2QXI1mkFR02l5qXLM2TRG
	l6cbvQ==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hsspf63ah-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 09:57:09 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-945b0154705so102849585a.3
        for <linux-media@vger.kernel.org>; Mon, 09 Nov 2026 01:57:09 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794218228; cv=none;
        d=google.com; s=arc-20260327;
        b=cbWJXkNJriPdwZLLR5pfDJBlBuVkPnwptzv4t8n1qfnipZ2MsuMRGXArJDJDCGI3eP
         8rxoVUukkHNHWqh+Gd6PmTy4KpN86f/CU38tS8qvabDe6s6cV+uS2HlRDEsqLERNZ7iv
         gfU3rLfpqreppInGs5+UQRwPF2C0hmMsomnXG0LuynB/fZ/Wc4lnZFdnRZKtzGPD4eFI
         EsKOJ+lzry+re53ZAtEx5fvzK8tVwH9Fl2SvvChL5Wb5I3wi8CyB74bI3S6OcqQcsQEq
         E2/4gvFk7HPMGYwIZklcJoZlkOq7fhiv0LisICp5jW7vDccMzJ+6vuH56Y26aEYAixGx
         GJMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        fh=XFkcA86c0SSYE0vRE2mDin4ya/AIATDEMFRxSNfroRM=;
        b=rvyvlf7lLrcmiNA5MSmvM3lLpAy605WBJEXld8bvGlc8ROWtxz5CaeysJOAhPEBdQw
         cwKvKn1vV0C4/WxSIs2clw0QWytv4GggrGWra0IvGC6RVSu1ELdwit1flGKj5fKKT11s
         /C0qzQAA1MUO6OHt3ebxWSYeuU6/B9gpXgcoZ88qLrFaJzPmIfaApZ4albqz9GH8+84F
         6hBD/fOGI+ZnyzBBsvacpHAGJ0+3c1FEldKcjzJYjyV2ewD6updAHXTwxqEgz7M4ubs6
         ENyxoh5IJt1kCHYBA9VIXGhVIQ/+vhdkvbnY4WePaWSJ2B6rXIsIsjms2YpH4BWg3t14
         6tMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794218228; x=1794823028; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=YI1HO/W0EQLWyHzVs0t1ZJ5qJNb5kcxeU7uNuwCe5segq//c1E5N5oPqoV9dNtfp8L
         93zZqfkERMPSE7DzbD/ZdVK7suWGRfpt+ihpAv6AQVXNu+vIdZOghnBK6qwcKDcmVtXg
         rB2Tf2TOANlYphZejtHgq7gyORN34BqEaSeeSoDkCy9zYy/lRkOfBTT7vjFeyjKl++8d
         xdK4O8XvvLNtywna6hkjsLv8YBjgSrLT5/qVykPiTAyQbrHSSRrhxeBYePzgzwtmExnS
         5oj0D3sY3dWR+/Ut1a+eWJQbW7jVad0yZ47QeCXJE8PESRx7ONc+jLMfceOKCi8dfdn0
         FupQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794218228; x=1794823028;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AAG6wtd1w6cVFaCC+O0b2STezx0qv6f7g12TMj5bqMM=;
        b=jEiJoUPTsmG16xvtItNgwbgOrIe8J2UTqvFouR2WlfC6flB4Wa9J9BoSu+//x7HxPI
         iJqmySzqjzd1oZaLkOSMBA9l3d/8JFBtODg+PU5MfGHODuKUWXwQLDUaZLeeLCpAz6Dk
         k2z8UJtrw3DipBQAyDGxavKbk+zRojvvHFiFB49Do9SSLOroRzrW2hgyFsV0pR+a9/GL
         4A+mu2W5PPa8fcPNvpssJB+FlbbgRqNCPd6GItvnteK3LcWoylZtr36Xo2KPitXW2iLO
         g0PoWGgHVgzr2fOQox4mgsRV8npyCi5PwheGAp5QFFeufPlndfE2U3wMoeG6EBYrCIsZ
         /fcg==
X-Forwarded-Encrypted: i=1; AL+hErHf8B/Qp+y0kmRxBz4Pl+Vse2SPBM5m/trtBRoh6zzIGPopeANUqtTS8vpuCzAe1Nk9rjshZUDxa3II7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z/8sNmE9D3OQbvmLYt73/a3WeFY5Aciy5xA1u9XYIxKmdW3z2tB
	pxrmBq8Nj92CkbVmMTepwMg3CAuF/papKsV09edMr+DdZhb8FXppH9WjJ0velfAyCZET4INjg0f
	0Qhv9Qa5yLZcRGOjMWME0DDyds14Q+r7ziIR2YHTRYJtPzhZkbi+zgfZwzrdsBFBN2CBZiGhfX4
	vB/0AOpC3Wd1IwE4SpMNsPfnyYvY0CF64Nq3f79Cdl
X-Gm-Gg: AYBFou0WbxP3lzVUX2EIDhwHjZRekTVz5nvjy8IDN5BXwNWQIQ0xEpkBlQnizMopDWO
	vDMSpQmC7kujBBy9ZlvQiruWcFnzNS6elTrNdMfC6CB2mPGkPzvDAofYl4dZbIsXug4pjQukwUp
	y8b1OyF96LYec/31jYDIauZr1QoFkFYArb1GTnidZ5N9wCp18nfoow14X11tSnjp64lBIxCASIw
	/pUsQMvJNdNKxds3w9iOp3fTUrMgOEbvu5YYgYybIw/M690ykqrtJHSNJihrFom+m5HWoj8JzE=
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id af79cd13be357-94784da9342mr336039285a.83.1794218228406;
        Mon, 09 Nov 2026 01:57:08 -0800 (PST)
X-Received: by 2002:a05:620a:2401:20b0:947:84da:8458 with SMTP id
 af79cd13be357-94784da9342mr336037885a.83.1794218227882; Mon, 09 Nov 2026
 01:57:07 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261107-v4l2-frame-sync-v3-0-e5bf7073a35d@kernel.org> <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
In-Reply-To: <20261107-v4l2-frame-sync-v3-8-e5bf7073a35d@kernel.org>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Mon, 9 Nov 2026 10:56:56 +0100
X-Gm-Features: AclHuK9j9RAwJKTKzev9RbLG7mY1UiDABvkGjeRinbRp40Cik4QzcPP6hAY-YhQ
Message-ID: <CAFEp6-0t_r7yH3hGRFH6amgfNUK7sTMe68HXQ2WEuUffHMQF2A@mail.gmail.com>
Subject: Re: [PATCH v3 08/11] media: qcom: camss: Switch on frame_sync_en
 logic for csid-gen3.
To: bryan.odonoghue@linaro.org
Cc: Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, "Bryan O'Donoghue" <bod@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX3R/SH6PbppBH
 lBcx1iwClkSxczDjicgo6bw04j+AomjF7KYK/CRJ98OVV6omkkztxdvH4g0HB7ebHpRtijSFJeM
 QOmKtJo8i00qwi57uwatRhK7Zj5qews=
X-Authority-Analysis: v=2.4 cv=LJzz05W9 c=1 sm=1 tr=0 ts=6af198f5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=eoimf2acIAo5FJnRuUoq:22 a=KKAkSRfTAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=XzkgqCU9wlH7P1zULpYA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: NiMjhmLkgMcG1hqAk6tT6bTkMo_eT8tO
X-Proofpoint-ORIG-GUID: NiMjhmLkgMcG1hqAk6tT6bTkMo_eT8tO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA5MDAzOSBTYWx0ZWRfX/abqnNXb9pq6
 ggk8yyl6ZrcIyi52cNb71wVQ/ZKe9K7/LWnxgfvJ2CJOH8POviabdbmMtCIg6GegX7OPwtOeCpa
 qAoOO+CS6yHzbqvrbVLoY3+vbiOaKpMVGry5n1dpgexfFvGuleZcwTpGNrmPEqMvyAJ1IQoUmwf
 mY1zmST9LHdrGRKJzkDxgy31VYqf46j29zB6jM5Dn6e/hHcX+W7G+UsFZyWD/4/ve9kCtbfmnqT
 AVoZ6m6ljcCpRrSlx1hHYZB8xR0n6m3IcJ0vM6fDSRMHLCiS77V4jhEf7LGbaDnsX6J2ALdwvWb
 +FkaC6s3pNm6ZZ5QW47MRqGf8FywUlbecnJUkgzoWJBSp9pYyX6FOJpGWeedhtEtpj6aeIeh6Ld
 SzN7uR7uecW2OcCJKy0xThDhe2CxTCg8YJs3Ron8fbXoXvURyigsTXcRnAq1eqdYPiPZilEwD34
 D8UyMssl3zGZva+ZzHA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-09_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 spamscore=0 lowpriorityscore=0 clxscore=1015
 priorityscore=1501 phishscore=0 bulkscore=0 suspectscore=0 impostorscore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611090039

On Sat, Nov 7, 2026 at 2:02=E2=80=AFAM <bryan.odonoghue@linaro.org> wrote:
>
> From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>
> Switch frame_sync_en to true to track and consume SOF/EOF data.
>
> Tested-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org> # sm8650-hdk
> Signed-off-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
> Signed-off-by: Bryan O'Donoghue <bod@kernel.org>

I would have preferred this to be defined directly in the
corresponding CSID implementations rather than in the resource
descriptors, so that the component implementing frame synchronization
is also the one advertising support for it. In other words, something
along the lines of a csid_hw_ops.features flag or a dedicated
csid_hw_ops.has_frame_sync callback/field. That said, this is more of
a design preference than a blocking concern for me, so:

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index 52bb19f5fbf3b..b7821019241d7 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -3120,6 +3120,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3135,6 +3136,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3150,6 +3152,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3165,6 +3168,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3180,6 +3184,7 @@ static const struct camss_subdev_resources csid_res=
_8550[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3433,6 +3438,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3447,6 +3453,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3461,6 +3468,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .formats =3D &csid_formats_gen2,
> @@ -3476,6 +3484,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3492,6 +3501,7 @@ static const struct camss_subdev_resources csid_res=
_sm8650[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>                         .hw_ops =3D &csid_ops_gen3,
> @@ -3790,6 +3800,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid0" },
>                 .interrupt =3D { "csid0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3807,6 +3818,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid1" },
>                 .interrupt =3D { "csid1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D false,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3825,6 +3837,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite0" },
>                 .interrupt =3D { "csid_lite0" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3842,6 +3855,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite1" },
>                 .interrupt =3D { "csid_lite1" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3859,6 +3873,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite2" },
>                 .interrupt =3D { "csid_lite2" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3876,6 +3891,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite3" },
>                 .interrupt =3D { "csid_lite3" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
> @@ -3893,6 +3909,7 @@ static const struct camss_subdev_resources csid_res=
_8775p[] =3D {
>                 .reg =3D { "csid_lite4" },
>                 .interrupt =3D { "csid_lite4" },
>                 .csid =3D {
> +                       .frame_sync_en =3D true,
>                         .is_lite =3D true,
>                         .hw_ops =3D &csid_ops_gen3,
>                         .parent_dev_ops =3D &vfe_parent_dev_ops,
>
> --
> 2.56.0
>
