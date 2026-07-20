Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20B8641B363;
	Mon, 20 Jul 2026 12:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784552132; cv=none; b=qHv1cWSDkaY8AU6CEwZOVyJED4rDAtbDt/ujeGEOI0OBIr/p7n+S81XHf41ebp4DRitY/WLeph/woUlLoJr77Gu/DxFD4m/Dja+bAGnjmBZf02d74JzTX+dKLj2ZRdtpPBYBppKFWIdJfOD3vCup1UddWAR4tCPsqqOKShySzgs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784552132; c=relaxed/simple;
	bh=EqZttyW6Fr3BaQGNy8OhPuzjAQ7uUs3mJgEtQ65g+QU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=PmII5Yw6VW85wpdpBmnxXsGthpp1bNdQ7T2A+d/ZbOgsBgyhuogrCOhv+I2B2DOyW4V9Nzfw2v658q2hz2lMG1mYwrtCDg1owqU1O8G8MwAQ3XBbMI0J1KQhgPEqNyWbepb+cML9lbGXPKsb0dRZMkqopznrUJ0jxOv/h7xlpvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S6293riy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S6293riy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EFD4B1F00A3A;
	Mon, 20 Jul 2026 12:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784552130;
	bh=G4BAt+bKnO8iM/WmRA2+M8A3uhOKwiT2ZWRrzKhJD8Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=S6293riymmJW22O7WsPD7JTWQORWazSgtg23XD2SgqmuD/YXO2HMeBUiPqB0j7UQu
	 EXUU7p8Rtc4gQphOCSZDBioyOYpb5an0yPlIg+bh2WJvNsb7Fr6/+51HxIOEfh2kZm
	 TNEtOFwcsAjL9EX6wJ7AW5VNMVNykShpZAowro0XabYNTi50U1JW8ojwbJkG6RrMeB
	 o60dAVXEHT6NWHYP1lYQ6xjQfRWxb9iies24BnjE97P7IS7wOiSpMKFPDKBqszPH9R
	 1tkh0WTeU201dsg59s8sgKcGurjkn/NgmW9dW9G199Q1dTxSNQi/XXLCCaBe7i94l7
	 4FlXdSY4ySWKA==
Message-ID: <035192d8-9d6e-4e04-ad1b-56f52c11933d@kernel.org>
Date: Mon, 20 Jul 2026 13:55:28 +0100
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_venus=3A_encoder_job_execution_hard-resets_SoC_on_S?=
 =?UTF-8?Q?M7325_=28sc7280-compatible=29_=E2=80=94_extensive_analysis=2C_nee?=
 =?UTF-8?Q?d_wrapper/GDSC_insight?=
To: Kirill Ermolitskiy <00vopoj00@gmail.com>, linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com,
 linux-arm-msm@vger.kernel.org
References: <MOR1FYP_9xkM8GfpziB5D4Q3H5XLHq6MowZkeFMhI_49wkvgOVxXHbtJYMHHnToR_DOz2HU3N102cMMRPNWfLA==@protonmail.internalid>
 <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
From: Bryan O'Donoghue <bod@kernel.org>
Content-Language: en-GB
Autocrypt: addr=bod@kernel.org; keydata=
 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
In-Reply-To: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 20/07/2026 13:22, Kirill Ermolitskiy wrote:
> Hi,
> 
> On a mainline port of the Xiaomi 11 Lite 5G NE (sm7325-xiaomi-lisa,
> SM7325 "kodiak", sc7280-compatible venus, kernel 7.1.2, postmarketOS),
> the Venus decoder works fine (H264/VP9/HEVC/MPEG2 via v4l2 m2m), but
> executing any encoder job instantly hard-resets the SoC below the
> kernel. I've spent considerable effort narrowing this down and I
> believe I've hit the limit of what can be done without wrapper/GDSC
> documentation.
> 
> Reproducer (100%):
> 
>    ffmpeg -f lavfi -i testsrc2=size=176x144:rate=10 -vf format=nv12 \
>      -c:v h264_v4l2m2m -b:v 100k -t 5 /tmp/e.mp4
> 
> With venus dyndbg + custom HFI tracing on UART, the full session
> negotiates cleanly: SYS_INIT, SESSION_INIT (acked), all
> SET_PROPERTY/SET_BUFFERS (accepted), LOAD_RESOURCES (acked), START
> (acked), 4x ETB. The SoC dies the instant the first FTB is issued and
> the engine starts executing — no SYS_ERROR, no EBD/FBD, no SMMU fault,
> nothing from the kernel. XBL log after reboot shows "PM: Reset by
> PSHOLD / Warm Reset", i.e. a TZ/secure-level reset. HEVC dies
> identically (engine-level, not codec-specific).
> 
> What I've verified/excluded (all cross-checked against the downstream
> yupik tree):
> - memory-region (0x8b200000/0x500000), SMMU SID (0x2180/0x20), CP
> ranges (cp 0x0+0x25800000, nonpixel 0x1000000+0x24800000), clock set,
> GDSC offsets (0x3004/0x2004): all match downstream.
> - Firmware: vendor vpu20_1v.mbn, Xiaomi-signed (Xiaomi Root CA /
> Attestation CA in the cert chain), reproduced with two firmware stacks
> (old and HyperOS OS2.0.8.0 coherent TZ+vpu pair). Venus hw version
> 6.40.a.
> - Reproduced identically with the iris driver (sc7280 platform data) —
> two independent implementations, same silent reset.
> - Encoder scratch buffer sizes x4: no change. Runtime PM pinned: no change.
> 
> The interesting part is the power matrix around vcodec_control_v4():
> 
> 1. Stock (dev_pm_genpd_set_hwmode, HW_CTRL_TRIGGER on mvs0_gdsc):
> set_hwmode returns 0, engine powers up on first frame -> instant
> PSHOLD reset.
> 2. Forced legacy path: WRAPPER_VCODEC0_MMCC_POWER_STATUS BIT(1) never
> asserts (readl_poll_timeout -110, register reads 0x0). No crash — but
> ignoring the timeout shows the engine never leaves clamps: session
> runs to FTB, zero EBD/FBD, fw eventually non-idle ("wait for cpu and
> video core idle fail").
> 3. GDSC forced SW-mode via genpd, or ALWAYS_ON: same as (2) — rail up,
> engine clamped, no execution, no crash.
> 4. video_cc_xo_clk (0x7018 branch + 0x7000 RCG): missing entirely from
> mainline videocc-sc7280.c, downstream marks it CLK_IS_CRITICAL. Ported
> it (confirmed on at 19.2 MHz in clk_summary): no behavioral change in
> any mode.
> 5. Dropping en_rest_wait_val/en_few_wait_val/clk_dis_wait_val from
> mvs0_gdsc (keeping XBL defaults): still resets, but behavior became
> nondeterministic across runs (one run showed a msg-queue response
> after FTB before dying) — smells like power-ramp timing.
> 
> So: the encoder engine only actually executes when the MVS0 GDSC is
> under HW control, and that execution/power-up hard-resets the SoC;
> every software-controlled arrangement leaves the engine clamped (MMCC
> handshake never completes). Downstream (msm-vidc + gdsc-regulator with
> qcom,support-hw-trigger) uses hw-trigger on the same silicon and
> encodes fine under Android, so the hardware is capable — something in
> the mainline hw-trigger power-up sequencing differs fatally on kodiak.
> 
> Questions for people with wrapper/GDSC documentation:
> - What does the hw-triggered MVS0 power-up require on kodiak/sc7280
> beyond what mainline gdsc.c + venus do today (AON config? NoC LPI
> handshake? different GDSCR sequencing)?
> - Is the sm7280_reg_preset ({0xb0088, 0}) sufficient for this part, or
> does downstream program additional AON/wrapper registers before
> encode?
> 
> I can test patches quickly (UART attached, one-command reproducer,
> full HFI traces of both healthy decode and dying encode sessions
> available on request).
> 
> Thanks,
> Del'aRun

Quite likely to be operating point failure i.e. not ramping voltage to 
match clock.

Anyway we're doing a new kernel release so I'll try to replicate on 8250 
which is ~ the same silicon.

---
bod
