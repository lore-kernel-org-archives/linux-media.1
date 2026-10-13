Received: from mail-24429.protonmail.ch (mail-24429.protonmail.ch [109.224.244.29])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C995D485929
	for <linux-media@vger.kernel.org>; Tue, 13 Oct 2026 18:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=109.224.244.29
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791916168; cv=none; b=eAQsuYq5EBsnIMpJpxSFkOlxhPKSgqAv2py8UtNANDImcdUOyZXJvy7LixvgXovVPZ7siYKKvXfPbGaCWe3yoPiCQQoNIt0ydfL+tojTiLmAbl15NfPnNShzbH0ucNsTe4H6jEVWMlqH2NrqC+C8bvaRdTsJ1T7DqZA4RWBcSqo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791916168; c=relaxed/simple;
	bh=4ZE52JZ+8/1fCH+rWBwXEhvRc5L1pjnd6FeYvgL2Qas=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=To2DzTFsezknOcHgdP4iSM9hQCCsMJmVJVv3ZMMIb+2klpAsd54F4s5cY0/Jogsydo2TlEcMTX6f8CDHzIMRYj2lJhs96n8eONcxbYNpekD+7nGfogQqRfiYZvraR7WU3Rs7fiEeKDGWwGzPom4UVMd4+Ugzg/mLbULLq5vXDWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=NC0T+fUL; arc=none smtp.client-ip=109.224.244.29
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="NC0T+fUL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail2; t=1791916154; x=1792175354;
	bh=4ZE52JZ+8/1fCH+rWBwXEhvRc5L1pjnd6FeYvgL2Qas=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=NC0T+fULwkkO72YVeE1pISoLGo8Sd7PZWfpOrufoefgcKfPBs2TihPEln96kqh6lA
	 eHwVNxEXkouzOt9noMD0PdzUo3bmNgPBpzGF8gtTna2K3jE5bx0Mm7v1HCFUrTgcXe
	 8CcYgUcBhtCWNuiIY1PwsL/+eKGLgrWhEy/mCuPkcs+Dc3bis4s2+QnDG5VsteN0wu
	 wbfxDUR+cTHEDcle48jS4y4L3UERq8Fngk/OvhWVBa2oCF0J1L5tfJLAECPMO01Rm/
	 eoKd/Ra38Q8AmkZ+gBxWJHDA6e7SVNXiF97nGoKbxT93H8DielDwE6JCKZd/jsFcjJ
	 I3Zt3Q7T8oXjg==
Date: Tue, 13 Oct 2026 18:29:09 +0000
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, "laurent.pinchart@ideasonboard.com" <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <P4sgRUf7yks-ANWSwgvFQ4QY6bTr4XH8tjIKq79z-WoHdwjJcVaQNc_GYudqIQLeye5u8tp9zwVCI1VvHRInucbEM0aeRuYE_TGp4FWDQBg=@proton.me>
In-Reply-To: <asyRlrnPTLmfYVn-@ashevche-desk.local>
References: <5oAFQQK4aV42L5EWnypG-lloKyb1XF33Qcd8JU3xf9Ik0JjBNXuPkx0f5mvFZzd4jDkt7orjqgppZJJUrH2UePK9HvAfIYfxyWVG4HYl7rU=@proton.me> <asyRlrnPTLmfYVn-@ashevche-desk.local>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: ca21cb49b7d92f6386a9710718f1c0cf691f1201
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Andriy,

On Monday, October 12th, 2026 at 9:52 AM, andriy.shevchenko@linux.intel.com=
 <andriy.shevchenko@linux.intel.com> wrote:

> On Sun, Oct 11, 2026 at 02:24:15PM +0000, Ruslan Bay wrote:
> > This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> >
> > Most of the groundwork was done by Antti Laakso in the IPU7 support
> > series [1]. I added the IPU4P-specific parts, using Intel's downstream
> > driver as a reference [2]. Development was assisted by GPT-5.6 Luna.
> >
> > Image capture works with front and rear cameras, but a
> > rear-camera stream-off timeout remains under investigation [3].
> >
> > The media device name is intentionally kept as "intel-ipu6" so the
> > unmodified libcamera Simple pipeline handler can recognize it [4].
> >
> > Tested on a Surface Pro 7 (Ice Lake, i5-1035G4).
> >
> > Review and feedback are welcome.
> >
> > Thanks to the linux-surface community and the libcamera developers for
> > testing the downstream driver and sharing their findings.
>
> Your patch series is broken. Please, use appropriate tools with the expec=
ted
> parameters when preparing and sending patches. The
>
> =09`git format-patch -v<N> --cover-letter --thread ...`
>
> (and --subject-prefix if required) where <N> is the version, usually does
> the correct formatting.

I'm sorry for the mess. It's gonna take me a couple of tries to figure
out the flow, please bear with me. I thought it is okay to send
the PoC as is, but I understand the problem now. It's always better
to ask than to assume - lesson learned, I'll base the next version of
the patchset on the media-committers.git tree.

Thank you for looking into it!

>
> --
> With Best Regards,
> Andy Shevchenko
>
>
>
