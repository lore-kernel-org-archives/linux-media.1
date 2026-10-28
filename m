Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.28
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793165942;
	b=JyQLvy+gqyEaub/sr4btgUApJOKRNhDT4uZMsyraAapQMsvjVAygKNjV36nzU52KwkU9
	 5Z1lpwBDlvG2A9Yi0CCf6TepLMK8ejVPPMWsW7N74xfcD7COnaIfMN2iGB6ztpRR35jWg
	 H2OmS584aj2HRQZaEJ5aui9o1BEqip0nJ9DRFyQ27Kxdp+8S1MCZRZ6svYaUhM29AtFOt
	 cTpoN36lA3kpEcu5YLQEj8nc7zB9mT3PrODt9FamNQ2axdIfHEbc94eduS4mdVsnUcXrj
	 mC7eIgPC1nayFJ5Q6/H7sscPCduckrf5HcK3dQztQu4K7GNEJGOcBlbzLrBr8TqHsaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793165942;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=kcUbDftRximW+U5Ah4Hwvu8Y4Rc1mxNjtROWvZc4iSU=;
	b=psQ5Q6LGWDC7zdVbp1eI1vzyVRvQCNmoRmokmFvRePys3sRWuD7l/uNH71ZJdO6p8Bze
	 5dZZSzVNnWGjXJejcRpALbHXNyOxlnK7AB9wGUDqiGW1VjzXwiPSdroUuXRLnRKMwrOYl
	 b4K2OSHsk3UdzZYk+Oh6QqqCJSliGGfMHAQYRQMHNPrDU7rve6UCsVMXU4glE/kDIBI/W
	 rvffL469B4TexGlHeuOM+93EiciGRsQv4fK3oWQgwMy5CWIarKHlwbQPfr9tctqTPfvWz
	 Ys7Le35L1UpV7qlFYQgCe8jjdrzNprRGAi3AdARYzg28wB95Dyr/TPMjxtDwC9Fn0Fw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TU3k8TaW;
	arc=none smtp.remote-ip=79.135.106.28
Received: from mail-10628.protonmail.ch (mail-10628.protonmail.ch [79.135.106.28])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A506606A31A
	for <linux-media@vger.kernel.org>; Wed, 28 Oct 2026 05:39:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A506606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=TU3k8TaW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1793165938; x=1793425138;
	bh=kcUbDftRximW+U5Ah4Hwvu8Y4Rc1mxNjtROWvZc4iSU=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=TU3k8TaWzkOPjmij5n4x8FE9DRkrsfjtPqt90L4EquekXQyCeopsW2/wFhWHbXhCs
	 i6+eFge2ylc2L+neinNB+a8XDt0aBzyPKyoPG2Y8xB8BRf5iny2aGQDemvDT6zfdNP
	 HBMRcABVnSIzYnz+IHBWELHMRZ9xauqjbJhF+9ihHLUUYfsn7ZtyUBG3s1NLeztn3k
	 LAS3c49o9bEDh/b05SltyqZH2ifWDyu77w6poBfbYFx5ZAsqbj39T6xL+FTPXHrE4Z
	 k5hOW1pX5t+T3zCiWyOVE7t7YfW/vo3XSVutxdqqF3qNRyTbhPrWkKPFboZSkGVuis
	 mvpuZCpI6tF/w==
Date: Wed, 28 Oct 2026 05:38:51 +0000
To: "D. Manresa" <dmanresa@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <johannes.goede@oss.qualcomm.com>, Dan Scally <dan.scally@ideasonboard.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, Fernando Rimoli <fernandorimoli11@gmail.com>, Ruslan Koreev <koreev.r@gmail.com>, linux-media@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/2] media: ipu-bridge: survive module unload and reuse the software nodes on rebind
Message-ID: <20261028053837.41501-1-lsa.uz@pm.me>
In-Reply-To: <20261026082549.662885-1-dmanresa@gmail.com>
References: <20261026082549.662885-1-dmanresa@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b5122132112c647f4af83e2073d01fe0d9fc638c
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Dario,

You asked for a run with KASAN on IPU hardware. Here is one, with a
result that is partly about my own patch.

Setup: a Surface Pro 11 (Lunar Lake, IPU7 8086:645d, run by
intel-ipu6), media next d7e7bca7169 with my VD55G0 v1 series, generic
inline KASAN with KASAN_VMALLOC, which KASAN needs to see module memory
at all, and lockdep. KASAN reports only once per boot, so each variant
had a boot of its own. The sequence: load the IPU stack, capture, unload
intel_ipu6_isys, intel_ipu6 and ipu_bridge, then unbind and bind the
VD55G0 with the bridge gone.

  variant                                   bind after the unload
  my v1 series as posted                    froze, 2 of 2 boots
  + your v5                                 froze, 1 of 1
  + your v5 + my 4/4 fixed (st,leds name    clean
    and GPIOs in the bridge's structs)

The freezes were total. The persistent journal stops before the bind,
with no KASAN report and no Oops, and kdump did not fire even with
panic_on_oops, the soft and hard lockup panics and hung_task_panic
armed; only the power button brought the machine back. With the bridge
still loaded, the same rebind is clean. So on this machine the dangling
pointer that freezes it is my st,leds, which Fernando pointed out on
25/10. Every run without that fix froze at the first read, so I cannot
tell what link-frequencies alone would have done. KASAN reported nothing
even where it should have, so the evidence for v5 below is that what
froze before no longer does, not KASAN's silence.

With v5 and the fix, the run went on, all clean (no KASAN, lockdep or
Oops lines, debug_locks still 1), with a capture of 10 of 10 frames
after each step:

- the rebind above;
- a reload of the stack;
- four PCI remove/rescan cycles of the IPU, each logging "Reusing the
  previously registered software nodes", none hitting a duplicate
  INT343E node, and the IPU7 back each time without a cold boot;
- one remove -> unload -> rescan -> reload cycle, as in your cover
  letter.

Only the VD55G0 was bound on that kernel (the stock OV13858 driver fails
probe on this machine without a patch of mine), so that is the sensor
the run covers. The only WARNING was the known one at
ipu6-isys-queue.c:203, once per stream start, in every variant.

So both patches ran here and held. The failure they guard against is
not a quiet stale read: for an st,leds-style property, it is a machine
that has to be power-cycled. My v2 4/4 keeps st,leds in the bridge's
structs, as your 1/2 does for lens-focus and link-frequencies.

Tested-by: Sergey Lebedev <lsa.uz@pm.me> # Surface Pro 11, IPU7, KASAN

Sergey

