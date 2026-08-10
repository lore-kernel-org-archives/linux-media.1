Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F4DF49620
	for <linux-media@vger.kernel.org>; Mon, 10 Aug 2026 00:14:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786320867; cv=pass; b=C6OOBVL71cyLe/KI6NlAk7S50kqwy+qBleYFyo1ah1RkvUGwDjyNpO90Wxc86o1dkUUvywpG3sD1RwuwAedkbNQEYlH1qhSPzhEWi2wJJH0NKr7aN4Yz/cIjD7+Abb1W6hEptTSAelxEjSNVkZYBjj1ED/rYWQ7DylACgukpvuk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786320867; c=relaxed/simple;
	bh=JEgqZXe+TmWcFDkQ4RSSR720wWFwjKRWFdTLBUwIihc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bgvNvzyuJUWu2eQ/X/+kWNx+jHj47YtZqEdKh7/2CEMIP/1bXL/zc/xbAFic5zSRI+T+LULAW0KP0fMklLBd6paS7bQVjSdMi3RU/Je9ZDQyE7prDB37Mb/vauEuXeXLyV5clSQSRvdUiyPtfLI1sAnK4pfxoUxjcIy7kQ1HwfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qS9GUrBc; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qS9GUrBc"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38dd55ad76cso1029381a91.1
        for <linux-media@vger.kernel.org>; Sun, 09 Aug 2026 17:14:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786320865; cv=none;
        d=google.com; s=arc-20260327;
        b=ddAVOOqj21w0sILwpDVutgydO1316d5Fc+lXxK/Os1SzwWN69DIJ6aVSQOMMsOhPLg
         YU6+cYFcyzURjKU0nRvWDsRRhOZPhnAnr2WV1HG29BiXnplUdYcFgrhHa3+cqw0qpOMS
         C6Ecd1Srk9vRJf1CBI6j0e0YU1j26XYlxfPGwaQ6bO/+F4oQAAdCxNOXsjeI5bROUmDu
         1zTFuodkLFQhOCd3wYiEVaq+0HMXIQiqKEjXLQQ7Vb2KExYrQxWwmqIlsgNxZkyUX8X9
         JaTdCQzQlx4s37Gkl8DUdB0HuK5gBX6VFnsviRcA4QrAhXeg3F1eqI5A0t8kiU/ICPcF
         yRFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7iBsYXZ6NNe/IK85imXuaVPUbbvLo/YiytAGi0EJQvw=;
        fh=ut9UYEdHq4Z95zDHp6Njjh+u5PNjBmSzT+uumsN0kbQ=;
        b=AtF4xVnxQlcx6byrSHymq6zA96yWdSW24HecDpgpB/+wjtJSSoyyh6mpKxv3CZAxCh
         zLeIX0yB0JM7+2b0OXs1gCfG2B3qZ7qsjnIFsDQtcEGV3wBqxn4DDvqtXq1aTS+W4as4
         sscPQYuF4djB6iYvxvnYZ0ev60xzmzNEO2tHCOD/xsPaH1LjR0wTyYtXpXNkGS5v+Rrt
         Nb+i0zDzdeDtpgw7MS+rEbACKebojklQtpMoPh8LJkiSzz6qAo4F94vOeUSCdpJVGPPH
         6mTfO618h+0JFu7LAwagXRuw73N9BOsJikS6dVdj5SqNqGsNMBHKC1UhdL1F+Aql2u7i
         UK0A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786320865; x=1786925665; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=7iBsYXZ6NNe/IK85imXuaVPUbbvLo/YiytAGi0EJQvw=;
        b=qS9GUrBcCibqljHNUgOD3+eiQj+6oDn1JdmxzBzyLIT18wdZLWcSZwADrhCZmzLHXl
         GAzjRVWGaQO3Vz54UHyWBiPDKuViL2JcZP7kS6TgqnJ8ZEKFkpB5WVu7UV1PRpttQuKk
         wWUTiMM0OE/IrTw47Vxp0aGUXrp//GgGojJQdfx2zbnrBn6hhBeh481GlAQHqap0O/h6
         3Wua+y8wobyshBMN1FCAjmI8FpZZ3l0oTs5wZyd3Pc7J5qriNeC7y+KVMCOskOjMbAC2
         e9Z8i5B3LavRYeEeY9ttiZElB1JIllXzejQLSBoHSfogE2N5BjGA1YlleIQu6pwDH14O
         /Pyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786320865; x=1786925665;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7iBsYXZ6NNe/IK85imXuaVPUbbvLo/YiytAGi0EJQvw=;
        b=KO9Qxdf9mvmvXtp2sgpB+QkhWhXH36k4z2uPF59TjMzfQFEnvmmhhxBg3mowf222SN
         s9WccPHP7C1jUd9tgPxkl9XwAaWjphyd0B1FBTiBvz2HEI22iAf9MArVVLFF65QjBoy0
         wAFgpnlBIObdLDZAGqd/MmwoJ+kPuWIIfTc5AgTjeRv7154Zr5E4GQqfjoRyV4dYczmM
         O2co5xssmSEgLqvsCd5iPpKZXo/3ay3WyGotHIO/lVHYqXXA8AnEc0kG84Sv1zso/F3L
         x7HXmk4IiP9Rtm9iuhUTpiU5+GqiE9D5AAcn4qIshjS0Ao3vY/YRsBuNAwCCa4nKd0o9
         7cEA==
X-Forwarded-Encrypted: i=1; AHgh+RrDidPFsl8qYw2c6mb09sbrXMfH8tJ/pxv6NLySN7awaU6azfj/69DD0qG1zZDDxeo9qNTRYD+Jh86ojw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyjzV2xMXVkheFKMWrFHhEDlLGREKBstTZRonhIMMJshAo6PyfK
	AWADXiUuf3YjXumYFRbMWZnfEIrlSilrd18lLtvhsPiEyoZaaw0bkryEhNdQRDInx6z3X3Juo02
	lt5PtayW07F6zYIuhlrotj6vFK9rHL+0=
X-Gm-Gg: AR+sD12RxTtMatPszdc8KlsCrRdOwvYD1zPTJAnuc20zs+VHxO3T7DbI14iBhHwEnA9
	249cHb7Aqr32dfJmk5HRFkiqeujslQUEWd1AcEkbdnQGTDEVI/IbBBv7MsnrVSuVoHJ8QYdntWP
	XuJm0hdTEwrmEW1hjlClqBM9UM++59+EwPIw4imjWPWKW6VaaIswcLNUScq3qnO8t9Qy2ncmME0
	fth8ZUWHYz7ZySaMTkSFJxKNGFd/xT0wnbvHgNLUYWOeC2eN1vhTGFjHqybj177l+8LnRg1zkJX
	HzCsY+hrVajJlR7/r2Md6RxGRiV+/XaFT5kptASGz/g=
X-Received: by 2002:a17:90b:4c42:b0:38f:cab0:9aa9 with SMTP id
 98e67ed59e1d1-39284703808mr7292370a91.13.1786320865147; Sun, 09 Aug 2026
 17:14:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808230846.12232.alvinhuang0603@gmail.com>
In-Reply-To: <20260808230846.12232.alvinhuang0603@gmail.com>
From: Ben Hoff <hoff.benjamin.k@gmail.com>
Date: Sun, 9 Aug 2026 20:14:14 -0400
X-Gm-Features: AUfX_mx7VV0p1_H-JfpjuXCXhMo3xwUEcp8S0EvqHlA876mhXySGmYpFX3SWUf4
Message-ID: <CAMSzxxTpHyUVud3Lwrg3Q5==OuHq3MBrwxyhmysnFhCsWzJmNg@mail.gmail.com>
Subject: Re: [PATCH] media: hws: Wait for IRQ handler before returning buffers
To: Hao-Qun Huang <alvinhuang0603@gmail.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, 
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I reproduced this on HWS hardware.

Without the patch, the synchronized STREAMOFF/VDONE test produced vb2
ownership warnings. With the patch applied, 500 attempts entered the
instrumented 250 ms post-snapshot VDONE window without an ownership
warning or capture failure.

Reviewed-by: Ben Hoff <hoff.benjamin.k@gmail.com>
Tested-by: Ben Hoff <hoff.benjamin.k@gmail.com>

On Sat, Aug 8, 2026 at 11:08=E2=80=AFAM Hao-Qun Huang <alvinhuang0603@gmail=
.com> wrote:
>
> hws_stop_streaming() disables capture and then collects the active and
> queued buffers straight away. Clearing cap_active and setting
> stop_requested only stops a VDONE handler that has not checked them
> yet; one already running on another CPU has passed those checks and
> cannot be recalled.
>
> That handler snapshots v->active into a local pointer and drops
> irq_lock before it touches the buffer, so stop_streaming can run in
> between. Without a next_prepared buffer both paths complete the same
> buffer, and the second vb2_buffer_done() hits the WARN_ON for a buffer
> that is no longer active. With a next_prepared buffer the snapshot is
> the only remaining reference to the old active buffer, so
> stop_streaming returns without it and vb2 reports "stop_streaming
> operation is leaving buffer %u in active state" before completing it
> with an error.
>
> Either way the driver breaks the vb2 rule that stop_streaming has to
> give back every buffer it owns before it returns.
>
> Wait for the handler once the hardware is disabled and before the
> buffers are collected. The live mode change and the channel cleanup
> paths already do this around the same collect helper.
>
> Fixes: ba07fd2f5742 ("media: pci: add AVMatrix HWS capture driver")
> Assisted-by: Claude:claude-opus-5
> Signed-off-by: Hao-Qun Huang <alvinhuang0603@gmail.com>
> ---
> Found by code inspection; I do not have an HWS card, so this is not
> reproduced on hardware. What convinced me is the asymmetry inside the
> driver itself: the live mode change path calls synchronize_irq() before
> the same hws_video_collect_done_locked() helper, and hws_stop_streaming()
> does not.
>
>  drivers/media/pci/hws/hws_video.c | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/drivers/media/pci/hws/hws_video.c b/drivers/media/pci/hws/hw=
s_video.c
> index 18e4bc6901d3..7f7e51040926 100644
> --- a/drivers/media/pci/hws/hws_video.c
> +++ b/drivers/media/pci/hws/hws_video.c
> @@ -1292,6 +1292,8 @@ static void hws_stop_streaming(struct vb2_queue *q)
>         WRITE_ONCE(v->stop_requested, true);
>
>         hws_enable_video_capture(v->parent, v->channel_index, false);
> +       if (hws->irq >=3D 0)
> +               synchronize_irq(hws->irq);
>
>         /* 2) Collect in-flight + queued under the IRQ lock */
>         spin_lock_irqsave(&v->irq_lock, flags);
> --
> 2.43.0
>
