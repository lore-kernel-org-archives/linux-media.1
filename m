Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795516046;
	b=BDA9UMl/XGzgG/2pT0TGXstAWP6VIgWWh/T5b2yA0xnkPI4X7HUA+m5UETUAUBpmz9Hv
	 puFs788TmSXb0+0k6oTZTyP6AkJhl1nJPvkNlbDjot90eriC3VCbCFgqOg404rKNwhKEK
	 ariXlypPy17+6/uOeGwRifFj0Ar49Jt4c9VZ5y8mf/o1+m+ntkGSvZKojettC4IJsiBLl
	 6cRq96S0D91F1XvlDh38YYgX9Sp8s8Wu5U59LKvQ993fvmhD2YAu6VWStITSYSXtb2/xx
	 eDKwEeaIm7qKrAEFwewQsbWCQ8qhY5I3PqfnkRebmqP/QrVyfbkOWCk0++MP5ATmy2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516046;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-ZohoMailClient;
	bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=;
	b=0r296QIYyzrJN07yACv5naTLb6o2GSHcCCbgagodYMHzKv1cKX6vzRyhLJJGruFlqPvo
	 rCr69hv0+j+Rzp9ckXY6S5wxzv3OgDdI4P3cXbQDK+rXf3XGa8j4swV61XivA8rwz78xH
	 tOqzdDt9/LiHPLPxWGwzsozTHwwnz9pNqr5sCgE8QessUfVay6XS1tONEWqUIpUg9pOsE
	 qO1COIE8++94ov3lYUBGuOY3PircjslCqFOKYDcFO4BmPgUH8MLOQ1KQFDgqSLFPiobBp
	 t0rmxIiz3SQoyK1kS5KfSsEA7/Sh4oOlbDScWPZ+sff5f1zK1czJS30OvxbCr/Vy6cg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IyJGpSNW;
	arc=pass header.oldest-pass=0 smtp.remote-ip=165.173.182.112
Received: from sender5-pp-f112.zoho.com (sender5-pp-f112.zoho.com [165.173.182.112])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84946606A31E;
	Tue, 24 Nov 2026 10:27:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84946606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=IyJGpSNW
ARC-Seal: i=1; a=rsa-sha256; t=1795516019; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=LfGiEdx8OjnCNigbjAA6/zn9RrTArJj2FDRUGgWVO5SPcAiahJmVxLsT627D3JaA8Igbqlk1yUjNWE7FultU3Bvjuzb7lmQFjH8Bltsder65QyePUvW12kIwQ2gD1J7Pm48uyCA6+GZGsGYkMcPrpWoVFDd0ThBLB7EqbRVig3A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1795516019; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=; 
	b=hPUujiE2ZP/ar4Z+UH5dqbDAOlu/PhBGp4xXAHQrjoOBPy0SqOKalskGYGBEDYLsnNLScobmFoTbeo1JD79xvbDAopeATWwr6kp+lgmkpB1lpo0xT+4lVe0wGqPJpDgkcgxjvN7idRhNZj7JKbfRXEYW6FhUTRxndJMcaQgIrzY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: a=rsa-sha256; b=IyJGpSNWB3Iy/ksv11xA0oHwGVyuEQzfVI+XPmi/aAJVMDKWAB3iuYQoMCoSwuI+OLtzXFjzqdUyIVoOUcKK8Ty899HJoO+qLXSiJ3Vusk85kW5XO6Xrtp9piULRsfRNBmr0mlJSrkVMRm7FRDOK/PvBotijXBWkz1DcEKOVRPo=; c=relaxed/relaxed; s=zohomail; d=collabora.com; v=1; bh=4A9LDC1Pxq66xRXpAnFLlD4joyJvsEB7ommipyTBSAU=; h=Content-Description:Content-ID:Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:List-Subscribe:List-Post:List-Owner:List-Id:List-Archive:List-Help:List-Unsubscribe:MIME-Version:Message-ID:Resent-Sender:Resent-Cc:Resent-Date:Resent-To:Reply-To:Resent-Message-ID:Resent-From:Sender:Subject:To:Date:From:Message-Id:Reply-To:Subject:To:Cc;
Received: by smtp.zohomail.com with SMTPS id 1795515987257765.0607790829777;
	Tue, 24 Nov 2026 02:26:27 -0800 (PST)
Message-ID: <35884259-b669-46ed-a9e9-59cbfab926e1@collabora.com>
Date: Tue, 24 Nov 2026 11:26:23 +0100
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
Subject: Re: [PATCH v2 1/2] media: rockchip: rkcif: Filter enumerated formats
 by media bus code
To: Faizel K B <faizel.kb@gmail.com>,
 Mehdi Djait <mehdi.djait@linux.intel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, libcamera-devel@lists.libcamera.org,
 Robert Mader <robert.mader@collabora.com>
References: <20261118203134.315591-1-faizel.kb@gmail.com>
 <20261118203134.315591-2-faizel.kb@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261118203134.315591-2-faizel.kb@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External

Hi Faizel,

Thanks for your patch.

On 11/18/26 21:31, Faizel K B wrote:
> VIDIOC_ENUM_FMT ignores the mbus_code field and returns all formats,
> although the video devices set V4L2_CAP_IO_MC. Return only the formats
> that match the requested media bus code. The DVP output formats have no
> media bus code, so they are still all returned.
> 
> Otherwise userspace can pick a pixel format that doesn't match the
> media bus format, and then interprets the captured data in the wrong
> format.
> 
> Signed-off-by: Faizel K B <faizel.kb@gmail.com>

Reviewed-by: Michael Riesch <michael.riesch@collabora.com>

Best regards,
Michael

> ---
>  .../platform/rockchip/rkcif/rkcif-stream.c     | 18 ++++++++++++++----
>  1 file changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> index 3130d420ad55..b117ba57bc75 100644
> --- a/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> +++ b/drivers/media/platform/rockchip/rkcif/rkcif-stream.c
> @@ -395,13 +395,23 @@ static int rkcif_stream_enum_formats(struct file *file, void *priv,
>  				     struct v4l2_fmtdesc *f)
>  {
>  	struct rkcif_stream *stream = video_drvdata(file);
> +	const struct rkcif_output_fmt *fmt;
> +	unsigned int i, n = 0;
>  
> -	if (f->index >= stream->out_fmts_num)
> -		return -EINVAL;
> +	for (i = 0; i < stream->out_fmts_num; i++) {
> +		fmt = &stream->out_fmts[i];
>  
> -	f->pixelformat = stream->out_fmts[f->index].fourcc;
> +		if (f->mbus_code && fmt->mbus_code &&
> +		    fmt->mbus_code != f->mbus_code)
> +			continue;
>  
> -	return 0;
> +		if (n++ == f->index) {
> +			f->pixelformat = fmt->fourcc;
> +			return 0;
> +		}
> +	}
> +
> +	return -EINVAL;
>  }
>  
>  static int rkcif_stream_enum_framesizes(struct file *file, void *fh,

