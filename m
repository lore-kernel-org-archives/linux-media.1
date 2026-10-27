Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793128883;
	b=enYWeHYD3CgDmuKeHL44QbUgngD5KEKkJMTkBIhfBKRTB6M8z7bkHurAgxwYHuzMvCdm
	 cZBZZ3ixqMioZTQKN1GeFGEbYW2cIIAPqIvElEn/+dyG9Y9AGLPNUCeUg7TLI4nb85++S
	 OeedugkIONhi56vg2XNaB3155+SJmX4ZMZVS03l8bVQFZIlLY6cEQhLxaKpi0NuM+SdWM
	 uUpKvtXP//13h4bqbnj8ej+xxUHpuweczg2ZwR0K/m8cIocMgc8Xq5KDsaTMizHbajGHs
	 cWDzL3agzVu0InoRJFco1J22/tjOufLkSUI+R3GBtN+Kwzh7+tgfa/tlWt+K8PkJEow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793128883;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:From:
	 To:Cc:Subject:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=xnFNtyz8/784i5O5Y8tV5H7w2jusUzA2q79eDaSlxJw=;
	b=CrPW56nM2jGmjmCamBXmsMNv3uiQ6Usj74UodxwhUpNXDiRs5KTGxIB41Zf6uTZkt7x4
	 Bs8DGeyZW2bL5UbCpxJg0/Pr8D5HoayS9fOaXMDpjL+ThdZ9HEqc+yqSblC/QWLsYurJf
	 G+qiYEGOC/5zmhOXh/tz4Y3h7SgU6ngk8xi2Eklfbjmq3Juoz/zf6sHXnox1JTAfaLuhG
	 XBFBdUGcrz/pn3FHR4XOqL5gnjtsnku8/X5tR5yvj9zMVr7JPaghg2xR/d7QwG81wy8Kw
	 RPwqrNWoRpfm0tKvDEQedLxNlBOy+07g94TOKqcZZ41lI+PnCN/Ujv/2A5bxBYrqLhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.128.41
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D65606A31A
	for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 19:21:22 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 02D65606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-4956869750eso1286085e9.2
        for <linux-media@vger.kernel.org>; Tue, 27 Oct 2026 12:21:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793128881; x=1793733681;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xnFNtyz8/784i5O5Y8tV5H7w2jusUzA2q79eDaSlxJw=;
        b=0Dx5NUID4DWBksmuBG/Poag+VTZZCvk0UJ9aXXLSacAVgYoZehuNuQ2B+BXu89fOtW
         2KExlBzn5lr8vW2WF+G5vlYDJV7jNae3yR3YEBvAhju80B5Dc2xo0FSxs+jx6j1GAU05
         wR2C9NmMIw/NJrBQdamcr47Dq5Rcdt7zNKpyVsy2p8w7KVO3b7Wi7hxPxdOtH6+Ti0iN
         ZzkkVjQtFKDQy0euAe7AWJBquFWXV6CdI39EJKGb7Y/TfXytf7fehBGTazIkibtDgtZJ
         EdNxEwGaKeeIfIah2YHRtzyRpHDBubh/W3rhjMAcWyZeFQvAEpnczneXcxB7VR02nWCS
         m9fA==
X-Forwarded-Encrypted: i=1; AKwUvBzD6PFK3lYdX/L1yICBpayNoWQpp/WUyquRRi+iC+zSUn10ldATmDX2aNGg0c2m7t9LUwRUI499AHWFhA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIKmAkXcfXYJlya+WS+4w4M9EeTAY59AoTba3rqrw2kCHZD7q0/
	bH6n2lIPQBPNaHNHacDvMv6o1BpAOLLZdW24qlc98gKfG6rYHtpfChk=
X-Gm-Gg: AYBFou3fUoBiA/INIfpiLgxMuLp18T2OaiFVlhMWcRKDGAvFELNs/6ibfRvLGnxhRXE
	EIa0Op/oUW3cHa2wOz3ebTyRSK0NaAIl+/t/FMTIhEu6c3k+LW+KzHWqEWOigBr6VTzOEjwnr9c
	W1SNN5+kbUguXFar230PB4EhQe/uYb8QBp03Lih3a4Dbor6blwYFlqCtUi/CrenYZc+rXBEL/ru
	G+G6MqbozEZchdmJ+Zdfhqp5gy0UnGYDHn8vby4EZnMEa/REeGbj6OZbMriGMrR9KD2QEtrZu5T
	qI9SrkUDzx+/cyubDxbtpef7XnGorv+tVpbhxtuPOz7sQQU9+UEYk6EVPx+BWz5z0RQOlh3dodX
	ZVFQdWQO9F8gyhvzdPNZAO9i+kkojqUujzjuze0/bQXK5CrLnmmOTuTWM3kNeEO+lgR4AJVOAnV
	39wLWxhru+cHSwPxJOUBWheybzSUIIXZT7iScf4Bc3OLIBKpyg8IHTh/Y9nk/i18nmzeFjqnnPF
	G+FU1eivxeF+rrMJXGmPstDACUI/NC4fQr0Sc+4Q95eLg4DfEOLeRhzfEREW5M7LoDCKQ+mRSl4
	TThFMotwyBvwh4H1NG2temkCZcEJQzy/JNKl7Sc=
X-Received: by 2002:a05:600c:1987:b0:4a1:96cd:2f73 with SMTP id 5b1f17b1804b1-4a35ac3a777mr219295385e9.1.1793128881120;
        Tue, 27 Oct 2026 12:21:21 -0700 (PDT)
Received: from [127.0.1.1] (84.124.213.91.dyn.user.ono.com. [84.124.213.91])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a94e8a43b1sm2679415e9.11.2026.10.27.12.21.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 12:21:20 -0700 (PDT)
Message-ID: <6ae0f9b0.a39f85ff.264c73.e463@mx.google.com>
Date: Tue, 27 Oct 2026 12:21:20 -0700 (PDT)
From: D. Manresa <dmanresa@gmail.com>
To: koreev.r@gmail.com, linux-media@vger.kernel.org
Cc: fernandorimoli11@gmail.com, sakari.ailus@linux.intel.com,
 dan.scally@ideasonboard.com, hansg@kernel.org,
 andriy.shevchenko@linux.intel.com, rillian.grant@gmail.com, lsa.uz@pm.me
Subject: Re: media: ipu-bridge: lifetime of retained software-node properties
In-Reply-To: <20261027143023.3312353-1-koreev.r@gmail.com>
References: <20261026091252.676350-1-koreev.r@gmail.com>
 <20261026111108.34186-1-fernandorimoli11@gmail.com>
 <179303518584.774397.17279190841735842653@gmail.com>
 <20261027143023.3312353-1-koreev.r@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Hi Ruslan,

On Tue, Oct 27, 2026 at 05:30:23PM +0300, Ruslan Koreev wrote:
> Could you confirm that capture works again on each previously working
> sensor after module reload and repeated PCI remove/rescan with the full
> v5 series?

Confirmed on the hardware. All three sensors on this Surface Pro 7+
(IPU6 Tiger Lake, 8086:9a19) delivered frames after a module reload and
after each of 8 consecutive PCI remove/rescan cycles, with both v5
patches applied. No cycle failed and no reboot was needed.

  stage                  ov5693 front  ov8865 rear  ov7251 IR
  baseline                   frames       frames      frames
  v5 fresh load              frames       frames      frames
  after module reload        frames       frames      frames
  PCI cycles 1 through 8     frames       frames      frames

I am quoting frames rather than frame rates on purpose: the per-stage
captures were 30 frames (10 for the IR), which is too short to measure a
rate. A separate 120-frame run on the rear with v5 installed gave 30.07
fps with no dropped buffers.

One thing worth saying before the rest, because it would have made the
whole test worthless: the module installed on this machine turned out to
be v4, not v5. I built v5 from the patches as posted, and before loading
it I removed the software nodes the v4 module had registered at boot, so
v5 created all five nodes from scratch rather than inheriting v4's.

What the properties actually read with the bridge unloaded
----------------------------------------------------------

This is the part your QEMU runs and mine are both really testing, so
here are the values, read back by a probe module while ipu_bridge was
fully unloaded and the nodes had been created by v5:

  INT33BE-4 (ov5693)  link-frequencies[0] = 419200000
                      clock-frequency = 19200000, rotation = 180
  INT347A-1 (ov8865)  link-frequencies[0] = 360000000
                      lens-focus -> 'dw9719-1', reference resolves
  INT347E-5 (ov7251)  link-frequencies[0] = 319200000
                      clock-frequency = 19200000
  INT343E             data-lanes intact on port@1 (1,2,3,4),
                      port@4 (1,2), port@5 (1)

Nothing poisoned, and identical when re-read after the 8 cycles. The
lens-focus property, whose name was the module string literal, still
resolves. As a functional check of the same thing I re-modprobed
ov5693, ov8865 and ov7251 with the bridge still unloaded: all three
bound to their i2c clients with no "supported link freq not found" and
no errors.

The refcount, per cycle
-----------------------

With dynamic debug on, every cycle logged "Reusing the previously
registered software nodes" exactly once, and the INT343E kobject
refcount went

  4 (before) -> 3 (after PCI remove) -> 4 (after re-bind)

flat across all 8 cycles, with every child node still present. For
contrast, v4 measured earlier on this same machine went 4, 3, 2, 1 and
the node was gone by cycle 4.

What this test cannot tell you
------------------------------

This kernel has CONFIG_KASAN, CONFIG_PROVE_LOCKING, CONFIG_LOCKDEP,
CONFIG_DEBUG_LIST and CONFIG_DEBUG_KOBJECT all unset, and slub_debug is
not on the command line. So the absence of a KASAN report here means
KASAN was not available, not that it was clean. The property read-back
and the refcount are the evidence; the quiet log is not. If someone has
a KASAN-enabled kernel on IPU hardware, that run is still worth doing.

A build note for anyone repeating this out of tree: v5 changes struct
ipu_sensor, so the modversion CRCs of ipu_bridge_init and
ipu_bridge_parse_ssdb change and an out-of-tree intel-ipu6 must be
rebuilt against the new symvers, otherwise modprobe fails with
"disagrees about version of symbol ipu_bridge_init". An in-tree build
never sees this. intel-ipu6-isys only imports
ipu_bridge_instantiate_vcm, whose CRC is unchanged.

sensor->vcm_type still points into module rodata in the surviving
struct, as discussed earlier in this thread. Not a live bug today, and I
agree with keeping that cleanup separate.

This machine leaves in a few days, so if there is anything else you want
exercised on real IPU6 hardware with three sensors on the bridge, now is
the time to ask.

D. Manresa

(Written with AI assistance, directed and reviewed by me.)
