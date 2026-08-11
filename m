Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 384CB36D4E1;
	Tue, 11 Aug 2026 20:22:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786479749; cv=none; b=qMuiPB/JPbBYqayIoFTWT18Lh9J6RK1p8QhDsOIGD+l2JLQVhXj+gWexoBTKmMuWTrxrBPAyjLBo2rJXuE6Z/e5Srh+uacO24oQRPl9rh0/CpvpWnyZ/sNrsuErGgkIArKEZyl5lDO17MrRecrCTiiqATPojpcKyeHW1rVvjYhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786479749; c=relaxed/simple;
	bh=Wz9MHW44aeB6pwNnHm1InxQmMZgedGRzOQHdWchZDq8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=JQ9Q5GJoohDH1ePKO23izU4kKrcJvp5OAIdnu42qjrexFljBs2X3zSj3fzffg2JbA1Z0XAwHroNVmdOCDSdDKojr4HCq2P7CWYvxfW3ldsnV8vtDUOrIMMWZxFbrgbnLw/ZHw3tC8WW9fEzU0QKaeRDMAYGBxXVuXf4pAMPNnNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=NsSQ6E7c; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="NsSQ6E7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1786479746;
	bh=Wz9MHW44aeB6pwNnHm1InxQmMZgedGRzOQHdWchZDq8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=NsSQ6E7c2GhYe0E5c8QOLiVWTQaEZff47w+zb9VuQB01TJ8rHWKqn5CWOvUMP/xDG
	 rXh9+U/zO+4oDHNfXaOA51YB8X+aGcU4Zv1MHslRuMqzf9nEltm6FIegiAfsNX3NFV
	 TREuPuJWEUF9UVZgXXTrDq8PtK5o4GKIBAG/dAi/utNkSPyGsplZYh458T0wLUal9P
	 EV9AT7SgsAa+KC7OZyNCt1sF3dUa9mwW+ZgEtXYmfDFUb1svjBt11t5Ol9bA1Bd8YX
	 buaZQLLU4HksrmDY62W4nTLpAp5u9TeCGxQd+8m792bdabk3yHlE4ec8BoNBOP8r58
	 YppK5RtCN3tgQ==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9AFA317E06DB;
	Tue, 11 Aug 2026 22:22:22 +0200 (CEST)
Message-ID: <c8ab26c2edfa4ee4fbbb83faf5f54547f252464f.camel@collabora.com>
Subject: Re: [PATCH v6 01/14] media: mediatek: vcodec: support vcp
 architecture
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu =?UTF-8?Q?=28=E5=90=B4=E6=99=97=29?= <Kyrie.Wu@mediatek.com>, 
 "matthias.bgg@gmail.com"	 <matthias.bgg@gmail.com>, "fshao@chromium.org"
 <fshao@chromium.org>, Yunfei Dong
 =?UTF-8?Q?=28=E8=91=A3=E4=BA=91=E9=A3=9E=29?=	 <Yunfei.Dong@mediatek.com>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>,  "fanwu01@zju.edu.cn"	
 <fanwu01@zju.edu.cn>, "jacopo.mondi@ideasonboard.com"	
 <jacopo.mondi@ideasonboard.com>, "haoxiang_li2024@163.com"	
 <haoxiang_li2024@163.com>, "tfiga@chromium.org" <tfiga@chromium.org>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Andrew-CT Chen =?UTF-8?Q?=28=E9=99=B3=E6=99=BA=E8=BF=AA=29?=	
 <Andrew-CT.Chen@mediatek.com>, "linux-media@vger.kernel.org"	
 <linux-media@vger.kernel.org>, "ribalda@chromium.org"
 <ribalda@chromium.org>,  "wenst@chromium.org"	 <wenst@chromium.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "kees@kernel.org" <kees@kernel.org>,  "rongqianfeng@vivo.com"	
 <rongqianfeng@vivo.com>, Irui Wang =?UTF-8?Q?=28=E7=8E=8B=E7=91=9E=29?=	
 <Irui.Wang@mediatek.com>, "krzk+dt@kernel.org" <krzk+dt@kernel.org>, 
 "linux-mediatek@lists.infradead.org"	 <linux-mediatek@lists.infradead.org>,
 Tiffany Lin =?UTF-8?Q?=28=E6=9E=97=E6=85=A7=E7=8F=8A=29?=	
 <tiffany.lin@mediatek.com>, "p.zabel@pengutronix.de"
 <p.zabel@pengutronix.de>,  "benjamin.gaignard@collabora.com"	
 <benjamin.gaignard@collabora.com>, "mchehab@kernel.org"
 <mchehab@kernel.org>,  "sebastian.fricke@collabora.com"	
 <sebastian.fricke@collabora.com>, "robh@kernel.org" <robh@kernel.org>, 
 "linux-arm-kernel@lists.infradead.org"	
 <linux-arm-kernel@lists.infradead.org>, 
 "laurent.pinchart+renesas@ideasonboard.com"	
 <laurent.pinchart+renesas@ideasonboard.com>, "hverkuil+cisco@kernel.org"	
 <hverkuil+cisco@kernel.org>
Cc: "sakari.ailus@linux.intel.com" <sakari.ailus@linux.intel.com>
Date: Tue, 11 Aug 2026 16:22:20 -0400
In-Reply-To: <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
References: <20260720012056.1026551-1-kyrie.wu@mediatek.com>
		 <20260720012056.1026551-2-kyrie.wu@mediatek.com>
		 <c3abd49fc12e8cfab6993feb60b361ba07b6fb7d.camel@collabora.com>
	 <275503aae6ff76a4c186efe665acf996dec9229d.camel@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-GldQxjJ0Y3JLQz4hWdAB"
User-Agent: Evolution 3.60.2 (3.60.2-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0


--=-GldQxjJ0Y3JLQz4hWdAB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kyrie,

Le lundi 10 ao=C3=BBt 2026 =C3=A0 03:05 +0000, Kyrie Wu (=E5=90=B4=E6=99=97=
) a =C3=A9crit=C2=A0:
> I agree. Since the platform data is introduced in the MT8189 patch
> series, I will move fw_type to the platform data and make
> mtk_vcodec_dec_get_chip_name() derive the chip identifier from it in
> the MT8189 series.

I'm not sure I have captured the plan correctly. Would you mind clarifying =
?

Nicolas

--=-GldQxjJ0Y3JLQz4hWdAB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCanuEfAAKCRDZQZRRKWBy
9GplAQDqFehP0p9YkX8g3K/opaqz/gZ9NiNEPga5LbtCDES9cwD/ey7quM27QoKq
481yz3QPt2ziTigIuzbPk6CdIXYoCQk=
=Ilc3
-----END PGP SIGNATURE-----

--=-GldQxjJ0Y3JLQz4hWdAB--
