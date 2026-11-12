Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794499639;
	b=rteWjFRlRxakIRwn2Jf00eWOsEMmng48oXTViGi0wpnW7fXwy0pHL37nXoC3gjyHj5AK
	 Lgy4HTExHUOnh+zCcYi1GeA8+TeKvJWGiLT+E1oZOIf72Q3f3LtNdVG71rw9GS+CiILi9
	 Agj73pWc2gynIVc15QynkiwhcPAJs3LS2ckfu/qGbWPHUYl8rf8WFGWskN3YNmD83ntvo
	 YEZ7xSQ6cLmegZF6xj94xHKL/T2mmfikQ96KnwrZ9AAvFswEWokKVrenPE7gE2w9V67h4
	 GHSm1AekuKtbcZ+mWCklKz1gVo+2eVQTt1tnQiIIqOvCvZ9OVgmHhYyzRc5dPLqJWuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794499639;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=fgUM8MAZVjSSP/5FbR2dN87DFZ3isTqJIYoNVzvAakQ=;
	b=JrmrzpgDKXqFyZmeU6v6UupczKk7F5CQ+adTsiNGw/pJQGlKycyIHdVwZYRPNnCB8nZU
	 qtXjmZFsgBfTqPqHF0A5xZTwT540Jw5xxoXGN8DiwA/epyGX3neaaG6VpILb1JFXmEDOv
	 VqWwd+fe613R/IApmU/HGXqY+dxa6guoaR7cVghGqytYewLz4lJCW1Jd6Xi94yMIwf5Bx
	 ixyOWRwYBQlOi0wkD6XDW9jJbpd6R5gBPQBvprbvCEtjwh+2yW1ZKaKNsFabYkLnarXRP
	 bSpIDTcuCP/csCHoKTHNSSujPSi4CipnRawHjAiQRvX/DuWji6BETMZDnh0v/10I2Lg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q+ZQXiJS;
	arc=none smtp.remote-ip=209.85.128.43
Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC2C5606A31C
	for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 16:07:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC2C5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Q+ZQXiJS
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso39433585e9.3
        for <linux-media@vger.kernel.org>; Thu, 12 Nov 2026 08:07:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1794499637; x=1795104437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fgUM8MAZVjSSP/5FbR2dN87DFZ3isTqJIYoNVzvAakQ=;
        b=Q+ZQXiJSyaFHb/Y92Sbg1ArTq0TqM9KcYwqq8FZQFw4cft8bqDNuMXGT4hHzwvBhcH
         6upw3p2z9QZPi13jswzdkt6cHrQa4ybrhoCm50YaOm1qL/aQz2os6mS6qGEb/TkUgWtF
         LNecou4CA0Ud4YMd/IfJNUm+Un7pqCmq15EV2YtC7bdCC0sD9sjiElxNA7F5bLg0hL42
         y+H0SI/JfP53+pMYWFC/OkF29pUrajt1DFk7cCF+ZRb9lbxXFxVbWFmpkTmDtFfjeOrM
         4oThjIybeHsUMGCJqziWck2x5p0ZgjkdbfxuOkZ5RXG7CrMUIxkJHFGQMn1edigqNsm6
         C8xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794499637; x=1795104437;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fgUM8MAZVjSSP/5FbR2dN87DFZ3isTqJIYoNVzvAakQ=;
        b=ZDsn1pW5DOfzqOhZk2do96ZD69AK6iwmE4UJ1OrEBlg8mZKyrvDxcU7uXbNODQDOo9
         tz56CiTCsaXVrxQ9MM6klMv7XOGWB9sloaKSY6eT0Z9FDiAfoE60lCZdmVw3lHnv/FwD
         ET8LN9cFrwveTZ7Gb/S6mD/Uves1EqmsXtEcxBJAy/9bf10Swv4O36dZ7wgFIb9IwCuE
         ZBJRIXth0fJNg10iPP6yxVzYyrZcerJT+hN/Vm7GX1T2t4DMs4IpcBliR7weJ081lfWw
         JHMYRXZmdg/mPDdLZ9vtx6xRA8kbyR/yxx+5EanfZ0qgzpBKFWJFhW6OPTDcOid3nxuM
         Rtdw==
X-Gm-Message-State: APuU4Z8APVHTpnhceuceexiH/ErcfSoYvzLfLjNSubCkciZmltL8SiKk
	7wskoc3bWvWwFaA4mJDfg7VkVY4W+uDzNCABMlnljcUrf92kfbLtxvekDRl58neMF44xctmE/7N
	qxEWqlMs=
X-Gm-Gg: AYBFou1RRDNT3Y7E6Ma2Ru/GjaAxMzBMpV6mxQ65iJWeePBDjrttc/v21v7saNNs+/q
	Iaze0hg7B6obGoMyh1mcZyuupUX9TVxIqYwJFBb/MViGn9UVT3Aa1qJijf7PoecztyxfcYLWTUY
	4hZT7f3/MQsK41A1OiHUBLoEb/TX27EpJC+haz+R325WVRiz0azkOW9QisKaQKdX3nzb1urwaub
	iZbVDlSyoaRJT+6frYAlb0DDXcjE+wSUd1a5yShCHWAAHun3Sn5IgHY0qtturagGHmVaxaR9mO+
	Cb3H3ZJDeW+onjzl02aCzWkZ2EiFEnNm1BfNIZqg1WfQFQ91GxK8vsN8SPNyfItt4GZSNmTS6En
	Czw/qPfMubGv3l7BUujHVijBADuK3I1028Zebsh6di7qG/ab8viuQpQU0E9YsoHhYx1iFMGnqJo
	O1nDHiXwtIFStcwNNZjR5c9Ok2Of/5G7hH7BSv18G8GSBIiNm2PUfTQLajIc2+NEfiPAUAByBMS
	rM2UqKYcrrQNtwLxObi2RRdzpQ7etaG0nhS7SGHMACWZhC7GNYREtOAdGD2XIs47jeT7XwyA9w0
	7CKH6mBKKbjO1+ozwhCS4x7PMhRPRioHTbRvqW+adnqUIbryje7VW9SkgZ9Vq3cI/64OlMT4Knk
	v0X4EqYvj3DkqgQSx
X-Received: by 2002:a05:600c:1c01:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4ba09395574mr135241465e9.35.1794499637326;
        Thu, 12 Nov 2026 08:07:17 -0800 (PST)
Received: from localhost (p200300f65f19a9043dac1f1ce30146b0.dip0.t-ipconnect.de. [2003:f6:5f19:a904:3dac:1f1c:e301:46b0])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-4bb4e26c2casm71865705e9.12.2026.11.12.08.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 08:07:13 -0800 (PST)
Date: Thu, 12 Nov 2026 17:07:07 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
To: linux-media@vger.kernel.org
Cc: Linux Media CI <media-ci@linuxtv.org>
Subject: Re: media: firewire: Drop <linux/mod_devicetable.h> from firedtv.h
Message-ID: <avXi_DvNc-58btfA@monoceros>
References: <20261112101815.2772413-2-u.kleine-koenig@baylibre.com>
 <6af5a328.9e649e5a.f3855.8f9a@mx.google.com>
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Post: <mailto:linux-media@vger.kernel.org>
List-Help: <mailto:linux-media+help@vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-media+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="kovx73mxaklmirun"
Content-Disposition: inline
In-Reply-To: <6af5a328.9e649e5a.f3855.8f9a@mx.google.com>


--kovx73mxaklmirun
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: media: firewire: Drop <linux/mod_devicetable.h> from firedtv.h
MIME-Version: 1.0

Hello,

On Thu, Nov 12, 2026 at 03:29:44AM -0800, Patchwork Integration wrote:
> Dear Uwe Kleine-K=F6nig (The Capable Hub):
>=20
> Thanks for your patches! Unfortunately the Media CI robot detected some
> issues:
>=20
> # Test media-patchstyle:test-valid-ancestor
> ERROR: This code is not based on any of the branches: next fixes
>        from https://gitlab.freedesktop.org/linux-media/media-committers.g=
it.
>        The output of media-ci will not be reliable, and the code will not
>        land upstream as-is. Please rebase your code.

Well the base I chose is next-20261111, but drivers/media/firewire
didn't see any changes in there since v7.2-rc2, and also

	https://gitlab.freedesktop.org/linux-media/media-committers.git next

doesn't have any changes to that directory, so it should apply there
just fine.

> # Test checkpatch:./0001-media-firewire-Drop-linux-mod_devicetable.h-from=
-fir.patch checkpatch
> WARNING: Prefer a maximum 75 chars per line (possible unwrapped commit de=
scription?)
> #24:=20
> $ git grep -oE "\<(acpi_device_id|amba_id|ap_device_id|apr_device_id|auxi=
liary_device_id|bcma_device_id|ccw_device_id|cdx_device_id|coreboot_device_=
id|css_device_id|dfl_device_id|dmi_(device|system)_id|eisa_device_id|fsl_mc=
_device_id|hda_device_id|hid_device_id|hv_vmbus_device_id|i2c_device_id|i3c=
_device_id|ieee1394_device_id|input_device_id|ipack_device_id|isapnp_device=
_id|ishtp_device_id|mcb_device_id|mdio_device_id|mei_cl_device_id|mhi_devic=
e_id|mips_cdmm_device_id|of_device_id|parisc_device_id|pci_device_id|pci_ep=
f_device_id|pcmcia_device_id|platform_device_id|pnp_(card_)?device_id|rio_d=
evice_id|rpmsg_device_id|sdio_device_id|sdw_device_id|serio_device_id|slim_=
device_id|spi_device_id|spmi_device_id|ssam_device_id|ssb_device_id|tb_serv=
ice_id|tee_client_device_id|typec_device_id|ulpi_device_id|usb_device_id|vc=
hiq_device_id|vio_device_id|virtio_device_id|wmi_device_id|x86_(cpu|device)=
_id|zorro_device_id|cpu_feature)\>" drivers/media/firewire/firedtv.h driver=
s/media/firewire/firedtv-{avc,ci,dvb,fe,fw,rc}.c | sort -u

I'd expect that there is an exception for commands like that?

Best regards
Uwe

--kovx73mxaklmirun
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmr15B8ACgkQj4D7WH0S
/k7F4QgAtIE1tV8QrrydoNPpD5ekXljw8NFtWLURW8F7WEXpxqMpbtvuKrqSSd9s
8ezzPaHZqfnuZdlJTVNrxzkAmkhbCHLx1lsipblRBu5+/bEl/JpsnT8iuvhmwEMo
zXvuvT28ywv8ItV1YiZlacDyhAfv+9NsPYVeF9Ey9piT55OyFDTwBQGZ00PfHzks
vNPPy8RHZXzDA5ccaIqNr8WSKVTU93Da5EUk9g/kOQgMbFmCirHLkRyrKbS2t7E1
LMKsU5Lbkn9flGbu9dVPq6eyRQCSZJytFzfqjMMwQp419Js0QycxySmk9desEhiH
6gdVJB/gdUZpP9BxF05IP1TXJp3myw==
=hpfD
-----END PGP SIGNATURE-----

--kovx73mxaklmirun--
