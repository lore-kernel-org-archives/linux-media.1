Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=109.224.244.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795158285;
	b=2fBBodkwaUJPyUJ1UxRDZZCC1G1Mcno6w5WBA5cKU72vOOQbnditdpfqy0GGGfvR+6Wr
	 JKlKmANQofuE6TJ0a2mHXJPRTv9t82M02PobRivVkGfE5wzK7J4gALc9DSLT/An0/uwMY
	 +MnMlU+IGhveK2DvXxgMI1rxwkAod4w2N4n03A4ITdkS31v7q6/8K0LLlqPiE0l+wqkKP
	 PdMcG26+1M5fx8Jboykf8v5OtxmKjahl5LOgs+p2TsmBHdxyTefXERrAentfzsewK8iLT
	 yPt0OoDr/HZ0RSas40lpk/z0+qZ07iRQBHxu64JUO6/cU85PvDpAwuLUE29kroveRXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795158285;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=dwa+u8P7d13eHbe7OZ1U4Wf9/h/u1/HnbhT5AhfrDfo=;
	b=fJuqsFBmY92zpkfy+tG3dUwmrspvzhsqzIYFYMiMxBF38S/bLEAAZioOP/du2HAVK8A3
	 j1a8Y3CNAvK/sEkO809x2Rj0+LV+tTtKodXk7yKr8JX3nA6IMeOp9uifymY0AS21/KyZB
	 zp7A3l/TUPIoysUdj6tWfDAfpmn37VMWtKjkc6caMcO3ddM263oQ8jTF3smJnQ7iLrhGb
	 6d6vO9aHn4dnY6ikTLcMIL15ACAQ0UxsCn9BvYAjpQHxdKMHR4gGhGqNikJcSzqLhWXhE
	 tRz704beaGj5LwIjNjLxfyayFYGMSBrysz9hh0ll33tKT7F3jsSILqD0uFixPexI99A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=pm.me;
	spf=pass smtp.mailfrom=pm.me;
	dkim=pass header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ryN8YaXI;
	arc=none smtp.remote-ip=109.224.244.116
Received: from mail-244116.protonmail.ch (mail-244116.protonmail.ch [109.224.244.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405E0606A32A;
	Fri, 20 Nov 2026 07:04:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 405E0606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pm.me header.i=@pm.me header.a=rsa-sha256 header.s=protonmail3 header.b=ryN8YaXI
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1795158281; x=1795417481;
	bh=dwa+u8P7d13eHbe7OZ1U4Wf9/h/u1/HnbhT5AhfrDfo=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=ryN8YaXIUAWxJH3WqdMgt6JkP5vBzNzrAdTBKXIEFV4TUXA1DH2mC6YbF+EvwQTQR
	 NyhZLrwLjKdTX76HAO4RF9MCnFCmOdiiq+0K+tALBiS6FkdD4ImM6tQM0D9Ncg3h8+
	 Tp1TZXnLxQazkCqyu5bo50PoeoDRKwMkgBR2OEuxPDVke6hVPAR0BiLNZ/FAFE2EvR
	 2gd2mRJAGjWZUEb3DXLg6KwfgcGz/EcAyLH9lXZp6hVjlCusJbg+CiKqIY9+Ij2YlY
	 M4CO4OBPB0GH2YxaI5NJB0wrAv7suS95SRU1s7gV3wW5VSPCOO05aZ4yGGkYZix32y
	 OSlyJXW9CuxGA==
Date: Fri, 20 Nov 2026 07:04:37 +0000
To: Sakari Ailus <sakari.ailus@linux.intel.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Andre Gilerson <andre.gilerson@gmail.com>, Dan Scally <dan.scally@ideasonboard.com>, Hans de Goede <hansg@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, German Pablo Lindo <germanpapulindez@gmail.com>, George Neacsu <geocausa@gmail.com>, linux-media@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v10 0/3] Add support for the Sony IMX681 camera sensor
Message-ID: <20261120070427.80970-1-lsa.uz@pm.me>
In-Reply-To: <20261106124505.71429-1-lsa.uz@pm.me>
References: <20261106124505.71429-1-lsa.uz@pm.me>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: b98c0935f0b67509e3107d5b22b1f514d360dad2
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

Hi Sakari,

A ping on 1/3 and 2/3. You took 3/3 (ad5908546cc5 in media-committers
next, thanks); the binding and the driver are still new in patchwork.
Is anything needed from me for them?

Not about this series: ov13858 power v4 and gain v2, which I pinged on
6 November, have since got a Tested-by from Emfox Zhou.

Sergey

