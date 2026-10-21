Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.168.172.154
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792610177;
	b=UmpMwxpcaseSggz0kMbal9geLccneoobcNwvesxsYqSZuFTgI5fuCbDloAhQChc8tAby
	 nl5sJwGwn1z1sUr8yCZw6zBdtSbYyk5Hc1lZ5TijW1QBQgXEZDNERKeWiIOcudOmNVnwX
	 3qSZetzEuri1lolqlzaI4JKFNFVyiBMncWbIgTKXPR/p2jeikXO8yfcmQYTQrXsieOqJe
	 5SIvwjWtrLfaPK/6kZU06g8jRT3PRrFhatpehdJSdJBgwN1HX7xDgZWQpmMU8jCwRuR0H
	 EofgAbOJ8FCrVX3GNTbtU/GtUneS1BOLJ5aFgGIU7jrkm6wFfyEVzIkq06ITCl0PUKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792610177;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=anBMe2GlVFMRj3Y+KePhSdVVtI8f3f/xbQYGKM0sGrA=;
	b=NtybCXp5pVMAnCZLVAC3zE3A3rqJxSWYhwN79biJSFotip8+/LwU4QjsyQ/ATUR437xG
	 ++QwxJtvVWyle3Tl8x0Nv2LANd3r7sjKy4QB8eg7YwXEfmJkaQCcOwHHSIoN/qbf+PRc5
	 bnmZVhdbJRKWKq3mAbt/Dhf6jk7phNIB2yLBH+IMeizro5XcBRLI2Q6uQW9e5KApKzp6V
	 jc5Vx6IY5URQmr0uKiHFSehl89K0UY2vKRX22vcG3QHD0etXeCVDVEuKWO0EAbhiD+av1
	 RtnbnuNqw7K8LLLzii5MIJPqBIszOB6+MialagrTtRKJokmrTytEMUqP9XaFE1883hQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ragnatech.se;
	spf=pass smtp.mailfrom=ragnatech.se;
	dkim=pass header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=hPJIDzfO;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oYCoTg0T;
	arc=none smtp.remote-ip=103.168.172.154
Received: from fhigh-a3-smtp.messagingengine.com (fhigh-a3-smtp.messagingengine.com [103.168.172.154])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9AE56606A319
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 19:16:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9AE56606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ragnatech.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ragnatech.se header.i=@ragnatech.se header.a=rsa-sha256 header.s=fm1 header.b=hPJIDzfO;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm2 header.b=oYCoTg0T
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfhigh.phl.internal (Postfix) with ESMTP id B2CD214000E0
	for <linux-media@vger.kernel.org>; Wed, 21 Oct 2026 15:16:15 -0400 (EDT)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Wed, 21 Oct 2026 15:16:15 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ragnatech.se; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:message-id:mime-version:reply-to
	:subject:subject:to:to; s=fm1; t=1792610175; x=1792696575; bh=an
	BMe2GlVFMRj3Y+KePhSdVVtI8f3f/xbQYGKM0sGrA=; b=hPJIDzfOsGi8URy3y9
	NTOSDv+3wZkCFZCwGnpHy9xmWbplQrGx9Qohew9BNumQD1Hl9NfVFqg7kSW3fJut
	H1a2hc2R1dg1as7QQhjcVgB/GIgkSqUJYjmnU6htLzNb/Ldy7ygWPOXjsrdTnxAy
	hewdatC3ubvZDI5vuiqGJeO79D64Hg3tveaiDhk0SyTD31df4lUHcgKfp244JXC8
	0vtdDspt6kMHdJkbB6KwfEolc/RhNKOayFWOHZXSmqQ98S4GYYiMWnQo+BI9nkyz
	5+WGUsQcy57w81dM2UVSS2UohJPfiwadHeC7MyCSRP5MnD05Wm8UTgzYGJI18wPf
	P64g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:message-id:mime-version:reply-to:subject
	:subject:to:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm2; t=1792610175; x=1792696575; bh=anBMe2GlVFMRj3Y+KePhSdVVtI8f
	3f/xbQYGKM0sGrA=; b=oYCoTg0T63TFeuAto9tgvIvjVDk/7Uqx9G/2MHW9T70J
	VmMNK5jZqhPyF/yUJ7uqjr0ssEo6iLW0MSW3MiwOChIMHwx+IRB7R25/SKCaWpf+
	iDVeBX9MDcXBbgVarTut24bwCTnU5EtAU9dLh+9mMTSarDPER3LV5oaDW4atoi7t
	G4LGB6poVQlr75XOe0iUnL5q0Sq6ZabZ1fhdeMGSUbhUTO06KTcLU6cE2eQcHMXg
	jhqMbZ7wPBIsjIWpL65Br5WDEwUEyxoQZr1kJomdn/GK/d66luPRQXh+0shxWZE5
	WT4foy6rm3napUyZIsUqZds5NraQ4Ehu4zzqZuiKMA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=sign d=ragnatech.se a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1792610175; d=ragnatech.se;
	mf=PG5pa2xhcy5zb2Rlcmx1bmRAcmFnbmF0ZWNoLnNlPg==;
	rt=PGxpbnV4LW1lZGlhQHZnZXIua2VybmVsLm9yZz4=;
	s=fm1:rsa-sha256:eUhfZkGOclJOfSQ4xYvOQVrPt7Q+C4o9Nk+YWbpmEIPVKIR
	QNaa+0RZZbIMx2U6EngMgG330SNalIishhhMWh9r1nJh/YPLPa7iS1i68AlWrmA4
	dxnIxe6Pz19VBjSqdcXVaAV4YjgM4pJsTHyTRbsLEbXDYzCDgKhrbwJAV6h6QGYH
	7R1GgErePZ45TsG8BArgZrJ73o/BMDtqhUvA+IsEsNuh+0TGxF3I4cAPm8npqzEO
	Wc6nqMMK7QX2bW0oz3de5jYDS9q34bUs/pFi+xMHzUeEe6VQxNUwLrVTZnghHp3M
	brNksVG2Rf8wHXzGduox5VxjtLV0Y4i4lVmXwjg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-07;
	repo=github.com/dkim2wg/interop; date=2026-10-18; sw=lmtpprox;
	action=mi-m=1; hc=10;
	hn=cc,content-transfer-encoding,content-type,date,feedback-id,
	from,message-id,mime-version,subject,to;
Message-Instance: m=1; h=sha256:t3Ltq1zGgG79ZJveT809bqc+dwoeRafubx8lSbUZbOk=:P4a6Uv7XH2kxUHXOr70H+k33VJJVeiV2KFwhpsRfxZY=;
X-ME-Sender: <xms:fw_ZapN1zyIyLlAmm5K4h1QC-uuejALYI12Zki6b1GThotK2ZN29hw>
    <xme:fw_Zapwvm-zGIX3V9ny_IzUG5Bd1hDb2OcE_P48I39RxV6v3IrJqW6q-C3npiVwiH
    BkMe_5Z4thPmgW_G351ayRstDd_D025S9k0JjyrSkM3xY3Mg4345RU>
X-ME-Received: <xmr:fw_Zaiuj6gPqHZNahFT7T-9lDVwKJwgbDDTkMsIXewo5lhiw_MzmdET56fu50prqSFif8cFMlVsui4n7_qHjeT_qCkaG1io>
X-ME-Proxy-Cause: dmFkZTEZOlJ65KqWCzF/kisTmduFRQ7TNgCTu25Kmj07XH2tQJrnPtZhQQ3gCARtnJ1Ajg
    rNjNajz1duZO2r466nLHILae8EzUKtYPjibbtEvGQBrDyodJKS1hd6s9P8R9mvir+YZp7J
    77Iicq9Imp/7S1+tCywqlH0zVgawl1n7t6LTjpfKQfFmuO21AuAQaUkWmH+JJFyD0eU47X
    Tp5eb98PmpxSfaQsFsBnt6gN5oScVfW/y4uQau4OLXGi0anvxWJ2d+SJBSJR9JM9xSLYzB
    Yy934EVWMWBXm1ib902CkgY8LueO6Tava3q/xo5B7cBGf9oxeIEwjIbaxjKZNe97x05oJr
    0PSiZzZBx//CXCmj/VqSwAdTAPUUkvjQ7kNDb/VBf3k2fWRuO9AbsHQYpspiR+t+Pairft
    WGi0EkBVOlWVP75VLBo469yzjPf4UbNmGKtu8YZFnS3XT8bA1NCGMm6sPoqusN0sbG5T2q
    RujMMVIh1ckRU1CajznmRarETg14G3fZgPMlvZF1CrBzTOlbTrwhseFJLuHnMO0W/gnV1r
    hBezTA2u9hmTk9IrfrLe7n/R+LyrIedwDqUAdu7esfr2zbtXXo3OvfbeVtVpc3XJk6lkh5
    UXxrdz/6MRmAFv3b/IcstIsEQJOvi8661PEP6mYzTWagBYQbXrFTi7C5R8+w
X-ME-Proxy: <xmx:fw_Zai5pun0yeIFs9WABFdxxJ52386zyKQqMNWzA-g1TqtqN55foYA>
    <xmx:fw_ZahQwMWWeBBBRETdnCqNuCptJnAylb6lKO9knUI2YAnxuuLmiKQ>
    <xmx:fw_ZahpXwAyYK5r7GgYxZuJN1Ai6sHu1CCm6IwKEsiHjDWT3LnMB1g>
    <xmx:fw_ZavIEMbcVJGw-vgr9Nto3DWPU5_Sq7MQC1QIxG7DfVI55Y5NDww>
    <xmx:fw_ZaksKj8hWoOVvc8j1vvFy_ZRAMI-hQ3jUgcTfrCXkc76N7hPQNKfO>
Feedback-ID: i80c9496c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Oct 2026 15:16:14 -0400 (EDT)
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
To: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: linux-media@vger.kernel.org,
	=?UTF-8?q?Niklas=20S=C3=B6derlund?= <niklas.soderlund+renesas@ragnatech.se>
Subject: [raw2rgbpnm PATCH 0/8] Fix NV12 and NV16 with strides
Date: Wed, 21 Oct 2026 21:15:43 +0200
Message-ID: <20261021191551.2975000-1-niklas.soderlund+renesas@ragnatech.se>
X-Mailer: git-send-email 2.55.0
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hello,

A recent change [1] broke parsing of NV16 frames as it allowed the pixel 
reader to change the height and an earlier change to support NV16 with 
strides played with the height variable to support the two planes of NV 
formats [2].

While looking at the simple fix of reversing the height calculation in 
the pixel reader which was missed in [1] I noticed NV12 with stride was 
broken even in [2].

This series removes the plane information added in [2] and reworks the 
pixel information structure to contain function pointers to different 
pixel reader functions. All formats except NV12 and NV16 use the current 
reader which uses information on bits per pixel / component while two 
specialised ones are added for the two NV formats.

While this change is a tad large for the simple task of fixing reading 
of two formats I hope the ability to use different readers for different 
formats will prove useful in future as not all pixel formats are as 
simple as each line is of equal length and equal amount of padding.

1. commit 43ab0bd9ab0a ("Add -S option for setting stride")
2. commit 4d9c84b3d37c ("Add support for multi plane formats with stride")

Niklas Söderlund (8):
  Remove planes information
  Open the input file in main
  Create helper to get file size
  Create helper to read pixel data
  Create helper to check data dimensions
  Move bits per pixel reader
  Allow for format specific readers
  Add specific input file readers for NV12 and NV16

 raw2rgbpnm.c | 360 +++++++++++++++++++++++++++++++++------------------
 1 file changed, 231 insertions(+), 129 deletions(-)

-- 
2.55.0

