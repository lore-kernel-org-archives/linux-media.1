Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795689220;
	b=tcMaj4dREPTv9AxgREQ0IO3mKNBqaddxKKDjFBq2LHAbPiIRN2AdpaFhQkPSxxI5F6Ca
	 0OMW4hyHP6fpyKnsBugIk0l9B/WVHfhjlaAzKJctrRRs9aM2icuH+DkdCJsxeNNSBn5k1
	 FMWSCBN2Ha+XbQgeOTDVZpDUUjcSUTsxujfozOVknx5lCaJdU6VwozSbRpRJeNWJAofoe
	 KLA9qkKe5+M74tXD3MzvCnYHQxLmSqEYzVMHbHxy1kppkbrdWR3vf/E5aWpSgT7V+YRyc
	 7uaemAHtoWnymFx4FnTfbcz42Ql3GQDqeDA91/VXsCrG2D+jEOVPzdoWDcpmFV5Dm9w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795689220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
	b=tK9Y5vhCJdAPEptQNBd7XegUv+F2qgpLVAA2r1M9ciJfE4WDryippSgPl6r6rQ7+V1Xn
	 +nOGbo6ZJ84UmUsaqxXT72TEtA0vjY33BVXdzC4DytVLkjNtG1zq8BICLGdNlLooQXaMZ
	 +v44W86caZKTyM2OySt0HSsCmyyrIyZ3u/2ov6EZk2M++vuITIHGZ6Lfgk5dunVABokFq
	 DfDCVpxro7zw23eUCdYccSa36YAhGf9tvw4RSjD8SK8QYC4b7ixrwiCt6IdEsdOMHtQ5l
	 LX9ZCSEQCkzw6Cxjfgn64z0f0bHW6gV2Riv9sFkJZR96AHPnBEqR1XUEk2Of2cclf9Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De4U3Nri;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 005DD606A31E
	for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 10:33:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 005DD606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=De4U3Nri
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb2dfcca94so2879400a12.1
        for <linux-media@vger.kernel.org>; Thu, 26 Nov 2026 02:33:38 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795689218; cv=none;
        d=google.com; s=arc-20260327;
        b=ZF3DAbV3WuBhogoWEfsDR8Z5n2UwytKNopwCBiv3BGCebTKe9M1ffCJcvKE+A9RZUL
         QW9p4m7NggoV3uOhQOThrP+mMQQwJNd5/BMVMaDb96x1uqMKvtvqEEST5MnvYp4FXX9z
         j26PPTtlTOyuq6jsRDT/jMQhy08FlISkfIe/rWn1ebiVEGrbXi1LT4Cz+PjyrB+juHW8
         pSFA0Mh/CH06WrN08+ljE0kqziZKi10yTYYv0DGgoVeDeYuQUzf302zN4P7shlGyGAKp
         seUapyRUI4v7gE+x4lqHt8XuUSM9C0mfduai4LwSAO8muPE0OFQcQXsJX6rdh7woupZV
         nB1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        fh=WsKtICdqjS380khVgyR9p0NkFSIISGI2ZLHHK+mp/+E=;
        b=CxmL3BsK2VLXP7ersr3x0mRTttgUk8UblEZoon2x+fvuJK5Ka1ckLhhKVwiObCRsuX
         hM9BDK2i4prNYPZHeqSyKIERj5SscNQTpTbTdmhnBRNeeQMZRhNq1e/6pzs+lPhkhgQK
         yuB8Pu+5vhYN/E0KSUs8r8GqII5AR2QiavINUdgionDr7076pQYkawTnfs7skOT+Xq9X
         ofVa9/FzfmkJA3hXNsOsJ5cd+C6kmkSMXrJ19Jhckw3eevNed/FbkgfFiA79NYp9XpI2
         YkebZsBCyY5hw/sHnLgKOxP9uq/zqctUTlukJyASV3Kdae4+4jIJ8IdVnNiZHmfh2Ijz
         1hsA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795689218; x=1796294018; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        b=De4U3NriG0pnU5n61Rds0bGZ4V4UfHP8EPTjilbt+dGMz8sXOFX8ozPnVhuRkEl2Tt
         f6hSadLeVrHVyfqbY4XiA7LNkgGGqFSuF6t+umXE1r0hBHy8hCbpY03LMx7YEJswSNkv
         MeuWhnXmoZ7DJUuK/7MD34oP9RlXx3Kr+QRPRP6qVEfPLn1ZB/IOGCutz9AebD+FZtgz
         G89s27EsVAEkWBF3o+DQH33KX2quV9uDdZMdGBJDZLxGQwCO+3ezu0FN2DSYzCu5BWZa
         BNFJGHqP696CfMb0NbfcSRRF19SQowj79qbb32iZbjDSvSnaVJgRZJzN24rnzo02rit/
         i0iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795689218; x=1796294018;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CjQ8gPON54ImxNch/vz81iv8pHWJvCH/N5cvF02jvyA=;
        b=LbfPWK84uLsp0oyyM0pER/MHMTrHdL9sT5gHEhosyJR+R+btY4jXfsYmyed9U3ivEv
         ezJ1SqzAxai1qhFc5eH8grGqx2xbWSbfLA4/TqH8UCEOBLR2IAolOhBwtvdpXdBskaXz
         lp01KgkxqOJZYNJ/TqRhdWfOQ3xpjSBhdjtwUaRgXFBYPb/+ypVvsjSnl3iiJ7TgtN3z
         tK3OJuaHbatB3X29eISlMIjw9l1Bl9B3G79v5iBeLFP2RMZG7AqiD3b7Wqp0R/hlAHUR
         b2tZs9hGh4Qb6UiQrPBML22Ehdz9mkB+63iF06+p5LamKbS9Nz3xCN4AY/1Sg7zoPGUc
         T5vw==
X-Forwarded-Encrypted: i=1; AL+hErFPlaBZ+FsAEeXBiGD+UKyxefz4EiwqScMsKGOLSIXhmVCZbwA1w6Dobtc9HfTPCepzgepi2eYZ5rSsFQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z9iD4JYwUE3B5o0TCp68H0O3rUAXBk0lU4RGKZn4/UFoAQsbP0M
	z45Qo55R6uj7gvrST4tZdl13jUERPPdi5PAbc/mjVn8o8xXHnEKgSObcLvAicFaSkkL6zBdwA4h
	yiGClsucY64elELhytZCz4zx3ci9VZ8M=
X-Gm-Gg: AZFdTZcg7LXKF8U8Inr4YqXSpVDx7IHAppO4m0nIHkei88Y6HrjiK1r1aLVOIj6AcAw
	7sYK0+azA08s3zsk+XiRShGWT0v3joOZh1Lv6CbXqaDFRjECZRHOo82OnzNRIodrrvWOw4wQp3f
	J3hQNcJdERGpTo6cD8WMjT6zJyOs159uW5C7fT35RRkcEiRU/f4zHTH9CAqtkjRiFEa6IMOzswK
	0M1ZP/hEKmaOgtNzww6GfpYGkR0nLnjTHWb9XuGC/c7ipGS5sJFbisPUshyKG3NlR48ee18S2vE
	fVZDJv6Lxz2pt5v2Ioe9S73YOhocVrqwkMtDlDeT16xl0J7RcvaS5OGcLx3ZwuFQEDUIN94+tzX
	TMR1PK0tgIV9kFBP9tDUknuuR6/HPOjY/E/Ca6e32dKP7aZT4HsFc6PVvTw==
X-Received: by 2002:a17:90b:2f8c:b0:3a2:b16d:928b with SMTP id
 98e67ed59e1d1-3b41c95aec8mr18512828a91.46.1795689218173; Thu, 26 Nov 2026
 02:33:38 -0800 (PST)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261122190008.21278-2-arbabhaider649@gmail.com> <4724fb41-06a0-457c-be3a-25ad9e49e25f@kernel.org>
In-Reply-To: <4724fb41-06a0-457c-be3a-25ad9e49e25f@kernel.org>
From: Arbab Haider <arbabhaider649@gmail.com>
Date: Thu, 26 Nov 2026 15:33:26 +0500
X-Gm-Features: Aa3M54r0J6MsPFv-FI2m1pPxneDAzgN4uFfUfog5-WhTsHNyfmVJ8PwjCWIuLXE
Message-ID: <CAHPLoh+1WDe2YFxuyP65MHtCbSmmg6FORnk-bJ8FxTgq-PQW8A@mail.gmail.com>
Subject: Re: [PATCH] media: em28xx: clear dev->v4l2 on init failure and fini
 to avoid double put
To: Hans Verkuil <hverkuil+cisco@kernel.org>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, 
	syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Hans,

I checked media-committers/next at b4e3c4b6a36f. The init error path
already clears dev->v4l2 under dev->lock before dropping the initial
reference, and em28xx_v4l2_fini() checks the pointer under the same
lock. That covers the double put this patch was meant to fix, so
I'm dropping the standalone patch.

Thanks,
Arbab


On Wed, 25 Nov 2026 at 12:40, Hans Verkuil <hverkuil+cisco@kernel.org> wrote:
>
> On 22/11/2026 20:00, Arbab Haider wrote:
> > Commit 288254383674 ("media: em28xx: use v4l2_device release callback")
> > switched em28xx_v4l2 teardown to v4l2_device reference counting, where
> > dev->v4l2 is only cleared inside em28xx_free_v4l2() once the refcount
> > reaches zero.
> >
> > If em28xx_v4l2_init() fails after video_register_device() (for example,
> > when v4l2_mc_create_media_graph() returns -EINVAL) while userspace has
> > opened the video node, the unregister_dev error path calls
> > v4l2_device_put(&v4l2->v4l2_dev) to drop the initial reference, but
> > em28xx_free_v4l2() does not run yet because the open file handle still
> > holds a reference, leaving dev->v4l2 non-NULL.
> >
> > When the USB device is subsequently disconnected, em28xx_v4l2_fini()
> > sees dev->v4l2 != NULL and calls v4l2_device_put(&v4l2->v4l2_dev) a
> > second time for the initial reference, freeing struct em28xx_v4l2 while
> > the video device node is still referenced and causing a
> > slab-use-after-free in media_device_unregister() /
> > __media_entity_remove_links().
> >
> > Fix this by:
> > - Calling v4l2_device_disconnect() and clearing dev->v4l2 = NULL under
> >   dev->lock in em28xx_v4l2_init()'s unregister_dev path before dropping
> >   the initial v4l2_device reference.
> > - Checking and clearing dev->v4l2 under dev->lock in em28xx_v4l2_fini()
> >   so the initial reference is dropped at most once.
> > - Reading dev->v4l2 under dev->lock and checking for !v4l2 in
> >   em28xx_v4l2_close() so a close racing with teardown cannot dereference
> >   a NULL pointer.
> >
> > Tested locally in QEMU (x86_64, KASAN+UBSAN) using dummy_hcd and
> > raw-gadget emulating an EM2820 device with failed media graph creation
> > and concurrent /dev/video0 open/disconnect.
> >
> > Reported-by: syzbot+fb0d2df09b56117605fc@syzkaller.appspotmail.com
> > Closes: https://syzkaller.appspot.com/bug?extid=fb0d2df09b56117605fc
> > Fixes: 288254383674 ("media: em28xx: use v4l2_device release callback")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Arbab Haider <arbabhaider649@gmail.com>
>
> This patch no longer applies, can you rebase it on top of
> https://gitlab.freedesktop.org/linux-media/media-committers, next branch?
>
> This patch might not be needed anymore, it's unclear.
>
> Regards,
>
>         Hans
>
> > ---
> >  drivers/media/usb/em28xx/em28xx-video.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >
> > diff --git a/drivers/media/usb/em28xx/em28xx-video.c b/drivers/media/usb/em28xx/em28xx-video.c
> > index 84424284d..50998aa1c 100644
> > --- a/drivers/media/usb/em28xx/em28xx-video.c
> > +++ b/drivers/media/usb/em28xx/em28xx-video.c
> > @@ -2333,7 +2333,6 @@ static void em28xx_free_v4l2(struct v4l2_device *v4l2_dev)
> >
> >       v4l2_ctrl_handler_free(&v4l2->ctrl_handler);
> >       v4l2_device_unregister(v4l2_dev);
> > -     dev->v4l2 = NULL;
> >       kfree(v4l2);
> >       kref_put(&dev->ref, em28xx_free_device);
> >  }
> > @@ -2414,7 +2413,7 @@ static int em28xx_v4l2_open(struct file *filp)
> >   */
> >  static int em28xx_v4l2_fini(struct em28xx *dev)
> >  {
> > -     struct em28xx_v4l2 *v4l2 = dev->v4l2;
> > +     struct em28xx_v4l2 *v4l2;
> >
> >       if (dev->is_audio_only) {
> >               /* Shouldn't initialize IR for this interface */
> > @@ -2426,13 +2425,16 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
> >               return 0;
> >       }
> >
> > -     if (!v4l2)
> > +     mutex_lock(&dev->lock);
> > +
> > +     v4l2 = dev->v4l2;
> > +     if (!v4l2) {
> > +             mutex_unlock(&dev->lock);
> >               return 0;
> > +     }
> >
> >       dev_info(&dev->intf->dev, "Closing video extension\n");
> >
> > -     mutex_lock(&dev->lock);
> > -
> >       v4l2_device_disconnect(&v4l2->v4l2_dev);
> >
> >       em28xx_uninit_usb_xfer(dev, EM28XX_ANALOG_MODE);
> > @@ -2455,6 +2457,8 @@ static int em28xx_v4l2_fini(struct em28xx *dev)
> >               vb2_video_unregister_device(&v4l2->vdev);
> >       }
> >
> > +     dev->v4l2 = NULL;
> > +
> >       mutex_unlock(&dev->lock);
> >
> >       /*
> > @@ -2502,18 +2506,19 @@ static int em28xx_v4l2_close(struct file *filp)
> >  {
> >       struct video_device   *vdev = video_devdata(filp);
> >       struct em28xx         *dev  = video_drvdata(filp);
> > -     struct em28xx_v4l2    *v4l2 = dev->v4l2;
> > +     struct em28xx_v4l2    *v4l2;
> >       struct usb_device *udev = interface_to_usbdev(dev->intf);
> >       int              err;
> >       bool last_user;
> >
> >       mutex_lock(&dev->lock);
> > +     v4l2 = dev->v4l2;
> >       last_user = v4l2_fh_is_singular_file(filp);
> >       _vb2_fop_release(filp, vdev->queue->lock);
> >
> >       if (last_user) {
> >               /* No sense to try to write to the device */
> > -             if (dev->disconnected)
> > +             if (dev->disconnected || !v4l2)
> >                       goto exit;
> >
> >               /* Save some power by putting tuner to sleep */
> > @@ -3110,6 +3115,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >       return 0;
> >
> >  unregister_dev:
> > +     v4l2_device_disconnect(&v4l2->v4l2_dev);
> > +
> >       if (video_is_registered(&v4l2->radio_dev)) {
> >               dev_info(&dev->intf->dev,
> >                        "V4L2 device %s deregistered\n",
> > @@ -3129,6 +3136,8 @@ static int em28xx_v4l2_init(struct em28xx *dev)
> >               vb2_video_unregister_device(&v4l2->vdev);
> >       }
> >
> > +     dev->v4l2 = NULL;
> > +
> >       mutex_unlock(&dev->lock);
> >
> >       /*
>
