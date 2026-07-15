Received: from lamorak.hansenpartnership.com (lamorak.hansenpartnership.com [198.37.111.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B49353B4E84
	for <linux-media@vger.kernel.org>; Wed, 15 Jul 2026 20:36:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.37.111.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784147806; cv=none; b=obS350Th/PGrvgIXHfHHagLV9bwDx9HxlHaWxvGUU1WEzAYwOpuqDrEW5B7vfD8oE+M5lHIrMRz4sIxS2VQcCUkZmADC1mrv0vckJBSvwH56NrFqHAn4MfzHOp/Jqa1yfHCROtso1If1MRKJN0fv9m2Kabk1YnJyPZe3us5cFK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784147806; c=relaxed/simple;
	bh=1OqiMhGUjDbBkdwku37VfV1cXJ3D4gunMft5ZVDDF5c=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=DVsyTgVdlZvnWqQdYQubKgzwOJ0/0PHRmxVbklw+SqXpYcjMl/Twm7+H988BYuZuLqSRZmMG8dgS3Ot6vrzr3Jb3VPKIhMRs/KzlR+T3tByeOUc3EQcWDNARHUXtjB1N7bXKELGJYFycQkMW0UNqZqrjm+3mJQ6FYFA2sxsuC+k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com; spf=pass smtp.mailfrom=HansenPartnership.com; dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b=x1J2sN5u; arc=none smtp.client-ip=198.37.111.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=HansenPartnership.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=hansenpartnership.com header.i=@hansenpartnership.com header.b="x1J2sN5u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
	d=hansenpartnership.com; s=20151216; t=1784147803;
	bh=1OqiMhGUjDbBkdwku37VfV1cXJ3D4gunMft5ZVDDF5c=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:From;
	b=x1J2sN5uZl27PG/7id9Gp1riCZVd9/ToIVpCnrWNFgFx8uV5NUoHJeBYfMjDFlD0S
	 SRfv8OmbLKh5pjqjy9j3O5n3SovHmgueZCj7+5kiXYjwU8/aPw2n3/rfvyOkR37Al1
	 l0aoDcWUrf4coI4YF7l6jD01TFEnlEyHuDoCyRIs=
Received: from lingrow.int.hansenpartnership.com (unknown [IPv6:2601:5c4:4300:d341::8c71])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by lamorak.hansenpartnership.com (Postfix) with ESMTPSA id 53ED01C0247;
	Wed, 15 Jul 2026 16:36:43 -0400 (EDT)
Message-ID: <7b8e735092ecd25c61e79d8291b2edf5e54dfb15.camel@HansenPartnership.com>
Subject: Re: Linking Patchwork with Sashiko?
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Jan Kara
	 <jack@suse.cz>
Cc: Theodore Tso <tytso@mit.edu>, Roman Gushchin <roman.gushchin@linux.dev>,
  Mauro Carvalho Chehab <mchehab+huawei@kernel.org>, Derek Barbosa
 <debarbos@redhat.com>, Matthieu Baerts <matttbe@kernel.org>,  Konstantin
 Ryabitsev <konstantin@linuxfoundation.org>, Jason Gunthorpe <jgg@ziepe.ca>,
 Steven Rostedt <rostedt@goodmis.org>, 	users@kernel.org, Linux Media
 Mailing List <linux-media@vger.kernel.org>,  Stephen Finucane
 <stephenfin@redhat.com>
Date: Wed, 15 Jul 2026 16:36:42 -0400
In-Reply-To: <20260715202808.GN1778116@killaraus.ideasonboard.com>
References: <20260710083845.23c753ca@foz.lan> <87wlv2jq4t.fsf@linux.dev>
	 <20260713095538.3d5e86f1@foz.lan>
	 <20260713094120.GD1127719@killaraus.ideasonboard.com>
	 <20260713220427.582b28bf@foz.lan> <7ia4mrvtrxjl.fsf@castle.c.googlers.com>
	 <20260715005909.GF1656185@killaraus.ideasonboard.com>
	 <alcBvuIMEGSjAD1R@mit.edu>
	 <20260715161111.GC1778116@killaraus.ideasonboard.com>
	 <j4jhhj6rw6kgem73slctakegtoirqmngbejbabfnfwtyshdlgp@itpaup6ghuod>
	 <20260715202808.GN1778116@killaraus.ideasonboard.com>
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

On Wed, 2026-07-15 at 23:28 +0300, Laurent Pinchart wrote:
[...]
> No later than yesterday a friend of mine pointed me to a mail thread
> where sashiko referenced code that has never existed in the kernel,
> and the maintainer blindly trusted the comment and asked the patch
> author to fix that issue, seemingly doubling down when told the code
> didn't exist.

We can definitely do maintainer education if you point me (or the TAB)
at the thread.  Sashiko as a tool can absolutely get things wrong so,
as maintainers, we do need to accept a reasoned answer that shows the
review is wrong.

Regards,

James
