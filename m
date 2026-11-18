Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.251.105.195
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795016103;
	b=PljI56EKY1R3KvEIXPfBBxp0DXXIRlzKil5iI3eA+ayDUG5IfG7PLk7ooZeZ61rTb/8G
	 dmHDqAa13mos9Ot57HOCdlkmzc2oirXuOq0rgVg/tVwMI78aigcY6mZX3tt9Hf9Sk6N53
	 OOUZmmjg1BsKDKRwUPDCffokMmK+s/7ogsphC4fkGDUhOj1413kv/B4l37YZwZ+ahaf4W
	 24cv3PCdAmQSfrP9mGZbvY0ZfQwimAwwNCzaJU0rNf1mZbYF1iPTMxDk3YcbEjwR1+O7k
	 s+CFVUHqfmIUXzpUmNU6//Xsv+PUezggKmEUhjXsyHr9WLfODJ6g3+8FLDQxxavpvIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795016103;
	h=DMARC-Filter:DKIM-Signature:Received:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Autocrypt:Organization:Content-Type:
	 User-Agent:MIME-Version;
	bh=YmIyJHLhfqfVnjjdZyBd1VHQ43Q91L66Z3wUwsYbj70=;
	b=SoKva8wjsKuveScSL/3w6py6PA+c6iZsB2ch6BK716uj6wm+U2AWwbaEtExygCP6/ufM
	 rnLRcBexa6pChpjaYZe7YEWDgqXSIXV2Dpk5Q6k7reGhzf+pMggGQd0EMNKddZG8xN+Kd
	 ZZDWTNrcT2+1r7XPGoBnogARmaP0ppkvVlZ5vXJOeH0rr4EZzYJogOvesYK+WSxvjMIa1
	 8TVOcsB1PKsUwIYBP9QsVthUwKRamJMe0REo4KSPNUJLPumwfjN93XZqDa3Sifk7VHBoh
	 +jKO0xWfuSdgCOwTTkkKGVqIUOul50CRPyAXZJpbZCQ0fulu51id4vAvF7brYlHnSxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=collabora.com;
	spf=pass smtp.mailfrom=collabora.com;
	dkim=pass header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M3FQqFzf;
	arc=none smtp.remote-ip=148.251.105.195
Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111DF606A31C;
	Wed, 18 Nov 2026 15:35:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 111DF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=collabora.com header.i=@collabora.com header.a=rsa-sha256 header.s=mail header.b=M3FQqFzf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1795016101;
	bh=51dwE9+j0e1mawOBNMOi0nQ9g2gIMsjDwbanm/5LQiY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=M3FQqFzft/Ir+kHAV0p/RwbOGW3u27zvr6sW1lPU+5YbjNxcyQY61Xv5g4w7jct62
	 nRRIqmM8exVWdDoK5r3z7QNiwZxHTD2W9ZH0YdWey5yIc1pg+tAgJrjq8HXWrXqiHf
	 oCb/tCqyuYglr5qCzF148U536E2cxDwn5doz9KpnwMAizCt5Z8gxpCV7ocYB5CaR4a
	 epwIZqWKk419fQBbY2P52F3hIuweR7Z391GGDaLDccZJG1Y9nbbhzgPDzlBuToHY14
	 bTKJJe/VqEBXXMz5yTM70lI4bKWakajb/NuRJwnLqTycU6Xf61Ag87lL3h3RT6B3gk
	 +aWFGoeCKOouw==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C5E6917E0564;
	Wed, 18 Nov 2026 16:34:57 +0100 (CET)
Message-ID: <f804ccb29fdda80673f7150b24390fdefce04505.camel@collabora.com>
Subject: Re: [PATCH v9 08/14] media: dt-bindings:
 mediatek,vcodec-subdev-decoder: Add MT8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Rob Herring <robh@kernel.org>, Kyrie Wu <kyrie.wu@mediatek.com>
Cc: Tiffany Lin <tiffany.lin@mediatek.com>, Andrew-CT Chen	
 <andrew-ct.chen@mediatek.com>, Yunfei Dong <yunfei.dong@mediatek.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,  Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>,  Ricardo Ribalda
 <ribalda@chromium.org>, Kees Cook <kees@kernel.org>, Hans Verkuil
 <hverkuil+cisco@kernel.org>,  Fei Shao <fshao@chromium.org>, Haoxiang Li
 <haoxiang_li2024@163.com>, Chen-Yu Tsai	 <wenst@chromium.org>, Laurent
 Pinchart	 <laurent.pinchart+renesas@ideasonboard.com>, Tomasz Figa
 <tfiga@chromium.org>,  Philipp Zabel <p.zabel@pengutronix.de>, Benjamin
 Gaignard <benjamin.gaignard@collabora.com>, Qianfeng Rong	
 <rongqianfeng@vivo.com>, Irui Wang <irui.wang@mediatek.com>, Jacopo Mondi	
 <jacopo.mondi@ideasonboard.com>, Fan Wu <fanwu01@zju.edu.cn>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Sakari Ailus
 <sakari.ailus@linux.intel.com>
Date: Wed, 18 Nov 2026 10:34:56 -0500
In-Reply-To: <20261118152219.GA1746506-robh@kernel.org>
References: <20261117032950.1425556-1-kyrie.wu@mediatek.com>
	 <20261117032950.1425556-9-kyrie.wu@mediatek.com>
	 <20261118152219.GA1746506-robh@kernel.org>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-EzpDPXQ5rHo8aaNXRlwQ"
User-Agent: Evolution 3.62.1 (3.62.1-1.fc45) 
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

--=-EzpDPXQ5rHo8aaNXRlwQ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 18 novembre 2026 =C3=A0 09:22 -0600, Rob Herring a =C3=A9crit=
=C2=A0:
> On Tue, Nov 17, 2026 at 11:29:44AM +0800, Kyrie Wu wrote:
> > Compared to previous ICs, the MT8196 supports a 10-bit decoder
> > and has a decoding capability of 4K@120fps. It also supports
> > 36-bit DRAM IOVA address and Video Power Control to optimize
> > bandwidth and voltage usage.
> >=20
> > MT8196 uses VCP to run the decoder firmware, so require mediatek,vcp
> > for MT8196 and move the mediatek,scp requirement into the condition
> > for the existing SoCs.
> >=20
> > Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> > Acked-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> > ---
> >  .../media/mediatek,vcodec-subdev-decoder.yaml | 52 ++++++++++++++++++-
> >  1 file changed, 51 insertions(+), 1 deletion(-)
>=20
> This patch should be based on this one:
>=20
> https://lore.kernel.org/20261019212431.4109371-1-robh@kernel.org

Ack.

>=20
> Rob

--=-EzpDPXQ5rHo8aaNXRlwQ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCav3FoAAKCRDZQZRRKWBy
9EukAQD0ZTCdWzl/LYHeFQ4jPv5f0c/GvDvpO4ddSGxPgZzJlQEAtSL/JNfxGUlF
ZCRrbteHcXbERxxd7ObdAXxvqyOB2Qc=
=ic/T
-----END PGP SIGNATURE-----

--=-EzpDPXQ5rHo8aaNXRlwQ--
