Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EEF2139C9
	for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 14:15:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787235336; cv=pass; b=UFcRh/XtzchQydkTFin4n8Q+D9obuJGkl8Ntf0bhtaCwoAsdnBwslB+N9qTmF6XMdeRpE4vQIkdkyMh77gkGenrlMV8LmwslKoQlZ9FgmTGhb64YhNQn0zgryFvlBYHS1g1Yu6RqmPL2UhYgvUVdQRrZuLoEIKVCybMvVq4y8LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787235336; c=relaxed/simple;
	bh=fVDI9qUr0qMP1TyCb6Rht+fdKuU++t9fRjNPPJhK6Gc=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ZEuDGJw4WL8iXCU+2+ZAcq5Ln/sHdZw8kyL2504171DU7uXkk2748YxFeGe9EwCherVmg47q+xvA3wRMSd52s5XyqUw2+ZzI/vlEr+opUk5F3uGlRVmYXZWwmsbgvkHJfPIPoN8uhEAicsgA6PjRXJalLhgSrnRgxQxD+/nNKCU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oNH5OuwE; arc=pass smtp.client-ip=74.125.224.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oNH5OuwE"
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-66ca4bdccfaso3646050d50.3
        for <linux-media@vger.kernel.org>; Thu, 20 Aug 2026 07:15:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787235333; cv=none;
        d=google.com; s=arc-20260327;
        b=RI8QlAq2fZS4Lj8IX1b3mANFXqSBTPXllr37aQn9zcwmYZQOY5NuupICRdL5uoVBkE
         A9jFefIj9Yhryauez6Nus/X/Pssewy4z0rP32fUgtRQYorIJKe4fbvDxgIhdaOoafaTz
         bMLFAmVdZFYB8zvRszYhZjE3+PvRat1TSdbfun/a1siaXJXchKCFEV8AUOJ0z0c/3uXY
         s1MeR7cEUJZKY7uHtrOnCMQIpPSlo6SeN9o3ykNA8zu3jpfijfYL6ag1XWNBEkY22a6r
         xYDmpjOnSVh4pwb9mLtRQzDuDgXoFI3ZgYTLCy83Z3tjlp4cw/QgDziBOtPbrtlw3Kk2
         cGkg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=wiuRp2lMC99rGanQb9bvhIAM7kIXybnpz54iiNftrrA=;
        fh=WpoetKQJPRBOk5Dbl/gAyGGMPpBUy8E3SWkNnXuJ7v4=;
        b=i5plagO0WxRuFvgHpYp9KmZhKpxzr8zQ9TzC7dc158Zjrk0eRejNMyKa+GfBdR9H4v
         6ZxkQGUidWmAXLNN1fJ6882TaJJKxgO/0zROb7NhaVXBgGtopOVPQyN15GWh8ahoxpWH
         o7UTZPYyd8GV5v/beSLv71MWKPey9gTV/PTs43n+Ghq2rq6B2yrY6xTqvNnkwKdGtfGg
         +KDUYdTBL/XpdMRF37arxTBSupL45O4OjqqCu2pj+54Y1Ll+7TJWfnDh0jjxqPaZApro
         141UUlgev34h7qltVJTEyAmu9AWBmVH42kR8pEl/gkbRS7y9Pq8SdMjM2Ko6mxZi9ECy
         Jrxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787235333; x=1787840133; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:mime-version:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wiuRp2lMC99rGanQb9bvhIAM7kIXybnpz54iiNftrrA=;
        b=oNH5OuwEhxoNJiPaeB2Po0VqggKwdKFysmkB1/52/sRK+L+pwvIAL+2/hdjbqM3eJ4
         YERbWQw/gBRVzht0fuNypT14VZ3b/qqRCtQhHg8Ounw6ZJ37FEwoQb1K7r5JSolm1FLJ
         W0MT44sSxqIjuwAjmr2K7SA/1Ciqxlrt3W5A3T8LcWUns8zKFxW2JqRaIOOdDTVh8Tsh
         48taYUwW+Sl4F3KH+KIvRs3vn8aRKwdR/KrMrCxnPB+P9Lz+CvI99udzPoPsPfGKlSm9
         cWfpmw2flf9OEKf3sxSzGrz9VjcwTpLAcnxvvzeTgkD/BiiC5nxjxa5TRkzJYGXn+4tu
         UJaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787235333; x=1787840133;
        h=content-type:cc:to:subject:message-id:date:from:mime-version
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wiuRp2lMC99rGanQb9bvhIAM7kIXybnpz54iiNftrrA=;
        b=lN3HQTcsi+RT7Wbh7vGOZN969bnoKggR+pmHj14NBpQANnYj8V57KDvbfe+WEDIgKI
         NLtiFgciip3wL37TRYu8A4jSA9UgsBQEjUSpj7BEgdTxY6Ob2A8gcCsvXemc83pA/A5A
         UXMuf73aQa29caXJzmnnCevK+npjO8ofoCDd7qM+tEjr8iv7e0O+0keIXmlfPEvtc5yU
         kiWsIXlsODhxGE3UYhHjTCi/PSm0xd2/dFi9knxUXUdUa1c4XYUXAi3pASL8Cls+kQ+d
         g2/2YPQlKyCpF4lOyAIHFLRN/rcSVidGe/kIMy5EttJKVXHfQdLqm+4Vv16+mNoDnWdK
         IMqA==
X-Gm-Message-State: AFuF++nl1J8XoF+qY4x9GchpsMzpJstTI5g2TzAddiO6RVtg4DnNBTjm
	XQC1IVZNnp3w91DQ4pSmFxRVTEStM5QH5zPlbNM8nYfDroLND6y53LtlNU82UMLeJv2+xbiLMxO
	TJcq5NCqBk1nbXcRgcCvmjy6yKoIQ7D4nZN2I
X-Gm-Gg: AR+sD11S1oR0uUXOlr4fNqDz1uje9IML1tI1PMUi71QeIuN/FS1cQovm55oKUkN6Jgp
	Rxmp1us90J4ouvcON68jsICFkbARzAOwYyqLc0TrayUyWpClZcKxrIQ305iqhOJLcNowHFtjNiX
	qrRnINrp/B7uM+X6pHahTh8aXP49amyMS9eAnqxvGmyPPTV9NQzU1i9Ak4r4URatFTBbi6slfq8
	FS/bPCDL9cfSThQdXG1hnff/jm6AugvlFJcD16n+/UlWqhJMbrQnRsxMeTB3SohsxPjv19NrCNA
	jg6yGDVX3CqFFm3WytmEgs7RCUsXkI8Bgc0YH/meD28+S1qofUkJZoGy6qfBcCpIODHm+kDX7/b
	z2MOLYmyd+hv0T0nk2gDqC4oqAQFwZYutNCDTg8my006jxlbxTNsfyBtxalPU5F0YYf/QpXby83
	uP1UOKTFLxnvNQarE4H6Pg
X-Received: by 2002:a05:690e:c4e:b0:667:a025:89a4 with SMTP id
 956f58d0204a3-66ccb618589mr4430455d50.18.1787235332559; Thu, 20 Aug 2026
 07:15:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Vasco Valadares Semana <vasco.valadaressemana@gmail.com>
Date: Thu, 20 Aug 2026 16:15:19 +0200
X-Gm-Features: AcwNN1V3xcTl-MOoxSGp4vh2Mp4wjKMjo1TJ1r8axgU9_lrZp3Rdm9iaNAIIASo
Message-ID: <CADybn6f2E3Vqus5fxcPN-bKp7Em-jyzo1ph_AXRrW=c4wUe_3A@mail.gmail.com>
Subject: [BUG] libdvbv5: dvbv5-scan hangs forever on a NIT with two versions
 in the stream
To: linux-media@vger.kernel.org
Cc: mchehab@kernel.org
Content-Type: text/plain; charset="UTF-8"

Hello,

dvbv5-scan hangs indefinitely on one of my DVB-S2 transponders. I can
reproduce it every time and I have collected traces and a stream capture.

I am a developer but new to this codebase, so the source reading in the
second half is offered as a possible lead rather than a diagnosis. I used
an AI assistant to help interpret the captures and find my way around the
code, so it is worth checking the reasoning rather than taking it at face
value. The observations in the first half are mine and reproducible.

Environment:

  dvbv5-scan 1.22.1 (Debian bookworm, libdvbv5-0 1.22.1-5+b2)
  TBS ECP3 card, DVB-S2
  Turksat 42.0E, 12685 V (same on 12685 H and 12729 V)

The code I ended up looking at appears unchanged in current master
(95ad25f).


What I can confirm
==================

Reproducer, single mux, no -F, no -T:

  $ cat /tmp/one.conf
  [T]
  DELIVERY_SYSTEM = DVBS2
  FREQUENCY = 12685000
  POLARIZATION = VERTICAL
  SYMBOL_RATE = 30000000
  INNER_FEC = 2/3
  INVERSION = AUTO
  MODULATION = PSK/8
  PILOT = AUTO
  ROLLOFF = 35
  STREAM_ID = 0

  $ dvbv5-scan -a 1 -I DVBV5 -l EXTENDED -o /tmp/out.conf /tmp/one.conf
  Using LNBf EXTENDED
  [...]
  Scanning frequency #1 12685000
  Lock   (0x1f) C/N= 12,20dB
  <never returns, killed after 5 minutes>

Same with -l UNIVERSAL. The process sits in do_select on
/dev/dvb/adapter1/demux0. strace shows the same 102 byte section being
read every ~8 seconds, with the 10 second select window restarting each
time:

  12:36:56.853097 read(4, "@\360c\4.\325\1\1\360\n@\10\5TURKSAT"...,
      4096) = 102
  12:36:56.853348 pselect6(1024, [4], NULL, NULL, {tv_sec=10, tv_nsec=0},
      NULL) = 1 (in [4], left {tv_sec=1, tv_nsec=984464352})
  12:37:04.869171 read(4, "@\360c\4.\325\1\1\360\n@\10\5TURKSAT"...,
      4096) = 102
  12:37:04.869306 pselect6(1024, [4], NULL, NULL, {tv_sec=10, tv_nsec=0},
      NULL) = 1 (in [4], left {tv_sec=2, tv_nsec=808841})
  12:37:12.868722 read(4, "@\360c\4.\325\1\1\360\n@\10\5TURKSAT"...,
      4096) = 102
  [repeats indefinitely]

  (lines folded for mail, they are single lines in the original)

The mux itself looks healthy otherwise: it locks, carries about 55 Mbps,
and PAT, SDT and the PMTs all parse fine. Other transponders on the same
dish and adapter scan normally, so I do not think this is a reception or
configuration problem on my side.

Decoding PID 0x10 from a 15 second raw TS capture (dvbv5-zap -P -o) gives
three distinct NIT section headers:

  table_id=0x40 net_id=1070 ver=5   section=0/0
  table_id=0x40 net_id=1070 ver=10  section=0/1
  table_id=0x40 net_id=1070 ver=10  section=1/1

Version 5 announces a single section table, version 10 announces two, and
both are broadcast in a loop. My understanding is that this is not
allowed, so the stream is at fault to begin with. Still, it seems like
something the scanner should survive.

For comparison, a transponder that scans fine (12458 V, same dish and
adapter) shows a single NIT, version 10, section 0/0.


What I am less sure about
=========================

Reading dvb-scan.c, struct dvb_table_filter_ext_priv keys extensions on
ext_id and does not appear to carry a version number:

  struct dvb_table_filter_ext_priv {
          int last_section;
          unsigned long is_read_bits[BITS_TO_LONGS(256)];
          int ext_id;
          int first_section;
          int done;
  };

If I am reading it right, sections from both versions would then share one
extension, and last_section is only assigned when the extension is created
(dvb-scan.c:229 and :256) rather than revised afterwards. That would leave
the completion test

  is_all_bits_set(ext->last_section, ext->is_read_bits)

comparing against whichever section count arrived first. I could not work
out an arrival order for this stream that satisfies it, but I did not step
through it under a debugger, so I may simply be missing the path. Repeated
sections seem to take

  if (test_bit(h.section_id, ext->is_read_bits))
          return 0;

which would keep dvb_parse_section() returning 0.

Separately, in dvb_read_sections():

  do {
          do {
                  available = dvb_poll(parms, dmx_fd, timeout);
          } while (available < 0 && errno == EOVERFLOW);
          /* ... */
          if (available <= 0) {
                  dvb_logerr(_("%s: no data read on section filter"),
                             __func__);
                  ret = -1;
                  break;
          }
          /* ... */
          ret = dvb_parse_section(parms, sect, buf, buf_length);
  } while (!ret);

timeout looks like it bounds each dvb_poll() rather than the loop as a
whole, so an arriving section resets it. That would match the strace,
where the available <= 0 exit is never reached because data keeps coming.


What might help
===============

If version_number were tracked per extension and collection restarted when
it changed, I would expect this stream to settle on one version and
complete. And a bound on total time in dvb_read_sections() would stop any
table that cannot be assembled from hanging the caller outright.

I have not sent a patch. I would probably get the details wrong, and I do
not know whether restarting on a version change causes problems for the
gap tolerant paths (EIT, ts_id != -1).

I can test patches against this transponder, it reproduces on demand, at
least for now. I also still have the raw capture if a filtered PID 0x10
extract would be useful.

Thanks,
Vasco Valadares Semana
