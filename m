Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793213552;
	b=tH9zR9SlZcQjpT5xoqqayDs9WybHaNtGAGc/TQtWiyjnvumxOEaVOXRr/WqsRT5HK9Zj
	 TxjriwJF8WCre8S+Kb4ZgTdDQIf3VH6GnWwuH8yL+wNQk7ud+/qUNK1dn47J+rAtwDV7y
	 hsVwtdjR3v+feZxS2IMhaBK1W/rkccOnXCFGoVhFkVNOcnJiUkfydK4VVuTbWzor0Yjci
	 fxvJIHK4hw5/72B89PsgbHqyzBKs2t62KrTguIud4IkCljGcJ3QiGvLWxuUYUMQFyL2Ty
	 72it13XTmkOwQDlMjhuF3fzQdQtMNU+BtJIzY72H7f+H58LC1uyIAMQRtk6Nhy3FxKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793213552;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=0BEsHb9r/ZqDzu9FPC1kBx0oe94gE6mCVbWLiXY+XYs=;
	b=Nnb4DHztS62Lu41TyIbH2uuUYANPEdj2Pv/T0NMkrKr+DWguV34Vi7Yao3hpjkwH1DbN
	 kvPxfVEiO0JXJVneIATsR5ZZp40HZPgXu2rkJcplaiA+KIifEkQA+RqAVLWgWmwhCN8Vd
	 zynA0o800UIJKLHPN9KHKdmA6+6p1TlApJ/VjYIWPDj0NDt7FEN/nnuG/1/Z25E+MqzEo
	 lPVW+th/yvnTj6fdjNWH35DQ4Vj6AG2U1Yjsq578VBCUOJH6BfjwHuc5UVTv5Wl/dcOQd
	 yzv9lUDx/GaHnhx6rx1M4UDzBa2V+oAhr2DRC02iA4/c3uzOCer3fmCyNHAeGIn3p5g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kerneltoast.com;
	spf=pass smtp.mailfrom=kerneltoast.com;
	dkim=pass header.d=kerneltoast.com header.i=@kerneltoast.com header.a=rsa-sha256 header.s=google header.b=Lu+FtGbL;
	arc=none smtp.remote-ip=74.125.224.45
Received: from mail-yx1-f45.google.com (mail-yx1-f45.google.com [74.125.224.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97EA606A31C
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 18:52:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E97EA606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kerneltoast.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kerneltoast.com header.i=@kerneltoast.com header.a=rsa-sha256 header.s=google header.b=Lu+FtGbL
Received: by mail-yx1-f45.google.com with SMTP id 956f58d0204a3-679334baa1fso1714050d50.2
        for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 11:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=kerneltoast.com; s=google; t=1793213550; x=1793818350; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0BEsHb9r/ZqDzu9FPC1kBx0oe94gE6mCVbWLiXY+XYs=;
        b=Lu+FtGbLOGkDFrmG4LD06Eq2dbLYRKTP3mSbPtrWUrAaexIpL6XN0j7NR348Hb/q32
         JvT86Lv4PZ5WHRy0RAtvCwdA+yDG9sU675DOv9Mb/mC2OZf8iIl+Hih+bzI/mjoLghDb
         9DignMrctd+QcfrOLFl/bqKn2kt0xEwMB/bh5PJy+oWU1aodgoNxGgXA/2uFht7fqyXu
         kB9GXSjqC9F4CkOuBZnTRougezgJHBLeZ5pytXOWF3RRpIJ5UE4Dqik02LCAgGkoOMz1
         SEt3olgSE6z69gWgPSb7DXqxNMo9XdMO2dSc3WoL9zUbEcgNNQdAX8CBcJLIAwvHV8EM
         lDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793213550; x=1793818350;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0BEsHb9r/ZqDzu9FPC1kBx0oe94gE6mCVbWLiXY+XYs=;
        b=UihIqmHRR4w5aIu511wZB7mFZB/g+hYOgxGp6hMU5n3IDfVqFQpF25Dk7V3Lbi028t
         u0r89wSNQCCaxYLs6WYqZp0tvGIEY8GcpFoVg7M5iaMw7Uh6o9KxdNhkKYzYp/HFJaRP
         FAFShK03zi1DddamvEMtDr3L/Ws5dNTrzcHWBPBK7KEm8ZEe3CklGsKfRL/Z+V2r5mrf
         UDmvkO9u2lhvq2zWrZ76ZoyVrj7/w3pEuMCptIxXWZGbgMCiM73VMvvpevuwNKEOiHZm
         VDYnu6Y9O1C3+rYpCQgMjONN8TjaMVDBxXwkIqwDl0xNReo5dbhitC5VuSOdjVIW2P2P
         n/yA==
X-Forwarded-Encrypted: i=1; AKwUvBwED67jL4c1HN7FRBKPwaTbMzn+czOzkMg/2gZ7obqcGzQyfZOsJRg6A1QbRe0tCYnyp48vVliq5tvMaQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYIFlXRJmPy0ws4iYeq6zek/AApgTSZoA2lfO0JSknpw4NJCYeyY
	ssNYlDaC7qJ3JaEBAlMhuL8s3jr5otVMIUfuupn3Tifbkbm6ifm6+DIAX7QC1gqAXbnG
X-Gm-Gg: AYBFou1tX11BtJM1T5FnPMtOb7FWj024wtL15EJKRuxP170z9cdsqKg1bcC25g+r3hN
	IwWPlbeI6M2feUHLqgukDdmpg/m4djD/N3o22OD3zoLA4TnXERFn3kajcp9lNukKzAYxtyPj4vp
	bgGUVUk4oT2I9hgLMuBXz4XDm6YIAUvtdg5m+0bik9EqWdTTtSrciF1ZLJLFxEIu8pp8xlcJa2v
	RVQZVjFP8FPIn2wmRxawI7P0C8h+suPpIiUbbGBpv52VfZrjm4k2ja0QQAtx9ckMxr4JBi5DD+c
	9vLj+2HOKIBoBQ8+4TpWOEYqsxo+Ia8fyxvzeC/bnLG6M45MvEenXDgBC86Z0iXtqCubHRfyOWE
	K6IRKZGzvy1N4a9louxUS6Flx3JInnT2jKjfV/hhgQLvoh9XOLmlA0ZJ8MPOonwS+DMXzBRMccG
	HHwxoiXdm3/vFuJDGg/wJOhFHpgzl2ON+53zM2dtfcZs9nehTRo/sFo7Slr427TVBWWO1qPdgsB
	vFORW/VQqPg1e0wOVxxfNdopTlV47Z82b2AOJUtAQnQROHqxJAaGqy+ykVGtEcYdpsNNykb9IhM
	1rpcrAnVQU9lhKdJyzcxWkAz3hbwEeYe
X-Received: by 2002:a53:ee0c:0:b0:679:9afd:c0dd with SMTP id 956f58d0204a3-67a7bd81c47mr1564139d50.111.1793213549589;
        Wed, 28 Oct 2026 11:52:29 -0700 (PDT)
Received: from sultan-box ([142.147.89.222])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-67a79f38dfesm2247957d50.1.2026.10.28.11.52.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 11:52:29 -0700 (PDT)
Date: Wed, 28 Oct 2026 11:52:25 -0700
From: Sultan Alsawaf <sultan@kerneltoast.com>
To: caspar.adriani@proton.me
Cc: Bin Du <bin.du@amd.com>, Nirujogi Pratap <pratap.nirujogi@amd.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Benjamin Chan <Benjamin.Chan@amd.com>, King Li <King.Li@amd.com>,
	Svetoslav Stoilov <Svetoslav.Stoilov@amd.com>,
	Yifei Gao <gyf161023@gmail.com>,
	Seifelden Abdelmonem <saif.elden.hatim@gmail.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Subject: Re: [PATCH] media: amd: isp4: fix self-deadlock in
 isp4sd_start_stream() error path
Message-ID: <auJEaXevXj6hNTsK@sultan-box>
References: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261028-isp4-start-stream-deadlock-v1-1-babd80273148@proton.me>

On Wed, Oct 28, 2026 at 03:05:41PM +0100, Caspar Adriani via B4 Relay wrote:
> From: Caspar Adriani <caspar.adriani@proton.me>
> 
> isp4sd_start_stream() takes ops_mutex with guard() and, when
> isp4sd_init_stream() or isp4sd_setup_output() fails, jumps to
> err_stop_stream and calls isp4sd_stop_stream(). That function takes
> ops_mutex again, so the task blocks on a mutex it already holds. Every
> later open, close or ioctl on the device then blocks behind it, and
> only a reboot recovers:
> 
>   INFO: task .v4l2-ctl-wrapp:38440 blocked for more than 122 seconds.
>    isp4sd_stop_stream.isra.0+0x43/0x1d0 [amd_isp4_capture]
>    isp4sd_enable_streams.cold+0x8b/0x26c [amd_isp4_capture]
>    v4l2_subdev_enable_streams+0x1ff/0x360 [videodev]
>    isp4vid_qops_start_streaming+0xf2/0x160 [amd_isp4_capture]
>   INFO: task .v4l2-ctl-wrapp:38440 is blocked on a mutex likely owned
>   by task .v4l2-ctl-wrapp:38440.
> 
> One way to reach the error path: start and stop a stream, then start
> it again without setting the format. isp4sd_uninit_stream() clears the
> subdev pad format on stop, so isp4sd_get_str_out_prop() fails on the
> second start with "fail to get out prop" and "fail to setup output".
> 
> Move the body of isp4sd_stop_stream() into __isp4sd_stop_stream(),
> which expects ops_mutex to be held, and call it from the error path.
> 
> Fixes: 4e5e7a7ddb4a ("media: platform: amd: isp4 subdev and firmware loading handling added")
> Cc: stable@vger.kernel.org
> Signed-off-by: Caspar Adriani <caspar.adriani@proton.me>
> ---
> Tested on an ASUS ROG Flow Z13 (GZ302EA) on v7.3, with a local,
> not-for-upstream change that adds its OMNI13B1 sensor to the ISP4 ACPI
> tables so the capture device is created. The stock firmware does not
> support that sensor, so no frames arrive, but the start and stop paths
> run. Sequence: v4l2-ctl --set-fmt-video=1920x1080 NV12 --stream-mmap,
> stopped after 10 s; the same without --set-fmt-video; then the first
> command again.
> 
> Without this patch (v7.2.8, same setup) this failure hung the task as
> shown above. With it, VIDIOC_STREAMON returns -EINVAL after "fail to
> get out prop" / "fail to setup output", v4l2-ctl exits, no task is left
> blocked, and the third run starts and stops the stream normally.
> Not run: lockdep (CONFIG_PROVE_LOCKING is off in this kernel).
> ---
>  drivers/media/platform/amd/isp4/isp4_subdev.c | 15 +++++++++++----
>  1 file changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/platform/amd/isp4/isp4_subdev.c b/drivers/media/platform/amd/isp4/isp4_subdev.c
> index a108d90ace..08512f060a 100644
> --- a/drivers/media/platform/amd/isp4/isp4_subdev.c
> +++ b/drivers/media/platform/amd/isp4/isp4_subdev.c
> @@ -745,15 +745,15 @@ int isp4sd_pwron_and_init(struct v4l2_subdev *sd)
>  	return -EINVAL;
>  }
>  
> -static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
> -			      struct v4l2_subdev_state *state, u32 pad)
> +static void __isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
> +				 struct v4l2_subdev_state *state, u32 pad)
>  {
>  	struct isp4sd_sensor_info *sensor_info = &isp_subdev->sensor_info;
>  	struct isp4sd_output_info *output_info = &sensor_info->output_info;
>  	struct isp4_interface *ispif = &isp_subdev->ispif;
>  	struct device *dev = isp_subdev->dev;
>  
> -	guard(mutex)(&isp_subdev->ops_mutex);
> +	lockdep_assert_held(&isp_subdev->ops_mutex);
>  	dev_dbg(dev, "status %i\n", output_info->start_status);
>  
>  	if (output_info->start_status == ISP4SD_START_STATUS_STARTED) {
> @@ -786,6 +786,13 @@ static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
>  	}
>  
>  	isp4sd_uninit_stream(isp_subdev, state, pad);
> +}
> +
> +static int isp4sd_stop_stream(struct isp4_subdev *isp_subdev,
> +			      struct v4l2_subdev_state *state, u32 pad)
> +{
> +	guard(mutex)(&isp_subdev->ops_mutex);
> +	__isp4sd_stop_stream(isp_subdev, state, pad);
>  
>  	/*
>  	 * Return success to ensure the stop process proceeds,
> @@ -836,7 +843,7 @@ static int isp4sd_start_stream(struct isp4_subdev *isp_subdev,
>  	return 0;
>  
>  err_stop_stream:
> -	isp4sd_stop_stream(isp_subdev, state, pad);
> +	__isp4sd_stop_stream(isp_subdev, state, pad);
>  	return ret;
>  }
>  
> 
> ---
> base-commit: 65ba8f34ec886ec72b2c07ddc8cf3d815c32869d
> change-id: 20261028-isp4-start-stream-deadlock-6c33a97d3297
> 
> Best regards,
> --  
> Caspar Adriani <caspar.adriani@proton.me>

Reviewed-by: Sultan Alsawaf <sultan@kerneltoast.com>

Funny coindicidence, I ran into this independently 2 days ago on v7.3 when
Chromium restarted a stalled stream, and I made a similar fix locally. The
trigger you mentioned is a another bug: the subdev format shouldn't be cleared
when streaming stops, since the video node keeps its copy and userspace can
restart streaming without VIDIOC_S_FMT. I have a fix for that, plus one to power
off the ISP when starting the stream fails, which I'll send on top of this.

Sultan
