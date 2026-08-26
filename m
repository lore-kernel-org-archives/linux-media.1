Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FF923D9DC4
	for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 13:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787751915; cv=none; b=cLq+PxcNxkNEJyPiJoyZhR6NA7SbBqESA9HmjrjXNMGVmyNoIHZaF7CEfdkGKylgyImltSqzvUSYzNWxZWfdC2OFaadnX3lCo8A/If4nEXIX5OD/fgMv3axnVSJImBKOLu6tLFr6lLMbydMsxTrVvyPtdy54dwgkvsmcgr+cOpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787751915; c=relaxed/simple;
	bh=vuGhCPpXhEKiyjkY2Zl3bS9XBYK46CjoNqSao+yAVu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ovjOJ/X1OkV883WdCpIC8JiyY2LNuDVFD6t8EwEQApohZnNHhGIP6VC+0ZHtYRgLwkGQ6zS7lFa6hJNq5TgyZyAJsnVizJqQpdNBqn9ONywmue/xzQReHnR+UlSwe9Q1BoFr1JXYKolNdWW9MFGwPyFr+l12kR4vs/hIKmM8YXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com; spf=pass smtp.mailfrom=jphein.com; dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b=wtWd7BXq; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=jphein.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jphein.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jphein.com header.i=@jphein.com header.b="wtWd7BXq"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caed617615so10754925ad.3
        for <linux-media@vger.kernel.org>; Wed, 26 Aug 2026 06:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jphein.com; s=google; t=1787751904; x=1788356704; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=L7hvoCmTHP0bqd1CBKEjrUbKs431WZODQPlvf5quuUI=;
        b=wtWd7BXqhwkGy78fxUY8cme46V0g1zj670eyV6qDzLqQlqmMvc8uYL5sDFZEaXV265
         /AhX89YkuAJ7Zc2KsvP2OptVaPmUK0cDtTJS4M1VbdnuH1QkrfRQJkjrvNoTTFVffQTP
         puSao9vfdcN8if1Jk2ENQ/bKLrWy57yAedfRv4gjseForU/WCtGnesAvSehnyDTRNvti
         UF4LaXEPxklCF7jdFF7Ip7mpqs9L/XuQuqo6msGTQsI+qnQwwEVy7E9fQo+g2QPRMBcZ
         OtykHFOdVsCuT/tKOyKcA06U2NxAJap3pvjabAzVvJ1pY3P+EuiWl6laHu5PTDziK87A
         0GRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787751904; x=1788356704;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=L7hvoCmTHP0bqd1CBKEjrUbKs431WZODQPlvf5quuUI=;
        b=CJOu2gSzd5L+nkc0WECytqicqkLPSeDkBzqCnnjSid1nWjKwokRDk0o+hRvILdLiZK
         CTO5dZHVTCoAjuQ1qxGmtcf497ErK99NZIMFHP8Ec3SWVE7OrvRUpnrXszePkn0JbazT
         M2+kfhVaJ8ECEqO9gO9cNKs/MoM72PIEqsH/MRO4wkprUk7GstEZTp0Xk7Ha6p+16UoR
         r198l2+/8T6z1kFsoN1skIHrOAzs4i2arlDwqKlIu78EeODGup54dIosu+VwAWby1Sg3
         Xf+5Hm//G5osJQn5S8jTSir7FWy8UOGvrdv1CHjfttVYRx0k3mHLm+DmtMVMNL+vWibP
         mDgQ==
X-Forwarded-Encrypted: i=1; AHgh+RrxpB8eMOWneG+jnf1mNfXQRyu5W8Ebg4A7tXs90IPLl5jChcGorGGj3sl6Eq7tN48exonMNMgv6lb8Sw==@vger.kernel.org
X-Gm-Message-State: AFuF++k4z86rcYIpb4PlxZcM55JWNUHk6uYaU8S8yl8s9CMWVU1fXtzK
	g74pOV+zKedzjXkgprebemzc5GhB1/nO5B55ENcadErEKzoeqJ7SA44krL4XpoKiEg==
X-Gm-Gg: AR+sD107gEhYsE9NNvwR0k2mXLACxpq2mabMHsZIxK5AScudRSUolWcJGnAO1FzCWnl
	M8QRvEtFBmlIU+hkPnRSqgZAo/iBCe3ItvUgzie6OEubYHbSUtMRt0kDn+PEMzt7sbaVogw4ZN2
	Nc4zxAcesfi5iZr9dsKyIlD9pAUBLMkm89BtWF1QnBrSYBhvSK9m/+9pjymuX80RTE4s6JTEKMX
	2W8dYTHl3+CabVrWorSH6Jqf7p/1AR1Y/X28st7jLKcTyLRfXiQsLnvPd8UVGuEkqIoyOS73xg5
	uDe65cQET7Sqc2Y62ufNaFAAfTlxQvciJGm3VulYkq4VNFXxpD31WihnUi5eMBDTqXRHTF8Y2wK
	KLp6fl6CgUDFJEtxccF6jqX4xKE0QvacEli/S0IhgB9VMipqM0r8hMB5P4nlqDg7mFpNTipsMKS
	0rhoz0GzZRFMu/t9uEWAsmdOcyiK0W90FJD6fIndCqx04vl5FcIwFoht/xEpIg/Gq3y7RQG5k2r
	BT6KLPcoh/Xa6qzIgEjqAdbj7nj28lK4yldFa0ynLW8pe3FuFX4DxLwe75Eqwc0NvqwvZBOcQgA
	0SUZ
X-Received: by 2002:a17:903:1b08:b0:2d0:cc92:f7af with SMTP id d9443c01a7336-2d707b7f5bemr132617665ad.9.1787751903533;
        Wed, 26 Aug 2026 06:45:03 -0700 (PDT)
Received: from katana.lan ([108.74.4.89])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3283d60b539sm8356719eec.1.2026.08.26.06.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Aug 2026 06:45:03 -0700 (PDT)
From: JP Hein <jp@jphein.com>
To: Michal Pecio <michal.pecio@gmail.com>
Cc: JP Hein <jp@jphein.com>,
	Mathias Nyman <mathias.nyman@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Hans de Goede <hansg@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-media@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH v5 2/3] media: uvcvideo: add UVC_QUIRK_CTRL_THROTTLE for fragile firmware
Date: Wed, 26 Aug 2026 06:45:01 -0700
Message-ID: <20260826134501.1726230-1-jp@jphein.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260427083553.36ff4731.michal.pecio@gmail.com>
References: <20260331003806.212565-1-jp@jphein.com> <20260427083553.36ff4731.michal.pecio@gmail.com>
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Michal,

Three updates: the stock reproduction I owed you, a correction to my own
endpoint labeling that touches earlier mails, and what looks like a separate
usb-core regression on 7.x that you (or Greg's list) should probably see.

--- 1. Stock-kernel reproduction, full usbmon (2026-08-25) ---

Ubuntu kernel 7.0.0-30 (upstream 7.0.12 uvcvideo), no out-of-tree module of
any kind, camera on a 20-minute-old enumeration, video + microphone both
streaming in a WebRTC call. The controller died mid-call. usbmon was running
on the bus for the whole call (168MB, preserved).

Wire sequence, same two-phase lock I described on 06-13, now on stock:

  t0        app stops the stream; video URBs unlink cleanly (last frame
            completes status 0)
  t0+1ms    SET_INTERFACE alt0 (iface 1) submitted        -- Phase 1
  t0+5.16s  still unanswered; driver unlinks it (-2)
            (06-13 measured 5.4s; 05-30 measured 5.1-5.5s. Same number.)
  t0+5.16s  COMMIT_CONTROL SET_CUR submitted              -- Phase 2
  ...       COMMIT never completes. dmesg shows the escalation:
            "Timeout while waiting for evaluate context command"
            "Abort failed to stop command ring: -110"
            "xHCI host controller not responding, assume dead" -> HC died
  t0+23.6s  everything on the bus reaps -108/-2; the hung COMMIT
            error-completes and prints the familiar
            "Failed to set UVC commit control : -110" post-mortem.

Through Phase 1 and Phase 2 the microphone's iso endpoint streamed
healthily to within a few ms of HC death (sequence numbers advancing,
status 0). Control plane dead, data plane flowing -- consistent with
everything since 05-30.

Same afternoon, two more commit-control stalls on fresh enumerations were
caught early by my userspace watchdog (camera-only port cycle, no HC
death), also captured. So: the lock reproduces on stock, and -110/-32
remain "who reaped the hung COMMIT first", as before.

One honesty note on that day: the machine was concurrently in a CPU/memory
saturation incident (order-9 allocation fallbacks in uvc_alloc_urb_buffers
in the same window). I don't think it changes the mechanism -- the wire
signature is identical to the June captures taken at normal load -- but
the unusual event *frequency* that day shouldn't be read as clean data.

--- 2. Correction: EP 0x82 is the microphone, not video ---

I mislabeled an endpoint in my 06-06 and 06-13 mails and want it on the
record straight. From the descriptors and the wire:

  0x81  iso, wMaxPacketSize 0x400, 32 packets/URB, ~1MB buffers  = VIDEO
  0x82  iso, wMaxPacketSize 0x0c4 (196), 1 packet/URB @1ms       = AUDIO
        (196B payloads are plainly 48kHz S16 stereo PCM on the wire)
  0x85  interrupt, the wBytesPerInterval 8-vs-64 descriptor case = STATUS

So in my earlier mails: the "healthy iso video streaming through the
control stall" was the *microphone*; and the 06-06 "timeout: still 12
active urbs on EP #82" hang was the *microphone* endpoint, which also
means the mic was in active use in that crash. The two-phase structure
and ordering are unchanged (control plane leads, data follows), but any
reasoning that leaned on "video specifically wedges" should be discarded
-- in the 08-25 stock capture, video had already stopped cleanly before
Phase 1, and audio was the surviving stream.

--- 3. EP5 on stock: still no flood ---

The 08-25 stock capture has EP 0x85 at 5 events total across the whole
call -- every one a teardown artifact (2x ENOENT unlink, ESHUTDOWN at HC
death). Zero short-packet completions. That closes the loop from 06-13:
the absence of an EP5 COMP_SHORT_PACKET flood is now demonstrated on
stock as well, so hypothesis A (EP5 underallocation -> ring congestion)
is out on both driver variants. The lock is (B): a device/controller
reconfiguration hang independent of the EP5 descriptor bug.

--- 4. Separate finding: NO_LPM quirk not applied on 7.x ---

While investigating I found the merged quirk from patch 1 of my series
(usb-core quirks table entry for 1532:0e05, USB_QUIRK_NO_LPM) does not
take effect on the 7.0 kernels I can test:

  - the entry is present in 7.0 sources (drivers/usb/core/quirks.c), and
    'k' still maps to USB_QUIRK_NO_LPM in the dynamic-quirk parser;
  - I additionally boot with usbcore.quirks=1532:0e05:k (verified live in
    /sys/module/usbcore/parameters/quirks);
  - yet after every enumeration the device shows
    power/usb3_hardware_lpm_u1 = enabled, and the sysfs quirks attribute
    reads 0x10 only (the RESET quirk my udev rule adds) -- no 0x100.

So this camera -- quirked upstream precisely because LPM destabilises its
firmware -- has been running with U1 active on every 7.x kernel here. I
can't yet say whether that raised the lock's frequency (see the load
caveat above), but a merged NO_LPM quirk silently not applying seems
worth a report to linux-usb regardless of this camera; I intend to send
one after bisecting whether it's the static table, the dynamic parser, or
the application point in hub.c that regressed. If you've seen anything
like this on 7.x I'd be glad of a pointer. As a stopgap I now call
usb_disable_lpm() from a local uvcvideo build's probe for this device,
and the device then holds u1/u2 disabled.

--- Still owed ---

Item 3 from my last mail (A/B on your 6.17-xhci-test branch) is still
open, with a wrinkle: my stock baseline has moved to 7.0, so a 6.17 A/B
would no longer be apples-to-apples. If you have (or want) a 7.x rebase
of the test patch I'll run it; otherwise I can boot the old 6.17 pair and
accept the version skew for the comparison.

Captures + analysis: https://github.com/jphein/kiyo-xhci-fix
  crash-evidence/auto-captures/CRASH-20260825T212701Z-4events.txt.gz
      (stock HC death, full call, 168MB raw / 34MB gz)
  crash-evidence/auto-captures/CRASH-20260825T213016Z-*.gz, -213154Z-*.gz,
      -220834Z-*.gz  (same-day precursor stalls, incl. one on the local
      LPM-workaround build)
  crash-evidence/2026-08-25-stock-hc-crash/  (watchdog dump + notes)

JP
