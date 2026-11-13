Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794583984;
	b=0oaS09Q30PteAj6YSplbgxBaF8g/pCNMc+SHtGnRKc9yusNJui4M4RdUgICH4L3nTfmK
	 sC7EIgYUIcCI9GT10Hp5dP2YYJcHTJetzRq7h6eaoxLj8JnuEM1D2BbTajEB58Cg0GXDZ
	 FiFrB1UrhpsSYEb+73nbaglZuxiNNvfrfW/TvKI/n6BJpTe3ee7BDcr5PlMF35yebyVzQ
	 cAVpoiRWNSG0NQ3sk98LZ8IIb6WGb4Xu//S9F3dRflxSDLxvdDqYX2/+gLKkkQDnxFimJ
	 pvu5aNcWAbaAFBU8nEdQigQ75/4y7H4aUVXBPfpL988P0Wmf1mNC+fEdUdf//T4ttMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794583984;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:From:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
	b=PzMtjlYr6wf+WKPxfIWdvc6M3EgAzvA8wSG86DF/VfcJxovJs44d79O/Fgu5LSXKeSTb
	 2IY7ZEx/WkQDIN7jp9afQK1J2dmsFeFKEOTfX/e4ZT94WvmceSVlvZpGfRBPgDwOnvQZ0
	 Wm27w/A1J3kLT0r8sjdH7RehZqsRuePJfKCTA7toOEXdvARpm1uQZuVPH/nFp34f0M6Ou
	 dt4Kx8yrdSb4JUocFXzBZGP5BaoWQ+LsTkOxgJ8eKAFOoJkLs0AuL4GVdy1bH1a6jb17N
	 XrcRRJZaLA7GjUw1FcUeUc+C6rTj7wiRk51tE3+KpfFkkxlxhc1gDVmxcwUlixwCfEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxafsgr9;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD8B0606A334
	for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 15:33:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD8B0606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=sxafsgr9
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4a208d93758so17385575e9.3
        for <linux-media@vger.kernel.org>; Fri, 13 Nov 2026 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794583982; x=1795188782; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
        b=sxafsgr9q4WtgV5gGf+FAMXBcr0gPNBz6e4/ZPt9ERGdyxnXLNQbiJkzQVPb9lAp1i
         JKzzXnYbIiA5nGEtvpcTVc1YvAIKP4SjTDd5DqDmgg+i9rC2p3MFO1Hw8P0HZ3EvCzFM
         w5hKtMfXa4xdj1X8btbQyM9qIcJfWEPcS3e8QeojL1AoOON61oyIE3HGrOhTvnYHZrs7
         KZxCN52Lsol1nJNEtLmkxpX8y2Sj++ro04MxVbmcyUSV0xYNjOOnrZ5/tXSURA9fR+Gs
         wPpS+J91oUCjdmfGIksePGdlfiBAl9E2nvYDp5YcFaN2qfhumzat9z/4V/NxnwIMncgc
         M4wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794583982; x=1795188782;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZczA9sgPjaI7i0jiqSjl5uIsFc87U1KMYtOFZr38zvc=;
        b=Dypy2M1NtuEM96G5+51MVEZ53DGsF9LbxH8QtwqChg6Svk1w2+xNKM6sU/sy9ywFkY
         snrormowaAc/vPHc0xfpQShlv3pByY8U60qGjGTvUPO/KFr7KZVYH8rUcGqhGzm8MZE4
         uoJkfMLpWIEHgGMh+8hhwjnQi2DQJQJBK8qyGem8JCYzemnoKY9/f/Kj/Cnpnox7d/ML
         ghSBDiFS2aP2dX1SZ3mpfCxTa/lP3oAHfKCCxRAi3fHXUytEnJv95iVAZf38itjJ5CX+
         wS0wC8RDMK2TYTCobh9p8v6+7yw9gxEKBU3KXGfElp2u3JGcr3bTuxcVk0hFuMXymfE2
         YB4A==
X-Gm-Message-State: APuU4Z+R4kCEOrV8vcu0iolFqB+YtlWm/jTfPsB4iLffURYOxtgeEzBf
	+d4cmYAY6YecG3nI6xf3RiuO8VwYzOwg5Bmms4mVDOH63XxTMANlJV3PsoglIBJDzw4=
X-Gm-Gg: AYBFou3B8vqcYYY06fXXjqZmWiM4rteRJSNrTyjwwqQo35ZZ4L3K+jDR4vlDwtXES5d
	bTnz05mz8mV17QHP38lje/U3O/Yo+nkC5L2+23wERAU6w8Hu5z5VbSLlgwn30mISfGYL2QuFtKN
	wjZvJKT/WEfOLIixDPMIDA0dV7Gg0eBfuyOqTo+5BNYlbzoQoLTFochHW2ENtg8ciQASgLVL2X7
	UAJ+UyCSYOEqagNObbi2/oYGz+AmkE8BSgG80Oeu/g4sMj1E2RmTynYJQpjRUGOgYrXqw3LxgLV
	XshRJRoSv75k0v+1PPFWy52mU/m7jMXUo4DhvZCrQ5oKzTmwPwThyOt9HwfI4buXXnEZijZLQSl
	jLtxD/fjJMgQf/R23A0bpr0qLscl4inQ33nf6QgPzdhRmSL8PjDyCBPAfruCigPyGtpghkZQWJT
	+Uw6gznBx6ICPgCgztSntNx5kxImEp7aBqWGp9bAjyX8m1GkPR2FOcREaqjihBMEt2g62oTXgRd
	NBYS00A9d4RbQ2H/yMVUhymF+XELekM23rpJam/KDFyeKED0ixiR2k6Eszr0c3tneyMeRhTA89y
	me+HAcAH4WuIXAd4u5TopViU5qOn84u3Xhlpb2M=
X-Received: by 2002:a05:600c:8509:b0:4a6:4d6b:a840 with SMTP id 5b1f17b1804b1-4bb55ab74fdmr55626085e9.31.1794583982026;
        Fri, 13 Nov 2026 07:33:02 -0800 (PST)
Received: from [192.168.0.167] ([51.37.10.72])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5b4a3fcdsm33490835e9.0.2026.11.13.07.33.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2026 07:33:00 -0800 (PST)
Message-ID: <2392b6bf-d1af-4fba-84d2-e8e60b7dcecf@linaro.org>
Date: Fri, 13 Nov 2026 15:33:00 +0000
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] media: qcom: iris: venc: keep the crop rectangle in
 visible resolution space
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Wangao Wang <wangao.wang@oss.qualcomm.com>,
 Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: linux-media@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261112-iris-fixes-v1-0-22b759c3c285@oss.qualcomm.com>
 <20261112-iris-fixes-v1-1-22b759c3c285@oss.qualcomm.com>
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Content-Language: en-GB
In-Reply-To: <20261112-iris-fixes-v1-1-22b759c3c285@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/11/2026 16:15, Loic Poulain wrote:
> The encoder keeps two source resolutions. inst->fmt_src holds the padded
> buffer geometry handed to userspace, with width aligned to 128 and height
> to 32. enc_raw_width and enc_raw_height hold the visible resolution sent
> to the firmware as HFI_PROP_RAW_RESOLUTION.
> 
> inst->crop must use the visible resolution, because
> iris_hfi_gen2_set_crop_offsets() computes
> 
> 	bottom_offset = inst->enc_raw_height - inst->crop.height;
> 
> iris_venc_s_fmt_input() seeded inst->crop from the padded fmt_src instead,
> so any height that is not a multiple of 32 underflows. 

I think this explains the bug enough TBH.

<snip>For 1280x720,
> crop.height becomes 736 and bottom_offset becomes 0xfffffff0. The two
> offsets share one payload word, so the right offset is corrupted too.
> 
> iris_venc_s_fmt_output() compared the requested coded size against
> fmt_src, so a plain 1280x720 session looked like a 736 -> 720 downscale.
> Seed fmt_dst from the visible size. The encoder does not use fmt_dst for
> stride programming.
> 
> Seeding fmt_dst from the visible size also means the codec alignment has
> to be applied on every path and not only when scaling, so that the
> CAPTURE queue keeps reporting the coded size. For 1920x1080 that is 1088,
> and the firmware signals the visible 1080 with SPS frame cropping.
</snip>

> Report CROP_BOUNDS and CROP_DEFAULT from enc_raw_*, so the bounds match
> the real source frame.

> G_FMT is left as is. For contiguous NV12 pix_mp.height is the only way to
> report the vertical luma padding, and the hardware is programmed with
> scanline_y = ALIGN(h, 32).

>    v4l2-ctl -d /dev/video1 \
>        --set-fmt-video-out=width=1280,height=720,pixelformat=NV12 \
>        --get-selection-output=target=crop
> 
> Before:
> 
>    Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 736
> 
> After:
> 
>    Selection Video Output: crop, Left 0, Top 0, Width 1280, Height 720

Nice.

> Fixes: d9967fa37ca9 ("media: qcom: iris: Improve format alignment for encoder")
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---
>   drivers/media/platform/qcom/iris/iris_venc.c | 20 ++++++++++++--------
>   drivers/media/platform/qcom/iris/iris_vidc.c |  4 ++--
>   2 files changed, 14 insertions(+), 10 deletions(-)
> 
> diff --git a/drivers/media/platform/qcom/iris/iris_venc.c b/drivers/media/platform/qcom/iris/iris_venc.c
> index 2f2c56bf9122c73e10e86815b1aa5fad99b0fb42..b367367ac2ccf874a00606b8b1352fed37b37a57 100644
> --- a/drivers/media/platform/qcom/iris/iris_venc.c
> +++ b/drivers/media/platform/qcom/iris/iris_venc.c
> @@ -240,14 +240,18 @@ static int iris_venc_s_fmt_output(struct iris_inst *inst, struct v4l2_format *f)
>   	 * If output format size != input format size,
>   	 * it is considered a scaling case,
>   	 * and the scaled size needs to be saved.
> +	 * Compare against the visible source resolution.
>   	 */
> -	if (f->fmt.pix_mp.width != inst->fmt_src->fmt.pix_mp.width ||
> -	    f->fmt.pix_mp.height != inst->fmt_src->fmt.pix_mp.height) {
> +	if (f->fmt.pix_mp.width != inst->enc_raw_width ||
> +	    f->fmt.pix_mp.height != inst->enc_raw_height) {
>   		inst->enc_scale_width = f->fmt.pix_mp.width;
>   		inst->enc_scale_height = f->fmt.pix_mp.height;
> -		fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> -		fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
>   	}
> +
> +	/* The CAPTURE queue reports the coded size, in whole macroblocks. */
> +	fmt->fmt.pix_mp.width = ALIGN(f->fmt.pix_mp.width, codec_align);
> +	fmt->fmt.pix_mp.height = ALIGN(f->fmt.pix_mp.height, codec_align);
> +
>   	fmt->fmt.pix_mp.num_planes = 1;
>   	fmt->fmt.pix_mp.plane_fmt[0].bytesperline = 0;
>   	fmt->fmt.pix_mp.plane_fmt[0].sizeimage = iris_get_buffer_size(inst, BUF_OUTPUT);
> @@ -293,8 +297,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	fmt->fmt.pix_mp.quantization = f->fmt.pix_mp.quantization;
>   
>   	output_fmt = inst->fmt_dst;
> -	output_fmt->fmt.pix_mp.width = fmt->fmt.pix_mp.width;
> -	output_fmt->fmt.pix_mp.height = fmt->fmt.pix_mp.height;
> +	output_fmt->fmt.pix_mp.width = f->fmt.pix_mp.width;
> +	output_fmt->fmt.pix_mp.height = f->fmt.pix_mp.height;
>   	output_fmt->fmt.pix_mp.colorspace = fmt->fmt.pix_mp.colorspace;
>   	output_fmt->fmt.pix_mp.xfer_func = fmt->fmt.pix_mp.xfer_func;
>   	output_fmt->fmt.pix_mp.ycbcr_enc = fmt->fmt.pix_mp.ycbcr_enc;
> @@ -312,8 +316,8 @@ static int iris_venc_s_fmt_input(struct iris_inst *inst, struct v4l2_format *f)
>   	    f->fmt.pix_mp.height != inst->crop.height) {
>   		inst->crop.top = 0;
>   		inst->crop.left = 0;
> -		inst->crop.width = fmt->fmt.pix_mp.width;
> -		inst->crop.height = fmt->fmt.pix_mp.height;
> +		inst->crop.width = f->fmt.pix_mp.width;
> +		inst->crop.height = f->fmt.pix_mp.height;
>   
>   		iris_venc_s_fmt_output(inst, output_fmt);
>   	}
> diff --git a/drivers/media/platform/qcom/iris/iris_vidc.c b/drivers/media/platform/qcom/iris/iris_vidc.c
> index 05aab6e3005d5c3788f5dfe5857f2d6b782e7a83..e3eaec1b7c2e30c065d8419ac3278756f70a8a97 100644
> --- a/drivers/media/platform/qcom/iris/iris_vidc.c
> +++ b/drivers/media/platform/qcom/iris/iris_vidc.c
> @@ -522,8 +522,8 @@ static int iris_g_selection(struct file *filp, void *fh, struct v4l2_selection *
>   		switch (s->target) {
>   		case V4L2_SEL_TGT_CROP_BOUNDS:
>   		case V4L2_SEL_TGT_CROP_DEFAULT:
> -			s->r.width = inst->fmt_src->fmt.pix_mp.width;
> -			s->r.height = inst->fmt_src->fmt.pix_mp.height;
> +			s->r.width = inst->enc_raw_width;
> +			s->r.height = inst->enc_raw_height;
>   			break;
>   		case V4L2_SEL_TGT_CROP:
>   			s->r.width = inst->crop.width;
> 

Could crop and scaling go into separate patches ? Feels like it could be 
made more granular.

---
bod
