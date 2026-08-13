Received: from extorris.mess.org (extorris.mess.org [92.243.27.206])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB4032D0FC;
	Thu, 13 Aug 2026 14:02:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=92.243.27.206
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786629750; cv=none; b=n/2S9pRBYoe3uWT4uJOB2vvQt5SZiV89Co2FwtVjfGhGa2uAxeJzO7V+GdOQJf0BhKFHZmj8Z2+uhcHW2XxcoyyDj4mElvmQwuGEqt0ZSBkYe+jDGMknIbEmOaoMJ7fJ6tJ5Sp6YFkvdBOuzXgGhMFKG3DUC3d0U2+6neNMEU00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786629750; c=relaxed/simple;
	bh=vbKfBch/UEEFFguO+x8EG2UHHMgwwOY2dQPtAJhBb9c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdo1V4Ppmf882yK9PkMcx0nbezTAJ+DjJ3TLJWYuQQt10d3QLeTQVTTtLU3MjvcZf/O4NTAxxtS6hGa48jqPjOm/9jB77GUjT5jWd4LNX3wlOfulikZpmSZBgpRs4Ca/0JiMH4ELRo/lebyyNPXOqoUL6UFK2FMpYXw7gWbdOCc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org; spf=pass smtp.mailfrom=mess.org; dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b=l0LXSmRg; arc=none smtp.client-ip=92.243.27.206
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=mess.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mess.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mess.org header.i=@mess.org header.b="l0LXSmRg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=mess.org; s=2020;
	t=1786629740; bh=vbKfBch/UEEFFguO+x8EG2UHHMgwwOY2dQPtAJhBb9c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=l0LXSmRgLt8DhA65tPanpkIl8ch92js75Txwz3aosDrkPmyPOFeFCBTcb2V9lfKxS
	 1jgb/OMCQxjUMY/MeSz5hSEveImHV3jADQ5b8gsAISl7CEWHbzAcy6UDVMGMnijqyX
	 pWLyLX/og0vNPP1rxdu4DA5W4Gt6ijp3LBrPu17d7cnomVFdSb9o0iAI3gryx6gQG2
	 9MyyOllluZ5A39zxLFr8N468Krfh6dgj3Q5nBsniFZj7cIZa+ppdS9fmYoZ7O625V0
	 Udj2QECvNCnR7OD5US2qNzGn+aclpRcsEtTpxMNnWkW+YaijkhQbWaTLWwsiryt7A7
	 xt3ERXqZaw7VQ==
Received: by extorris.mess.org (Postfix, from userid 1001)
	id F070641567; Thu, 13 Aug 2026 15:02:20 +0100 (BST)
Date: Thu, 13 Aug 2026 15:02:20 +0100
From: Sean Young <sean@mess.org>
To: Rik van Riel <riel@surriel.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jarod Wilson <jarod@redhat.com>, linux-media@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: redrat3: fix UAF in probe error path leaving
 rc device registered
Message-ID: <an3ObNj_uyRJI2tY@extorris.mess.org>
References: <20260808232031.500f781c@fangorn>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260808232031.500f781c@fangorn>

Hoi Rik,

On Sat, Aug 08, 2026 at 11:20:31PM -0400, Rik van Riel wrote:
> redrat3 stores its device name and phys path inside the main rr3
> structure, and the rc device's device_name and input_phys point into
> rr3. When the RC device is registered, it keeps those pointers.
> 
>   KASAN: slab-use-after-free in string_nocheck lib/vsprintf.c:648
>   Read of size 1 at addr ffff888051fda758 by task udevd/7464
>   Call Trace:
>    string_nocheck lib/vsprintf.c:648 [inline]
>    string+0x216/0x2d0 lib/vsprintf.c:730
>    vsnprintf+0x74a/0xef0 lib/vsprintf.c:2945
>    vscnprintf+0x41/0x90 lib/vsprintf.c:3014
>    sysfs_emit+0x10e/0x180 fs/sysfs/file.c:761
>    input_dev_show_name+0x58/0x70 drivers/input/input.c:1282
> 
>   Allocated by task 10:
>    redrat3_dev_probe+0x477/0x2570 drivers/media/rc/redrat3.c:1023
>   Freed by task 10:
>    redrat3_delete drivers/media/rc/redrat3.c:466 [inline]
>    redrat3_dev_probe+0x1bf4/0x2570 drivers/media/rc/redrat3.c:1124
> 
> Syzkaller triggers this via usb probing. It probes the RedRat3 USB
> interface, which calls redrat3_dev_probe() in redrat3.c. That function
> allocates rr3, then builds an rc device whose name points into rr3 via
> redrat3_init_rc_dev() in redrat3.c, and registers it with
> rc_register_device().
> 
> When the detector enable fails after the RC device is registered, the
> probe jumps to the led_free path. That path unregisters the LED but does
> not unregister the RC device before freeing rr3 via redrat3_delete() in
> redrat3.c. The RC device still holds device_name = rr3->name which is now
> freed.
> 
> Later udevd reads /sys/.../input device name via sysfs_emit() in file.c,
> which calls input_dev_show_name() in input.c, which emits dev->name which
> is the freed rr3->name.
> 
> When the detector enable fails after the RC device is registered, the
> error path must not leave the RC device registered. Make the probe error
> path clean up the same way redrat3_dev_disconnect() does.
> 
> This change should be safe because the RC device is fully registered at
> this point and its teardown via rc_unregister_device() is protected by
> the input device mutex, and rr3 is still alive during unregister so
> device_name remains valid until after unregister. The URBs are killed
> before rc_free, so no completion can run after rc is freed. No new lock
> ordering is introduced.
> 
> Reported-by: syzbot+302b9b575a06733ff60c@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=302b9b575a06733ff60c
> Link: https://lore.kernel.org/all/6a74a76d.ec7c9571.3ac9bb.0056.GAE@google.com/
> Fixes: 2154be651b90 ("[media] redrat3: new rc-core IR transceiver device driver")
> Cc: stable@vger.kernel.org
> Assisted-by: Hermes:muse-spark-1.2 syzkaller
> Signed-off-by: Rik van Riel <riel@surriel.com>

The commit message is very good. Your patch is very similar to a patch
I wrote earlier (which still has to be reviewed, I can't merge my
own patches without review into the media-committer tree):

https://lkml.org/lkml/2026/7/29/1730 

I don't really have a preference for which one to merge. 

Sean

> ---
> v2: fix the Sashiko bug https://sashiko.dev/#/patchset/20260808174213.1d68336e%40fangorn
> 
>  drivers/media/rc/redrat3.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/media/rc/redrat3.c b/drivers/media/rc/redrat3.c
> index 3f828a564e19..565c490b7051 100644
> --- a/drivers/media/rc/redrat3.c
> +++ b/drivers/media/rc/redrat3.c
> @@ -975,6 +975,7 @@ static int redrat3_dev_probe(struct usb_interface *intf,
>  	struct device *dev = &intf->dev;
>  	struct usb_host_interface *uhi;
>  	struct redrat3_dev *rr3;
> +	struct rc_dev *rc;
>  	struct usb_endpoint_descriptor *ep;
>  	struct usb_endpoint_descriptor *ep_narrow = NULL;
>  	struct usb_endpoint_descriptor *ep_wide = NULL;
> @@ -1119,9 +1120,12 @@ static int redrat3_dev_probe(struct usb_interface *intf,
>  	return 0;
>  
>  led_free:
> +	rc_unregister_device(rr3->rc);
>  	led_classdev_unregister(&rr3->led);
>  redrat_free:
> +	rc = rr3->rc;
>  	redrat3_delete(rr3, rr3->udev);
> +	rc_free_device(rc);
>  
>  no_endpoints:
>  	return retval;
> -- 
> 2.55.0
> 
