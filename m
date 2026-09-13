Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9276A366045
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 21:10:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789333822; cv=none; b=dZ3ewG+jVfjTRLyemxRBiuA/jjrI09A8hIDtjEEHN/KUtWbmpn1W2Q2ImqLBI4MlLuMbG9ZKA8BC4m3/hipH1XCojtuu4hW2Yn7TelBtDCBjlShaWJs/uuTdiiGLTeRfCc5ysWGtbawXWPjvqrRymcpzmZfRWNIe4qkG+qsgbRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789333822; c=relaxed/simple;
	bh=VE9l3ScAikMV67xiZ9JYY76gCII7SuWJrsr04utpEOQ=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=nKKuGXxVNekB+HlKgD7n3qwsl8it5xPaJKl5b7VS2CRqJvUwomvf4Me8D032s6S+hfkCRHtQagHvg0xigBPKFsAGUwGqdc6GNPPXc0lVmEYgbXVDX3ndYEJl+XSp0zdSadrGcwhqYd3W7KVSn3gEbSZEpDvxdIRuWIHjNlN+zsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Rmg30Ite; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Rmg30Ite"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4851F000FF;
	Sun, 13 Sep 2026 21:10:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789333821;
	bh=kfoCzwVb8PzrqzO6KpwSC3feBg9mjaddmn8FARNkCKk=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=Rmg30ItewcG231xEQ4W/I9iMfgTfO+Xjk3IZjDqMzdMQFy70LhGcarvRMCk/3t9Dw
	 HJAlyO7t3CIUMzv+FHy05UzE25yWwRGxT9BuutoVNzc2JAoYw8Uc0Na4RKMmOTEq+6
	 OONH3PIh3UERpaXUxDQTXKRDQoCLgYIPna/PkXeH7wtjCgs3gwB0fxdLFnLUdBMq0u
	 espRZq6Ya7HyrfKfCvnfPC9fqi9N8+kJ90gJyVExw8b7v1HTvIdVa/BwnQTSAydq0B
	 sZlA81NhEH6bm7UZSdnUv6IS3hRMlPVkCW2GHAJWTfdexf7GWbTgMQnRCZA6A4x9du
	 7JHut4YgDZF+g==
Date: Sun, 13 Sep 2026 23:10:13 +0200
From: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
To: d01 <d01.devel@gmail.com>
Cc: mchehab@kernel.org, linux-media@vger.kernel.org
Subject: Re: [PATCH] media: em28xx: fix silent audio capture on
 EM2860/TVP5150 reference design
Message-ID: <20260913231013.30b18fcc@foz.lan>
In-Reply-To: <20260913202312.1511971-1-d01.devel@gmail.com>
References: <20260913202312.1511971-1-d01.devel@gmail.com>
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sun, 13 Sep 2026 16:23:12 -0400
d01 <d01.devel@gmail.com> wrote:

> The EM2860/TVP5150 reference design (eb1a:5051, "USB 2861 Device",
> card=29) captures no analog audio.

Instead of touching the reference design, and except if you have the
real em2861 reference card (unlikely unless you're a manufacturer or
if some manufacturer donated one to you), you need to create a 
board-specific entry with the brand name used on it, and use
card=<number>.

Having a generic USB ID means that the vendor of your specific board 
was lazy enough to not store a different USB ID at the USB table inside
its eeprom.

It may also mean that the AC97 chip - either emp202 or a different
model - is wired on a non-standard way. Those chips have multiple 
inputs that are wired on different ways depending on the board.



> The ALSA device yields a flat noise
> floor of about -85 dBFS, identical with the audio cable plugged or
> unplugged and regardless of mixer settings, while video capture works
> normally.
> 
> Audio on this board is not on the em28xx vendor path. Chip config
> register 0x00 reads 0x50 -- bit 0x80 (vendor audio) is clear -- so the
> board exposes a USB Audio Class interface claimed by snd-usb-audio, fed
> by the EMP202 codec's ADC. Which input that ADC listens to is set by
> AC97_REC_SEL (0x1a).
> 
> em28xx_audio_analog_set() does program AC97_REC_SEL, but only under:
> 
> 	if (dev->ctl_aoutput & EM28XX_AOUT_PCM_IN)
> 
> ctl_aoutput comes from the board's per-input .aout field, falling back
> to EM28XX_AOUT_MASTER when it is unset (em28xx-video.c). This board's
> entry sets .amux but no .aout, so EM28XX_AOUT_PCM_IN is never set, the
> AC97_REC_SEL write is skipped, and the mux stays at its reset default
> of 0x0000 (Mic, which is not connected on these boards). Nothing is
> captured.
> 
> Set .aout on both inputs to select the PCM record path from Line In,
> matching the .amux already declared. ac97_return_record_select() maps
> EM28XX_AOUT_PCM_LINE to 4, which em28xx_audio_analog_set() mirrors into
> both channels as 0x0404.
> 
> EM28XX_AOUT_MASTER is included so the master volume continues to track
> the V4L2 volume control exactly as it did via the old fallback, keeping
> the change additive. It is not required for capture -- muting
> AC97_MASTER by hand while leaving everything else in place does not
> affect the recorded signal.
> 
> Diagnosed on eb1a:5051 by writing AC97_REC_SEL directly over usbfs with
> everything else held constant:
> 
>   AC97_REC_SEL = 0x0404 (Line In) -> -21.8 dBFS, line-level audio
>   AC97_REC_SEL = 0x0000 (Mic)     -> -85.4 dBFS, silence
> 
> Then verified with this patch applied and the rebuilt module loaded, with
> no userspace register writes at all: the driver programs AC97_REC_SEL to
> 0x0404 on its own at probe, and capture yields -25.0 dBFS of line-level
> audio once the mute control is cleared.
> 
> AC97_POWERDOWN (0x26) reads 0x420d throughout -- status bits ADC, ANL
> and REF all set -- so this is not an analog-power or GPIO problem. The
> codec is powered and simply listening to the wrong input.
> 
> Note that the V4L2 mute control defaults to 1, which gates the bridge
> audio path via EM28XX_XCLK_AUDIO_UNMUTE in R0F. That is a separate
> issue and is unchanged by this patch, so "v4l2-ctl -d /dev/videoN -c
> mute=0" is still required to hear anything.
> 
> Signed-off-by: d01 <d01.devel@gmail.com>

Please use your name instead of "d01".

> ---
>  drivers/media/usb/em28xx/em28xx-cards.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> --- a/drivers/media/usb/em28xx/em28xx-cards.c
> +++ b/drivers/media/usb/em28xx/em28xx-cards.c
> @@ -1148,10 +1148,14 @@
>  			.type     = EM28XX_VMUX_COMPOSITE,
>  			.vmux     = TVP5150_COMPOSITE1,
>  			.amux     = EM28XX_AMUX_LINE_IN,
> +			.aout     = EM28XX_AOUT_MASTER | EM28XX_AOUT_PCM_IN |
> +				    EM28XX_AOUT_PCM_LINE,
>  		}, {
>  			.type     = EM28XX_VMUX_SVIDEO,
>  			.vmux     = TVP5150_SVIDEO,
>  			.amux     = EM28XX_AMUX_LINE_IN,
> +			.aout     = EM28XX_AOUT_MASTER | EM28XX_AOUT_PCM_IN |
> +				    EM28XX_AOUT_PCM_LINE,

Most boards don't require adjusting aout. On most cases, just amux is
needed. The above setup also sounds weird: why does it need 3 audio lines
there?

>  		} },
>  	},
>  	[EM2861_BOARD_PLEXTOR_PX_TV100U] = {



Thanks,
Mauro
