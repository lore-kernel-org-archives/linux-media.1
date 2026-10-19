Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792423220;
	b=nmkBl72iHr60bI9OYawwoHQ2gRawKgQ72BIpxnS0L3zalKJ5dgP23IH24k49t7ExfKP2
	 3Pi5sCHQutE/1z8LB/A5bnnjMCrsl/38LNffs/+K5FhPXibon+PVO54co3Pt/3WaosUZX
	 LzUmKJ1CDWpT9nnEOcIpZQ7LrtyrTnlyafEuO2+qMdcEXb1nCSxC/txbsAcSeTxzyeZVb
	 YXg1VmtKkoW3BaxqiSLAcSjXkOe6lxlmAE06DTirox9izem141uQhIxNmIXBi6W/Fuy/Z
	 9sgKmcd6xi427Mb/RZOTnhofM6uvih8BfuoazOfL4Yt5WjLCFmSlHMEy4BW5qg5NQvw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792423220;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mWjkGewxAcRXbaVfdvgorur7bESLlKy5C/veEUL3TVg=;
	b=oaThhjAqzK+KJgKSavA7t6siJLqo/4qh73MpmBX86rOeneq1Ob6Oj3VMQ3xKk5GsXk+n
	 L5zf2oUINkc9SJsYoyj7A+D/b4ZxqkDHwxd3cltBYJ1qFwWgnc7vt8VbYQvmwqhcv7NWE
	 RkE29gdco8A0tUytvXx8oKmXm3zKAXgkAQT6EHdyKPaURNty1lCmOJ06olmHmk/B6GMEs
	 Nn9edcmDrjqcR7+5Y1hUD6MDimfGLNjhWpEcNC7/+c+pW4LhcV33K31WLjvECYeH+btI6
	 dDgfEBAmJOiCRB3Ve82i8dVfUC3zRil7eR8hJNSjEHZcKnmQ7BnWyvcB1dJEG9I+Dbg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCMUPJ51;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D091B60A6F70
	for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 15:20:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D091B60A6F70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=rCMUPJ51
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so5716199eec.1
        for <linux-media@vger.kernel.org>; Mon, 19 Oct 2026 08:20:19 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792423219; cv=none;
        d=google.com; s=arc-20260327;
        b=PXS2uPOQmJ/zyfYkjmPSIPhWmi35wMQvLpMPcm6jzSAVIDFEPKPPcQEDyRTGivQZXO
         2+yFlJEEczig6gZZ2SC9wCcOxsP9J7dh/5gU6M9sDx3LS2jJPLPkU2HOUpp0JQkpfid+
         wLWk3+PMwpjFgjBIeY1Z4+Pn8V/Tq2scCVPWj7HY4k24va5wSpDJu+4FOX9VIzqUk8a+
         hp/cYLUTNTCirNWzicE5tBA7tamIUcjJBvhSvmZ2VmYK7p5XZCQ+U8RApKvghc3WqAvn
         jMyM8zCrJCL3G0cVdBR8JgnsYwQ9B8vCZRR260hYCv8u5OmP3tVK2syJexI8AQBqFSBx
         qpWw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mWjkGewxAcRXbaVfdvgorur7bESLlKy5C/veEUL3TVg=;
        fh=qF4HgwY4/1BrSfEBvImMbUA9lKkR60LhpIp7BAJnSW8=;
        b=Bs2gWj/jlPwLSxSUah3A7jXwaTUm//KvedvbqU7p3QTtA67MRycVHwi5/DF/2E8yjv
         qkxwNhgH+mTgbc9K5waqX7lp9CkEiodzp7PQZ3873/60DHY63wAHoD+X+BIs4idb1t+k
         trpG3B4F2raYR/pOnqn0Af5ZJLallgqFVYNHNTQdLx5v2DNGvVGgy4da7hSF6xLnZqIQ
         6s5/koddwKAYPMgvHIKSmY7CueiPq7qxuYyRq3+OPPG6QCBXka/xqGhwbQyX9FzBQbNW
         7USJaxuhFhgUMZAWyyT2rErKn25LIv6Xcd4uddC1P/v1cdv2S8ipoheY6Wj21+eGJHt3
         pddw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792423219; x=1793028019; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mWjkGewxAcRXbaVfdvgorur7bESLlKy5C/veEUL3TVg=;
        b=rCMUPJ518Q/g4MafTGXS2YOV4ONjKUAugqtcCJ9mL/BGHWbfl65Ba+qC2dfbMP5Uwr
         DPJtRI2RSuri5YNZubUMACeh7jlMAmEx4faToEqDJ5NBF9JAicYv19vtWtrxJ412uCp3
         ZyOxZkWEjIdk0dZ6H8Ngl6AMzPjoyEDw2MlKrleENalkbWx7X9iFWhSFAP/8Q468zWeY
         VP0IeK6hgcQFGVDMIeRVeF/ACPgiVRGgZOqqOeZVOZFU1H/sUwtZkRDWtRO6TFRe2PMZ
         d9FcCu8VzUoB6pwUb0rZ5/vIqc+zzwAym8vGTGMm7Hs/jS2UofdnYjJqk9WJcbaXskPM
         1u7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792423219; x=1793028019;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mWjkGewxAcRXbaVfdvgorur7bESLlKy5C/veEUL3TVg=;
        b=TCfqGmkVs3ni71gt03KCis9HF2oa5UIGZz1eI+Tnd7EHyzq2cbpBSWfm38Z8lozoOg
         9/kXWGztbb7hUhkL163ZavYY786sjSqfCC5Hhqi1Ai9ttyVoDQwW6w61iY4QOEILPTfL
         4pqpXGwJkk16eeIFsLL9ba1LDc6NLlpuIeIQ2ucYxSWKvx/FP96E7IzN4V6hAerc1P6A
         juVQ7rkJ/ehMU+xF73HtSUQ06nRxslTCENdW6BNNx1twEahCJ/ia8M7VL3m8D32Zx3uB
         R8xPHybVT1LVXDla2pR/5iztzINgRM71sBdhOok4lrEgEA8/EIKsi1lVhBNt5R8EfybF
         XJqg==
X-Forwarded-Encrypted: i=1; AKwUvBwkBrB0KFB8Z7kTbo34En1mJqVHT0OCyDYOXrC5Zjth5OiNy+PaaClPNrc9BuBfJ/9IML6/Yqw7d+wB5Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYJqHkAKnJrdnWSNHgfYiD2/zt28u5Fu3eWlniK/gKyF85u8YAiL
	gSGJdbjN3P9BLG1aLIkzF6d2lrm3KvKxYRU0+d6ezZ6Qmj/vbPogMMDI3TNy/7J7n1K/iMzV7XJ
	HbGT3nQhJH0/wYBT8+VBUzNnfFNrj7P4=
X-Gm-Gg: AYBFou2KQJnGLJ/IgG04j1ahVSEZ7lT94p3snjsru91d+m3aBsZK4GFU3sElnmPixbY
	RnDvVZopop8UGjBLF3GgEBcYp+HKQOvGTP8K4SRaiudGbTmqo+I8gEuB6LN3r/LcCMqaZOY6SlC
	RjllBn2trneIQAMr2iqr1Ui1Z9kPI3Yzalhu/n8QFp3KeRsQipfktBHMZc0Tg+GqRJRmDHx2UZj
	VYlLUnJPyxhdedmKZzfxFbHNygijpuKB3tlWVCuSouKHvy0pD3oxEOYcyEuGeVYnJu5BmqhfDX6
	0OEOPU65SrGZEROqLsstcA8vJd/qqXTRbgTJnvnW+x1UkrKZXnt1Nisji3FNKkFevp22piAw3zL
	cDJ5DN5pDl2yLPDz0fANp+5AnBx9fRM8tSkCgTxCjAoRGyliot77MZM/tkfHDeUph9HufBMsBv+
	RzyFGvTgwq+P+Ft97d
X-Received: by 2002:a05:7022:f51b:b0:14a:a6dc:9ca6 with SMTP id
 a92af1059eb24-1850d087d4fmr11645084c88.3.1792423218217; Mon, 19 Oct 2026
 08:20:18 -0700 (PDT)
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-sv105c-retry-set-interface-v1-1-ab2f08bc3fcb@gmail.com>
 <20261019111712.GP595565@killaraus.ideasonboard.com> <449eb143-37a8-4044-a071-63fe495c0213@kernel.org>
 <20261019112726.GR595565@killaraus.ideasonboard.com> <CAAquLuDc==WsbOYTfuKV2tspTSQAvB7kg2r2aqbE2rs3tYx2LA@mail.gmail.com>
 <d2d5e53a-ba8b-4b66-8e15-0c45e08e0f3f@kernel.org> <20261019123803.GA855235@killaraus.ideasonboard.com>
In-Reply-To: <20261019123803.GA855235@killaraus.ideasonboard.com>
From: Ostashow Constantine <ostashow@gmail.com>
Date: Mon, 19 Oct 2026 15:20:04 +0300
X-Gm-Features: AclHuK9PK_erQka1AjpHe9yUHPuX_p02w73ldR6AFrXTpE4OCE3wcIh6ni5FniM
Message-ID: <CAAquLuBW3MaBZgxQt_Kr7L2jGQf6mXarRtKi729-44DqwC=CnA@mail.gmail.com>
Subject: Re: [PATCH] media: uvcvideo: Add quirk to retry SET_INTERFACE for
 SVBONY SV105C
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Hans de Goede <hansg@kernel.org>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

To: Hans de Goede <hansg@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Mauro
Carvalho Chehab <mchehab@kernel.org>, linux-media@vger.kernel.org,
linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] media: uvcvideo: Add quirk to retry SET_INTERFACE
for SVBONY SV105C
In-Reply-To: <20261019123803.GA855235@killaraus.ideasonboard.com>

Hi Hans, Laurent,

On Mon, Oct 19, 2026 at 02:33:11PM +0200, Hans de Goede wrote:
> When you say "then queurs the control transfer", you mean the control
> transfer for the SET_INTERFACE, right ?

Yes. On Windows the order is: COMMIT completes, Configure Endpoint
command (about 3 ms), then the SET_INTERFACE control transfer.

> I wonder if the problem is that Linux is missing this Configure Endpoint
> command ?

It isn't. I traced the xhci-hcd events on the Pi for 20 stream starts
(MJPEG 1920x1080, auto exposure). Linux does the same thing in the same
order, because usb_set_interface() calls usb_hcd_alloc_bandwidth()
before it sends the request:

  COMMIT status stage           Success
  +0.07-0.46 ms  Configure Endpoint (Add: slot 1in, Isoc IN, maxp 1024,
                 burst 2, ESIT 3072)   0.23-0.26 ms, Success
  +0.06-0.11 ms  SET_INTERFACE alt 6 queued, doorbell
  +0.9 ms        Transfer Event 'USB Transaction Error' on the Status
                 Stage TRB
                 Reset Endpoint, Set TR Dequeue, Configure Endpoint
                 (Drop 1in), Configure Endpoint (Add 1in)
  retry          SET_INTERFACE alt 6, Success after 259-295 ms

The first SET_INTERFACE failed in 17 of the 20 starts, more often than
the roughly 15% I see without tracing, and the retry succeeded every
time. When the first attempt succeeds, it takes
260-262 ms. The error event always points at the Status Stage TRB, so
the Setup stage was accepted and the transaction error happens in the
status stage. That fits the guess in my previous mail.

Configure Endpoint itself is faster on the VL805: about 0.25 ms, against
2.7-3 ms on the AMD controller (see below, the same under Linux and
Windows). I don't think the timing explains the failure, though. The
fsleep() test in my previous mail put 1 to 300 ms between COMMIT and
SET_INTERFACE and did not help. On the AMD controller under Linux, the
gap between Configure Endpoint completion and the SETUP is even
shorter than on the Pi (0.02 ms), and nothing fails there.

On Mon, Oct 19, 2026 at 03:38:03PM +0300, Laurent Pinchart wrote:
> > Have you tried reproducing this on a different XHCI controller then
> > the one found in the Raspberry Pi 4 ?
>
> In particular the same one as the system running windows.

Yes, now. I booted Ubuntu 26.04 (kernel 7.0.0-30-generic, stock
uvcvideo, no patch) from a live USB stick on the Windows PC. The camera
was on the same AMD chipset xHCI (1022:43ee), behind the onboard GL850G
USB 2.0 hub (see below). The test was MJPEG 1920x1080 with auto exposure
and v4l2-ctl --stream-mmap:

- 50 stream starts without tracing: 0 failures.
- 30 stream starts with xhci-hcd trace events: 0 failures. Every
  SET_INTERFACE alt 6 completed with Success on the first attempt, in
  261-262 ms. There was no Transaction Error and no Reset Endpoint on
  the camera's EP0 during stream start.
- The order is the same as on the Pi: COMMIT, Configure Endpoint,
  SET_INTERFACE. Configure Endpoint takes 2.73-2.94 ms here, much like
  the ~3 ms under Windows. The SETUP is queued 0.02 ms after it
  completes.

(The only EP0 errors in the trace were two STALLs of
CLEAR_FEATURE(DEVICE_REMOTE_WAKEUP) when the camera resumed from
autosuspend. They are not related to stream start.)

So the same Linux code works on the AMD controller, with or without a
USB 2.0 hub in between. The failure looks specific to the Raspberry Pi
4's VL805 xHCI (or its internal hub): the status stage of this
particular request ends in a transaction error there, while the AMD
controller simply waits about 260 ms for the device to complete it.

> > Likewise have you tried reproducing this under Windows with an USB2.0
> > hub in between ?

Yes, now. Same PC, same AMD xHCI (chipset controller 1022:43ee). The
camera sat behind the board's onboard Genesys GL850G USB 2.0 hub
(05e3:0608), the same kind of topology as on the Pi, where the camera
is behind the VL805's internal hub. 120 starts with ffmpeg/DirectShow,
MJPEG 1920x1080, with an ETW trace of USBXHCI/UCX:

- 0 failures out of 120.
- Exactly 10 control transfers on the camera's EP0 per start, as on
  the root port. No retries.
- No Reset Endpoint command at all. Every xHCI command completed with
  Success: 240 Configure Endpoint (alt 6 and alt 0 per start); the
  only other commands were Stop Endpoint and Set TR Dequeue.
- SET_INTERFACE alt 6 takes 262-263 ms, measured to the first isoch
  transfer, the same as on the root port.

So on Windows a USB 2.0 hub in between doesn't make the camera fail.

Given that, how would you like v2? I can keep the retry as a UVC quirk
for this camera, or try to describe the VL805 behaviour to the xHCI
maintainers if you think it belongs there. The Pi 4 is a common host
for these astronomy cameras, so the quirk would help users either way.

Regards,
Constantine
