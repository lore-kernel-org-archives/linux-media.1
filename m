Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794220629;
	b=XVvZHhaTRu5uvmipM3xTpmyoxgpBdhKbtN9k3YlQvSpGS2BSv2wFk5kYUIDfeXEXncgt
	 +J5QULDXVpTm2BuB8imQVJOjN9CTSi2wufJECXVDNTPndyclg/0rpb5+dboUOyKnYryuA
	 uBXvn9tQ6G6bTs140FxmP6mkeJTId+7OdH+cNxnwq1oY1ZplgtbqNyT3zrHfq8P0mXdZ5
	 SdkPNCwYxIEqSQOPk07Od5IY/QM5IOrL/gNsPcai6PTD+68KHueMwOHXS5KJumQz9LD94
	 SoGOoMB3Y64yJeEGaCNcI7HFhZqEFdhYQWELrLg6IjXAVRo+uZ78xiXbJ1P2i01SRAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794220629;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=RgiXM5r9puzO2EF/c9LYyxKCbLgzsjgycU7HBuwYv14=;
	b=vmsk6Q1mULc0F3bFBSRk+oGTV5WOH3420DuRME/ZN40qK2ABLE2IvXn6IkDk2qpdHoDw
	 vSIGq8yUnBVR3DEMyfCqtaZaEEc9D9NxQwPUkddEi9dL1YsRp2epqtiegosHbiVi1NXI3
	 8SgAbZhatgXAGGI0ycQ8p49g8h3Rz2Xj7Md+fd/iv3eKMjiQ6P1Gt91C07cjrOWJ46AkP
	 Z7IvdY+oekyXU5/0JjmMuB7rwR3kXGdnjTln+5dsAmPWmZ0OJWNduDy4fvulwKaj3HfPy
	 Sx+6BcY4mgrfjn4n3T9nejoDXbKdRLeoCMHctVlqt6aHic3+xzF+CpYOMs4Svpgcarg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=S7Y1lMou;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7DC606A321
	for <linux-media@vger.kernel.org>; Mon,  9 Nov 2026 10:37:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BC7DC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=S7Y1lMou
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1794220623; x=1794479823;
	bh=RgiXM5r9puzO2EF/c9LYyxKCbLgzsjgycU7HBuwYv14=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=S7Y1lMouhSsXanUL2M88fpxKKj/V7JtNNiWE2kkXW4PMPlAsxwxXMGp+2EgvSimiX
	 gBjGNl0BWTz9lr2rruucIByBkB9npPaJfR5+lfwZHKoo9sh7D/Ks2V/afRQuqvKS4F
	 jqthYrW3V/dctInVG5X67ZjYit0E+h5vYnhGiSoRIMt2yRkURI2ProyCTP/ou+B958
	 maIADTiGv0o5YjDAYHx4DtdsS3c6mDYPulrEbk6Nc0Ngf4ryeR0seRoDp05yLunwYy
	 8CwB9luL3vn21xlVo/zSEm+ME2WtpvZjEjzIb1MtgTJl5g/iUwVsmZmmJEJlr+h9wr
	 7jW5aM/znH/Kg==
Date: Mon, 09 Nov 2026 10:36:54 +0000
To: Benjamin Mugnier <benjamin.mugnier@foss.st.com>, Sakari Ailus <sakari.ailus@linux.intel.com>, Sylvain Petinot <sylvain.petinot@foss.st.com>, Mauro Carvalho Chehab <mchehab@kernel.org>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Peter Marshall <pm@petermarshall.ca>, George Neacsu <geocausa@gmail.com>, Hao Yao <hao.yao@intel.com>, Fernando Rimoli <fernandorimoli11@gmail.com>, "D. Manresa" <dmanresa@gmail.com>, Jizhou Tong <fqwqf@fqwqf.xyz>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: media: i2c: st,vd55g1: Add ST VD55G0
Message-ID: <20261109103645.32173-1-lsa.uz@pm.me>
In-Reply-To: <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
References: <20261109093353.3757-1-lsa.uz@pm.me> <20261109093353.3757-2-lsa.uz@pm.me> <66c9105b-4da7-4b57-a0a1-e33c093f1529@foss.st.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 7f23696f074205ce908f5e43290b2a74f03e6da2
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

Hi Benjamin,

Yes. The single file came from Krzysztof's answer on v1. I offered to
fold the compatible into st,vd55g1.yaml with an if/then for the
link-frequency minimum, and he replied with a link to Peter's 2/7, which
adds the VD55G0 to that binding. His review of that patch asked only to
keep the file name and to move allOf to the bottom, so I read it as one
file for both:
https://lore.kernel.org/all/20261020-cute-peccary-of-attack-2376af@quoll/
https://lore.kernel.org/all/20260903-utopian-vagabond-mamba-44caea@quoll/

I am happy to do either. Once you and the DT maintainers agree, I will
send v4 promptly. For a separate file, it brings back v1's
st,vd55g0.yaml with your Co-developed-by, and its MAINTAINERS line in
2/4.

Sergey

