Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793772151;
	b=DvSbTNCekkhkNZwv9ofQFrPV2/bwJEBIjiL5izCFuSbYuPaXp5M6FYIxl0zVjUPng1AL
	 9YyJwNO4ooURVkmIOo9LjQeTDLle3/mH0tbMF7H+dtKyRpq8CMg9tsh79F/yy0fZ0eitD
	 fVlCNV903FMhgug76BQ+sNx1hX1VoiCKbgdAg9FQmP+6A1EQrLm/92vjfk+PC08vFsmQu
	 K2YJEKCKRYaV5CXx6KwwF7ZunMm1WB02H7//TNEVcMk/tsLbpoVTCN9V4cq34Uz/E3Ggt
	 pWA8ZO5ehxIMdhZs4BdtUkdQVqLbLklAzy5p7oErz0Jd9TbyesuKk1UACSjDg4HRHFQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793772151;
	h=DMARC-Filter:Received:DKIM-Signature:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=uOLB12MQyjEBV9DH0Gm1V/oqPC1Qg/RHhTnpXOkgJ+0=;
	b=A2FPDFTsPLVpvtSScWUUs5slia4fUWDVZVJQc7XTKdi1BYZBajrspxexMc31Mx1N2cQm
	 allGmptekswri8pzOYW7Ge5jEYGS4LmJ3F0pKxrlzoxwBQyDjG75+L65KOILk4yjeIjP1
	 YJTK9R7i2OANaPowpFLxw4gZtBiw9tLAZZZ5B9fNnyotEXMwmgMPBqG/n4FozM8a2v3OP
	 bwJNuu9dITrB25gyCFunodV8t8XJsFKA3mLCAqzXdoKYg0aE2FL61SyDT4eYFykhJkn8p
	 cclDWBCvp+PyIsce3ZlKZfDNmPqGnkFp9k+sBgpYFJ/PZXiLZ9pAhb3tjsUlzWP5hXw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CSNdwhbz;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC426606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 06:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC426606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=CSNdwhbz
Received: from killaraus.ideasonboard.com (81-175-209-152.bb.dnainternet.fi [81.175.209.152])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 772AF9A4;
	Wed,  4 Nov 2026 07:00:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1793772008;
	bh=Cnk96OCgnbj2Jb0Ey9mMBCeUlpoB5lqKL9eKvdYZpBc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSNdwhbzGIbmccGm+jIIqMaxYtk/maosg2+ij+ZsyqD1sZrWQPeLrz9CGWIx97l65
	 OtECVjfGHMYCjcDS3hzLlPySkizx5TiYpSzXT8M+SL4wFPzhNBdVfSlLeATje+IADg
	 Qmn8RqtWkoOJ7WWpHHFjtc24tcQvuW429wkPcIC4=
Date: Wed, 4 Nov 2026 08:02:24 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Ruslan Bay <ruslanbey@proton.me>
Cc: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"linux-media@vger.kernel.org" <linux-media@vger.kernel.org>,
	Antti Laakso <antti.laakso@linux.intel.com>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Andreas Helbech Kleist <andreaskleist@gmail.com>,
	"ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>,
	"tfiga@chromium.org" <tfiga@chromium.org>,
	"senozhatsky@chromium.org" <senozhatsky@chromium.org>,
	"claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>,
	"tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>,
	"kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>,
	"johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <20261104060224.GC3619815@killaraus.ideasonboard.com>
References: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me>
 <auj3IU5FC2lejqa7@kekkonen.localdomain>
 <aDZJlXzfVn1R7UC47TgI2YbHkd7cFWAqFk62vFouazo-xyzLXPnqKoZ_fWP6DX2YrCNI5F0hmapeic6LiKHdlluFARAsH_MTybxQjkIov6E=@proton.me>
 <auopqnqgOTY2x7No@ashevche-desk.local>
 <Nd0nHHFZe3yDdCr1d8dOPvVmpKnjbnhqj5AEGS0D9e_n8RhsX9cMsB56L9Fob8IFYJvjkZptYaa7KROk_dMxIP_5LROFdhoaEJTAaUa5kqc=@proton.me>
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
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Nd0nHHFZe3yDdCr1d8dOPvVmpKnjbnhqj5AEGS0D9e_n8RhsX9cMsB56L9Fob8IFYJvjkZptYaa7KROk_dMxIP_5LROFdhoaEJTAaUa5kqc=@proton.me>

On Wed, Nov 04, 2026 at 12:40:17AM +0000, Ruslan Bay wrote:
> 
> I sent the email in a hurry from my phone and forgot to check the
> line length. If that's the issue, fair enough.
> 
> Now, about doing something...
> 
> I'm genuinely trying to keep this discussion constructive. But if you wanna
> go there... as someone who owns an Intel-based device (and, unfortunately,
> is also an Intel shareholder), I have a few things to say.
> 
> IPU4 has been around for 10 years, yet Intel engineers never made a serious
> effort to get the driver upstream. Instead, the driver was renamed and sold
> to their managers as a new IPU6, even though it shares more than 85% of
> its codebase with IPU4. Then the same approach seemed to be repeated with
> IPU7 - the existing IPU6 driver was renamed and even managed to make it into
> staging.
> 
> I understand that this makes internal KPIs look better: more lines of code,
> new repositories. But it also makes it unnecessarily difficult for
> third-party developers to understand, maintain, and contribute to these
> drivers.
> 
> And this isn't an Intel-specific problem. Qualcomm, MediaTek, and other
> vendors have similar issues. They announce a new product, I get excited
> about it, and then I wait a year or more for proper mainline support.
> By that point, I'm already over it. Why would I buy hardware that doesn't
> properly run the software I use? Why would I buy an outdated device
> that's going to be abandoned by its manufacturer after 3–4 years?
> 
> I understand that Intel sells hardware, and that releasing a new socket
> every year forces customers to buy new motherboards with more Intel chips
> on them. But customers aren't stupid. We care about long-term support,
> compatibility, and whether the hardware we buy will actually work with the
> software we use. This is one of the reasons Intel is losing customers to
> AMD. And I can assure you that the next device I buy isn't going to be
> Intel-based. It's probably not even going to be a PC.
> 
> I spent my own time getting the abandoned downstream IPU4 driver to work with
> recent kernels. Now I'm trying to make it more upstream-friendly, hoping
> that one day I'll be able to run a mainline kernel on my 7(!)-year-old tablet.
> I guess something about that upsets you.
> 
> For full disclosure this email is AI-generated.

Ruslan, if you can't even be bothered to write this e-mail yourself and
instead delegate conveying feeling to a machine, I don't think you can
expect much. The ipu6 isn't my driver, so it's not my call, but if it
was me I would just plainly reject this very rude behaviour and the
whole series. Supporting your hardware is no justification for such
behaviour.

> On Tuesday, November 3rd, 2026 at 7:36 PM, andriy.shevchenko@linux.intel.com wrote:
> > On Tue, Nov 03, 2026 at 12:36:26PM +0000, Ruslan Bay wrote:
> > > On Monday, November 2nd, 2026 at 9:48 PM, Sakari Ailus <sakari.ailus@linux.intel.com> wrote:
> > > > On Sat, Oct 31, 2026 at 12:18:19PM +0000, Ruslan Bay wrote:
> > > > > This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> > > > > The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
> > > > > this series supports IPU4P only.
> > > > >
> > > > > Most of the groundwork was done by Antti Laakso in the IPU7 support
> > > > > series [1]. I added the IPU4P-specific parts, using Intel's downstream
> > > > > driver as a reference [2]. The code mostly generated using AI.
> > > > >
> > > > > Image capture was tested on a Surface Pro 7 (i5-1035G4) with
> > > > > both the front OV5693 and rear OV8865 cameras. Test logs: [3]
> > > > >
> > > > > Thanks to the linux-surface community and the libcamera developers for
> > > > > testing the downstream driver and sharing their findings.
> > > >
> > > > Please use git send-email to send further versions of the set if any --
> > > > threading is broken in this version. No need to send a new version just for
> > > > that though.
> > >
> > > Thank you for taking your personal time to review the series.
> > >
> > > I'll address your feedback, send the updated series to the linux-surface project for testing, and then post a non-RFC version upstream. I'll use git send-email for the upstream posting to preserve the thread.
> > 
> > Have you written this reply with AI assistance? This promise already is broken
> > as I pointed out to the very same issue in RFC v1. I highly recommend to reduce
> > AI usage and start doing something.

-- 
Regards,

Laurent Pinchart
