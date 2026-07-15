Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D441A3644A4
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 16:53:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784134433; cv=none; b=afYfAVPOmroWTa66BnvHUmAchAuTKspuf2CR/7Aeg0+6xRkPetblpchUe52yjjkWbO4GqiM/Av9Dx7WlpONDCNvTr4YyrcFJIYuMZ57N8U0duvc6mVI6bi8wVueBzVORE96VxhIQEOFc6gth0iUveu724N6xhdpBVPjWPPO+0NE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784134433; c=relaxed/simple;
	bh=PjmD5Vb3Mgm/H/JPNFVcyn3tZ8JIfvi4MZRVfJG2UGM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=PT5ClDX1Qte11HBK/nLlvG3NTKvG1x2ZS6NCcBt07h++Lq9Pf7wqCoTnK05v+DiOBv3geOKWMfpMZuvjg9vir92m7UT67qTrRAF8h1y6viSH5RLRTK+rFzMBi3Xaqivc8VAw3xZ7a7BU7rqdqJxvcvVeZQku1/mtfOl2QjbhKnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=VlgvQsIP; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="VlgvQsIP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784134428;
	bh=PjmD5Vb3Mgm/H/JPNFVcyn3tZ8JIfvi4MZRVfJG2UGM=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=VlgvQsIPm2e6WS76RtFlJ16qXixZDsi+Nf2u3Qp6luZpSrPG+WuremzVeRDBLhe67
	 ob5UM2uH2HYPSq0Go1d1vR0eknJ2sL7qxz5k2qZMBbI0jrkZqAzq1UE6rJEISDEFG3
	 c6Nasos1l+6o7upcmM6v1x7+lNCQ34Dw4czu5Or8=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id E8B4D1C023E;
	Wed, 15 Jul 2026 12:53:47 -0400 (EDT)
Message-ID: <a03c191ab567d1f24708a797755e380b7657617e.camel@HansenPartnership.com>
Subject: Re: Linking Patchwork with Sashiko?
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Theodore Tso	
 <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>, Derek Barbosa	
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>, Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Steven Rostedt	 <rostedt@goodmis.org>, users@kernel.org, Linux Media
 Mailing List	 <linux-media@vger.kernel.org>, Stephen Finucane
 <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 12:53:47 -0400
In-Reply-To: <20260715161840.GD1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan> <87wlv2jq4t.fsf@linux.dev>
	 <20260713095538.3d5e86f1@foz.lan>
	 <20260713094120.GD1127719@killaraus.ideasonboard.com>
	 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	 <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <alcBvuIMEGSjAD1R@mit.edu> <20260715091349.2094a0ec@foz.lan>
	 <460bb8002edc009194dcc0ad68a0538e5df6bfb5.camel@HansenPartnership.com>
	 <20260715161840.GD1778116@killaraus.ideasonboard.com>
Autocrypt: addr=James.Bottomley@HansenPartnership.com;
 keydata=mQENBE58FlABCADPM714lRLxGmba4JFjkocqpj1/6/Cx+IXezcS22azZetzCXDpm2MfNE
 lecY3qkFjfnoffQiw5rrOO0/oRSATOh8+2fmJ6el7naRbDuh+i8lVESfdlkoqX57H5R8h/UTIp6gn
 1mpNlxjQv6QSZbl551zQ1nmkSVRbA5TbEp4br5GZeJ58esmYDCBwxuFTsSsdzbOBNthLcudWpJZHU
 RfMc0ew24By1nldL9F37AktNcCipKpC2U0NtGlJjYPNSVXrCd1izxKmO7te7BLP+7B4DNj1VRnaf8
 X9+VIApCi/l4Kdx+ZR3aLTqSuNsIMmXUJ3T8JRl+ag7kby/KBp+0OpotABEBAAG0N0phbWVzIEJvd
 HRvbWxleSA8SmFtZXMuQm90dG9tbGV5QEhhbnNlblBhcnRuZXJzaGlwLmNvbT6JAVgEEwEIAEICGw
 MGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheAAhkBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAml2ZBI
 FCS3GUMIACgkQgUrkfCFIVNZKjQf/deRzlXZClKxTC/Ee2yEPqqS7mm/INUA49KdQQ5oIhSxkUBy0
 9J4qjMIo5F8ZFkFTqikBqeL35LKu7O7rn8WETfX8Bxvos3HUsl3jHo34DES4MUFIpoQPgtiLRGwLb
 K0cVCAArR2u2qj4ABmTRrs1I1kvdjEw6gatOuXtEe/j5O2fvfzTq9GBr0Q3n2IAsFXi4hLlx6VPE8
 tyWUZ8BWJKtih3JAeUiXFvASL3McV0rV9RnU0VbjEQEhSE7PMYhWpnDC9AyBb0lXJllQRvC3NSkUB
 8KVQgNNxRPss0WE/nBoZ4dFA42jTyzTz8lNylxZoAWV7WJb3QxVg4oCodRVrxxrQhSmFtZXMgQm90
 dG9tbGV5IDxqZWpiQGtlcm5lbC5vcmc+iQFVBBMBCAA/AhsDBgsJCAcDAgYVCAIJCgsEFgIDAQIeA
 QIXgBYhBNVgbnPItGJxvq2a34FK5HwhSFTWBQJgS5mYBQkbNYS9AAoJEIFK5HwhSFTWBpwIAL5Bk3
 5FB34U6iHmDzzgdCbxLTs43T/YQyJpcGIvopBvnI/fDY8oSG6Df64/O6B+1R+A8TDp6ZG5ysUWnCC
 6GuIaEHemBYkitMPglR6+sGCMQY7O0mlsPvdssvKK1KI9Bno4VU6ogaF2qVzefSqg1Djmf/DcsxWP
 rI/jdJ8FB5AYR2rjIdDFc+zRdAJuavo1/anyY2wgpFh/3R8IOYAEfWV9nGgYkf9+tA4EIn1sxE0I3
 L5oW2N3mbyRrkzuBwO8ztMCwqEPk7moWzhokcZqMXiAIahaZdkashJC+s2X2RZSGCy+g+pvY5NN4B
 BVG5XwLgVBqbHMTcxE0fbmPqz+q6O0LEphbWVzIEJvdHRvbWxleSA8amVqYkBoYW5zZW5wYXJ0bmV
 yc2hpcC5jb20+iQFXBBMBCABBFiEE1WBuc8i0YnG+rZrfgUrkfCFIVNYFAmODZ5ACGwMFCRs1hL0F
 CwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4AACgkQgUrkfCFIVNZu0Af/TzvL2/NdgAcw9uN3x60H8
 jc4QUq14VpxcFEFEMpcj1morkX/G93V+56HBBaXZj+yK8PhxIA/SIz+sU7C/0YvKuvzakP8ZX/7WJ
 e32SOUtjfr/VTaqjIBzNj6OxLvZpmNbBw7s6DwhhNpHOWqJ/1ml+PtDRDV71IB58yVqQjp1xlNKVl
 ZppcJ5908EJzsFnRIVjiQiDSKoppqB2BCibBbrWcln7CiWMyOC/cco6SIn6twH+f7+aivJ3xGcOE2
 a9gBKF5rNi9TBoX9oyPmshv/TDmnohsVrH7AYXlGYfZTk15SWEiROh1QX8/uD9wl/gcIv5EDUpT/F
 L2jzOsA5663bw==
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2026-07-15 at 19:18 +0300, Laurent Pinchart wrote:
> On Wed, Jul 15, 2026 at 08:42:54AM -0400, James Bottomley wrote:
> > On Wed, 2026-07-15 at 09:13 +0200, Mauro Carvalho Chehab wrote:
> > > On Tue, 14 Jul 2026 23:54:43 -0400 "Theodore Tso" wrote:
[...]
> > > > Things get a lot more complicated when we're considering the
> > > > use of LLM's to (a) review code, (b) automate the analysis of a
> > > > bug report or stack trace, or (c) automate backporting a patch
> > > > to LTS kernel.
> > > >=20
> > > > Consider the first recommendation, "The FOSS community should
> > > > support, not just tolerate, those who outright reject LLM-gen-
> > > > AI systems."=C2=A0 If someone rejects LLM-gen-AI systems, and the
> > > > LTS kernel contains patches which are automated backported, and
> > > > they object, are we bound to forswear the use of automated
> > > > backport technologies?
> > > >=20
> > > > What if someone reports a bug with a kernel stack trace, and
> > > > someone uses an LLM agent to analyze their bug report and find
> > > > a fix.=C2=A0 What does it mean to "support somone who outright
> > > > rejects the use of LLM-gen-AI systems" in that case?
> >=20
> > I think it's simpler than that: The contributor doesn't get to
> > approve the tools the maintainer uses to assess and apply patches.=C2=
=A0
> > If there's AI in there and the contributor is an AI luddite, then
> > the patch doesn't get applied (i.e. your right to ignore AI stops
> > when it infringes others' right to use it).
>=20
> I don't think anyone instructed any maintainer to stop using those
> tools to assess patches.

Well, AI replies to patches were the discussion.  That is part of a
maintainer assessment (at least if sashiko replies with a problem to
SCSI patches I ignore the patch until the submitter either fixes the
issue or explains why it is wrong).

> On a side note, I find the formulation "contributor *is* an AI
> luddite" gets close to an ad hominem attack. I assume it wasn't your
> intention. Given how heated this topic is, focussing on people's
> actions instead of their nature could help making the discussion more
> productive (if that's at all possible on a mailing list).

It's a common and neutral dictionary term to mean someone opposed to
change:

https://www.dictionary.com/browse/luddite

If we avoid all words which originally had negative origins because the
origins might cause offence to some, you'll find a long list of
everyday words:

https://www.mentalfloss.com/language/words/13-words-changed-negative-positi=
ve-or-vice-versa

Although I personally would love to support banning the word "Dude" in
silicon valley on grounds of original negative connotation ...

Regards,

James
