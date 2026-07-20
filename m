Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 830953E928F
	for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 12:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784550182; cv=pass; b=pVqBzYyA3BmiidihpwmCnIjgueD/ZeUHrZtKuqzGokFEnu6HWbglANVbFOpH2RSNanWCqlQKHTpI3LRz6c5GPu/yUgpLiQ4mtSs8XaPzOq6lILzIM6mh1UC3d7Ht49yhQH0RvL73lE+bTkuMELhvqde9+ac+YVw86fhPoTOpVkc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784550182; c=relaxed/simple;
	bh=0mitG+8FThZx81ptAQLduASuicVYCnxMrJeUe80oBYE=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=GdsZToNWV4V23Mwthr4TQG6nBTWCdGkwQdmP+4ECMiHM3E1JmW1PsL3ega4f/SwAvy41/lK4VZOSSH5G9UxUrGqB7zvjC0j11piw0CefN1xRzjMkJq8IqGy4JJeSrFo9msjtEG3wsY0IasNmFhn+oV2WhPhIXnY4Kj7w69vGslg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XqywrI6J; arc=pass smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XqywrI6J"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2ceab75934dso104562105ad.2
        for <linux-media@vger.kernel.org>; Mon, 20 Jul 2026 05:23:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784550181; cv=none;
        d=google.com; s=arc-20260327;
        b=K08r9Wj+mi/paHCYNZkPxcP3nv2Ifw75ZI5vPRZaTAwU+Ka9iS9yeCBAa1k9nyhn/d
         GugVzVrRu0DDPieLL4QcczJ3wp1434IwpXtL3onRpCVLupLzLdX43sWXzG6GliK7EPFg
         IkSgDRrp+pl9l18nTk8hKGJDzL7awv5pKkTyHAk5gyWMyY7iOBa8uqx5WGDqxrr6XcHF
         OQ359dhNluoFz/yF543IKHWrIs+xVon41llQq2PjJu06mQhfF01yZXoeAsn8EOqSZE8j
         Pt16NG0eG7mO7M090HKhoNra7jGZ4tw8D2s2x5Z9s4iVOfNeg7J8TiatZa+l7pneZz4b
         j5OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :mime-version:dkim-signature;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        fh=ut8VfA+08RKNjuCm9gciNCPBPsJoXrkKr/q61lMoWWs=;
        b=CHOFnY8ug/n/Pc7Z9ruvW1qGnajQ0SHNrORPDT1UOyZwldbxU87g0k6I0YqjiyjG7Q
         YPb0EYac1Tdgeida+DOQC8ePoWpNX9V++dYOIUa1sXz6fYkVyfqUtmGl1p9Rf0D68WCb
         gF9yPHAdPyv3P+GiJTQzimWvNgSw6Bh3luhpEmNcklY+Ujni1J2nrPxGhs2Apdq8Kt9n
         /U3mOZrTrHWJIt/xyKoma+wQSsk/47bpcjKQjID14vYl2GuTrtvAEJ0FTGvTaKTrzxBG
         Ekr3AXNxgJdGgBluviD26p+0zpJugLcg0re32BNAViowvQ4we+dO6fFe1USCSgp91hBi
         FYSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784550181; x=1785154981; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        b=XqywrI6JjYaGJJm/X2wbxd1M3unL6rxNfSeGuIdupR4+SDf+KigujgoR6j2dPl3B5Z
         dx4/S1Vis53oOEOeAObBE9L+RsaRGPXUi10+kynrqwBujCg3Vl9aw4i33IePRU+5Wlln
         b09o8qohuIi7vp+yq6UBKKttyz1QTJfyixux5CZlgU0ERuEt2LL4Rmi55ztBZFdOQ63U
         skucKOcQem6w8rjzAuzG7aOPxB3KKFFLisqAi8j2YiEWrLfZ/1GveM32tp0pAdcgMgQ4
         Kjmj/6/Asy7uh7JSJ60mQp/Db8qfA58hl78t/eZQ3pHzmKA7CDwv4a9Sspuv4sYJI+tN
         gP8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784550181; x=1785154981;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=EElgMrmvO1hr91/z88S9QUFIgNeRTIFWBxAntyFjN/o=;
        b=Qag7Tc6j760FgxsC0SbuHXlMPUcUU3pAeSw/FkEhXXlVTXoSUzSnwebUsuxs2eOJDS
         +HcH7pY3SMfhYGrm2iIpWbHU3ui2QkapEhfQEJHantdNYQPB7K/kMRoMVKcLsAL06W+o
         0nVOPEEXmAY1/TTQKRSMZVqDg/wAPV8fAYfd/5NMi2DL1LENewxISrBvaZwooWQpOfZx
         KlPTY9vg1gaum5TElV/buQA2vzbrcTwK9ASim3Lfl80TTnrYVaofSNsjUAx6AoQxsFeN
         KJDTAC5jPg0omxWJqX4h72tCMG68fRW1/1qaatv9eIK7PW+QB+DSU3W9lUuq+7cIICy5
         U95Q==
X-Gm-Message-State: AOJu0YxhhrFwfIhXDJP48rIHqDtg1km5bU8L2lYGhh1o79RCAFag9I4l
	1/y21I/vq5wroLbySrH+GnuzZ/DHhbZv+LPz2shQU5DjG4AwO61WEV96BHGixHVaM+QhEc+pBIZ
	qlrRtW4iy2MZmPENSFrZc0TQAKKsecrwYlg309lei+Q==
X-Gm-Gg: AR+sD10Dl3DyJnn14kIxXvdpe3Vi2ps1s009n/GkgmOTS+/5TQCb/A0l/ojpccDRbGr
	UCcOjtbyMIPyACKNm3UbQUTYsraqel0E0q30NtIU7a+jrIVrqOU7kJPGbWBL4WQgeVoqXUFfQWb
	0Y2zoEm4G1QbKgxnLl7Rs4JsKXvzohcd9Qlu6RdwdrSeErk0xRV/RqFJ15nP0AD3GN4djdHR7Ez
	L1mzVTh5mBzyMKLB3OoXLqZbQ5Nk8G7sDq+ft0IdGzXXRZ61mwg+rLjf/nU
X-Received: by 2002:a17:902:fdae:b0:2ca:ecf6:910e with SMTP id
 d9443c01a7336-2cf3466a93fmr155729425ad.0.1784550180710; Mon, 20 Jul 2026
 05:23:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Kirill Ermolitskiy <00vopoj00@gmail.com>
Date: Mon, 20 Jul 2026 16:22:48 +0400
X-Gm-Features: AUfX_mwaO4JEgK4MvbPx7H0QEU-64ZjDqzMHa6VLQXSHts_xmQIs7yaGScXS29M
Message-ID: <CADRRrN12FvS3v3c3on69XLErB9i8ih=LgJOGaKhYYT7KrZKe2g@mail.gmail.com>
Subject: =?UTF-8?Q?venus=3A_encoder_job_execution_hard=2Dresets_SoC_on_SM73?=
	=?UTF-8?Q?25_=28sc7280=2Dcompatible=29_=E2=80=94_extensive_analysis=2C_need_wrapper=2F?=
	=?UTF-8?Q?GDSC_insight?=
To: linux-media@vger.kernel.org
Cc: vikash.garodia@oss.qualcomm.com, dikshita.agarwal@oss.qualcomm.com, 
	bod@kernel.org, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On a mainline port of the Xiaomi 11 Lite 5G NE (sm7325-xiaomi-lisa,
SM7325 "kodiak", sc7280-compatible venus, kernel 7.1.2, postmarketOS),
the Venus decoder works fine (H264/VP9/HEVC/MPEG2 via v4l2 m2m), but
executing any encoder job instantly hard-resets the SoC below the
kernel. I've spent considerable effort narrowing this down and I
believe I've hit the limit of what can be done without wrapper/GDSC
documentation.

Reproducer (100%):

  ffmpeg -f lavfi -i testsrc2=3Dsize=3D176x144:rate=3D10 -vf format=3Dnv12 =
\
    -c:v h264_v4l2m2m -b:v 100k -t 5 /tmp/e.mp4

With venus dyndbg + custom HFI tracing on UART, the full session
negotiates cleanly: SYS_INIT, SESSION_INIT (acked), all
SET_PROPERTY/SET_BUFFERS (accepted), LOAD_RESOURCES (acked), START
(acked), 4x ETB. The SoC dies the instant the first FTB is issued and
the engine starts executing =E2=80=94 no SYS_ERROR, no EBD/FBD, no SMMU fau=
lt,
nothing from the kernel. XBL log after reboot shows "PM: Reset by
PSHOLD / Warm Reset", i.e. a TZ/secure-level reset. HEVC dies
identically (engine-level, not codec-specific).

What I've verified/excluded (all cross-checked against the downstream
yupik tree):
- memory-region (0x8b200000/0x500000), SMMU SID (0x2180/0x20), CP
ranges (cp 0x0+0x25800000, nonpixel 0x1000000+0x24800000), clock set,
GDSC offsets (0x3004/0x2004): all match downstream.
- Firmware: vendor vpu20_1v.mbn, Xiaomi-signed (Xiaomi Root CA /
Attestation CA in the cert chain), reproduced with two firmware stacks
(old and HyperOS OS2.0.8.0 coherent TZ+vpu pair). Venus hw version
6.40.a.
- Reproduced identically with the iris driver (sc7280 platform data) =E2=80=
=94
two independent implementations, same silent reset.
- Encoder scratch buffer sizes x4: no change. Runtime PM pinned: no change.

The interesting part is the power matrix around vcodec_control_v4():

1. Stock (dev_pm_genpd_set_hwmode, HW_CTRL_TRIGGER on mvs0_gdsc):
set_hwmode returns 0, engine powers up on first frame -> instant
PSHOLD reset.
2. Forced legacy path: WRAPPER_VCODEC0_MMCC_POWER_STATUS BIT(1) never
asserts (readl_poll_timeout -110, register reads 0x0). No crash =E2=80=94 b=
ut
ignoring the timeout shows the engine never leaves clamps: session
runs to FTB, zero EBD/FBD, fw eventually non-idle ("wait for cpu and
video core idle fail").
3. GDSC forced SW-mode via genpd, or ALWAYS_ON: same as (2) =E2=80=94 rail =
up,
engine clamped, no execution, no crash.
4. video_cc_xo_clk (0x7018 branch + 0x7000 RCG): missing entirely from
mainline videocc-sc7280.c, downstream marks it CLK_IS_CRITICAL. Ported
it (confirmed on at 19.2 MHz in clk_summary): no behavioral change in
any mode.
5. Dropping en_rest_wait_val/en_few_wait_val/clk_dis_wait_val from
mvs0_gdsc (keeping XBL defaults): still resets, but behavior became
nondeterministic across runs (one run showed a msg-queue response
after FTB before dying) =E2=80=94 smells like power-ramp timing.

So: the encoder engine only actually executes when the MVS0 GDSC is
under HW control, and that execution/power-up hard-resets the SoC;
every software-controlled arrangement leaves the engine clamped (MMCC
handshake never completes). Downstream (msm-vidc + gdsc-regulator with
qcom,support-hw-trigger) uses hw-trigger on the same silicon and
encodes fine under Android, so the hardware is capable =E2=80=94 something =
in
the mainline hw-trigger power-up sequencing differs fatally on kodiak.

Questions for people with wrapper/GDSC documentation:
- What does the hw-triggered MVS0 power-up require on kodiak/sc7280
beyond what mainline gdsc.c + venus do today (AON config? NoC LPI
handshake? different GDSCR sequencing)?
- Is the sm7280_reg_preset ({0xb0088, 0}) sufficient for this part, or
does downstream program additional AON/wrapper registers before
encode?

I can test patches quickly (UART attached, one-command reproducer,
full HFI traces of both healthy decode and dying encode sessions
available on request).

Thanks,
Del'aRun
