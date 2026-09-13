Received: from mail-106120.protonmail.ch (mail-106120.protonmail.ch [79.135.106.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EB418A93F
	for <linux-media@vger.kernel.org>; Sun, 13 Sep 2026 15:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.120
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789314368; cv=none; b=rekECg7JLjJSyIFRbhJl2pDHAJ9xRZWnbk5xW/2Zmt/jOhzoexWMeXUKGNpT99dChbzVGQSADsybaXQpHnNvHrvx84jyF55QhZg9iHkvG2QForX/UoKOcJJOrPEjo7fs7gFj6dyzwIo+D4R2UjfRWGFUmv0OdF/i0tBQc4A5ErQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789314368; c=relaxed/simple;
	bh=cAKX9PMg/sXO7GrdWkeNq8TAyEXZC21Di+NOnJYEhj4=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MD2PTeenzKLnO1CWdncW338ju8/PYJR5uPQWpWs0PdxMgl7KD1e5lcsDig+iZIHdB3mfBSXJCGuCZ6qyWnud7xUVRiQ8UTXKgZRSNIH4pRlU6zg6Et3EG3qPWYnzUdJISIN/op5eG+xEO6mmNQs4Z/MrVjJTLdZvoHHK/2GFq4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me; spf=pass smtp.mailfrom=pm.me; dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b=Z6TrlQFX; arc=none smtp.client-ip=79.135.106.120
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=pm.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pm.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pm.me header.i=@pm.me header.b="Z6TrlQFX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pm.me;
	s=protonmail3; t=1789314357; x=1789573557;
	bh=kEFgWj3Fvw0AE3KSc8w0iiPjmVgeng3bLpK+ZogjFLQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Z6TrlQFXdYPsuQJUNTh95lZbxAtID6xb2IZqY8/XvfDmA1HVzqfZQqsZsk34/LYki
	 KN7udEjoWVWzFx1vXQnsJk123TvlcRaAvWqgBgXcndC3gKZoJ/ka7A/yAtw+O0rLnP
	 bzZvuWIdtHULKmXlmhG/KD0dRqvp0xFymr2EFznYDkbNYf0jnhDC7Mtp0Gbzs3CPUt
	 0Fh48yeC/af6/ChUxKWNurkeNe3m81guq/BdCDt3clMPyEgWZPy1Wjzm2BxU6RLIC6
	 FX/hBy70DIwUZjk7x6XU6Rw1K2XZwacpkbOCaLJ1yfP8KxmMpUEvCUusDV8TdFnY9/
	 f7vk+Tzwgp2DQ==
Date: Sun, 13 Sep 2026 15:45:53 +0000
To: German Pablo Lindo <germanpapulindez@gmail.com>
From: Sergey Lebedev <lsa.uz@pm.me>
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>, Hans de Goede <hansg@kernel.org>, Dan Scally <dan.scally@ideasonboard.com>, linux-media@vger.kernel.org
Subject: Re: Test for [PATCH] media: ipu-bridge: add the OV13858 rear sensor
Message-ID: <20260913154547.81202-1-lsa.uz@pm.me>
In-Reply-To: <20260913144127.17995-1-germanpapulindez@gmail.com>
References: <20260913100932.92087-1-lsa.uz@pm.me> <20260913144127.17995-1-germanpapulindez@gmail.com>
Feedback-ID: 113843758:user:proton
X-Pm-Message-ID: 9ddba38a86a014f1afe1e3b2ef39b62be279738b
Precedence: bulk
X-Mailing-List: linux-media@vger.kernel.org
List-Id: <linux-media.vger.kernel.org>
List-Subscribe: <mailto:linux-media+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-media+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Thank you - and no, you did not forget to apply a patch. There was nothing =
to
forget. The rotation fix existed only on my disk, because I had written it
against a form of upside_down_sensor_dmi_ids that does not exist upstream, =
so
it never applied and I never sent it. You found a real bug and the gap was
mine. It is on the list now, rewritten against the table as it actually is:

  https://lore.kernel.org/linux-media/20260913153526.80287-1-lsa.uz@pm.me/

Your September report is the reason it matches the way it does. You wrote:

  Surface Pro for Business 11th Edition with Intel

which is this machine's DMI_PRODUCT_NAME here, character for character, so
the entry matches on that rather than on the SKU I had originally used. If
that string came from /sys/class/dmi/id/product_name on your machine rather
than from a specification sheet, the patch covers you as written. Worth
confirming, since one is evidence and the other is marketing:

  cat /sys/class/dmi/id/product_name /sys/class/dmi/id/product_sku

Then, and please do not expect it to work: apply it and look at Snapshot,
qcam and Firefox again. I think the picture will still be upside down in al=
l
three, and I would like to be wrong.

Why it probably will not fix what you saw
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

The firmware describes the sensor as not rotated, so libcamera reports
Rotation =3D 0 and no application has any reason to turn the image. The pat=
ch
makes the kernel report Rotation =3D 180 instead. That is all it does.

I captured one static scene twice here, once with the property at 0 and onc=
e
at 180, and correlated the vertical brightness profile: +0.995 the same way
up, -0.781 flipped. libcamera hands out the same buffer either way, and the
sensor has no flip controls, so nothing is corrected in hardware either.

So the kernel stops lying and whether anyone acts on the truth is a userspa=
ce
question. You have those three applications set up and I do not. If one of
them rotates once the property is right, that is worth knowing. If none do,
that is a userspace bug to file, not a kernel one - and it is a much better
answer than the one I could give by guessing.

About the tag
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

Carried, and you were right to flag that you tested v1: the v1 and v2 diffs
are byte-identical, only two over-long lines in the commit message changed,
so your Tested-by transfers unchanged.

Nothing needed from you - but the trailer is indented three spaces again, t=
he
same thing I mentioned on your imx681 tag. It costs nothing here because I
carry these by hand, and I mention it only so tooling works for you later:
git send-email keeps the leading whitespace, and b4 and patchwork both matc=
h
trailers only at the start of a line.

Sergey

