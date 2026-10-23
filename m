Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792769867;
	b=F4Sk8FCnJxPlJ/Ub3bK3zpVi8BTYNPxAqz1oGEgrk19UVzQ9OZbahpDGc2uRLNAIpz7F
	 BET9ZbmMzWDpMHzwyvs1NnHfK+098FdAUxSGgz3h6MzW8gBptdVgXHJLob2fcQnyn9Zqn
	 3oaRPXxIF5Vfwr8VLZtJkk+hLlkPFMjeLQ4gC9+yiaOkEQReZvlGZRYks6wxgKmAgb5BY
	 +7LBpj4JegER2tF5MZiGec3YfRIdj2RxvchZJ10eyIFcZ6F0ocu1FfRPnaa+orHqLaGeh
	 aCQGgr+qKsmFCr23vQpYP2ZlB5x3rJtjfJJ1DxUMokq0ZlXDhfX5Z1aT4uTWbcNM17Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792769867;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
	b=jk3iIgWkieAAJ5BM8SeGq0iZmIII5aj3DnXJhz0g8Gub5UZkXM4szo+E0BVet7k1BLPu
	 O7q6gi36zeIRuaGROdt1miUZfXFPeV0pVTLfslZoJCFs36jza7KJxeVijB2kiOB+s1AQZ
	 h4+WRrYyShCXtysSnrwPGO3ZDzCrl3+ADfJ4MKAadZsWI3ibQaTj/UiR4WVaLQ1Ag1DT2
	 5OGDPb2v294zzqkcXWgL2CyVcmwZrkUh/HANbaGPUFNv2hYCWWOt+J6ocAXGHY9AM1WpE
	 vh33kpazJlzYs6fsf36o7pltM7LrDVGh5U4mVwBzxzzFh2FOZ0zSAVO2LKtm2rO2kEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E510606A31B
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E510606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oscOz2za;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=P34KoyEp
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NE6Ch92462562
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=; b=oscOz2zakSq427/H
	WOVKkqX88uNUFLv9cbB/hvad0/uIStlwDWUeHqEuDg5HekRLKL4ql8nNTfKhlTSa
	fUoR/oyzzbNvx/LNiuX9oFduwnYjt1Zqfr4wOmQH3M6C5QhANs2EWtv5mJV/pHP9
	OzXoGVtjbzanmY410ZBFvhqeOoRjU6eqAITYZVjTyLu1pClzj3WAq0QEreF2tFM6
	sq/wZYYxOFOPo6XQ9DxCetoXdOXZ4DfV1qCjXVku+jG6WoY6f2NVm0vkqfavYDjC
	919P3qvUJFbSCSduomLjh7oW0PJFX8U/Zsz5pv05RIWbvEykpfGq7fDUEDnryxlm
	nTnTfg==
Received: from mail-oi1-f198.google.com (mail-oi1-f198.google.com [209.85.167.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfqmtvctd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 15:37:46 +0000 (GMT)
Received: by mail-oi1-f198.google.com with SMTP id 5614622812f47-4b26d8d2498so1405595b6e.2
        for <linux-media@vger.kernel.org>; Fri, 23 Oct 2026 08:37:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792769865; cv=none;
        d=google.com; s=arc-20260327;
        b=l+c3x6EFd4a++pVnin+3YFpSgXN4g3CRsA1K6kbz7XQNXqiMcMFbzy+eh1glwGAAby
         Kp5npdp8V2XeMpWYYPOt/twJUENV5QA3VRW685xlbW2xyfeUdFaE5HnFxyRjpp41rIcK
         Bd0hBmCo9nm83dcm0zkT4kGwsDSedMf2tcm35ELffa+5TiERtcRBlIF8CGKRdt83+mM+
         vtEfQPxMb+VuVszymvGotu8s/e6QMKitDdEUyi6lnSyaxVMAHDDBXtoYCz7pTG33pijb
         waQVHAvdreCml6nSy3Pqb8sIAsOBloDV7J56adNVK1bdLymPxIm09c/tvoqviWraVHWW
         T0JA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        fh=28Oo7xYF3nD9i8UtiICfY5z1qfegDgRNYjJvpTvSyrs=;
        b=lKB80J+b6gN5Xsio1BVnhNL7BzGCaoHecpPMklrSu1S7rEsFSi8phLfaH5ZDbqRu9Q
         bJW8Avx7QboIbfEhSSYu+bNn9S4fqfpNTgEnwTRtOeJxVgg6/kGDWxlEzyH4mgsscYyC
         p6wqgXxZttzCZdWMEsZgr2y4wVJnsL3W3ije2ObwKqb2IcVWMgGyG7qaOd5ana4xjb59
         DRYAPJYYf/YNOA3IUZYQ3czOCPIak4qEXVjHIltrPupWuvJllrC/KoeBqWYhhDeWtf0B
         DPTVOlZ1Ds23VUI/y2j8exRcICDFawkIxnagU5QLnWmMYKfVo+Q2dPuPDi3RG0u3Pti/
         JmwQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792769865; x=1793374665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=P34KoyEpcj8qi9nCPpR1VOgOsMcNeP2Bx44QoJERS6Ve31jTerLtTFn9P8AsH818Hk
         AGCHH2twc30JM3uEHK1mspQYdUD6UE3fQpVJZhTCetEd3ySC+/SmLwhbF0lScXQ1y3Yk
         UODEuWVSQpaCNRqsW1xJHL2tGIe6/WDtuQ5HHEDXFSxrjzV/mB00SeXbFolUXQ6Fn7cf
         1iuA/HdsqfQsV/kZThLBNYkT8GsMU9RY6mYzb2OFX8b+J0q0DmDJFJosm5GMPEcjKjUc
         wve1i/qT/AvLu+EJzJisFnxyQpb3oYrTjxfLAuse/izF5B7SndxbXCG9L+LK50N2rSa2
         3uZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792769865; x=1793374665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u71sPDFA0V1HRblAC4yZ+CxptBv96slm9iFbwxOL/WA=;
        b=UkXOPciJ+SED4kpIyWqwzBVyEbgtXemWiCmuVZ6mgTnstNqKhphZr9W4VzNb1Ox0Hx
         e5kzngiNpFpKYViLzh+CXPhFgd9gfGcHgYv6MJ8rmmDh6okCAuPXXhaWLFi+yojKG24p
         T9mUOWNh3WCYcD8iRK19Au/pRsiWxKvp/0MpECccuZiYZ9yl5P1jiFF5MdF+OUIye2/2
         iw9e/5wgTznwHkM+JVTV2Wdyp+BOkg3V5a23alhS7x5El57Sam7pBwGkMi/lY++RAGsW
         4T03/nrxpuSTXbk0d2TIO84MATSqqCOGV2s+OVySCTKj6T2uuCE0UYT3rxsK0Nwg48Rf
         SIXA==
X-Forwarded-Encrypted: i=1; AKwUvBxjZmDJkXV8cuPST2Omke4VTeOwoz2snOuJFR6n2RB/rRZ3mjwmXNV7mCiJ+JJQ5WnN0ar6rlhmaps7Kg==@vger.kernel.org
X-Gm-Message-State: AFq9FYKcgQV4Rsm4iWdkcdPCpddpQF9zrMVozunOhjgI7TDAFHT3OuVX
	2r/xgju6Yn6/6TAhjItjFN+bHOcy0FRz7klPoYSOCkp0CHIQr784Lp4JS7G3a1XDixKjmC/9Fhr
	m2gL55NvaQNWp9UiJnk7Q/0ZAxvlRD0ex3veJ8vYBKQfjYle/agah7e7K0rWOO0aOXcM9njPcWs
	+loWsqY5pQktEVsTWgmK9bu+pgSukAVxrC0gtEdb7L/z+JEv3rDL0=
X-Gm-Gg: AYBFou0dQCqyMRR4lzZwxjhyO1sbUsaE7l9u85yQIIbubCT7qkCxQnCAhiMSRe3L5oh
	mtqh7k9bJxHcXQSaEc0rBETHMg1mydQqiDKeUSBYQ+u0vvRTyFSq2ZctJos5Kh/gJ1MnEHZZupG
	CkBbVrDn9/4S9jdAOBRQM24X+WGWkbx/yMtqJXtBYiVQMSKw8MYN949d/RM2cQK5Z+cj/XCvjKd
	/r4n21MlMRjfcgr96vd0+C8uC5Uu+/vfBYL1w6OY3XqpRO8DjofLjjF4dx9JteH1Nf8k5OsT3U=
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id 5614622812f47-55be85f894bmr1777811b6e.15.1792769865324;
        Fri, 23 Oct 2026 08:37:45 -0700 (PDT)
X-Received: by 2002:a05:6808:470c:b0:4f8:4a95:9969 with SMTP id
 5614622812f47-55be85f894bmr1777788b6e.15.1792769864900; Fri, 23 Oct 2026
 08:37:44 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261023152857.2859767-1-atanas.filipov@oss.qualcomm.com> <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
In-Reply-To: <20261023152857.2859767-3-atanas.filipov@oss.qualcomm.com>
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 17:37:33 +0200
X-Gm-Features: AclHuK98d0P5yH7QJpyoncKDu7si33RmQoO6a8dZ5w8x9_6qeviYUDBD5TuqCZo
Message-ID: <CAFEp6-2rPeLXwo2uRDm+xTW_MRMcwM1BsbE0hLU9+S_kGdgOxA@mail.gmail.com>
Subject: Re: [PATCH 2/4] media: qcom: camss: sm8250: do not set VFE core clock
 rates from CSID
To: Atanas Filipov <atanas.filipov@oss.qualcomm.com>
Cc: "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>,
        Gjorgji Rosikopulos <gjorgji.rosikopulos@oss.qualcomm.com>,
        linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=Gt3XaU1C c=1 sm=1 tr=0 ts=6adb7f4a cx=c_pps
 a=4ztaESFFfuz8Af0l9swBwA==:117 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=u2ZE8GkQQ5s483KH7DcA:9
 a=QEXdDO2ut3YA:10 a=TPnrazJqx2CeVZ-ItzZ-:22
X-Proofpoint-GUID: nrnyNI8EYNeMQ4h5-wCQLMdZkDBQxU7a
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfX0DVkqe/WW91R
 6lqYZc/biHqPOgkzg/M7RD8ry7PHZygKxfsNumzi6n8++BcCCnFDKteYJ6sfIJXb4gZSDdoYFgl
 zzdI6i6gT1ok0cyz5wYA1vzkZiveSk1YpdhdtsX2T6i9MDWjHYelDXmntvQg+mqIpyOfSi7P8kW
 nd67+6MSAUAuMTDxtvqBrsYlc1jenzEUweb+bhAFHClubkB1G89a0uvTf8EB21JFapkWSBA5ux3
 LG7fL2e7Mllau1AnRYc9PR3cZrCgR+rHKlOXi0qIOCCJrJxlkrcWArg26vOf/4gSnjfo0v2lcD7
 NhP1bXPeF3yRkhdMtXaDj4TSlF5bKDAcdlNMiOKAOr1SV8MLfaSdT14TaufAkUzHAq8L0+uoXfv
 erK2fh78GLhAOw6oZd+qwlewVY8WdNbcsN7msk8Jr+CZWOwMEHMu63ezdvpxKX9KxzBFto45+T+
 fu/SE6fTqbbAMKUuY9w==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA2MSBTYWx0ZWRfXzUjrDxd+Bilu
 MOJF3G8I+qS4dzuQ5dBWiequ1EsSGyTFhIBIHnYoNKYnwJXrMkh+2/T3H9jTED6BCyQMHMFIUne
 9as5VKXb/kfjyJh/DJwF2tQ7EXsgRGg=
X-Proofpoint-ORIG-GUID: nrnyNI8EYNeMQ4h5-wCQLMdZkDBQxU7a
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_04,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0 adultscore=0
 clxscore=1015 priorityscore=1501 impostorscore=0 phishscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610230061

On Fri, Oct 23, 2026 at 5:29=E2=80=AFPM Atanas Filipov
<atanas.filipov@oss.qualcomm.com> wrote:
>
> The SM8250 CSID resources list clock levels for the VFE core clocks and
> for the shared VFE Lite core clock. CSID power on runs after the VFE is
> powered on and sets these clocks to their lowest level, overriding the
> rate selected by the VFE from the pixel rate and lowering the shared
> VFE Lite clock under a running VFE Lite.
>
> The VFE core clocks are set by the VFE. Drop their levels from the CSID
> resources so that CSID only enables them.
>
> Signed-off-by: Atanas Filipov <atanas.filipov@oss.qualcomm.com>

Reviewed-by: Loic Poulain <loic.poulain@oss.qualcomm.com>

> ---
>  drivers/media/platform/qcom/camss/camss.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/media/platform/qcom/camss/camss.c b/drivers/media/pl=
atform/qcom/camss/camss.c
> index c54185c93a8a..7fe12049b78a 100644
> --- a/drivers/media/platform/qcom/camss/camss.c
> +++ b/drivers/media/platform/qcom/camss/camss.c
> @@ -2052,7 +2052,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe0_csid", "vfe0_cphy_rx", "vfe0", "vfe0_a=
reg", "vfe0_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid0" },
> @@ -2069,7 +2069,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe1_csid", "vfe1_cphy_rx", "vfe1", "vfe1_a=
reg", "vfe1_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 350000000, 475000000, 576000000, 720000=
000 },
> +                               { 0 },
>                                 { 100000000, 200000000, 300000000, 400000=
000 },
>                                 { 0 } },
>                 .reg =3D { "csid1" },
> @@ -2086,7 +2086,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid2" },
>                 .interrupt =3D { "csid2" },
> @@ -2103,7 +2103,7 @@ static const struct camss_subdev_resources csid_res=
_8250[] =3D {
>                 .clock =3D { "vfe_lite_csid", "vfe_lite_cphy_rx", "vfe_li=
te",  "vfe_lite_ahb" },
>                 .clock_rate =3D { { 400000000 },
>                                 { 400000000 },
> -                               { 400000000, 480000000 },
> +                               { 0 },
>                                 { 0 } },
>                 .reg =3D { "csid3" },
>                 .interrupt =3D { "csid3" },
> --
> 2.34.1
>
