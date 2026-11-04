Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.31
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793752825;
	b=ljzVSk0qjagGhpzBrP5bUwWe15nkSHxvFXCWSDamXhUfARRVv6IR6e0jOskYNW1lN5S4
	 uhwPDHO8PCu39QsoOYDl1uci3ZCB6IKWOUTparRVyVwDkgZ1xNUNjNKzRkwmlH7qF1uWO
	 J59/euP633g6XzuyO018cig9b3ZnXjq/+8L6MRQeUd4o4bZxpXJr+N5nZljZbC3bZdXun
	 q9xlYlWohygfpWIQYs7LMcMLAezfQHRJGtZIQR6b8KN9VMkpkTgyUQBUXjewDiooWgFds
	 eINmcXgtbF2+q1HAcxtX1feEn2RMzDltfZSTmuV88XQtu/6TwV3EUGLxBa4KEJBzqJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793752825;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=apT3fSc1fVUWiPe70VQ+zFiN7yIPCcZ9r7xA0IOgOTw=;
	b=MEUyo6u3O2ZFWSh+bk7BquXN4jHavGTOSQAQ9c7QeU7jcLyPfr8vmTN87QQcyEzsX/+G
	 JlzDKSohXemEYR3PeIJOXmMeaqpeYLDYPG4hyEuYVkThdBqNiRIsUNiUCfTUxpBj9KX/j
	 awjaBTQQFp06tfg2B+6+q1WGAtZDjPENw5y1D9BKKRXHqRoPNmxpaENQ8mTU5G9C0R2+k
	 EfVUW6u/82uWzgHyF38BkZutORidWaV8qJy2R64Y2erGlXvgs6tbdOVW638MX2AyH49BF
	 hkgdRyl/vsz3HGDqo4cfEFSlpzmT0LBtFnCda4JEDfY2JwdJv9KBTvRtEdeJuHlxVMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=proton.me;
	spf=pass smtp.mailfrom=proton.me;
	dkim=pass header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7i7vobjaaje3rm3y6w62rvo22a.protonmail2 header.b=hnVpGubG;
	arc=none smtp.remote-ip=109.224.244.31
Received: from mail-24431.protonmail.ch (mail-24431.protonmail.ch [109.224.244.31])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0F1606A31B
	for <linux-media@vger.kernel.org>; Wed,  4 Nov 2026 00:40:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB0F1606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=proton.me header.i=@proton.me header.a=rsa-sha256 header.s=7i7vobjaaje3rm3y6w62rvo22a.protonmail2 header.b=hnVpGubG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=7i7vobjaaje3rm3y6w62rvo22a.protonmail2; t=1793752821;
	x=1794012021; bh=apT3fSc1fVUWiPe70VQ+zFiN7yIPCcZ9r7xA0IOgOTw=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=hnVpGubGwB3s9Ai8xTlqDJVo6emFnzFJI7jtt8kxo/Y8GGjJpAnSGb71ktf7kTEYb
	 csL8XG9mGdUOMPrvVc45KxqJdeQJUc/fB+9Wg7MkPsoS5sjJzmiL1nhhAQrzX/qLA5
	 yQNg6rl2wLfSdEh6Bb0pXc9WvcWEqiQxLpMSe4vae40fRmtMuECcUcFEU4ROHM19q0
	 +5uXHWpR6TtUKQ4qoIE8KSqMR+e/MuNK1magxJwu3MnP43qd6eKgYoF1n+Sdca+TOb
	 LnNlKQM43KkZtOhQDv3wckjMj5SWssAQjbWnD12iDN0H0HWE0g884LZw4bPXViaExs
	 wiCxxCJEbEH7g==
Date: Wed, 04 Nov 2026 00:40:17 +0000
To: "andriy.shevchenko@linux.intel.com" <andriy.shevchenko@linux.intel.com>
From: Ruslan Bay <ruslanbey@proton.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, "linux-media@vger.kernel.org" <linux-media@vger.kernel.org>, Antti Laakso <antti.laakso@linux.intel.com>, Ricardo Ribalda <ribalda@chromium.org>, Andreas Helbech Kleist <andreaskleist@gmail.com>, "ilpo.jarvinen@linux.intel.com" <ilpo.jarvinen@linux.intel.com>, "tfiga@chromium.org" <tfiga@chromium.org>, "senozhatsky@chromium.org" <senozhatsky@chromium.org>, "claus.stovgaard@gmail.com" <claus.stovgaard@gmail.com>, "tomi.valkeinen@ideasonboard.com" <tomi.valkeinen@ideasonboard.com>, "kieran.bingham@ideasonboard.com" <kieran.bingham@ideasonboard.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, "johannes.goede@oss.qualcomm.com" <johannes.goede@oss.qualcomm.com>
Subject: Re: [RFC PATCH v2 00/12] media: ipu6: Add support for IPU4P hardware
Message-ID: <Nd0nHHFZe3yDdCr1d8dOPvVmpKnjbnhqj5AEGS0D9e_n8RhsX9cMsB56L9Fob8IFYJvjkZptYaa7KROk_dMxIP_5LROFdhoaEJTAaUa5kqc=@proton.me>
In-Reply-To: <auopqnqgOTY2x7No@ashevche-desk.local>
References: <2MQDQgaaKZ4HAu3U6zhMj_Muf_H8tsVGLh_CSXM_kxcTL51pE14U9-brGqLYwPPJfDXHog_jWWWOTgToPYLMVZN-KW80t9sDIlEw1uwg-FA=@proton.me> <auj3IU5FC2lejqa7@kekkonen.localdomain> <aDZJlXzfVn1R7UC47TgI2YbHkd7cFWAqFk62vFouazo-xyzLXPnqKoZ_fWP6DX2YrCNI5F0hmapeic6LiKHdlluFARAsH_MTybxQjkIov6E=@proton.me> <auopqnqgOTY2x7No@ashevche-desk.local>
Feedback-ID: 183606634:user:proton
X-Pm-Message-ID: 3344764cbd12523396b2a9602a9c7d069e115325
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


I sent the email in a hurry from my phone and forgot to check the
line length. If that's the issue, fair enough.

Now, about doing something...

I'm genuinely trying to keep this discussion constructive. But if you wanna
go there... as someone who owns an Intel-based device (and, unfortunately,
is also an Intel shareholder), I have a few things to say.

IPU4 has been around for 10 years, yet Intel engineers never made a serious
effort to get the driver upstream. Instead, the driver was renamed and sold
to their managers as a new IPU6, even though it shares more than 85% of
its codebase with IPU4. Then the same approach seemed to be repeated with
IPU7 - the existing IPU6 driver was renamed and even managed to make it int=
o
staging.

I understand that this makes internal KPIs look better: more lines of code,
new repositories. But it also makes it unnecessarily difficult for
third-party developers to understand, maintain, and contribute to these
drivers.

And this isn't an Intel-specific problem. Qualcomm, MediaTek, and other
vendors have similar issues. They announce a new product, I get excited
about it, and then I wait a year or more for proper mainline support.
By that point, I'm already over it. Why would I buy hardware that doesn't
properly run the software I use? Why would I buy an outdated device
that's going to be abandoned by its manufacturer after 3=E2=80=934 years?

I understand that Intel sells hardware, and that releasing a new socket
every year forces customers to buy new motherboards with more Intel chips
on them. But customers aren't stupid. We care about long-term support,
compatibility, and whether the hardware we buy will actually work with the
software we use. This is one of the reasons Intel is losing customers to
AMD. And I can assure you that the next device I buy isn't going to be
Intel-based. It's probably not even going to be a PC.

I spent my own time getting the abandoned downstream IPU4 driver to work wi=
th
recent kernels. Now I'm trying to make it more upstream-friendly, hoping
that one day I'll be able to run a mainline kernel on my 7(!)-year-old tabl=
et.
I guess something about that upsets you.

For full disclosure this email is AI-generated.






On Tuesday, November 3rd, 2026 at 7:36 PM, andriy.shevchenko@linux.intel.co=
m <andriy.shevchenko@linux.intel.com> wrote:

> On Tue, Nov 03, 2026 at 12:36:26PM +0000, Ruslan Bay wrote:
> > On Monday, November 2nd, 2026 at 9:48 PM, Sakari Ailus <sakari.ailus@li=
nux.intel.com> wrote:
> > > On Sat, Oct 31, 2026 at 12:18:19PM +0000, Ruslan Bay wrote:
> > > > This series adds IPU4P support to the upstream IPU6/IPU7 driver.
> > > > The IPU4 family includes IPU4 (Apollo Lake) and IPU4P (Ice Lake);
> > > > this series supports IPU4P only.
> > > >
> > > > Most of the groundwork was done by Antti Laakso in the IPU7 support
> > > > series [1]. I added the IPU4P-specific parts, using Intel's downstr=
eam
> > > > driver as a reference [2]. The code mostly generated using AI.
> > > >
> > > > Image capture was tested on a Surface Pro 7 (i5-1035G4) with
> > > > both the front OV5693 and rear OV8865 cameras. Test logs: [3]
> > > >
> > > > Thanks to the linux-surface community and the libcamera developers =
for
> > > > testing the downstream driver and sharing their findings.
> > >
> > > Please use git send-email to send further versions of the set if any =
--
> > > threading is broken in this version. No need to send a new version ju=
st for
> > > that though.
> >
> > Thank you for taking your personal time to review the series.
> >
> > I'll address your feedback, send the updated series to the linux-surfac=
e project for testing, and then post a non-RFC version upstream. I'll use g=
it send-email for the upstream posting to preserve the thread.
>=20
> Have you written this reply with AI assistance? This promise already is b=
roken
> as I pointed out to the very same issue in RFC v1. I highly recommend to =
reduce
> AI usage and start doing something.
>=20
> --
> With Best Regards,
> Andy Shevchenko
>=20
>=20
> 
