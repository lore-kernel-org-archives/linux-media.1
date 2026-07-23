Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2864833A9FC
	for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 23:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784850482; cv=pass; b=RjO9+BZdcPpHsmvwniTONR6XAtLVoLWj1SOkAd6PBCfq93WbUl3O4EO1gd749+ViDrKXDYuNRK2Uf48bCwG1Dbradl55Vh5leSIqW2XPf6nN1QJS5Szk2StjDY/EjHEEKWry+g6PmGRxnXTkaRS5A0SVzmW1bKgE4EOvk7QOn0k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784850482; c=relaxed/simple;
	bh=TyLuVUUX/ZaM9OY/LH4HVOmQ2oiQc4G3lPqxlUQIoVM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HVxtl6cr8OABzZm8IOdHnZkxMrcNVRzhhm44LXw4ttq3YFBlnUFUhxcEjBYCYqfeuk1KWcWgHniWpbcad/dB/Aihm1pnBoblRN0GiIUW+36vuYANh2hGqRCdjUvQoqdeJq57JIt+57ihbTn4dTD/qjrs0FT90QIA4bDxo0UXJo0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dPWE8r1z; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dPWE8r1z"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-664f5750b02so169471d50.2
        for <linux-media@vger.kernel.org>; Thu, 23 Jul 2026 16:48:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784850480; cv=none;
        d=google.com; s=arc-20260327;
        b=pAEenZ6ZHgj5m/lIY66Ley51xLpio1CxMqMsxcsj8iv0l1l4iQQwipnXwCes7G99Wv
         7iNxYgKyJo183s1q4deuyQwJIeJa/0fCprpflS4pVfhedCtNppLulehGn0z1XYtLuxlz
         xW0c+4z3dwOMMr2vICV/5jEROOS1b+6anFdb6xmUWjCZqMlVNGayJaKTnkVeHvHd7S5S
         p7n2H+e702H8Z9VrnFqa1vPo6wwgELvN6g6PtyoRVByOGfyl7hFDmd34iul3Wa4YJhTo
         2AFFwlD4mJIZ/owyg5dE4NhMDLcd+1ZP2E7lwmf12Mkyw3cNO0FQRqNgCWvvKS5f0XYL
         9xXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        fh=af2Mrkl9md9VdKHE18tHMZMWysj86XnDfYFULSA1/lI=;
        b=pKFA8zjHtZ/+pm6kpw9wsoxsdlpgug0xl3XbAecPWSgAxCvXudNFTkhjIAuexr7A/j
         uOlkmpyb0lXln9HFxkECya2qDDL1MjeFozy4RjLDPuKKs8qvxPIrSrHNsnJpCH0ORn+N
         UsvZKO5p7YELedGDI8NOpQg39Uu28rVAUe1ONdwQO2wok/szGbKX6bDOz4jp5oPCnwHS
         8Gwfcm28FMcost2N2EqvLifWoIgDWkwOZECPrFTk88vpmY9QoB5VAaEiiP66fTJ5tVFc
         PEyy7yrtsIF82vBUKlVofXDQhCNdEuVskCrMQcBGdcENBdMPuAXyprdCAEGhyweHXRDM
         iRig==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784850480; x=1785455280; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        b=dPWE8r1zaf+VMy6VkcwDGO809IqQ6P/fhtyjIEZ6UlUg4kO4PrbGKfbqYvOkIrHTpT
         3BXgDgadUOsCS3gGf/GVQjyY0lV32u7tf6dMrf1Fyn8T4YQ1DeATbLBw3WZYXOu3lHWf
         EpIYuSVM/1JlWKfkDZKKvfrsDua/KucmviGu+XxKILZBf1mPWataq7U3JSglHZd5cuUB
         RNfXQr9bCdfG5Tf2/9yJZ4ckXFMj1hAOVUuYLR6ptnmyrNdPam6EzhnK4UWLjVSwd6Jb
         nBnwwoSJ0Uhm+qZ3CYp0rXtMUDVvyz9NkEQnYRFF0+Wl10fEbpCfSf3Cx3cj4aZM39Uo
         N4OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784850480; x=1785455280;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sBSg+zmK0rXA8MQwVQ/Rx8kwPD6hENRcbQrpEao+5kg=;
        b=dr/CLoZiCXcItgAycHo/XgtNUpq3RouiemFyArH39MlYsvnME89ryzvcpwQlug7DPv
         CGzGGGm5/FKqLn0SkNRis5qAqRTDONK3owjHIXJQSt0wUwmMKCE3s0oZPo6y2yfNpaMo
         0nSgvwr+ZBdZGR7YYulLvShxP6NzpGQHbhfAC8nA01eEA5n0VaagybDDlMj0XA6OWati
         zVSM8BYUOpudwijyiT/2jjFknHoNGUrJlZL++Xre246orFcYVWS02FnFCl4i052sOFHs
         WRczhdTUvCPdJQy8K/DYI+eQSdVDRYxrlTCAUrxtxiDty49aytHmvtWCxEf26fltlDrV
         3TTA==
X-Forwarded-Encrypted: i=1; AHgh+RqjrRThmJ/3uyJimJuLHRWnUD2earBqWZFOCyofHIn7QB4ENf89vxtXbLMtzV43PyVJLQXEjQ21zXkLow==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywnn4i5s1fyRvFnQhX960dEF0FOC45UDEcxTBOycEVSzv8lXqEF
	Pyn6r9fd6Waks9hd14xZLzOb0UjFtS66VqzBq4DlOz4daza4wsSEw6YBq3E7DgW+TmqrMWSiZZz
	iuRGTCIXbbvndYLMkgVEpoQUvhiylmWQ=
X-Gm-Gg: AR+sD138fYki/SeMnbW43IKwkhCtxnCSw9qA95tYC2U8zPqQ/BWlNWh4qknfMD31tcW
	Mq4MloHQOLxNkQFhUD1MSsZ6NlKrI9+YD+WBVghu0/HcPDUDfw2AWGPGzV1khz4ZKmSbmUsxh10
	cbsEfuk2sFgdCQqbBQpPshC1Vbq7CEJ4TysoQryCNRpkgUU982G50anP6ywyBa4Cw9UZSRZq3+D
	bEDUZ5BV+gfw9NQvorA/ZB/Wcu2o0it1b9ctGLAVMtptMKhrHJcnMUSfNXRYfIlJa1VJQ6cftnw
	A4hGXZZdqeBhHMqMfhQl
X-Received: by 2002:a05:690c:6609:b0:7ec:58dc:f23 with SMTP id
 00721157ae682-81f5856ba5bmr8261157b3.5.1784850480115; Thu, 23 Jul 2026
 16:48:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com> <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
 <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
In-Reply-To: <1ac66aab-8985-4441-8ce1-07e2ea5183bd@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Fri, 24 Jul 2026 01:47:48 +0200
X-Gm-Features: AUfX_mwQpQY6ms6Ddg9sVvPaEi1tUNBsASXfULkmbLix8kQzlJ5kEVuWDGHKcXY
Message-ID: <CAEWPSH4aB4KZsrLx2TESjPvUG0+A_Z_7uuO=5Rd-VidKU9U3eg@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] media: synopsys: hdmirx: add HDMI audio capture support
To: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Sebastian Reichel <sebastian.reichel@collabora.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
	kernel@collabora.com, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

Thank you -- and thank you for reviewing the whole series and testing
2/4. It went through a lot of back-and-forth since the RFC, so having
it land with your Tested-by means a lot.

I'll prepare the follow-ups as separate patches once this series is in:

- The video_device lifetime issue on the V4L2 side (the devm-allocated
  struct with video_device_release_empty that the automated review
  flagged) -- as a standalone fix for the existing driver, since it's
  independent of the audio support.
- An atomicity fix for the GLOBAL_SWENABLE read-modify-write, now that
  the audio path adds a second writer to that register alongside the
  CEC code.

The repeated-suspend wedge I mentioned in the cover letter I'd rather
send only once I have a clean, reproducible trigger for it -- it's
still under investigation and I don't want to send a fix ahead of a
solid repro.

The dynamic codec registration you suggested (bind on the plug event,
read the actual wire sample rate and restrict the codec's rate) is the
direction I'd like to explore after these, once I've looked at what it
needs from hdmi_codec_ops.

Thanks again,
Igor


On Thu, Jul 23, 2026 at 10:56=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/21/26 08:31, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> >> Re-arming will be best option if it works properly.
> >
> > Went back to it and made it work properly -- with one honest caveat
> > at the end.
> >
> > Plain cancel/re-arm could not have been enough as previously
> > written: hdmirx_resume() fully resets the controller via
> > reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
> > audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
> > the worker's error path never re-programs those -- it only resyncs
> > the clock rate and reinits the FIFO. So v4 does:
> >
> > - suspend: cancel_delayed_work_sync() on the audio worker before
> > the clocks are gated (audio_streaming stays set);
> > - resume: if a capture stream is active, re-program the whole
> > audio path (clock from the last known sample rate, FIFO
> > thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.
> >
> > The programming is factored out of hw_params() into a shared
> > hdmirx_audio_setup() helper so resume and hw_params cannot drift.
> > I also checked that nothing in the post-resume hotplug re-init path
> > (plugout/plugin/submodule_init/controller_init) touches the audio
> > bits, so the restore survives the replug dance resume triggers.
> >
> > Measured on the Orange Pi 5 Plus (pm_test=3Ddevices, i.e. full device
> > suspend/resume callbacks, active capture stream with live audio
> > through the whole cycle): on resume the capture simply continues --
> > audio was flowing again the moment the display came back, no
> > userspace intervention, clean dmesg, no oops in any of the ~6
> > cycles exercised tonight.
> >
> > The caveat: a *second* suspend/resume cycle in the same boot leaves
> > the audio datapath silent (the I2S slave sees no bit clock, so
> > capture reads time out) even though the resume restore re-programs
> > everything, and a fresh stream open does not recover it -- only a
> > reboot does. Notably this happens with plain no-stream suspend
> > cycles as well, so it is not caused by (and would not be prevented
> > by) either the re-arm or the -EBUSY approach -- it looks like more
> > controller state lost on repeated reset that neither hw_params nor
> > resume currently covers, likely the same warm-up state machine I
> > described in the v3 testing note (audio needing a video STREAMON
> > after a replug). I am instrumenting the register state next to
> > root-cause it; I'd treat it as a follow-up rather than a v4
> > blocker, but happy to hear if you see it differently -- and curious
> > whether the 5B shows the same second-cycle behavior.
> >
> > v4 follows with the re-arm plus the dts and binding changes already
> > mentioned.
> >
> > One more small thing the audio bit exposes, for a possible
> > follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
> > and the write each take rst_lock separately), and with audio added
> > there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
> > enable racing an audio enable/disable could in theory lose the
> > other side's bit. Mainline today has a single writer, so it is not
> > a bug there. Can send a small patch making it atomic if you think
> > it is worth it.
>
> Feel free to send the follow ups.
>
> --
> Best regards,
> Dmitry
