Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793975839;
	b=U7TNxv5yS4UMEyOfHnQEH5dmFWX1NTvVxf4ur7xoHdyOAG/t2/Q59b3rB71f+d+yEaER
	 L3IagKgt1zWktaMBYIaqQXvVQTeCxCTZqkaDkDdDF/NbvUGA88hZIXaXDMgPW5jkh7AZd
	 pswfSf9hJp8CRTjYRRTwp5/M8yoTsLt2eH5D8nM5PHBy9ycXX9N/mtf+beHJ+BZj4AoQZ
	 aZQc58MnsEAk915ZimPZLuKo1zsmAeIrj5DA07xiAlCIVN2DdSoZKx4xiRPhJUbZVIZEQ
	 pZRJ/XGhl6gy2y0Uarg3oWaZg72XKVQ0DPepNyu23jmRRp/4sOJ9zUCM4lbZrMZ2jFQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793975839;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:Reply-To:From:Date:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
	b=Hbx+sV6hPKrusA81bgSLkfQV5Umuix4wup8tJLeSN0t08QJ88iaD7fKseGtQ2TYmMPvz
	 5lORH6JTy6yrr1WvaCNZLzC7LZMVkmolcAQnPahZGz/L9bpIsnVkeowLzmPMDwWb/l7tj
	 SO1xveoLY2ftJog7T7YohDDJ0tcRiqBi/Sy4xroiFcsBQ5NeoNqGLcFWzoz2ZtyaT5TyP
	 3e+ar/hbYm3qeYscn9uqvFSPQPsKx2zTYcy0rmehCCqbWLc7HgGru+0Y6uxNQdABiRaXV
	 Sg6uidgjSgMYFZUDrJdo11Gke6Bu3kVxD0Y2QKRGhEX/m9gZUJTkv+AsGBHSg8FPqiA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1CEE606A331
	for <linux-media@vger.kernel.org>; Fri,  6 Nov 2026 14:37:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E1CEE606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oDzUxncx;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UVifpZnG
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A6EQ8Kf3647784
	for <linux-media@vger.kernel.org>; Fri, 6 Nov 2026 14:37:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:reply-to:subject:to; s=
	qcppdkim1; bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=; b=oD
	zUxncxZqM9j4vcCOndXBF3iIc4/WR1NvKSLy+dBwaYOm4erSCtt7mQL+KFrwYI3z
	70bIWvfQbCccOyYxOcCoKpXLXqaVtbZ8+XgQBGNdyrGdw1450R4r7383q+QOGIR0
	kzNMuT7bcO7muQGmD59w4tTETIoglXoIE98yc4zvFoWh7vohmFc9NGopOXqNOAyA
	XHpkS/ORTc4ycLhJDjiatf4u19cSTI41hyx+6UzGHCreR0moT69Gfqp2yFA2JJuO
	kjGt/kQGHbViURKEabcJ8k8BA6JOzdNjtQ6ZkaD82H6uwGWijD/hVFqq5m6FSZMr
	0whNfEAoKReAM0Fjhgmg==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3p9k4gx-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 14:37:17 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1383723dfddso1241759c88.0
        for <linux-media@vger.kernel.org>; Fri, 06 Nov 2026 06:37:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793975836; cv=none;
        d=google.com; s=arc-20260327;
        b=WYSusNGn4Bl2+nT2OUHUNQWMDuciMSLA7hIuRNZSii0h7nCvvC/yczLAlKhI0O1L6t
         ayFrIu6slpGb8Brg9GHx65zjMGuaRvPJdeBvl7t4uq/3bmnD3MsIFwR3u5x4EcYO5BxG
         pDZhnqpNN1T6Vy01/yTkI3giFRm0pKzjkxqzw8XxVN5I4YFqL4ZHvxpFvH2UDfJwWjBE
         24Xosyj/kDVBo57m2jVT6Wsjs9y4FDpC60WLXEC/TW7xjtV9rdDTt55L+HqUrn/8wIvN
         RQrpkUUQpiHsFUSFBRnkraIEha/+TN5gRtFmUzZCC4pP38IAINy/YM5vPHD0ThenYVYr
         0wyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:dkim-signature;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        fh=n4cyNgtFuefL/yC1IgqqKHPL6uL5xCC/sA15jMbj1rE=;
        b=iJG8BG2THoSGV8BFokEWcP2HzGwQhZQPRMHJa35Ql6ie2PwfqRdHNbi3hUBGCfPT6s
         hnU2K5O9qqhxCXkco2rQu2pvOahBS402d9wkzHypiPGSPwK9rpgf6G70P/I1J+fy410y
         t24Wd82W32u+YVwzohNY43YI+nxvboai+yuwSjmHI9hOqt+8vgMiYPJYGH4LvnRIv0wH
         gTTTuk96/qsdP3RBRqODWt3dAoxDgSJWbWmXXR9BzTfRPJmoGst3W+2+bhrtw769Rn55
         qkrHSjMsNEoJiO2pRxRvmTN355TFtd/Mm9lI0rzNmMRlMSLNxHpPzStS9QyqApc41nIc
         syrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793975836; x=1794580636; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=UVifpZnGmtn+CUp3hm9K6takq0A13pq7TaZGNjGIJgThvdw0/HdTqjYTGPtnrJi6wk
         tsSCHn5IiHqqsTSoMy+GQA/5nn7eYjdwKoVDBOfwIJRgE238v+cZwfvSlzILthvBJIK1
         v++sNmehgSf4nEsCqnwn3zv/+F/E0lYA3+NLV5z0tFv0hRyrVgskA/K+w9jyLY4o2Zkg
         1h4YGMxBOMhdWHDW9Zvc0w1xwzY/e/OPpiWGx6X+YQGtB45vtinfrRjvIWN79gQ2ARaw
         P4BFWgbgUFLsGC2l1Ys++QSI30aLcYBZ7VBnBp4VG64/Y2z0+HqocJJpuJM+/sVFDYNH
         A0+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793975836; x=1794580636;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:reply-to:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4HsyqapsxgGb3uQ6wsN6jzCK5d5H1eQhRuyR+l3gVi8=;
        b=i9XMl8Zm1GT+AdieeLaEl63Gej03VC29ehPTXgbvqH+7pZSKT0bjs+nKfWABO1uv85
         81H0vyY5GmVG/BfOO+hPcDMRp798wSzBXiLyxzRzrvXdBv7NHe78xbydjdUM+sjTRPOt
         CAPc2p/goM8E6o3FnkuT99ibtJA6uzqK3ZqvHAEWp9xl90Bb45PmH1NfEPBVZ//bTmde
         HFv5z4B696wTblRDTKHrUXm/JTPfc3XPn9jbMO5hiqlrOHft3j7fFX9IYMSeBWSSQshS
         fBGPC4QsppwA7IPbO2WKt/5mOT4Ca3CfC4YpHUsLJzVghcP37O8fctteRLt0x6Ps/fXq
         bNUA==
X-Forwarded-Encrypted: i=1; AKwUvBxE7QFx7F1jwiAC2AyOiToJZn6sg9266DIRgGI3/2iEWCYaJEUOiHekphsNCDARqxYRfa6mV9MRi37fDQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z/xjWZyCeRrvBvObO/lWYG+r61yet2Im7dLGEIgg1gd0KOSORMa
	z13wcvpxdpmURZ0E1aFK+AcPQz7Q6t9IAWZGPbEID3d0l7Xd1Lfy4HDe3225PRsQ7F/7Tk1Wft+
	0OlaJjpyAPIQZZLEAtzdPO4z0ZNEjUHky+Oureb2cMbZRRl4hnvUpKuBtpnxLeMQQMQwyENnpcV
	kceUlUWmaoY11L54YwhGgF6ywT/EvlzzaXvuywbEGo
X-Gm-Gg: AYBFou2sT+2HddmwkhapojFJLT4X6uEGZIqPDUlBHDiFXVPhLM86aS3EDOoz6jbtKaU
	0SwjwTwERiWwRUFk92nhe9ZH5HFMA9AR4Vp42nGoAE5Ihb+Ps+gv95ulZGrGfp9RtdPQLoDEvw2
	NN61m5Br4Jk668R55RM/iOtio1jPdZgwevMmucb1oU/VCh736tDIDAVGS/lHcH9kYAM5/WMqmQ3
	7fn+9PeC2AOmH2Mi79ERA==
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id a92af1059eb24-1b25d31e166mr2771662c88.28.1793975836146;
        Fri, 06 Nov 2026 06:37:16 -0800 (PST)
X-Received: by 2002:a05:7022:1201:b0:144:fb42:52 with SMTP id
 a92af1059eb24-1b25d31e166mr2771610c88.28.1793975835251; Fri, 06 Nov 2026
 06:37:15 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261106-ubwc-format-docs-v2-0-82949f88f030@oss.qualcomm.com> <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
In-Reply-To: <20261106-ubwc-format-docs-v2-2-82949f88f030@oss.qualcomm.com>
Reply-To: rob.clark@oss.qualcomm.com
From: Rob Clark <rob.clark@oss.qualcomm.com>
Date: Fri, 6 Nov 2026 06:37:03 -0800
X-Gm-Features: AclHuK-nYIdYytSxiDZGvmJ75_P0qcwPygnczJxVB0uKsMZiJo7oTk6OLzODjmg
Message-ID: <CACSVV01xGvudO4yjFeWzp8zk6wtOaHsEj=sJ=0E_7=wvKfhcdA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm: separate compressed P010 and P030 (TP10)
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Dmitry Baryshkov <lumag@kernel.org>,
        Abhinav Kumar <abhinav.kumar@linux.dev>,
        Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
        Marijn Suijten <marijn.suijten@somainline.org>,
        David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        "Bryan O'Donoghue" <bod@kernel.org>, linux-arm-msm@vger.kernel.org,
        dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Jordan Crouse <jordan@cosmicpenguin.net>,
        linux-media@vger.kernel.org,
        Nicolas Dufresne <nicolas.dufresne@collabora.com>,
        Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
        Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
        Robert Mader <robert.mader@collabora.com>,
        Neil Armstrong <neil.armstrong@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-ORIG-GUID: RbUOi7FybVkzIDr9xVohWMw6QnPW7WBj
X-Proofpoint-GUID: RbUOi7FybVkzIDr9xVohWMw6QnPW7WBj
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX4/5lVfTi4P5V
 MyQk8xsVFnpoacRtp8w6hc5a8Rm+ZINBK6H3iMAV8bFyKIxBhWAeS0sh1KM2Z9/tEd6FhLiRNRQ
 5pZ53b4ka/3CzDkMkfCwVxOlv8IMvJY=
X-Authority-Analysis: v=2.4 cv=XvNvqlF9 c=1 sm=1 tr=0 ts=6aede61d cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8 a=PWnpOtEoW80h80myw98A:9
 a=QEXdDO2ut3YA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDA1OCBTYWx0ZWRfX1ewUXHxeZJ2k
 mzX3yd97qF/z4YzV2xqN6BKHIM7rG/Jb01QneBN6yqxjmYdSexz1zxHVvSh/zI2WDCAApfZWAti
 ouuq3U4B/OgQ5VTEbi/NJPm85Yq59A7PTtr6k9VHO0TadvTBXqBQt9d6wmkMbc/z4pQtghzhBqs
 idyt9Y2e8uGvF01fEXyvfK/o/9y4iRzpCxqJRloKubYFTBHjYax3yhrMN5ng42p3omega1rJDGw
 76g8xQnMjxitryP7dBeg37vke8fUzm/UVrv2tXUuqRKox9OIpCbbxocAZ/QYFyzCgpngE2M3aQ4
 RhfocS5ZDBDaW9ZL6Qfjqb1lWIm6CAKQp21bM+9GkQjfZf+h/ZE3KRWOai3GgsSevRSSfvhhxkC
 n6KENR181AQ8QuRyzFXqv/T4iGDQR25CVCg9usxmQVQVEQ7Hutcexb+yVF88jRDyu5171X6su6U
 73EJcGJtJGxTeMWBWTw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_04,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 adultscore=0 malwarescore=0 impostorscore=0
 phishscore=0 spamscore=0 lowpriorityscore=0 bulkscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611060058

On Fri, Nov 6, 2026 at 5:44=E2=80=AFAM Dmitry Baryshkov
<dmitry.baryshkov@oss.qualcomm.com> wrote:
>
> The UBWC entry for DRM_FORMAT_P010 is set up for P030 (TP10), three
> 10-bit samples in each 32-bit word, the layout the video decoders
> produce for QC10C. It doesn't match P010: compressed P010, as the GPU
> writes it, keeps 16-bit samples and is scanned out as garbage.
>
> Use DRM_FORMAT_P030 for that entry, compressed only, as the SSPP can't
> fetch linear P030, and give P010 its own UBWC entry with 16-bit samples.
>
> This changes what compressed P010 means. Nothing is known to depend on
> the old meaning: Mesa and minigbm never allocate it, the vendor stack
> uses its own modifier bits, and the only user found is a draft
> GStreamer merge request.
>
> Fixes: f07c9946cc1a ("drm/msm/dpu: Add support for P010 format")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Reviewed-by: Rob Clark <rob.clark@oss.qualcomm.com>

This one, in particular, we should pick for -fixes

BR,
-R

> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c |  1 +
>  drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c      |  4 +++-
>  drivers/gpu/drm/msm/disp/mdp_format.c          | 13 +++++++++----
>  3 files changed, 13 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu=
/drm/msm/disp/dpu1/dpu_hw_catalog.c
> index 107150a8553f..f755c0d57abe 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
> @@ -173,6 +173,7 @@ static const uint32_t plane_formats_yuv[] =3D {
>         DRM_FORMAT_BGRX4444,
>
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_NV21,
>         DRM_FORMAT_NV16,
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/=
msm/disp/dpu1/dpu_plane.c
> index 1a471cdf767b..09146023d13e 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
> @@ -68,6 +68,7 @@ static const uint32_t qcom_compressed_supported_formats=
[] =3D {
>
>         DRM_FORMAT_NV12,
>         DRM_FORMAT_P010,
> +       DRM_FORMAT_P030,
>  };
>
>  /*
> @@ -1779,8 +1780,9 @@ static bool dpu_plane_format_mod_supported(struct d=
rm_plane *plane,
>         struct dpu_kms *dpu_kms =3D _dpu_plane_get_kms(plane);
>         bool has_no_ubwc =3D (dpu_kms->mdss->ubwc_enc_version =3D=3D 0);
>
> +       /* the SSPP can only fetch P030 compressed */
>         if (modifier =3D=3D DRM_FORMAT_MOD_LINEAR)
> -               return true;
> +               return format !=3D DRM_FORMAT_P030;
>
>         if (modifier =3D=3D DRM_FORMAT_MOD_QCOM_COMPRESSED && !has_no_ubw=
c)
>                 return dpu_find_format(format, qcom_compressed_supported_=
formats,
> diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/=
disp/mdp_format.c
> index 33da569eae5e..2712a73e5783 100644
> --- a/drivers/gpu/drm/msm/disp/mdp_format.c
> +++ b/drivers/gpu/drm/msm/disp/mdp_format.c
> @@ -298,8 +298,7 @@ static struct csc_cfg csc_convert[CSC_MAX] =3D {
>         .unpack_count =3D 2,                                             =
   \
>         .bpp =3D 2,                                                      =
   \
>         .fetch_mode =3D MDP_FETCH_UBWC,                                  =
   \
> -       .flags =3D MSM_FORMAT_FLAG_UNPACK_TIGHT |                        =
   \
> -                MSM_FORMAT_FLAG_YUV |                                   =
 \
> +       .flags =3D MSM_FORMAT_FLAG_YUV |                                 =
   \
>                  MSM_FORMAT_FLAG_COMPRESSED | flg,                       =
 \
>         .num_planes =3D 4,                                               =
   \
>         .tile_height =3D th                                              =
   \
> @@ -606,13 +605,19 @@ static const struct msm_format mdp_formats_ubwc[] =
=3D {
>         PSEUDO_YUV_FMT_TILED(NV12,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, 0,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT,
>                 MDP_TILE_HEIGHT_NV12),
>
> +       PSEUDO_YUV_FMT_TILED(P030,
> +               BPC8, BPC8, BPC8,
> +               C1_B_Cb, C2_R_Cr,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_TIGHT | MSM_FORMAT_FLA=
G_DX,
> +               MDP_TILE_HEIGHT_UBWC),
> +
>         PSEUDO_YUV_FMT_TILED(P010,
>                 BPC8, BPC8, BPC8,
>                 C1_B_Cb, C2_R_Cr,
> -               CHROMA_420, MSM_FORMAT_FLAG_DX,
> +               CHROMA_420, MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | MSM_FORMAT=
_FLAG_DX,
>                 MDP_TILE_HEIGHT_UBWC),
>  };
>
>
> --
> 2.47.3
>
