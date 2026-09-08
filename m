Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D7524EBAE8
	for <linux-media@vger.kernel.org>; Tue,  8 Sep 2026 09:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859428; cv=none; b=aRUPQH8xneWJ2v+Fb51Zgpm2Ex+/H4ZXTu3JZFWbMv88H7MsfEKFa4+26HJ4/Ee7IFHeZdshDyy8yZO3f6imWU1Nm0UuvXu5rkVpVN05R+hVb/tPxk4Ln/zKM01Q1mT01O7BcVB0ofFH1cK56cPHmKZ3lx4lqIHZDXLRAM94Kyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859428; c=relaxed/simple;
	bh=7GhoWawPB+U0fOoQdp/87Gt397JWDm5krcOW8s18chw=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=vEBXrYuyV3s/VTo3ojXm9GjlES84InWR92bIZKMTozsWMbMtITNRSGhW+WSrKYTByLxpU+/12uDn92SHsznSxmCwgZkLrh8RJOOE8acHcLVspaay/NUeKFIi2GL52uCxnl6e5XFt4Ql9Xj8DoHsixLeVxqAffVqyqvLmy4OYhlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fyXy8nCW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fyXy8nCW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59141F00A3A;
	Tue,  8 Sep 2026 09:23:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859427;
	bh=QffU2SELmTHrZcnyREij+R2Azljs7gHl8vSsM37RgQo=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=fyXy8nCWR0dCAcCJx4YG4aR0cPt94ZB742r5hptSGakq0Wfx12mIjoIC9lqIe5D7G
	 Akd/hzAb6MjCrvCxDNagguZwCqqXHk8pssNpX10aY/0Z6E7D9ePej0CdGv9di/3Jnz
	 tCAuRLgonicRRo+ztRv2v09lUUPcWLvYL/dojqKPWf4opinrWN0LsShDMIdx0ZK+nz
	 oOCJEIwwvEA7nb+mTeA0/VpELKacnqofYrUho7yheE7hHDyrOPylp6GcTwXRmH/vBc
	 3WMmUutwvu+uyTZWGVGiR/8BtbOyrBolPNSwwwe0ZRXaufut6IOCuL7WwSoEST0kaC
	 YaV766PbLY5Pg==
Message-ID: <7f58710e-d235-446d-9c69-cf286eae8700@kernel.org>
Date: Tue, 8 Sep 2026 11:23:43 +0200
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [RESEND PATCH 1/2] media: em28xx: adjust initialization order in
 em28xx_v4l2_init()
To: Dmitry Antipov <dmantipov@yandex.ru>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: linux-media@vger.kernel.org, lvc-project@linuxtesting.org,
 syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
References: <20260907102824.95222-1-dmantipov@yandex.ru>
Content-Language: en-US, nl
In-Reply-To: <20260907102824.95222-1-dmantipov@yandex.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 07/09/2026 12:28, Dmitry Antipov wrote:
> In em28xx_v4l2_init(), call to vb2_video_unregister_device() during
> 'unregister_dev' cleanup assumes that queues of the corresponding 'struct
> video_device' instance (i.e. 'vdev' of 'struct em28xx_v4l2')  are properly
> initialized, triggering an undefined behavior otherwise. So call
> em28xx_vb2_setup() immediately after video_register_device() and,
> since the former is actually non-void, do not ignore the value returned.
> 
> Reported-by: syzbot+dd0f06181ab66b93dc00@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=dd0f06181ab66b93dc00
> Fixes: 37ecc7b1278f ("[media] em28xx: add media controller support")
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/media/usb/em28xx/em28xx-video.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> index c418add65bb5..324855ff5e86 100644
> --- a/drivers/media/usb/em28xx/em28xx-video.c
> +++ b/drivers/media/usb/em28xx/em28xx-video.c
> @@ -2992,13 +2992,19 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  		goto unregister_dev;
>  	}
>  
> +	v4l2->vb_vbiq.lock = &v4l2->vb_vbi_queue_lock;
> +	ret = em28xx_vb2_setup(dev);
> +	if (ret) {
> +		dev_err(&dev->intf->dev, "unable to setup device queues, error %d\n", ret);
> +		goto unregister_dev;
> +	}
> +
>  	/* Allocate and fill vbi video_device struct */
>  	if (em28xx_vbi_supported(dev) == 1) {
>  		em28xx_vdev_init(dev, &v4l2->vbi_dev, &em28xx_video_template,
>  				 "vbi");
>  
>  		v4l2->vbi_dev.queue = &v4l2->vb_vbiq;
> -		v4l2->vbi_dev.queue->lock = &v4l2->vb_vbi_queue_lock;
>  		v4l2->vbi_dev.device_caps = V4L2_CAP_STREAMING |
>  			V4L2_CAP_READWRITE | V4L2_CAP_VBI_CAPTURE;
>  		if ((v4l2->vdev.device_caps & V4L2_CAP_TUNER) == 0)
> @@ -3068,9 +3074,6 @@ static int em28xx_v4l2_init(struct em28xx *dev)
>  	/* Save some power by putting tuner to sleep */
>  	v4l2_device_call_all(&v4l2->v4l2_dev, 0, tuner, standby);
>  
> -	/* initialize videobuf2 stuff */
> -	em28xx_vb2_setup(dev);
> -
>  	dev_info(&dev->intf->dev,
>  		 "V4L2 extension successfully initialized\n");
>  

I prefer this simpler patch:

https://patchwork.linuxtv.org/project/linux-media/patch/3e01154b-ab4d-4cb3-90d7-a5dce4e5b2c4@kernel.org/

Regards,

	Hans
