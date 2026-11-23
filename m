Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=213.167.242.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430304;
	b=4oeliUz+91dPZPXwt3pWnYtiFLaxMDxrRE/NLFf+fUPbgg0B57H7ZaKGfSmNURjuJePR
	 8HNf/VgD+2od5ZwxP2oJJcSqbHrvfuCqj3ZF+WGvvXrbjwaJc9NWVwAWpOXizHujRf5MV
	 1h/FpmlKX3JjWa+L6zOJUhDxl2kXIESdjoZlv+2DOrQFOwTuGrff/+ZVhf5arqmI0Fsoj
	 ohM3jPnmdBxJnjeAgmHDpuj1XQIogbYspflfHAqoGY89jLd4m14DTKDyWvVIE7jadZPN2
	 rmFHygn3u5rm+S4pOhv+p3Ccy56z47iIXXKaiGi3PWXT7yN0BE3rvfE/C9b/2SID26w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430304;
	h=DMARC-Filter:Received:DKIM-Signature:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:In-Reply-To:References:Subject:From:Cc:To:
	 Date:Message-ID:User-Agent;
	bh=SbWEJUjsX0YE70O2+Wb1YzHB/4D3qAf9pObHkNERrUw=;
	b=0EVxtmxzbuak68pVTMwfTAZ9hr6UCV6x13DbkBpXh61N6FlV+DSutV47k7JhA1K1KA8D
	 mu/YhbT1XA1Nm0vH0pa6qd/mN9uXLn4R6UjT9lM2iHyrh0v93a7mCzWkYvQw9E47Z9VlR
	 72JDbnT/pK8CO1WHOBNXKPTMW+lIJPTqpad6c2oWmPcmVyOmasK+/3EHNP9/B/SQ/wAvi
	 StsD4oFQhnByqr/VON/s5VOsEhONRyrVH0Z2PMCO1ydJUQE27QbkHeeUQzXzMKd2NNzb+
	 VG/30c3dddU5MTZtO6LzxTLwRQkLN4TQZpL55XN3rLjkNWNYil+WkzSXZy8WFqSpH6A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ideasonboard.com;
	spf=pass smtp.mailfrom=ideasonboard.com;
	dkim=pass header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qx7bPP8t;
	arc=none smtp.remote-ip=213.167.242.64
Received: from perceval.ideasonboard.com (perceval.ideasonboard.com [213.167.242.64])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68815606A31A
	for <linux-media@vger.kernel.org>; Mon, 23 Nov 2026 10:38:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68815606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ideasonboard.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.a=rsa-sha256 header.s=mail header.b=qx7bPP8t
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D81764B0;
	Mon, 23 Nov 2026 11:35:50 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1795430151;
	bh=iL+JZANKdznsaN78nML6Ar59HX93IgrUJ70eNSTp9cU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=qx7bPP8tZou74oLLyYeXowkJI0bwFpjKezfNgZx2LFRxMxedtLemNdmpfzGRIPqRK
	 DijaRT4WeG3WLabFancp9TQOqbLgH8+WDOcWOI+qdu8988EBjA6SoeKG5z2Ac8NDZY
	 UJKkkzuHxJ4KPGlsLkdDMOYJs+dHNkPHe5qDa1Fo=
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20261121163237.46332-1-dungeonlords789@naver.com>
References: <20261121163237.46332-1-dungeonlords789@naver.com>
Subject: Re: [PATCH v4l-utils 1/1] doc: upd
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
To: dungeonlords789@naver.com, linux-media@vger.kernel.org
Date: Mon, 23 Nov 2026 10:38:20 +0000
Message-ID: <179543030033.68583.8462255388156577551@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1

Quoting dungeonlords789@naver.com (2026-11-21 16:32:37)
> From: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.github.com>
>=20

Your subject/commit title is chopped.

> No manual work, just update via code

What does that mean ? How did  you update this ?

How do we know this is worth reviewing, or correct ? Was it automated?
Did you use a tool or a script? or update from a newer version of the
Doxygen documentation/defaults ?


> ```
> $ doxygen -u Doxyfile.in
> warning: Tag 'HTML_TIMESTAMP' at line 1151 of file 'Doxyfile.in' has beco=
me obsolete.
>          This tag has been removed.
> warning: Tag 'FORMULA_TRANSPARENT' at line 1431 of file 'Doxyfile.in' has=
 become obsolete.
>          This tag has been removed.
> warning: Tag 'DOT_FONTNAME' at line 2062 of file 'Doxyfile.in' has become=
 obsolete.
>          This tag has been removed.
> warning: Tag 'DOT_FONTSIZE' at line 2069 of file 'Doxyfile.in' has become=
 obsolete.
>          This tag has been removed.
> warning: Tag 'DOT_TRANSPARENT' at line 2269 of file 'Doxyfile.in' has bec=
ome obsolete.
>          This tag has been removed.
>=20
> Configuration file 'Doxyfile.in' updated.

Describe more about why and what is changed. Consider writing something
like 'where this file originated from' or where you are getting the
updates from to make all of this change.

Maybe even break it down to one thing at a time to review easily, unless
it's simply pulling in a new default file.



> ```
>=20
> Signed-off-by: Andrei Cherniaev <27889022+AndreiCherniaev@users.noreply.g=
ithub.com>
> ---
>  doc/Doxyfile.in | 1669 +++++++++++++++++++++++++++++++++--------------
>  1 file changed, 1191 insertions(+), 478 deletions(-)

There's simply too much churn there. I'm not reading the individual
changes currently.

--
Kieran
