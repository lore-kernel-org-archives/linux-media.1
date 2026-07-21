Received: from mail-yx1-f54.google.com (mail-yx1-f54.google.com [74.125.224.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F4534DCF3
	for <linux-media@vger.kernel.org>; Tue, 21 Jul 2026 05:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784611887; cv=pass; b=Jem4y4KDorE1mA5VCj5BKuQ07sU0rm1N7J0G4fQxKnGTyOU6tBeWVm5CLWgrDLO/2IgggLQU6nCk2XXV7Z4yYdZxPBB1yrMtbdVpk0qIBVs7p1kbW7SoViG7B4RSpjtTdgQFefXoEBKppiV3Ms36Cb7gU7CTwNwQliMDxgFjp1o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784611887; c=relaxed/simple;
	bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QCFpURM9Uda7WmsxtiYWUkRWfkx9cBO2a6SpwC3mBlylOxftAGCcIxELfU9w7+YJy2Q0MmKcTOlu6UTn5LcIfJzLU/f2Uqs6JdIJUXrKw0fbCjRqTSuTdZ4ABGxtyJSnWSh/IgCYxhZGVVXp4g8tzoUFeTW41NY3GUeh79vvv1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UVx17kWp; arc=pass smtp.client-ip=74.125.224.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVx17kWp"
Received: by mail-yx1-f54.google.com with SMTP id 956f58d0204a3-6646fd19d8cso1288842d50.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 22:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784611885; cv=none;
        d=google.com; s=arc-20260327;
        b=PsRyYyl5hcFrL7v+bjtgr2sLdN0W7MSe1NiFJYN4j42tGpsKZgZZKqj7l+C6tF17f9
         a28mTe0msr0RfwuvHRLzvhbZP1ny87Ee2f+PmQK02uHRsXg3xdtcV6iPbzuXqbaS00lb
         K1s5VLfeJDYVNPTWE5ZZENfh20ts0wQMbzQfdE46yKCQECEdfFDGpzfuw6FRe19dJXy7
         uqqdbgZLqvY4zzsaSNHWjsscgBq3/h2kwbAL0oY26V2DDHn9Tr4jcwX+GnL9I+aDdfM1
         e6J2ArCRHly5fPcRw0gbM6v5q/946zDm58BoL8tE4a5jlJDUK5TxbK4B8V/lgE3hckCl
         9gog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        fh=WVA5ddoShgvudBUO4TDE/Pf9byZ8uU2Q8GgDyuEQ/qw=;
        b=ZhgdGQCB6injt8DSlDROzgmSP6Gh8xcJylouK2oQICmwma8Q/+K/WbQD11kJ5bur9+
         +nhPSfjeIHsbxPMPzn/bIS1f3j/90B5UuAT9/uspv3QFJPp7XRoXJC4vONvrE5sukz72
         XWbTyto0G25AcXA2eNR97NBZt4+QfdR0HPyU3rXObTVOU/HYjnYujaI1zWKkc63Ahc91
         Zw0aiuqLyv5Zq/lSHFf9FGuo4FAQHzT/3k9ghqjth66MTiwqgiE/wF4FkjoOBNNa+AkZ
         clvX//4Y7ihZK2/aiMnWTbgJ3fzCkOMLdDfOM3VH0FXFKs+tkoTwmOzt5OHHvvmM/Myb
         HqZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784611885; x=1785216685; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=UVx17kWprd1A0hwIg/+8+jMQ1y/KJW3JNnrpqXE+igyI5bz/PdmD8FSq5/2lM3qHrQ
         ihyGGh619Z7iPulsibOexOm52HKXUo92rYKw44x5oK2rT8Sga47gZn2FfcJCfu0hQzjq
         9/GcTRBTLQxdEO36/kiMmhVbX3vVBVhSxOA01/rhEuzrOXIQ4vXW1vekyLZ6IK5XAPry
         Xme/DzIpHVaMgTguh5r6G9CoJ4DQzMa5baMfvxWoSsOwxUeY2/0yT+2FmxMXqd+Di3Kk
         IgXZzmMm0owmeenjMtWnnqAKB3EmrsYkuTlE8y0Iw2KAEOYpKgOCwx0JkprQu9L5kR4W
         xdqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784611885; x=1785216685;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2TB196GaR66SwyFsnNzabKS/+vodO/WvG61qZe4uFOY=;
        b=mvITBglgttvBFXB9jr1GRNojSbxoxNBX151jgJ4ZnEE+raOyUwUTUcjacEBdmvRuw+
         CAbiAZ9JEtQ6xcGgmWONB8z/QbQMhquNBOJO/Rvh0CTVrmK4rMdYRbPJLuDtPYiSVeHk
         fyOC0RzbKmmEJ90HZRJ4qk4RBbJkOUMqob6GTo8Nh0blG0TG7NDuAH3ge2/CQdMxBbb5
         VcEpHGfsrX+tIWc1pK+E5K0GSsZ90wN4zfpxSwhuqmNUE5dqLXPwhUylulXBYPh061e9
         SZYNrDCVe8hwc3Hnr3ytCMjiTdzOSG06NdIvBcGeK18AAcT7C+XqGrp3ZoktCDhnYBtt
         sqcg==
X-Forwarded-Encrypted: i=1; AHgh+Ropo5NtqcolYbB+WWMU0N2Uk11rayWsETLgPsadFnMclZqokGfrRKzdI7ILwT/ocmU50vx903w7qHxtKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyBAixcLEJMuW0A9Ah6QnV7ZVKR8EQmwdL8UP6C/DUOivalo92l
	rNnbT540HfzAEfK+gPMA9H5b7PwsA83ZhOv36wgOrbHPS5tOH7aBgQoasMNm3It0K83aW2vvXbt
	W9WkMyZXfEbIdT6DD9wR5bxsJqqyaDhQ=
X-Gm-Gg: AR+sD100YevmPyzbNhuTj3+yq/u1BH+QxBx0TPb59j5FVmfW/mhSTeDM5dVV7EjVh+/
	YL5x4lNj2gTN6VbWDWA0V9wHl5lzdYZGfIXy5vHmsvg7yaqvXu2OxnZmsn2Hk6hQXVYZIj5+mUq
	VDBZj+2EXsegwiswqyOaMV8Ss1Sw7Cw12Jjm8v1Z4IL7j0BA2+uH9qiblHqKzYngcHaHMWg1hBG
	TKeiXxwFisviBmuW61sdJG3qRklYiDeb67Ub9K/ksbAC1fa1Dc6SBTTMQmAq06YtVy83PbhNGKF
	YVnTftJ9W2EBp9v9Rj4E
X-Received: by 2002:a05:690e:e26:b0:664:ae68:33d7 with SMTP id
 956f58d0204a3-6683bdaf398mr3367592d50.9.1784611884801; Mon, 20 Jul 2026
 22:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260718085728.6797-1-royalnet026@gmail.com> <20260718085728.6797-3-royalnet026@gmail.com>
 <25922edc-4ff1-4d28-9a64-2c28b2b690cb@collabora.com> <CAEWPSH70FecQRuGtA=S8+_CnLY5sMyf1j57Uwzwv54zceS1HZg@mail.gmail.com>
 <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
In-Reply-To: <b8d63f61-b73e-412e-8119-ced1afdd4551@collabora.com>
From: Igor Paunovic <royalnet026@gmail.com>
Date: Tue, 21 Jul 2026 07:31:13 +0200
X-Gm-Features: AUfX_mxmfnzPqEwa71ax-VO-JiPM0c52nSKLc5Ko0WZ2ScXDIi8A0Y6FL5e5p2A
Message-ID: <CAEWPSH5j3tYNb1JKRGwa00PVnYAgCKS+B-Qz07D8Z7TJea5cMw@mail.gmail.com>
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

> Re-arming will be best option if it works properly.

Went back to it and made it work properly -- with one honest caveat
at the end.

Plain cancel/re-arm could not have been enough as previously
written: hdmirx_resume() fully resets the controller via
reset_control_bulk_assert/deassert in hdmirx_enable(), wiping the
audio configuration (I2S_EN, AUDIO_ENABLE, FIFO thresholds), and
the worker's error path never re-programs those -- it only resyncs
the clock rate and reinits the FIFO. So v4 does:

- suspend: cancel_delayed_work_sync() on the audio worker before
the clocks are gated (audio_streaming stays set);
- resume: if a capture stream is active, re-program the whole
audio path (clock from the last known sample rate, FIFO
thresholds, I2S_EN, AUDIO_ENABLE) and re-arm the worker.

The programming is factored out of hw_params() into a shared
hdmirx_audio_setup() helper so resume and hw_params cannot drift.
I also checked that nothing in the post-resume hotplug re-init path
(plugout/plugin/submodule_init/controller_init) touches the audio
bits, so the restore survives the replug dance resume triggers.

Measured on the Orange Pi 5 Plus (pm_test=3Ddevices, i.e. full device
suspend/resume callbacks, active capture stream with live audio
through the whole cycle): on resume the capture simply continues --
audio was flowing again the moment the display came back, no
userspace intervention, clean dmesg, no oops in any of the ~6
cycles exercised tonight.

The caveat: a *second* suspend/resume cycle in the same boot leaves
the audio datapath silent (the I2S slave sees no bit clock, so
capture reads time out) even though the resume restore re-programs
everything, and a fresh stream open does not recover it -- only a
reboot does. Notably this happens with plain no-stream suspend
cycles as well, so it is not caused by (and would not be prevented
by) either the re-arm or the -EBUSY approach -- it looks like more
controller state lost on repeated reset that neither hw_params nor
resume currently covers, likely the same warm-up state machine I
described in the v3 testing note (audio needing a video STREAMON
after a replug). I am instrumenting the register state next to
root-cause it; I'd treat it as a follow-up rather than a v4
blocker, but happy to hear if you see it differently -- and curious
whether the 5B shows the same second-cycle behavior.

v4 follows with the re-arm plus the dts and binding changes already
mentioned.

One more small thing the audio bit exposes, for a possible
follow-up: hdmirx_cec_update_bits() is a non-atomic RMW (the read
and the write each take rst_lock separately), and with audio added
there are now two writers of GLOBAL_SWENABLE, so a CEC adapter
enable racing an audio enable/disable could in theory lose the
other side's bit. Mainline today has a single writer, so it is not
a bug there. Can send a small patch making it atomic if you think
it is worth it.

Best regards,
Igor

On Mon, Jul 20, 2026 at 4:37=E2=80=AFPM Dmitry Osipenko
<dmitry.osipenko@collabora.com> wrote:
>
> On 7/20/26 15:30, Igor Paunovic wrote:
> > Hi Dmitry,
> >
> > Great to hear it works on the 5B -- thanks for testing!
> >
> > Agreed on the -EBUSY guard, done in my tree exactly as you wrote it.
> > It also supersedes the suspend cancel/re-arm I had queued from the
> > bot review: with suspend refused while audio_streaming is set, the
> > worker can never be armed at suspend time, so those hunks are
> > dropped.
> >
> > v4 follows shortly with this plus Sebastian's dts restructuring
> > (shared disabled-by-default card in rk3588-extra.dtsi, renamed to
> > "RK3588 HDMI-IN") and Krzysztof's binding comments (dai-common.yaml
> > reference + unevaluatedProperties).
>
> Re-arming will be best option if it works properly.
>
> --
> Best regards,
> Dmitry
