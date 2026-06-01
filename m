Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C93ACF06
	for <linux-media@vger.kernel.org>; Mon,  1 Jun 2026 15:55:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780329350; cv=none; b=JGX/1iCKYxdImZWmGHSlV9GBFbBDNioNyhX6zWcZc/cSuYl/NFeSYlcInZEGGXzP2su4eGfLZXFMpWe7fuA2n4Cn++2zehPO7f8lAuVHnW8BnD3bcd095QeUENS5J9AlFcE3JER3jUmN7VxlTW87XA+GkpHKQS5uxYh3F/rA3W4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780329350; c=relaxed/simple;
	bh=bVMGKDNWUa4Ucm1o0HX9RG0qt2GTkVIiMsPOrc67qoo=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BsRdOUYBJr1jCebNdjl+NlArlXwBC8ifD+iPwgPmMoqt5t4tNK7yfPlAgZPecWPQTfB7fKF4rYvgj+nzGuNNTXKDYiTUQD7CmngWAHG/Gx+udeW6jkgT5QHj1xXUOW6Ejsyjgg6iNef82XX9gtjEUOybL4Ymt1HQEK7ROlt5P80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cDeNMbNp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cDeNMbNp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95A0E1F00893;
	Mon,  1 Jun 2026 15:55:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780329348;
	bh=y9QG2pJiuD9TfVUsoPrS05CTIhlnTpxsEUZQc9Y4Yxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cDeNMbNpV0g20mtR4uPk7T9gZ4KLbf/9JJNhsxNGrWvjgiUU2tBqHKvwXgZGkaXkJ
	 Xm9+HI18hVvoFbroiDXddUqqw8P1SPVL+T2m8C/1ulsSTD/Yo4zbhpiEsstVyWvMlw
	 NSZvLiHeHIdlCV0AC94Ah1bwwp7GPEwvfx59MY82rz6y2oLV5BOkBWSKla96SMdh0i
	 0U2jmrXoHgKXM8vY2/YpWQXxq6ljXEgg96kwqyqkV7VdlaeKx2cPVU6Lj9xheM/3zL
	 cogj0fjgy8nRStPxAbGu8KO1VMz6AUAdpkdd4Ve+THbMZb/Xy/NZ9KkXuvo5JZvEkw
	 NiX+CnFs29pyQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] media: siano: fix URB work teardown
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rohith Matam" <rohithmatham@gmail.com>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260601154314.56784-1-rohithmatham@gmail.com>
References: <20260601154314.56784-1-rohithmatham@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 15:55:48 +0000
Message-Id: <20260601155548.95A0E1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:
- [Critical] Moving the buffer cleanup loop before cancel_work_sync() intro=
duces a data race on surb->cb, causing Use-After-Free and NULL pointer dere=
ference.
- [Critical] Data race on the usb_submit_urb() error path leads to a Double=
-Free list corruption.
--

commit b11c333a62046f4cc7d4416251c25e1dc3af596a
Author: Rohith Matam <rohithmatham@gmail.com>

media: siano: fix URB work teardown

This commit reorders the URB teardown sequence to kill URBs and release
buffers before cancelling the workqueue, aiming to prevent blocked workers.
It also adds an explicit error path to free buffers if urb submission fails.

Fixes: ebad8e731c1c ("media: usb: siano: Fix use after free bugs caused by =
do_submit_urb")
Reported-by: syzbot+0d6ef2b7ceb6014d756c@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D0d6ef2b7ceb6014d756c

> diff --git a/drivers/media/usb/siano/smsusb.c b/drivers/media/usb/siano/s=
msusb.c
> index 0fdc2e0950b77..c941a05a41247 100644
> --- a/drivers/media/usb/siano/smsusb.c
> +++ b/drivers/media/usb/siano/smsusb.c
[ ... ]
> @@ -168,31 +177,44 @@ static int smsusb_submit_urb(struct smsusb_device_t=
 *dev,
>  		smsusb_onresponse,
>  		surb
>  	);
> -	surb->urb->transfer_flags |=3D URB_FREE_BUFFER;
> +	rc =3D usb_submit_urb(surb->urb, GFP_ATOMIC);
> +	if (rc) {
> +		smscore_putbuffer(dev->coredev, surb->cb);
> +		surb->cb =3D NULL;
> +	}
> =20
> -	return usb_submit_urb(surb->urb, GFP_ATOMIC);
> +	return rc;
>  }
> =20
>  static void smsusb_stop_streaming(struct smsusb_device_t *dev)
>  {
>  	int i;
> =20
> -	for (i =3D 0; i < MAX_URBS; i++) {
> +	WRITE_ONCE(dev->streaming, false);
> +
> +	for (i =3D 0; i < MAX_URBS; i++)
>  		usb_kill_urb(dev->surbs[i].urb);
> -		if (dev->surbs[i].wq.func)
> -			cancel_work_sync(&dev->surbs[i].wq);
> =20
> +	for (i =3D 0; i < MAX_URBS; i++) {
>  		if (dev->surbs[i].cb) {
>  			smscore_putbuffer(dev->coredev, dev->surbs[i].cb);
>  			dev->surbs[i].cb =3D NULL;
>  		}
>  	}
[Severity: Critical]
Does moving this buffer cleanup loop before cancel_work_sync() introduce a
data race with the worker thread?

If a worker thread is concurrently running smsusb_submit_urb(), there is no
lock protecting surb->cb. If the worker evaluates the following and is then
preempted:

smsusb_submit_urb() {
        if (!surb->cb) {
                ...
        }

The teardown thread can then concurrently reclaim the buffer and set
surb->cb =3D NULL. When the worker resumes, it accesses surb->cb->p in
usb_fill_bulk_urb(), which might cause a NULL pointer dereference.

If the pointer was cached in a register instead, could the worker submit an
URB using a buffer that was just returned to the free pool, resulting in a
use-after-free?

[Severity: Critical]
Could this reordering also cause a double-free of the buffer?

Because the worker thread now explicitly returns the buffer on submission
failure:

smsusb_submit_urb() {
        rc =3D usb_submit_urb(surb->urb, GFP_ATOMIC);
        if (rc) {
                smscore_putbuffer(dev->coredev, surb->cb);
                surb->cb =3D NULL;
        }
}

Both the worker thread and the teardown thread in smsusb_stop_streaming()
might concurrently observe dev->surbs[i].cb !=3D NULL. They could then both
invoke smscore_putbuffer() on the exact same buffer.

Since smscore_putbuffer() blindly adds the buffer to the free list, might
this corrupt the list structure and cause a panic on the next allocation?

> +
> +	for (i =3D 0; i < MAX_URBS; i++)
> +		cancel_work_sync(&dev->surbs[i].wq);
> +
> +	for (i =3D 0; i < MAX_URBS; i++)
> +		usb_kill_urb(dev->surbs[i].urb);
>  }

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601154314.5678=
4-1-rohithmatham@gmail.com?part=3D1
