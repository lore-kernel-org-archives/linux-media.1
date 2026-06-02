Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472753F39DE
	for <linux-media@vger.kernel.org>; Tue,  2 Jun 2026 16:08:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780416495; cv=none; b=Z7oPGwN+eBNdmPTB9XzRtyts5bnAbD91v3hrSRLlw0Z65/VcN7UlqxQ3g4kMY6YpujLPqvAdK5XFx3Tt/Zm5be23aobg9qITZD87KcayCtQhqYPzUjDbx2OJKm1DZaxhzlRqIvQ9NFNe6Ah8IQL3qQj0n5cmB99DtW1GuFTY1UQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780416495; c=relaxed/simple;
	bh=V0tIGs+PgGYp+yMy6NuRufDQxMOM+ypKsw8aumzjWZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ej6EcLBR54QHhr3UWB8VakI0ei6Qj+4Dhp99l7YQ59KpqKy6vdtesTpuGvIoiMvCZ9XeHkEE80Oh54L3EUYqD++OV0RCAyEMct8tiKUAEsi1+FI+2FJVNR5ozjrEQLi6LcHGBIwvUlrgM6NoCqmzSI3jQeK1afzOcrMEJ3+ep2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jU1mAjqI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jU1mAjqI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B29621F00893;
	Tue,  2 Jun 2026 16:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780416493;
	bh=pVmcWqfX64ADXk+Y3xqz9r7DYv7c5OQolgY1KjekT4M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jU1mAjqIrL9FqpleVgnn1GSDlzdOZ4wK2+xn6Ij5d4DzDO7WiJ6Es9k29c6pPRvWP
	 bbMiQyJIqCzjOscEyFY/8CByOeNERjprWA6h0+20fA8yAO5ciD89Tg2iTWennih8Jh
	 1MM8xO6wEcRFZwQcCcak2VGJrxjnh1T1tX5PYGUoTRd11Sc3Tkd49e/4xgsn5he+ib
	 RO+4jsQIKmf0aII4GyJlcyDi0oO3jdO1oO5A+yhYNUFQhsRgDCibgihlTbk0oxGfLy
	 xrciHuo1Egq3VNNcIR8jQHYeg4gS862xmaLof3oO6sr7zQYA/ssEmVsJEEUJHOp8D4
	 9hcHzNKbvJtOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] media: usb: as102: initialize mutexes before
 registration
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joel Peech" <linux@jrpmail.ca>
Cc: linux-media@vger.kernel.org
In-Reply-To: <20260602155529.4097328-1-linux@jrpmail.ca>
References: <20260602155529.4097328-1-linux@jrpmail.ca>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 02 Jun 2026 16:08:13 +0000
Message-Id: <20260602160813.B29621F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] If `as102_start_stream()` fails, `as102_dev->streaming` is left in=
cremented, permanently breaking the hardware streaming state.
--

commit 2c8befce227c56474dec3c665bf27984a30ca17a
Author: Joel Peech <linux@jrpmail.ca>

media: usb: as102: initialize mutexes before registration

This commit moves the initialization of bus_adap.lock and as102_dev->sem
to occur before registering DVB demux and frontend objects. This prevents
callbacks from using these mutexes before they are initialized, resolving
a lockdep warning.

Reported-by: syzbot+3825a6102073c418fe41@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=3D3825a6102073c418fe41
Link: https://lore.kernel.org/r/tencent_F063E97E23B8C4431762377E26CC336AE30=
5@qq.com

> diff --git a/drivers/media/usb/as102/as102_drv.c b/drivers/media/usb/as10=
2/as102_drv.c
> index 6b1d3528a0a7f..60827acd73f87 100644
> --- a/drivers/media/usb/as102/as102_drv.c
> +++ b/drivers/media/usb/as102/as102_drv.c
> @@ -296,6 +296,12 @@ int as102_dvb_register(struct as102_dev_t *as102_dev)
>  		return ret;
>  	}
> =20
> +	/* init bus mutex for token locking */
> +	mutex_init(&as102_dev->bus_adap.lock);
> +
> +	/* init start / stop stream mutex */
> +	mutex_init(&as102_dev->sem);
> +
>  	as102_dev->dvb_dmx.priv =3D as102_dev;
>  	as102_dev->dvb_dmx.filternum =3D pid_filtering ? 16 : 256;

[ ... ]

[Severity: High]
This is a pre-existing issue, but does this error handling leave the hardwa=
re
stream state permanently desynchronized?

Looking at as102_dvb_dmx_start_feed() which takes this newly initialized
mutex, the streaming counter is incremented unconditionally before attempti=
ng
to start the stream:

drivers/media/usb/as102/as102_drv.c:as102_dvb_dmx_start_feed() {
        ...
        if (as102_dev->streaming++ =3D=3D 0)
                ret =3D as102_start_stream(as102_dev);

        mutex_unlock(&as102_dev->sem);
        return ret;
}

If as102_start_stream() fails, it returns an error directly while leaving
the streaming counter incremented.

The DVB core handles the feed creation failure by aborting, which means it
will not call stop_feed() during cleanup. Because the streaming counter
remains greater than zero, subsequent calls to start a feed will skip
as102_start_stream() entirely.

Does this counter need to be decremented when as102_start_stream() returns
an error to ensure the device can recover from stream start failures?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260602155529.4097=
328-1-linux@jrpmail.ca?part=3D1
