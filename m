Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795339095;
	b=LlMWycrYObcrZ9qkcUoY8fu/hKyoRE1UJqLMqNfrq8coeoBlVIreRuMgtZRkFxVdNI8w
	 3qHpBk1s77pl1DMoV61vI3iTy1GA+VTSY6WYw9HXFscchTnmUMbNELn/01JyRmzB48kdH
	 1KrPezjQhtehrnjSH1qemialEbBHo57MWYnLB2+Jf9MgOtxVWC9vEmNkEh3xVL31S92Fx
	 uxHSXbe2s1SXv1aVrL+eqYkdxSQOTMMgVRinDXY8xyP06/vGd54KKEka/KmrB69v1ym1q
	 /yzWKmriKoamgvOSiresBInBgCQCdyjBNPxk9FUA96SqYrfcS8qpbDBeAOPgLVmpMwQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795339095;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=5vyzSQTAensFh/VrNzVCAaqEVT8NgwOlMltWFziQiFc=;
	b=4SnZLQYAefwfRknOLuprH1CYdOG0D0GqKZXAAsOqQMrLwEJs369E0zlOatwwob+TL3m6
	 MZqAmAY+Yj6WZTVzEHSjUvZkmVF63/wAt0mb3mZyFu1nMB3IAbbflYyEom9NYoTXhKyWY
	 ghOPC0I74v5ICGI/m1AVsKYi6TRtqBMyUow/fSldb/sobmnbTL/mJ3mggNxBMkAy40x3I
	 BizmlsxqEO2KQg1QPrAr950Y4o2zMhZ4W4rgktJE3ttjhuSRWDiE01u1Ta4cVOXMxGerY
	 26r+Z0cPIvOycX1qvzEeusPaD/Vod0w+DFLXY8DjnHPlRTi76s+Pwym7cCX4YFs4YkQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJihFuuP;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.49
Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBFD606A32A
	for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 09:18:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ABBFD606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RJihFuuP
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5c0ea47f5b8so238573e87.3
        for <linux-media@vger.kernel.org>; Sun, 22 Nov 2026 01:18:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795339093; cv=none;
        d=google.com; s=arc-20260327;
        b=leoSigUGqKhLPlvNi1sCbfhQyHiMLYNkPYXc2ZzGJYN0IvqR79Xo12ipjGXbaWYmhr
         udldzrHki+oCW8HlO4Pqfw2AotrYyl4ojFDtiYYUld6QR2r7nOyvea72AR5hWJV0azm5
         FVpuQyo/s9WwhzFnqj7C64bNa2fnF2w2x3Qt2AXtexRwI07R0aBhnCeLtrzBPsmccAdv
         Z6lzzNSMfxbsLtqqEUiQfGbRJvXlv/alAh39xB1NdY7+FnV5fQMKicXYU5Vlq8JqcTDP
         7RdatMICNO/u1/txLIgz44zAb3tOIss2xGlTAIjkknIw/zL4PuiyDWkvEIfMamPLYQDo
         agpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5vyzSQTAensFh/VrNzVCAaqEVT8NgwOlMltWFziQiFc=;
        fh=EsR3aYgwoI5gVNjZ+I3oMGn2uTBG5NQ7Q5crvnTUt+g=;
        b=LKCZbYfMVclmXq4WOZIGrpwCOBUleyBCiCkc683bXTwEOUsrMW6WL9PkW1Ixkk1GLp
         +bSS0cZhT/JwBAACwYhx0kZdRfOPc2Ig8Cfvg/+8OR4CVXEb/VorUUXopL0Z0xrQG1v9
         a31CkseS3UZAipB783hOcLYajAN5+XN2EfWF/haf2Th4vK1l3+ptKcfmZvLBPklaHxXU
         02LiLP3GmWSeup0vHBxAhE3p1SAhMEsvIhIUdYpXuTfpl8c6a5jjFsZIKkcjUFkBXw1H
         s+WONlbCHyyc/RHPbtZVOIUL+cgOBcZvCYgvkJB8uhi1mud8tteBlBfRtQxqGmDZkfVx
         bb0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795339093; x=1795943893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5vyzSQTAensFh/VrNzVCAaqEVT8NgwOlMltWFziQiFc=;
        b=RJihFuuP8ngIx7HTHR+vb+bjF0YOnWhHUUxN8CpiAh+ylynC1q8OtS4tYrXxKxhrth
         2IK460VqwQhfnTetSLOQF6exrpXMvUzyYR52xjxwGOyHipRmra6guvuRn63dwyv7e3SM
         orrr+KFQLrX4Dmyvikl4E/TaH/fg00VDPF0CiRnF+nTMkIRTvLixPsPlrwN6ZdsASrmm
         1lxeOhMuNwn0ZWM/e5f/5rUMGKiiis0T/KFViuVgbhWSDbRNoDU5Ehl/klFB17Y4xF6G
         PRn2A9wLx97l62CkrXXvFBbXdnvl9wgdOtszPcVgm4b1a7gWPbkg2Mvv/drSbV3GnwHi
         Cm6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795339093; x=1795943893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5vyzSQTAensFh/VrNzVCAaqEVT8NgwOlMltWFziQiFc=;
        b=VEAITPSJya5TqNfhaE/G1b21obj80kswmshBkFTY3Dl8H3c2Jxs+bLYYbtVz47KebU
         N1+xTE6pyNtQ4F2KOM8ZcC33zhN0E9cSS8JBlTdeYwpNLV+NYvX2G1vh/z2LhCpj7u9w
         fO6HCbZiHqTjgWnFoYBzW8s4+v4gDLOVYQkV/+SM4biMC412NmfowheFD8eLhVO1FA4G
         S5iz1JhqzAT5t1t8CicMMbtxATojCK3xHhqLYsPGrV2f1zMi7NxHZ0nlg1R0ApWlck46
         pBe4cmlUc0K8LtNum48XAgqFThoPhKuT+5t2F9S/yW81XgoB5JY5VTCkJyRYJl+llpYJ
         D+9Q==
X-Gm-Message-State: APuU4Z/w03lTLWfPlgpoBBhxP5/6gsU2Eb0ATnRv/7L6PA9ZY7KtzjkF
	F2AuoC5a3/EzSyT7sspIwsaTAtxygkwanh4+dU9eI0tEQBQL7OCrNuroVpLZgDtR+3oWigcwelA
	/uyThx9H/+Pb9fa80AKAyWTnHc/wEh4A=
X-Gm-Gg: AZFdTZdD8XmE8EIOLD+FK53VT3B4BUIbLeeSdiwyCLTcLwEqUEi5p0VdmToPM6bQuCd
	i7U2euGPIAsPIxnMHMlSi8FXiz0l8oHu0aYkA8kpkiYXOsRrmO+rPp9Qep5podmZ+LPewRv/+dX
	hOEfAcK+UTozqkJMpssK6gSilKXf0T6a5aa0vHTsdBVdpQ8go1wGFjkWhW4L0RuQIvq/LRlKjLG
	2YTgp2wqyL7tdYl4udHYWnV6uc8N4Uw9UDQecSfGe4frsI33Rn98N/UiO8LRA4cEOZGabLFij/l
	Tq9WiPcFVDDw+NEZmyDCzJyEbeN0E+YtfPE6N6PCuNSGhDQ7uqPJ/djKQ0dLhlzVa086f2kL1kq
	Y8hcbQsE2WVJJGtM/Paw9f71bzUPyEIO9rRkgzL0x93iWXPS0Tlq4o57vAXg0SmhMGhAi+RdOHc
	y0prXxI1vIg4R2RI39
X-Received: by 2002:a05:6512:1320:b0:5bf:cf6d:ef1 with SMTP id
 2adb3069b0e04-5c1bc5767fdmr2957504e87.0.1795339092647; Sun, 22 Nov 2026
 01:18:12 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119-v4l-utils-mpeg1-slice-v1-1-204ec6ef9166@gmail.com>
In-Reply-To: <20261119-v4l-utils-mpeg1-slice-v1-1-204ec6ef9166@gmail.com>
From: Arun Iyengar <aiyengar1990@gmail.com>
Date: Sun, 22 Nov 2026 01:18:00 -0800
X-Gm-Features: Aa3M54pHiveqn0SgwLgwsHnHcAe0hY8IEer6mWVU6JRjhQWmXn8yV3vr4ftOlBk
Message-ID: <CAEy9hNV1zA8_GbnM_LJVu_QFWNfoy-rcaUPg_W786CNpmO4FDA@mail.gmail.com>
Subject: Re: [PATCH RFC v4l-utils] v4l2-compliance: detect V4L2_PIX_FMT_MPEG1_SLICE
 decoders
To: Hans Verkuil <hverkuil@kernel.org>
Cc: linux-media@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Please drop this RFC: v2 of the kernel series has no new pixel format
and stock v4l2-compliance passes.
https://lore.kernel.org/r/20261121-b4-cedrus-mpeg1-v2-0-95e4decf03fa@gmail.=
com

On Thu, Nov 19, 2026 at 8:44=E2=80=AFAM Arun Iyengar via B4 Relay
<devnull+aiyengar1990.gmail.com@kernel.org> wrote:
>
> From: Arun Iyengar <aiyengar1990@gmail.com>
>
> determine_codec_mask() gives up on a compressed format it does not
> know, so a decoder that lists 'MG1S' is not tested as a stateless
> decoder and fails VIDIOC_(TRY_)DECODER_CMD.
>
> The format and flags are added to the headers and v4l2-pix-formats.h
> by hand; sync-with-kernel replaces them once the kernel series is in.
>
> Signed-off-by: Arun Iyengar <aiyengar1990@gmail.com>
> ---
> For the kernel RFC "media: stateless MPEG-1 decoding, cedrus support":
> https://lore.kernel.org/r/20261119-b4-cedrus-mpeg1-v1-0-aa5ba1192822@gmai=
l.com
>
> Tested with it on an Orange Pi Zero2 (cedrus): 49 of 49 tests pass.
> Developed with Claude (Anthropic) as a coding assistant; I reviewed and
> tested it.
> ---
>  include/linux/v4l2-controls.h             | 3 +++
>  include/linux/videodev2.h                 | 1 +
>  utils/common/v4l2-pix-formats.h           | 1 +
>  utils/v4l2-compliance/v4l2-compliance.cpp | 1 +
>  4 files changed, 6 insertions(+)
>
> diff --git a/include/linux/v4l2-controls.h b/include/linux/v4l2-controls.=
h
> index 80d0e12e..8108f0ea 100644
> --- a/include/linux/v4l2-controls.h
> +++ b/include/linux/v4l2-controls.h
> @@ -1986,6 +1986,7 @@ struct v4l2_ctrl_vp8_frame {
>  /* Stateless MPEG-2 controls */
>
>  #define V4L2_MPEG2_SEQ_FLAG_PROGRESSIVE        0x01
> +#define V4L2_MPEG2_SEQ_FLAG_MPEG1      0x02
>
>  #define V4L2_CID_STATELESS_MPEG2_SEQUENCE (V4L2_CID_CODEC_STATELESS_BASE=
+220)
>  /**
> @@ -2034,6 +2035,8 @@ struct v4l2_ctrl_mpeg2_sequence {
>  #define V4L2_MPEG2_PIC_FLAG_ALT_SCAN                   0x0020
>  #define V4L2_MPEG2_PIC_FLAG_REPEAT_FIRST               0x0040
>  #define V4L2_MPEG2_PIC_FLAG_PROGRESSIVE                        0x0080
> +#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_FORWARD           0x0100
> +#define V4L2_MPEG2_PIC_FLAG_FULL_PEL_BACKWARD          0x0200
>
>  #define V4L2_CID_STATELESS_MPEG2_PICTURE (V4L2_CID_CODEC_STATELESS_BASE+=
221)
>  /**
> diff --git a/include/linux/videodev2.h b/include/linux/videodev2.h
> index feb32668..d027e134 100644
> --- a/include/linux/videodev2.h
> +++ b/include/linux/videodev2.h
> @@ -734,6 +734,7 @@ struct v4l2_pix_format {
>  #define V4L2_PIX_FMT_MPEG1    v4l2_fourcc('M', 'P', 'G', '1') /* MPEG-1 =
ES     */
>  #define V4L2_PIX_FMT_MPEG2    v4l2_fourcc('M', 'P', 'G', '2') /* MPEG-2 =
ES     */
>  #define V4L2_PIX_FMT_MPEG2_SLICE v4l2_fourcc('M', 'G', '2', 'S') /* MPEG=
-2 parsed slice data */
> +#define V4L2_PIX_FMT_MPEG1_SLICE v4l2_fourcc('M', 'G', '1', 'S') /* MPEG=
-1 parsed slice data */
>  #define V4L2_PIX_FMT_MPEG4    v4l2_fourcc('M', 'P', 'G', '4') /* MPEG-4 =
part 2 ES */
>  #define V4L2_PIX_FMT_XVID     v4l2_fourcc('X', 'V', 'I', 'D') /* Xvid   =
        */
>  #define V4L2_PIX_FMT_VC1_ANNEX_G v4l2_fourcc('V', 'C', '1', 'G') /* SMPT=
E 421M Annex G compliant stream */
> diff --git a/utils/common/v4l2-pix-formats.h b/utils/common/v4l2-pix-form=
ats.h
> index efc31d73..e34c9ae1 100644
> --- a/utils/common/v4l2-pix-formats.h
> +++ b/utils/common/v4l2-pix-formats.h
> @@ -223,6 +223,7 @@
>         case V4L2_PIX_FMT_H263: return "H.263";
>         case V4L2_PIX_FMT_MPEG1: return "MPEG-1 ES";
>         case V4L2_PIX_FMT_MPEG2: return "MPEG-2 ES";
> +       case V4L2_PIX_FMT_MPEG1_SLICE: return "MPEG-1 Parsed Slice Data";
>         case V4L2_PIX_FMT_MPEG2_SLICE: return "MPEG-2 Parsed Slice Data";
>         case V4L2_PIX_FMT_MPEG4: return "MPEG-4 Part 2 ES";
>         case V4L2_PIX_FMT_XVID: return "Xvid";
> diff --git a/utils/v4l2-compliance/v4l2-compliance.cpp b/utils/v4l2-compl=
iance/v4l2-compliance.cpp
> index e9e84363..f31b7ed5 100644
> --- a/utils/v4l2-compliance/v4l2-compliance.cpp
> +++ b/utils/v4l2-compliance/v4l2-compliance.cpp
> @@ -604,6 +604,7 @@ static void determine_codec_mask(struct node &node)
>                         case V4L2_PIX_FMT_FWHT:
>                                 mask |=3D STATEFUL_DECODER;
>                                 break;
> +                       case V4L2_PIX_FMT_MPEG1_SLICE:
>                         case V4L2_PIX_FMT_MPEG2_SLICE:
>                         case V4L2_PIX_FMT_H264_SLICE:
>                         case V4L2_PIX_FMT_HEVC_SLICE:
>
> ---
> base-commit: d2e89246cefcb6371425361b12c4ca2a36a662d2
> change-id: 20261119-v4l-utils-mpeg1-slice-7b90f7304a8d
>
> Best regards,
> --
> Arun Iyengar <aiyengar1990@gmail.com>
>
>
